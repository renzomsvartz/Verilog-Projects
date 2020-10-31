module Exercise2_63 (input x1, input x2, input x3, output f);
	assign orgate1 = x1 | ~x2 | x3;
	assign orgate2 = ~x1 | ~x2 | ~x3;
	assign f = orgate1 & orgate2;
endmodule