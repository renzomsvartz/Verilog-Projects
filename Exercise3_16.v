/*Figure 3.35*/
module Exercise3_16(input [3:0]m, input [3:0]q, output [7:0]p);
	wire [3:0]andgates1;
	andgates and1 (m, q[0], andgates1);
	wire [3:0]andgates2;
	andgates and2 (m, q[1], andgates2);
	wire [4:0]PP0;
	RCA rca1 (andgates1[3:1], andgates2, PP0);
	wire [3:0]andgates3;
	andgates and3 (m, q[2], andgates3);
	wire [4:0]PP1;
	RCA rca2 (PP0[4:1], andgates3, PP1);
	wire [3:0]andgates4;
	andgates and4 (m, q[3], andgates4);
	wire [4:0]PP2;
	RCA rca3 (PP1[4:1], andgates4, PP2);
	assign p = {PP2, PP1[0], PP0[0], andgates1[0]};
endmodule
/*Figure 3.35*/

/*AND*/
module andgates(input [3:0]m, input q, output reg [3:0]andgates);
	integer i;
	always@(*)
	begin
		for (i = 0; i < 4; i = i + 1)
		begin
			andgates[i] = m[i] & q;
		end
	end
endmodule
/*AND*/

/*RCA*/
module RCA(input [3:0]x, input [3:0]y, output [4:0]s);
	assign s = x + y;
endmodule 
/*RCA*/