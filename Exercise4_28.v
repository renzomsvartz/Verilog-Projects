module Exercise4_28(input [1:0]s, input [3:0]w, output f);
	wire [3:0]dec_output;
	
	decoder2to4 d1 (s, 1, dec_output);
	
	assign f = dec_output[3] & w[0] | dec_output[2] & w[1] | dec_output[1] & w[2] | dec_output[0] & w[3]; 
	
endmodule

module decoder2to4(input [1:0]w, input En, output reg [0:3]y);
	always @(w, En)
	begin
		case({En, w})
		3'b100: y = 4'b1000;
		3'b101: y = 4'b0100;
		3'b110: y = 4'b0010;
		3'b111: y = 4'b0001;
		default: y = 0;
		endcase
	end
	
endmodule 