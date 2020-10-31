module Exercise6_31(input Clock, input Resetn, input D, input N, output z);
	reg[3:1]y;
	parameter [3:1] S1 = 3'b000, S2 = 3'b001, S3 = 3'b010, S4 = 3'b011, S5 = 3'b100;
	
	//Sequential circuit
	always@(negedge Resetn, posedge Clock)
	begin
		casex(y)
			0:begin
				if ({D,N} == 0) y <= S1;
				else if ({D,N} == 1) y <= S3;
				else if ({D,N} == 2) y <= S2;
				else y <= 3'bxxx;
			end
			1:begin
				if ({D,N} == 0) y <= S2;
				else if ({D,N} == 1) y <= S4;
				else if ({D,N} == 2) y <= S5;
				else y <= 3'bxxx;
			end
			2:begin
				if ({D,N} == 0) y <= S3;
				else if ({D,N} == 1) y <= S2;
				else if ({D,N} == 2) y <= S4;
				else y <= 3'bxxx;
			end
			3:begin
				if ({D,N} == 0) y <= S1;
				else y <= 3'bxxx;
			end
			4:begin
				if ({D,N} == 0) y <= S3;
				else y <= 3'bxxx;
			end
			default: y <= 3'bxxx;
		endcase
	end
	
	//Output
	assign z = ((y == S4) || (y == S5));
endmodule