module tb();
reg [7:0] data0;
reg [7:0] data1;
reg [15:0] instruction;
wire [7:0]out0_tb;
wire [7:0]out1_tb;
wire [7:0]out2_tb;
wire [7:0]out3_tb;
wire zero_flag;
wire overflaw_flag;

top DUT
(
   .instruction(instruction),
   .data0(data0),
   .data1(data1),
   .zero_flag(zero_flag),
   .overflow(overflaw_flag),
   .out0(out0_tb),
   .out1(out1_tb),
   .out2(out2_tb),
   .out3(out3_tb)  
);

//trasarea formelor de unda

initial
begin
    data0=0;
    #10 data0=0;
    #10 data0=255;
    #5 data0=1;
    #10 data0=2;
    #10 data0=0;
end

initial
begin
    data1=0;
    #10 data1=0;
    #10 data1=255;
    #10 data1=1;
    #10 data1=3;
    #10 data1=0;
end

initial
begin
    instruction=0;
    #20 instruction=16'hffff;
    #25 instruction=16'b00_00_10_00000000;
    #25 instruction=0;

end

initial
begin
    #200 $stop();
end


endmodule
