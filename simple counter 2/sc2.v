module sc2(
	input clk,
	input rst_n,
	input mode,
	output reg [3:0]number=0,
	output reg zero=0
	);
always@(posedge clk,negedge rst_n) begin
	if (!rst_n) begin
		number<=0;
		zero<=0;
	end
	else if(mode) begin
		if (number==9) begin
			number<=0;
			zero<=1;
		end
		else begin
			number<=number+1;
			zero<=0;
		end
	end
	else if(!mode) begin
		if (number==1) begin
			number<=0;
			zero<=1;
		end
		else if(number==0) begin
			number<=9;
			zero<=0;
		end
		else begin
			number<=number-1;
			zero<=0;
		end
	end
end
endmodule