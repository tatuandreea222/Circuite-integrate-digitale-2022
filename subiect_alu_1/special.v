module special(
    input wire [7:0]in0,
    input wire [7:0]in1,
    output wire [7:0] sel
    
    );
    
    assign sel = ((in0[7] == in1[7]) & (in0[0] == in1[0]) & (in0[7] == in1[0]) & (in0[0] == in1[7]));
endmodule
//assign special =((data0[7]==data1[7]) & (data0[0]==data1[0]) & (data0[7]==data1[0]) && (data0[0]==data1[7]));