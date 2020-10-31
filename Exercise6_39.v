module Exercise6_39 (input [6:0]data, input Load, input Clock, output reg serialOutput, output reg [7:0]shiftregister, output reg [2:0]Counter, output reg Y);
	integer i;
	
	always@(posedge Clock)
	begin
		if (Load)
		begin
			shiftregister = {1'b0,data};
			Counter = 3'b000;
			Y = 0;
			i = 0;
		end
		
		else
		begin
			Y <= (Y ^ shiftregister[0]); //evaluate parity FSM
			Counter <= Counter + 1; //Counter
			serialOutput <= (Counter == 3'b111) ? Y : shiftregister[0];
			for (i = 0; i < 7; i = i + 1)
			begin
					shiftregister[i] <= shiftregister[i+1]; //shift register
			end
			shiftregister[7] = 0;
		end
	end
endmodule
