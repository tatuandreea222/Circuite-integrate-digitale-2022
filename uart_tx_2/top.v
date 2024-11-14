`timescale 1ns / 1ps
module top
(
    input wire start,
    input wire clk_top,
    input wire rst_top,
    input wire [7:0]data_in,
    output wire out_tx
);

wire w0,w1,w2;
wire out_toggle;
wire out_comp2;
wire out_comp1;
wire  [19:0]out_baud_rate;
wire [3:0]out_bit_select;
wire [19:0]in_comp2;
wire out_comp3;
wire out_comp4;
wire out_calc;
wire [10:0]out_reg0;
assign in_comp2=10416;
assign w0 = start & (~out_toggle);
assign w1 = out_comp2 & out_comp1; // este a
assign w2 = w0 | w1;


toggle_ff toggle
(
    .toggle(w2),
    .clk(clk_top),
    .reset(rst_top),
    .out(out_toggle)
);

counter_baud_rate baud_rate
(
    .clk(clk_top),
    .en(out_toggle),
    .rst_sync(out_comp2),
    .rst_async(rst_top),
    .out(out_baud_rate)
);

comp_egal comp1
(
   .in0(10),
   .in1(out_bit_select),
   .out(out_comp1)
);

comp_egal comp2
(
   .in0(in_comp2),
   .in1(out_baud_rate),
   .out(out_comp2)
);

comp_egal comp3
(
   .in0(out_baud_rate),
   .in1(0),
   .out(out_comp3)
);

counter_bit_select bit_select
(
    .clk(clk_top),
    .reset(w1 | rst_top),
    .en(out_comp2),
    .out(out_bit_select)
);

comp_egal comp4
(
    .in0(out_bit_select),
    .in1(0),
    .out(out_comp4)
);

crc_calc calc
(
   .in(data_in),
   .out(out_calc)
);

reg0 reg0
(
    .clk(clk_top),
	.reset(rst_top),
	.load(start & out_comp4 & out_comp3), // en
	.data_in({1'b1,out_calc,data_in,1'b0}),
	.data_out(out_reg0)
);

 mux mux1
(
    .sel(out_bit_select),
    .in(out_reg0),
    .out(out_tx)
);



endmodule
