module Exercise6_34(input Clock, input Resetn, input w, output z);
	reg[2:1]y;
	parameter [2:1] A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
	
	//Sequential circuit
	always@(negedge Resetn, posedge Clock)
	begin
		casex(y)
			0:begin
				if (w == 0) y <= C;
				else y <= D;
			end
			1:begin
				if (w == 0) y <= B;
				else y <= A;
			end
			2:begin
				if (w == 0) y <= D;
				else y <= A;
			end
			3:begin
				if (w == 0) y <= C;
				else y <= B;
			end
			default: y <= 2'bxx;
		endcase
	end
	
	//Output
	assign z = (y == D);
endmodule