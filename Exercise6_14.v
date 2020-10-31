module Exercise6_14(input a, input b, input Clock, input Resetn, output reg y, output reg s, output reg [1:0]y2, output reg s2);
	parameter G = 0, H = 1;
	parameter [1:0] G0 = 2'b00, G1 = 2'b01, H0 = 2'b10, H1 = 2'b11;
	reg [1:0] w1, w2;
	
	always@(posedge Clock, negedge Resetn)
	begin
		if (!Resetn)
		begin
			#1 y <= G;
			#1 s <= 0;
		end
		else
		begin
			#1 w1 = a + b;
			case(w1)
			0:begin
					#1 y <= G;
					if (y == G) #1 s = 0;
					else #1 s = 1;
				end
			1:begin
					if (y == G) #1 s = 1;
					else
					begin
						#1 y <= H;
						#1 s = 0;
					end
				end
			2:begin
					if (y == G) #1 s = 1;
					else
					begin
						#1 y <= H;
						#1 s = 0;
					end
				end
			3:begin
					#1 y <= H;
					if (y == G) #1 s = 0;
					else #1 s = 1;
				end
			default:
				begin
					#1 y <= G;
					#1 s <= 0;
				end
			endcase
		end
	end
	
	always@(posedge Clock, negedge Resetn)
	begin
		if (!Resetn)
		begin
			#1 y2 <= G0;
			#1 s2 <= 0;
		end
		else
		begin
			#1 w2 = a + b;
			case(w2)
			0:begin
					if (y2 == G0)
					begin
						#1 s2 = 1;
					end
					else if (y2 == G1) 
					begin
						#1 y2 <= G0;
						#1 s2 = 0;
					end
					else if (y2 == H0) 
					begin
						#1 y2 <= G1;
						#1 s2 = 0;
					end
					else if (y2 == H1) 
					begin
						#1 y2 <= G1;
						#1 s2 = 1;
					end
				end
			1:begin
					if (y2 == G0)
					begin
						#1 y2 <= G1;
						#1 s2 = 1;
					end
					else if (y2 == G1) 
					begin
						#1 y2 <= G1;
						#1 s2 = 0;
					end
					else if (y2 == H0) 
					begin
						#1 y2 <= H0;
						#1 s2 = 0;
					end
					else if (y2 == H1) 
					begin
						#1 y2 <= H0;
						#1 s2 = 1;
					end
				end
			2:begin
					if (y2 == G0)
					begin
						#1 y2 <= G1;
						#1 s2 = 1;
					end
					else if (y2 == G1) 
					begin
						#1 y2 <= G1;
						#1 s2 = 0;
					end
					else if (y2 == H0) 
					begin
						#1 y2 <= H0;
						#1 s2 = 0;
					end
					else if (y2 == H1) 
					begin
						#1 y2 <= H0;
						#1 s2 = 1;
					end
				end
			3:begin
					if (y2 == G0)
					begin
						#1 y2 <= G1;
						#1 s2 = 1;
					end
					else if (y2 == G1) 
					begin
						#1 y2 <= G1;
						#1 s2 = 0;
					end
					else if (y2 == H0) 
					begin
						#1 y2 <= H0;
						#1 s2 = 0;
					end
					else if (y2 == H1) 
					begin
						#1 y2 <= H0;
						#1 s2 = 1;
					end
				end
			default:
				begin
					#1 y2 <= G0;
					#1 s2 <= 0;
				end
			endcase
		end
	end
endmodule

module t_Exercise6_14;
	reg a;
	reg b;
	reg Clock;
	reg Resetn;
	wire y;
	wire s;
	wire [1:0]y2;
	wire s2;
	
	Exercise6_14 UUT1(a, b, Clock, Resetn, y, s, y2, s2);
	
	initial
	begin
		Clock = 0;
		begin: clock_loop
			forever #5 Clock <= ~Clock;
		end
	end
	
	initial
	begin
		Resetn = 0;
		Resetn = #1 1;
	end
	
	initial
	begin
		$display("a    b    y    s    y2     s2");
		$monitor($realtime, "%b    %b    %b    %b    %b    %b", a, b, y, s, y2, s2);
	end
	
	initial
	begin
		a = 0; b = 0;
		#5 a = 0; b = 1;
		#5 a = 0; b = 0;
		#5 a = 1; b = 0;
		#5 a = 0; b = 0;
		#5 a = 1; b = 1;
		#5 a = 0; b = 0;
		#5 a = 0; b = 1;
		#5 a = 1; b = 0;
		#5 a = 0; b = 1;
		#5 a = 1; b = 1;
		#5 a = 0; b = 1;
		#5 a = 1; b = 0;
		#5 a = 1; b = 1;
		#5 a = 1; b = 0;
	end
endmodule 