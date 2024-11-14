module and_block
( 
     input wire sel,
     input wire [1:0] in0_and,
     input wire [1:0] in1_and,
     output wire [1:0] out0_and,
     output wire [1:0] ok_and
);

wire[1:0]w2;
wire[1:0]w3;
wire [3:0] concatenare;
assign concatenare ={in0_and,in1_and};
and2 and2
(
   .in0(in0_and),
   .in1(in1_and),
   .out(w2)
);

rom_and addr2
(
    .in(concatenare),
    .out(w3)
);

comparator comp2
(
    .in0(w2),
    .in1(w3),
    .out0(ok_and)
);

mux2 mux2
(
   .in0(w2),
   .in1(w3), 
   .sel(sel),
   .out0(out0_and)
);



endmodule