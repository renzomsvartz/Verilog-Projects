module Exercise2_61 (input x1, input x2, input x3, output f);
	or (orgate1, x1, x2, x3);
	or (orgate2, x3, ~x2, ~x1);
	or (orgate3, ~x3, x2, ~x1);
	or (orgate4, ~x2, ~x3, x1);
	and (f, orgate1, orgate2, orgate3, orgate4);
endmodule