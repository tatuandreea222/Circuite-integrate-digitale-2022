module top
(
    input wire [15:0]instruction,
    input wire [7:0]data0,
    input wire [7:0]data1,
    output wire zero_flag,
    output wire overflow,
    output wire [7:0] out0,
    output wire [7:0] out1,
    output wire [7:0] out2,
    output wire [7:0] out3  
);

wire[7:0]w0;
wire[7:0]w1;
wire[7:0]w2;
wire[7:0]w3;
wire [8:0] suma;
assign suma = data0+data1;

mux4 v1
(
    .in0(data0>>data1),
    .in1(data0<<data1),
    .in2(suma),
    .in3(data0-data1),
    .out0(w0),
    .sel(instruction [11:10])
 );

mux4 v2
(
    .in0(data0&data1),
    .in1(data0|data1),
    .in2(data0^data1),
    .in3(1),
    .out0(w1),
    .sel(instruction [11:10])
 );


mux4 v3
(
    .in0(w0),
    .in1(w1),
    .in2(0),
    .in3(w3),
    .out0(w2),
    .sel(instruction [13:12])
 );

special spec
(
    .in0(data0),
    .in1(data1),
    .sel(w3)
    
    );


demux4 v4
(
    .in0(w2),
    .sel(instruction[15:14]),
    .out0(out0[7:0]),
    .out1(out1[7:0]),
    .out2(out2[7:0]),
    .out3(out3)
);

comp_eq eq
(
    .in0(w2),
    .in1(1),
    .out0(zero_flag)
);

assign overflow= suma[8:8];



endmodule
