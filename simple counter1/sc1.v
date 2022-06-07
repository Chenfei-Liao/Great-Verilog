module sc1(input set,input [3:0] set_num,input clk, input rst_n,output reg zero=0,output reg[3:0] number=0);
always@(posedge clk, negedge rst_n,posedge set)begin
	if(!rst_n) begin
		zero<=0;
		number<=0;
		end
	else if(set)
		number<=set_num;
	else if(number==15)begin
		zero<=1;
		number<=0;
end
	else begin
		number<=number+1;
		zero<=0;
end
	end

endmodule