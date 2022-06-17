module sd4(
	input clk,
	input rst_n,
	input data,
	input data_valid,
	output reg match
	);
parameter A=0;
parameter B=1;
parameter C=2;
parameter D=3;
parameter E=4;
reg [2:0] state;
reg [2:0] nstate;
always@(posedge clk,negedge rst_n)  begin
if(!rst_n)
state<=A;
else
state<=nstate;
end
always@(*) begin
if (rst_n) begin
if(data_valid)
case(state)
A:nstate<=data?A:B;
B:nstate<=data?C:A;
C:nstate<=data?D:A;
D:nstate<=data?A:E;
E:nstate<=A;
endcase
else if(!data_valid)
nstate<=state;
end
else
nstate<=state;
end
always@(posedge clk,negedge rst_n)  begin
if(!rst_n)
match<=0;
else if(nstate==E) begin
	if (!data_valid) //判断防止match出现超过一个周期长度。
match<=0;
else
match<=1;
end
else
match<=0;
end
endmodule
