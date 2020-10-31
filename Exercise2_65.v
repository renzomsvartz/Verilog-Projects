module Exercise2_65 (input x1, input x2, input x3, input x4, output f1, output f2);
	assign f1 = (x1 & x3) | (~x1 & ~x3) | (x2 & x4) | (~x2 & ~x4);
	assign f2 = (x1 & x2 & ~x3 & ~x4) | (~x1 & ~x2 & x3 & x4) | (x1 & ~x2 & ~x3 & x4) | (~x1 & x2 & x3 & ~x4);
endmodule