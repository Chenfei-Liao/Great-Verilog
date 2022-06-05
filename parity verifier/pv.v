module pv(input data_in,output x,output y);
assign  x=(~(^data_in));
assign  y=^data_in;
endmodule
