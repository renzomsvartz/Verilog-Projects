module Exercise6_10 (input [1:0]w, input Clock, input Resetn, output reg z);
	parameter [1:0] A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
	reg [1:0]y;
	
	always@(posedge Clock, negedge Resetn) 
	begin
	if (!Reset)
		begin	
			y <= A;
			z <= 0;
		end
	else
		case (y)
			A: if (w == 00 || w == 11)
				begin
					z <= 0; y <= B;
				end
				else 
					begin
					z <= 0; y <= A;
				end
			B: if (w == 00 || w == 11) 
				begin
					z <= 0; y <= C;
				end
				else 
				begin
					z <= 0; y <= A;
				end
			C: if (w == 00 || w == 11) 
				begin
					z <= 0; y <= D;
				end
				else 
				begin
					z <= 0; y <= A;
				end
			D: if (w == 00 || w == 11) 
				begin
					z <= 1; y <= D;
				end
				else 
				begin
					z <= 0; y <= A;
				end
			default: 
				begin
					z <= 0; y <= 2'bxx;
				end
		endcase
	end	
endmodule 