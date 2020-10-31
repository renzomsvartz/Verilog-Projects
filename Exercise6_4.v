module Exercise6_4 (input clock, input Reset, input w, output reg z);
	parameter [1:0] A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
	reg [1:0]y;
	reg [1:0]Y;
	
	//Combinational block
	always@(w, y) begin
		case (y)
			A:	if (w) begin
					z = 0; Y = B;
					end
				else begin
					z = 0; Y = A;
					end
			B: begin 
				z = 0; Y = C;
				end
			C: begin
				z = 0; Y = D;
				end
			D: if (w) begin
					z = 1; Y = B;
					end
				else begin
					z = 0; Y = A;
					end
			default: begin 
					z = 0; Y = 2'bxx;
					end
		endcase
	end
	
	//Sequential block
	always@(posedge clock, negedge Reset) begin
		if (!Reset) y <= A;
		else y <= Y;
	end
	
	endmodule 