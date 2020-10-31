module Exercise6_32(input Clock, input Resetn, input D, input N, output z);
	reg[2:1]y, Y;
	parameter [2:1] S1 = 3'b00, S2 = 3'b01, S3 = 3'b10;
	
	//Next state using Y and output
	always@(D, N, y)
	begin
		casex(y)
			0:begin
				if ({D,N} == 0)
				begin
					Y = S1;
				end
				else if ({D,N} == 1)
				begin
					Y = S2;
				end
				else if ({D,N} == 2)
				begin
					Y = S3;
				end
				else
				begin
					Y = 2'bxx;
				end
			end
			1:begin
				if ({D,N} == 0)
				begin
					Y = S2;
				end
				else if ({D,N} == 1)
				begin
					Y = S1;
				end
				else if ({D,N} == 2)
				begin
					Y = S3;
				end
				else
				begin
					Y = 2'bxx;
				end
			end
			2:begin
				if ({D,N} == 0)
				begin
					Y = S3;
				end
				else if ({D,N} == 1)
				begin
					Y = S2;
				end
				else if ({D,N} == 2)
				begin
					Y = S1;
				end
				else
				begin
					Y = 2'bxx;
				end
			end
			default:begin
				Y = 2'bxx;
			end
		endcase
	end
	
	//Sequential circuit
	always@(negedge Resetn, posedge Clock)
	begin
		if (Resetn == 0) y <= S1;
		else y <= Y;
	end
	
	//Output
	assign z = ((y == 2) && ({D,N} == 2)) || ((y == 1) && (({D,N} == 1) || ({D,N} == 2)));
endmodule