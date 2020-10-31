module Exercise5_22(input clock, input Startn, output reg [7:0]Q);
	integer i;
	always@(negedge clock, negedge Startn) begin
		if (!Startn) begin
			Q[0] <= 1;
			Q[7:1] <= 0;
		end
		else begin
			for (i = 7; i > 0; i = i - 1) begin
				Q[i] <= Q[i - 1];
			end
			Q[0] <= ~Q[7];
		end
	end
endmodule 