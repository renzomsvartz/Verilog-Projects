module Exercise6_30(input Clock, input Resetn, input D, input N, output z);
	reg[3:1]y, Y;
	parameter [3:1] S1 = 3'b000, S2 = 3'b001, S3 = 3'b010, S4 = 3'b011, S5 = 3'b100;
	
	//Next state using Y
	always@(D, N, y)
	begin
		casex(y)
			0:begin
				if ({D,N} == 0) Y = S1;
				else if ({D,N} == 1) Y = S3;
				else if ({D,N} == 2) Y = S2;
				else Y = 3'bxxx;
			end
			1:begin
				if ({D,N} == 0) Y = S2;
				else if ({D,N} == 1) Y = S4;
				else if ({D,N} == 2) Y = S5;
				else Y = 3'bxxx;
			end
			2:begin
				if ({D,N} == 0) Y = S3;
				else if ({D,N} == 1) Y = S2;
				else if ({D,N} == 2) Y = S4;
				else Y = 3'bxxx;
			end
			3:begin
				if ({D,N} == 0) Y = S1;
				else Y = 3'bxxx;
			end
			4:begin
				if ({D,N} == 0) Y = S3;
				else Y = 3'bxxx;
			end
			default: Y = 3'bxxx;
		endcase
	end
	
	//Sequential circuit
	always@(negedge Resetn, posedge Clock)
	begin
		if (Resetn == 0) y <= S1;
		else y <= Y;
	end
	
	//Output
	assign z = ((y == S4) || (y == S5));
endmodule