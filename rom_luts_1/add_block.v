module add_block
(
    input wire sel,
     input wire [1:0] in0_add,
     input wire [1:0] in1_add,
     output wire [1:0] out0_add,
     output wire [1:0] out1_add,
     output wire  ok_add

);

wire[1:0]w0;
wire[1:0]w1;
//wire[3:0]w2;
wire [3:0] concatenare;
assign concatenare ={in0_add,in1_add};
add add
(
    .in0(in0_add),
    .in1(in1_add),
    .out(w0)
);

rom_add addr
(
    .in(concatenare),
    .out(w1)
);

comparator comp1
(
    .in0(w0),
    .in1(w1),
    .out0(ok_add)
);

mux2 mux2
(
   .in0(w0),
   .in1(w1), 
   .sel(sel),
   .out0(out0_add)
);

overflaw_compute overfl
(
    .in0(in0_add),
    .in1(in1_add),
    .out(out1_add)
);












endmodule




