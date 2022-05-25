module sd(input clk,input rst_n,input a,output reg match);
parameter A=1;
parameter B=2;
parameter C=3;
parameter D=4;
reg [2:0] state;
reg [1:0] cnt=0;
	

always@(posedge clk,negedge rst_n)
begin
	if(!rst_n)begin
		cnt<=0;
		state<=A;
		end
	else
	case(state)
		A:begin
			if(a)
			state<=B;
			else
			state<=A;
		end
		B:begin
			if(!a)
				if(cnt==2)
					begin
						cnt<=0;
						state<=C;
					end
				else
					begin
					state<=A;
					end
				
			else if(a) begin
				cnt<=cnt+1;
				state<=B;	
				end
		end
		C:begin
			if(a)
				if(cnt==2)
					begin
						cnt<=0;
						state<=D;
					end
				else
					begin
					state<=A;
					end
				
			else if(!a) begin
				cnt<=cnt+1;
				state<=C;	
				end
		end
	default:begin
		cnt<=0; 
		state<=A;
		end
	endcase
end
always@(posedge clk)
begin
	case(state)
	C:begin
		if(a)
		match<=1;
end
	default:match<=0;
	endcase
end
endmodule

