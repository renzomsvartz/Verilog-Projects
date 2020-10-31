module Exercise5_23(input clock, input Startn, output reg [n-1:0]Q);
	parameter n;
	integer i;
	always@(negedge clock, negedge Startn) begin
		if (!Startn) begin
			Q[0] <= 1;
			Q[n-1: 1] <= 0;
		end
		else
			for (i = n - 1; i > 0; i = i - 1) begin
				Q[n] <= Q[n - 1];
			end
			Q[0] <= Q[n - 1];
		end
	end
endmodule 