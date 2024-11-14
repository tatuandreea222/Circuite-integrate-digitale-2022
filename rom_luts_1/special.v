module special(
    input wire [1:0]in0,
    input wire [1:0]in1,
    output wire [1:0]out0
    );
    
    wire [1:0]suma0;
    wire [1:0]suma1;
    assign suma0=in0[0]+in0[1];
    assign suma1=in1[0]+in1[1];
    assign out0 = (suma0==suma1);
endmodule
