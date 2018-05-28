module arbiter4_TB;
	reg req0,req1,req2,req3;
	reg clk,rst;
	wire gnt0,gnt1,gnt2,gnt3;
	
	arbiter4 uut(
					.clk(clk),
					.rst(rst),
					.req0(req0),
					.req1(req1),
					.req2(req2),
					.req3(req3),
					.gnt0(gnt0),
					.gnt1(gnt1),
					.gnt2(gnt2),
					.gnt3(gnt3));
					
	always #5 clk = !clk;
		initial
			begin
				clk  = 0;
				req0 = 0;
				req1 = 0;
				req2 = 0;
				req3 = 0;
				rst  = 0;
			
				#100;
			
				#10 rst = 1;
				#10 rst = 0;
				#10 req0 = 1;
				#10 req0 = 0;
				#10 req2 = 1;
				#10 req2 = 0;
				#10 req1 = 1;
				#10 req1 = 0;
				#10 req3 = 1;
				#10 req3 = 0;
			
				#300 $finish;
			end
endmodule	