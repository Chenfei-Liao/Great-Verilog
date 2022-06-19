module ml(input a,input clk,input rst,output reg x);
parameter A=0;
parameter B=1;
parameter C=2;
reg [1:0] state;
reg [1:0] nstate;
always@(posedge clk) begin
	if(!rst)
		state<=A;
	else 
		state<=nstate;
end
always@(*) begin
	nstate=A;
	case(state) 
	A:nstate=a?B:A;
	B:nstate=a?C:A;
	C:nstate=A;
	endcase
end
always@(state) begin
	if(!rst)
		x=0;
	else if(state==C) begin
		if(a==0)
			x=1;
		end
	else
		x=0;
end
endmodule

