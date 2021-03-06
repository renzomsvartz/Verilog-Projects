//Serial Subtractor Circuit using 3 shift registers with parallel load and serial input/output, a subtractor FSM for which "addition behavior" to perform, and a controlled shifting process
module Exercise6_41(input [7:0]A, input [7:0]B, Reset, Clock, output [7:0]shiftregDiff);
	reg [3:0]Count;
	reg sum, currentStateSubFSM, nextStateSubFSM;
	wire [7:0]shiftregA, shiftregB;
	wire Run;
	parameter nocarryin = 1'b0, carryin = 1'b1;
	
	shiftrne shift_A(A, Reset, Run, 1'b0, Clock, shiftregA);
	shiftrne shift_B(B, Reset, Run, 1'b0, Clock, shiftregB);
	shiftrne shift_Diff(8'b0, Reset, Run, sum, Clock, shiftregDiff);
	
	//Subtractor FSM
	//Output and next state combinational circuit
	always@(shiftregA, shiftregB, currentStateSubFSM)
		case(currentStateSubFSM)
			nocarryin: begin
					sum = shiftregA[0] ^ ~shiftregB[0]; //XOR
					if (shiftregA[0] & ~shiftregB[0]) nextStateSubFSM = carryin;
					else nextStateSubFSM = nocarryin;
				end
			carryin: begin
					sum = shiftregA[0] ~^ ~shiftregB[0]; //XNOR
					if (shiftregA[0] | ~shiftregB[0]) nextStateSubFSM = carryin;
					else nextStateSubFSM = nocarryin;
				end
			default nextStateSubFSM = carryin;
		endcase
	
	//Sequential block
	always@(posedge Clock)
		if (Reset) currentStateSubFSM <= carryin;
		else currentStateSubFSM <= nextStateSubFSM;
		
	//Control the shifting process
	always@(posedge Clock)
		if (Reset) Count = 8;
		else if (Run) Count = Count - 1;
	
	assign Run = |Count;
endmodule

//Shift register module instatiated in serial_subtractor
module shiftrne(input [n-1:0]Data, input Load, input En, input serialInput, input Clock, output reg [n-1:0]Shiftreg);
	parameter n = 8;
	integer i;
	
	always@(posedge Clock)
		if (Load)
			Shiftreg <= Data;
		else if (En)
		begin
			for (i = n-1; i > 0; i = i - 1)
				Shiftreg[i - 1] <= Shiftreg[i];
			Shiftreg[n - 1] <= serialInput;
		end
endmodule