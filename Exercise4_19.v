module Exercise4_19(input [2:0]w, output reg f);
	always@(w)
		begin
			case(w)
				1: f = 1;
				2: f = 1;
				3: f = 1;
				5: f = 1;
				6: f = 1;
				default: f = 0;
			endcase
		end
endmodule 