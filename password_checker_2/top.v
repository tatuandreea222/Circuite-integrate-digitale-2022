`timescale 1ns / 1ps
module top
(
    input wire clk_top,
    input wire rst_top,
    input wire en_top,
    input wire [7:0] data_in,
    output wire [7:0]data_read,
    output wire [7:0]data_read2,
    output wire consoane,
    output wire vocale,
    output wire out_pass_check
);
wire out_counter;
wire out_is_vowel;
wire out_reg;

counter_6b counter
(
    .clk(clk_top),
    .rst(rst_top),
    .en(en_top),
    .counter(out_counter)
);

vowel_checker_struct vocala_check
(
    .data_in(data_in),
    .is_vowel(out_is_vowel)
);

pass_check_fsm parola_automat
(
    .clock(clk_top),
    .reset(rst_top),
    .enable(en_top),
    .data_in(data_in),
    .pass_ok(out_pass_check)
);

reg_6b reg6
(
    .clk(clk_top),
    .in(out_counter),
    .rst(rst_top),
    .out(out_reg)
);

ram_consonants consoane_ram
(
    .clk(clk_top),
    .w_en(en & (~out_is_vowel)),
    .addr(out_reg),
    .w_data(data_in),
    .r_data(data_read)
);

ram_vowels vocale_ram
(
    .clk(clk_top),
    .w_en(en & out_is_vowel),
    .addr(out_reg),
    .w_data(data_in),
    .r_data(data_read2)
);

demux demux
(
    .sel(out_is_vowel),
    .in(data_in),
    .out0(consoane),
    .out1(vocale)
);

endmodule
