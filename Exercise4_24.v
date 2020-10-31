module Exercise4_24(input [7:0]y, input En, output reg [2:0]w);
	always@(y, En)
	begin
		casex({En, y})
		9'b100000001: w = 0;
		9'b10000001x: w = 1;
		9'b1000001xx: w = 2;
		9'b100001xxx: w = 3;
		9'b10001xxxx: w = 4;
		9'b1001xxxxx: w = 5;
		9'b101xxxxxx: w = 6;
		9'b11xxxxxxx: w = 7;
		default: w = 3'bxxx;
		endcase
	end

endmodule 