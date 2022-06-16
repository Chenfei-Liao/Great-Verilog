module sd3(
	input clk,
	input rst_n,
	input data,
	output reg match,
	output reg not_match
	);
parameter X=0;
parameter A=1;
parameter B=2;
parameter C=3;
parameter D=4;
parameter E=5;
parameter F=6;
parameter DEAD=7;
reg [3:0] cnt=0;
reg [3:0] state;
reg [3:0] nstate;
always@(posedge clk,negedge rst_n) begin
	if(!rst_n)
		cnt<=0;
	else if(cnt==6)
		cnt<=1;
	else 
		cnt<=cnt+1;
end
always @(posedge clk,negedge rst_n) begin
		state<=nstate;
end
always @(*) begin
if (!rst_n)
	nstate<=X;
else begin
case(state)
X: nstate = data? DEAD : A;
A: nstate = data? B : DEAD;
B: nstate = data? C: DEAD;
C: nstate = data? D : DEAD;
D: nstate = data? DEAD: E;
E: nstate = data? DEAD : F;
F: nstate = data? DEAD : A;
DEAD : nstate = cnt==6&&data==0? A: DEAD;
default: nstate = X;
endcase
end
end
always@(posedge clk,negedge rst_n) begin
	if(!rst_n) begin
		match<=0;
		not_match<=0;
	end
	else begin
	match<=(nstate==F&&cnt==6);
	not_match<=(nstate==DEAD&&cnt==6);
end
end

endmodule