`timescale 1ns / 1ps

module tb();

reg clk_tb;
reg en_tb; 
reg reset_tb;
wire [7:0]sir_tb;
wire tester_tb;

top DUT
(
   .clk_top(clk_tb),
   .en_top(en_tb),
   .reset_top(reset_tb),
   .sir(sir_tb),
   .tester(tester_tb)    
);


initial
begin
    clk_tb=0;
    forever 
    begin
        #5 clk_tb=~clk_tb;
    end
end

initial
begin
    reset_tb <=1;
    en_tb <=1;
    
    #20 reset_tb <= 0;
    
    repeat (500)
        begin
            @(posedge clk_tb);
        end
    $stop();
    
    
end




endmodule
