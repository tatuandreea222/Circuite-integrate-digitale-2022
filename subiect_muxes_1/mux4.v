module mux4
(
    input wire in0,
    input wire in1,
    input wire in2,
    input wire in3,
    output wire out0,
    input wire [1:0]sel
);

wire w0,w1;

mux2 v1
(
   .in0(in0),
   .in1(in1), 
   .sel(sel[0]),
   .out0(w0)
);

mux2 v2
(
   .in0(in2),
   .in1(in3), 
   .sel(sel[0]),
   .out0(w1)
);

mux2 v3
(
   .in0(w0),
   .in1(w1), 
   .sel(sel[1]),
   .out0(out0)
);
endmodule
