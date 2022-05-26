module sd1(input clk,input rst_n,input a,output reg match);
reg [7:0] state;
always@(posedge clk,negedge rst_n)
begin
	if(!rst_n)
		state<=0;
	else
		state<={state[6:0],a};
end
always@(posedge clk)
	case(state)
	8'b01110001:match<=1;
	default:match<=0;
	endcase
endmodule
		