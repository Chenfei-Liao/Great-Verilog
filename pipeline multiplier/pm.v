module pm(input clk,input clk1,input rst_n,input [3:0] mul_a,input [3:0] mul_b,output reg [7:0] mul_out);
reg [7:0] temp1=0;
reg [7:0] temp2=0;
reg [7:0] temp3=0;
reg [7:0] temp4=0;
always@(posedge clk,negedge rst_n)begin
	if(!rst_n)
	mul_out<=0;
	else begin
	temp1[3:0]<=mul_b[0]?mul_a:0;
	temp2[4:1]<=mul_b[1]?mul_a:0;
	temp3[5:2]<=mul_b[2]?mul_a:0;
	temp4[6:3]<=mul_b[3]?mul_a:0;
end
end
always@(posedge clk1)begin
mul_out<=temp1+temp2+temp3+temp4;
end

endmodule
