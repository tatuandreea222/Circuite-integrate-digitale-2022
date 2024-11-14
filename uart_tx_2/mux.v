module mux
(
    input wire [3:0] sel,
    input wire [10:0] in,
    output wire out
);
assign out = in[sel];
endmodule