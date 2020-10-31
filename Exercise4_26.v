module Exercise4_26(input [1:0]w, input En, output reg [3:0]y);
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

module h3to8(input [2:0]w, input En, output reg [7:0]y);
	assign En1 = ~w[3] & En;
	assign En2 = w[3] & En;
	
	Exercise4_26 bd1 (w[1:0], En1, y[3:0]);
	Exercise4_26 bd2 (w[1:0], En2, y[7:4]);
	
endmodule 