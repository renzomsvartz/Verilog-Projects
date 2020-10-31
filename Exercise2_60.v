module Exercise2_60 (input x1, input x2, input x3, output f);
	and (andgate1, ~x1, ~x2, x3);
	and (andgate2, ~x1, ~x3, x2);
	and (andgate3, ~x2, ~x3, x1);
	and (andgate4, x1, x2, x3);
	or (f, andgate1, andgate2, andgate3, andgate4);
endmodule