module Exercise4_21(input [7:0]y, input En, output reg [2:0]w);
	always@(y, En)
	begin
		casex({En, y})
		9'b100000001: w = 0;
		9'b100000010: w = 1;
		9'b100000100: w = 2;
		9'b100001000: w = 3;
		9'b100010000: w = 4;
		9'b100100000: w = 5;
		9'b101000000: w = 6;
		9'b110000000: w = 7; //can be 0 2 4 8 16 32 64 128
		default: w = 3'bxxx; //can be 0-7 or xxx or zzz or any combination of those three;
		endcase
	end
	
endmodule 