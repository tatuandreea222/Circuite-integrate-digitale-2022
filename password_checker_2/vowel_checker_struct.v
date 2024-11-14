module vowel_checker_struct
(
    input wire [7:0] data_in,
    output wire is_vowel
);

assign is_vowel = ((data_in == "A") | (data_in == "E") | (data_in == "I") | (data_in == "U") | (data_in == "O"));
endmodule