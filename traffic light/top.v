module top(clk, rst,light_s,light_w);
	input clk;
	input rst;
	output light_s;
	output light_w; 
	reg clk1;
	parameter GREEN=0;
	parameter YELLOW=1;
	parameter RED1=2;
	parameter RED2=3;
	reg [2:0] light_s;
	reg [2:0] light_w;
	reg [2:0] st_cur;
	reg [2:0] st_next; 
	reg [7:0] cnt=0;
//???
	always @(*)
	begin 
		if(!rst)
			begin
			st_cur<=GREEN;
			end
		else
			begin
			st_cur<=st_next;
			end
	end
//???
	always @(posedge clk)
		case(st_cur)
			GREEN:begin
				if(cnt<19)
					begin
	
						cnt=cnt+1;
						st_next<=GREEN;
					end
				else if(cnt==19)
					begin
						cnt=0;			
						st_next<=YELLOW;
						
					end
				end
			YELLOW:begin
				if(cnt<2)
					begin
						cnt=cnt+1;
						st_next<=YELLOW;
						
					end
				else if(cnt==2)
					begin
						cnt=0;
						st_next<=RED1;
						
					end
				end
			RED1:begin
				if(cnt<56)
					begin
						cnt=cnt+1;
						st_next<=RED1;
						
					end
				else if(cnt==56)
					begin
						cnt=0;
						st_next<=RED2;
						
					end
				end
			RED2:begin
				if(cnt<2)
					begin
						cnt=cnt+1;
						st_next<=RED2;
						
					end
				else if(cnt==2)
					begin
						cnt=0;
						st_next<=GREEN;
					end
				end
				default begin
					cnt=0;
					st_next<=GREEN;
					end
		endcase
//???
	always@(*)begin
		if(st_cur==GREEN)
			begin
				light_s<=3'b100;
				light_w<=3'b001;
			end
		else if(st_cur==YELLOW)
			begin
				light_s<=3'b010;
				light_w<=3'b001;
			end
		else if(st_cur==RED1)
			begin
				light_s<=3'b001;
				light_w<=3'b100;
			end
		else if(st_cur==RED2)
			begin
				light_s<=3'b001;
				light_w<=3'b010;
			end
	end
endmodule

