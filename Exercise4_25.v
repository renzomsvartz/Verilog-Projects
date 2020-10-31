module Exercise4_25(input [7:0]y, input En, output reg [2:0]w);
	integer i;
	always@(y, En)
	begin
		if (En == 1)
		begin
			for (i = 0; i < 8; i = i+1)
				begin
				if (y[i] == 1)
					w = i;
				else
					w = 3'bxxx;
				end
		end
		else
			w = 3'bxxx;
	end
	
endmodule 