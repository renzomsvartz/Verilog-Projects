module Exercise6_13 (input w, input Clock, input Resetn, output reg z);
	parameter [2:0] A = 3'b00, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100, F = 3'b101;
	reg [2:0] y;
	
	always@(posedge Clock, negedge Resetn) 
	begin
	if (!Resetn)
	begin
		y <= A;
		z <= 0;
	end
	else
		case(y)
			A: if (w) 
				begin
					y <= B;
					z = 0; 
				end
				else 
				begin
					y <= E;
					z = 0;
				end
			B: if (w) 
				begin
					y <= C;
					z = 0;
				end
				else 
				begin
					y <= F;
					z = 0;
				end
			C: if (w) 
				begin
					y <= A;
					z = 0;
				end
				else 
				begin
					y <= D;
					z = 0;
				end
			D: if (w) 
				begin
					y <= B;
					z = 1;
				end
				else 
				begin
					y <= E;
					z = 1;
				end
			E: if (w) 
				begin
					y <= F;
					z = 0;
				end
				else 
				begin
					y <= C;
					z = 0;
				end
			F: if (w) 
				begin
					y <= D;
					z = 0;
				end
				else 
				begin
					y <= A;
					z = 0;
				end
			default: 
				begin
					y <= 3'bxxx;
					z = 0;
				end
		endcase
	end
endmodule 

