module Exercise4_33(input [7:0]y, output [7:0]x, output error);
	assign error = ^y;
	assign x = {1'b0, y[6:0]};
	
endmodule

module parity_bit(input [6:0]X, output [7:0]Y);
	assign Y = {^X, X}; //even parity
	
endmodule 