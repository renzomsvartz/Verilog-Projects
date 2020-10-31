module Exercise5_20(input clock, input EN, input Resetn, output [3:0] Q);
	always@(negedge clock) begin
		if (!Resetn)
			Q <= 0;
		else
			if (Q == 12)
				Q <= 0;
			else
				Q <= Q + 1;
		end
	endmodule
endmodule 