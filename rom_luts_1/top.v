module top
(
    input wire [1:0]data0,
    input wire [1:0]data1,
    input wire [7:0] instr_in,
    output wire [1:0] out_top0,
    output wire [1:0] out_top1,
    output wire [1:0] out_top2,
    output wire [1:0] out_top3,
    output wire ok,
    output wire [1:0]overflag,
    output wire [7:0] instr_out

);
assign instr_out = instr_in;
wire  w0;
wire  w1;
wire [1:0] w2;
wire [1:0] w3;
wire [1:0] w4;
wire [1:0] w5;

add_block add_block
(
   .sel(instr_in[0:0]),
   .in0_add(data0),
   .in1_add(data1),
   .out0_add(w2),
   .out1_add(overflag),
   .ok_add(w0)

);

and_block and_block
( 
    .sel(instr_in[0:0]),
    .in0_and(data0),
    .in1_and(data1),
    .out0_and(w3),
    .ok_and(w1)
);

assign ok = (w0 | w1);

special special
(
    .in0(data0),
    .in1(data1),
    .out0(w4)
);

mux4 mux4
(
   .in0(w2),
   .in1(w3),
   .in2(w4),
   .in3(0),
   .out0(w5),
   .sel(instr_in[2:1])
);

demux4 demux4
(
   .in0(w5),
   .sel(instr_in[4:3]),
   .out0(out_top0), 
   .out1(out_top1),
   .out2(out_top2),
   .out3(out_top3) 
 );


endmodule
