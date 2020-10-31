module Exercise2_66 (input x1, input x2, input x3, input x4, input x5, output f, output g);
	assign f = (x1 & ~x2 & ~x5) | (~x1 & ~x2 & ~x4 & ~x5) | (x1 & x2 & x4 & x5) | (~x1 & ~x2 & x3 & ~x4) | (x1 & ~x2 & x3 &  x5) | (~x2 & ~x3 & x4 & ~x5) | (x1 & x2 & x3 & x4 & ~x5);
	assign g = (~x2 & x3 & ~x4) | (~x2 & ~x3 & ~x4 & ~x5) | (x1 & x3 & x4 & ~x5) | (x1 & ~x2 & x4 & ~x5) | (x1 & x3 & x4 &  x5) | (~x1 & ~x2 & ~x3 & ~x5) | (x1 & x2 & ~x3 & x4 & x5);
endmodule