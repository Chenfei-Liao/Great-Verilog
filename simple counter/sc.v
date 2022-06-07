module sc(input clk,input rst_n,output reg [7:0]second,output reg [7:0] minute);
initial begin
second=0;
minute=0;
end
always @(posedge clk,negedge rst_n) begin
	if(!rst_n) begin
		minute<=0;
		second<=0;
	end
	else begin
		if(minute==59)begin
			if(second==59)
			$stop;
			else begin
			second<=second+1;
			end
		end
		else if(second==59) begin
		minute<=minute+1;
		second<=0;
		end
		else begin
		second<=second+1;
		end
	end
end
endmodule

