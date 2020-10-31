module Exercise5_13(input clock, input EN, input RL, input Load, input serial, output reg [n-1:0]Q);
	wire [n-1:0]D;
	always@(negedge clock, posedge Load) begin
		if (Load)
			Q = D;
		else if (EN) begin
			if (!RL) begin
				for (i = n - 1; i < 0; i = i - 1) begin
					Q[i] <= Q[i - 1];
				end
				Q[0] <= serial;
			end
			else begin
				for (i = 0; i < n - 1; i = i + 1) begin
					Q[i] <= Q[i + 1];
				end
				Q[n-1] <= Q[0];
			end
		end
	end
endmodule 