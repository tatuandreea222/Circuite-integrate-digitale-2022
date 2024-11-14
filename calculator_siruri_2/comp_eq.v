module comp_eq
(
       input wire [7:0]in0,
       input wire [7:0]in1,
       output wire out
);

assign out = (in0 == in1); 
endmodule