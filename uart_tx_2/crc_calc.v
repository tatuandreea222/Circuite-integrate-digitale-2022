`timescale 1ns / 1ps
module crc_calc
(
    input wire [7:0]in,
    output wire out
);

assign out = ^in;
//assign out = in[0] ^ in[1] ^ in[2] ^ in[3] ^ in[4] ^ in[5] ^ in[6] ^ in[7] ;

endmodule
