module Exercise2_62 (input x1, input x2, input x3, output f);
	or (orgate1, x1, x2, x3);
	or (orgate2, ~x1, ~x2, ~x3);
	and (f, orgate1, orgate2);
endmodule