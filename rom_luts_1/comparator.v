module comparator
(
    input wire [1:0]in0,
    input wire [1:0]in1,
    output wire out0
);

assign out0 = (in0==in1);
endmodule