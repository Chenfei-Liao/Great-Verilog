module sd2(
	input clk,
	input rst_n,
	input a,
	output reg match
	);
reg [8:0] x=0;
always@ (posedge clk,negedge rst_n)
	if(!rst_n)
		x<=0;
	else begin
		x<={x[7:0],a};
  	end
always@(posedge clk,negedge rst_n) begin
	if(!rst_n)
		match<=0;
	else if(x[8:6]==3'd011) begin
		if(x[2:0]==3'd110)
		match<=1;
	end
	else 
		match<=0;
end
endmodule
