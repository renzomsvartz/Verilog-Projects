module Exercise6_33(input Clock, input Resetn, input D, input N, output z);
	reg[2:1]y;
	parameter [2:1] S1 = 3'b00, S2 = 3'b01, S3 = 3'b10;
	
	//Sequential circuit
	always@(negedge Resetn, posedge Clock)
	begin
		casex(y)
			0:begin
				if ({D,N} == 0)
				begin
					y <= S1;
				end
				else if ({D,N} == 1)
				begin
					y <= S3;
				end
				else if ({D,N} == 2)
				begin
					y <= S2;
				end
				else
				begin
					y <= 2'bxx;
				end
			end
			1:begin
				if ({D,N} == 0)
				begin
					y <= S2;
				end
				else if ({D,N} == 1)
				begin
					y <= S1;
				end
				else if ({D,N} == 2)
				begin
					y <= S3;
				end
				else
				begin
					y <= 2'bxx;
				end
			end
			2:begin
				if ({D,N} == 0)
				begin
					y <= S3;
				end
				else if ({D,N} == 1)
				begin
					y <= S2;
				end
				else if ({D,N} == 2)
				begin
					y <= S1;
				end
				else
				begin
					y <= 2'bxx;
				end
			end
			default:begin
					y <= 2'bxx;
				end
		endcase
	end
	
	//Output
	assign z = ((y == 2) && ({D,N} == 2)) || ((y == 1) && (({D,N} == 1) || ({D,N} == 2)));
endmodule