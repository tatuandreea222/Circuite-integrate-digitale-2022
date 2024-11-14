module top
(
    input wire clk_top,
    input wire en_top,
    input wire reset_top,
    output wire [7:0]sir,
    output wire tester    
);


wire [7:0] out_reg1;
wire [7:0] out_reg2;
wire [10:0] out_counter;
wire [7:0] out_struct;
wire [7:0] out_behav;
wire [10:0] out_scadere;

reg_8b reg1
(
    .clk(clk_top),
    .en(en_top),
    .reset(reset_top),
    .in(out_behav),
    .out(out_reg1)
);

reg_8b reg2
(
   .clk(clk_top),
   .en(en_top),
   .reset(reset_top),
   .in(out_reg1),
   .out(out_reg2)
);

counter_11b counter 
(
    .clk(clk_top),
    .en(en_top),
    .reset(reset_top),
    .out(out_counter)
);

compute_structural structural 
(
    .in0(out_reg1),
    .in1(out_reg2),
    .out(out_struct)
);

compute_behav behav 
(
    .in0(out_reg1),
    .in1(out_reg2),
    .out(out_behav)
);

substract scadere
(
      .in0(out_counter),
      .in1(1),
      .out(out_scadere)
);

ram  ram
(
        .clock(clk_top),
		.addr_r(out_scadere), 
		.data_r(sir), 
		.we(en_top),
		.addr_w(out_counter),
		.data_w(out_behav)
);

comp_eq comp
(
       .in0(out_struct),
       .in1(out_behav),
       .out(tester)
);








endmodule