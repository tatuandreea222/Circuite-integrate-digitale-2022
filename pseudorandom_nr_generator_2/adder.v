module adder
(
    input wire [11:0]in0,
    input wire [11:0]in1,
    input wire [3:0]in2,
    output wire [3:0]out
);

assign out = in0 + in1 + in2;
endmodule