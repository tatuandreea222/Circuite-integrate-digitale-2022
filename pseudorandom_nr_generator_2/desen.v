module desen
(
    input wire clk_desen,
    input wire rst_desen,
    input wire start_desen,
    input wire stop_desen,
    input wire [11:0]prev,
    input wire [11:0]seed,
    output wire [3:0]data_out
);

wire out_toggle;
wire [3:0]out_counter;
wire [3:0]out_adder;

toggle_flipflop flipflop
(
    .clk(clk_desen),
    .rst(rst_desen),
    .toggle(start_desen | stop_desen),
    .data(out_toggle)
);

counter counter
(
    .clk(clk_desen),
    .rst(rst_desen),
    .en(out_toggle),
    .data(out_counter)
);


adder adder
(
    .in0(seed),
    .in1(prev),
    .in2(out_counter),
    .out(out_adder)
);


lut lut 
(
   .addr(out_adder),
   .data(data_out)
);




endmodule