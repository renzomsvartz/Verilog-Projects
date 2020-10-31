module Exercise4_20(input [3:0]y, input En, output reg [1:0]w); //output reg error
	always@(y, En)
		begin
			casex({En, y})
			5'b10001: w = 0;
			5'b10010: w = 1;
			5'b10100: w = 2;
			5'b11000: w = 3; //can be 0 2 4 8
			default: w = 2'bxx; //can be 0-3 or xx or zz or any combination of those three;
			endcase
		end

endmodule 