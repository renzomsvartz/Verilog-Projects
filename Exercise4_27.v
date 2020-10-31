module Exercise4_27(input [5:0]w, input En, output [63:0]y);
	wire [7:0]WiresEn;
	
	h3to8 enables (w[5:3], En, WiresEn);
	
	h3to8 bd1 (w[2:0], WiresEn[0], y[7:0]);
	h3to8 bd2 (w[2:0], WiresEn[1], y[15:8]);
	h3to8 bd3 (w[2:0], WiresEn[2], y[23:16]);
	h3to8 bd4 (w[2:0], WiresEn[3], y[31:24]);
	h3to8 bd5 (w[2:0], WiresEn[4], y[39:32]);
	h3to8 bd6 (w[2:0], WiresEn[5], y[47:40]);
	h3to8 bd7 (w[2:0], WiresEn[6], y[55:48]);
	h3to8 bd8 (w[2:0], WiresEn[7], y[63:56]);
	
endmodule

module if2to4(input [1:0]w, input En, output reg [3:0]y);
	always@(w, En)
	begin
		casex({En, w})
		3'b100: y = 4'b0001;
		3'b101: y = 4'b0010;
		3'b110: y = 4'b0100;
		3'b111: y = 4'b1000;
		default: y = 4'bxxxx;
		endcase
	end

endmodule

module h3to8(input [2:0]w, input En, output [7:0]y);
	assign En1 = ~w[2] & En;
	assign En2 = w[2] & En;

	if2to4 bin_dec1 (w[1:0], En1, y[3:0]);
	if2to4 bin_dec2 (w[1:0], En2, y[7:4]);
	
endmodule 