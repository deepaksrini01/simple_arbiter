module arbiter4(gnt0,gnt1,gnt2,gnt3,req0,req1,req2,req3,clk,rst);
	input      req0,req1,req2,req3;
	input      clk,rst;
	output reg gnt0,gnt1,gnt2,gnt3;
	
	parameter   idle=3'b000,
				GNT0=3'b001,
				GNT1=3'b010,
				GNT2=3'b011,
				GNT3=3'b100;
				
	reg [2:0]   next_state,state;
	
	always@(posedge clk)
		begin
			if(rst)
			state <= idle;
			else
			state <= next_state;
		end
		
	always@(state,req0,req1,req2,req3)
		begin
			next_state <= 0;
			
			case(state)
			idle: begin
					if(req0)
					next_state <= GNT0;
					else if(req1)
					next_state <= GNT1;
					else if(req2)
					next_state <= GNT2;
					else if(req3)
					next_state <= GNT3;
					else
					next_state <= idle;
				end
				
			GNT0: begin
					if(req0)
					next_state <= GNT0;
					else
					next_state <= idle;
				end
				
			GNT1: begin
					if(req1)
					next_state <= GNT1;
					else
					next_state <= idle;
				end
					
				GNT2: begin
					if(req2)
					next_state <= GNT2;
					else
					next_state <= idle;
				end
				
				GNT3: begin
					if(req3)
					next_state <= GNT3;
					else
					next_state <= idle;
				end
			endcase
		end

always@(state)
		begin
			if(state == idle)begin
			gnt0 <= 0;
			gnt1 <= 0;
			gnt2 <= 0;
			gnt3 <= 0;
			end
			else if(state == GNT0)begin
			gnt0 <= 1;
			gnt1 <= 0;
			gnt2 <= 0;
			gnt3 <= 0;	
			end
			else if(state == GNT1)begin
			gnt0 <= 0;
			gnt1 <= 1;
			gnt2 <= 0;
			gnt3 <= 0;
			end	
			else if(state == GNT2)begin
			gnt0 <= 0;
			gnt1 <= 0;
			gnt2 <= 1;
			gnt3 <= 0;
			end
			else if(state == GNT3)begin
			gnt0 <= 0;
			gnt1 <= 0;
			gnt2 <= 0;
			gnt3 <= 1;
			end
		end
	endmodule	
				
				