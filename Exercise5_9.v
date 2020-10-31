module Exercise5_9(input clock, input T, input clear_n, output reg Q);
	always@(negedge clock, negedge clear_n) begin
		if (!clear_n) begin
			Q <= 0;
		end
		else if (T) begin
			Q <= ~Q;
		end
	end
endmodule 