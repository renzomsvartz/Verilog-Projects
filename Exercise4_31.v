module Exercise4_31(input [7:0]w, input [2:0]s, input En, output reg [9:0]y);
	always@(w, s, En)
	begin
			casex({En, s}) //you could use [1:0]s. I like the circuit this way
			0: y = 0;
			1: y = w;
			2: y = 2 * w;
			3: y = 3 * w;
			4: y = 4 * w;
			default: y = 10'bxxxxxxxxxx;
			endcase
	end
	
endmodule 