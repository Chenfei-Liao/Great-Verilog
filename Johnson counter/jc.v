module jc(input clk,input rst_n,output reg[3:0]Q);
reg [3:0] state;
reg [3:0] nstate;
parameter A=4'b0000;
parameter B=4'b1000;
parameter C=4'b1100;
parameter D=4'b1110;
parameter E=4'b1111;
parameter F=4'b0111;
parameter G=4'b0011;
parameter H=4'b0001;
initial begin
state=A;
end
always@(posedge clk,negedge rst_n) begin
if(!rst_n)
nstate<=A;
else case(state)
A:nstate<=B;
B:nstate<=C;
C:nstate<=D;
D:nstate<=E;
E:nstate<=F;
F:nstate<=G;
G:nstate<=H;
H:nstate<=A;
endcase
end
always@(*) begin
state=nstate;
end
always@(posedge clk,negedge rst_n) begin
if(!rst_n)
Q<=0;
else 
Q<=nstate;
end
endmodule
