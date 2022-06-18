module tl
    (
	input rst_n, 
        input clk, 
        input pass_request,
	output wire[7:0]clock,
        output reg red,
	output reg yellow,
	output reg green
    );
parameter A=0;
parameter B=1;
parameter C=2;
reg [1:0] state;
reg [1:0] nstate;
reg [7:0] cnt=0;

always@(posedge clk, negedge rst_n) begin
	if(!rst_n)begin
		state<=A;
		nstate<=A;
	end
	else
		state<=nstate;
	end

always@(*) begin
	case(state)
	A:begin
		if (cnt==60) begin
			nstate<=B;
		end
	else
		nstate<=A;
	end
B:begin
if (cnt==5) begin
nstate<=C;
end
else
nstate<=B;
end
C:begin
if (cnt==10) begin
nstate<=A;
end
else
nstate<=C;
end
endcase
end

always@(posedge clk, negedge rst_n,posedge pass_request) begin
if(pass_request) begin
	if(state==A)begin
		if(cnt<=50)begin
			cnt<=50;
		end
	end
end
else if(!rst_n)
	cnt<=0;
else begin
	if (state==A) begin
		if (cnt==60) 
		cnt<=0;
		else cnt<=cnt+1;
	end
	else if (state==B) begin
		if (cnt==5) 
		cnt<=0;
		else cnt<=cnt+1;
		
	end
	else if (state==C) begin
		if (cnt==10) 
		cnt<=0;
		else cnt<=cnt+1;
		
	end
end
end

assign clock=cnt;

always@(*)begin
if (state==A) begin
green=1;
yellow=0;
red=0;
end

else if(state==B) begin
green=0;
yellow=1;
red=0;
end

else if(state==C) begin
green=0;
yellow=0;
red=1;
end
end
endmodule