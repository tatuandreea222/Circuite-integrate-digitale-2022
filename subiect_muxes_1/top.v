module top
(
     input wire in0_top, 
     input wire in1_top, 
     input wire in2_top, 
     input wire in3_top,
     input wire [1:0]sel,
     input wire [5:2]data,
     output wire out0,
     output wire out1,
     output wire out2,
     output wire out3
 );
 wire w0;
 wire w1;
 wire [1:0]w2;
 mux4 mux4
(
    .in0(in0_top),
    .in1(in1_top),
    .in2(in2_top),
    .in3(in3_top),
    .out0(w0),
    .sel(sel)
);

parity_calc par
(
    .in(data),
    .out(w1)
);

mux2_v2 v5
(
   .in0(~sel),
   .in1(sel), 
   .sel(w1),
   .out0(w2)
);

demux4 dev3
(
    .in0(w0),
    .sel(w2),
    .out0(out0),
    .out1(out1),
    .out2(out2),
    .out3(out3)
);

endmodule
