module Exercise5_10(input clock, input J, input K, output reg Q);
	always@(negedge clock) begin
		if (J & K) begin
			Q <= ~Qnot;
		end
		else if (J) begin
			Q <= 1;
		end
		else if (K) begin
			Q <= 0;
		end
	end
endmodule 