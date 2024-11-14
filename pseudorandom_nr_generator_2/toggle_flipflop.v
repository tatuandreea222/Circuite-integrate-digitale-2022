`timescale 1ns / 1ps
module toggle_flipflop
(
    input wire clk,
    input wire rst,
    input wire toggle,
    output reg data
);

always@(posedge clk)
begin
    if(rst==1)
        data <= 0;
    else
        if(toggle == 1)
            data<=~data;
        else
            data<=data;
end
endmodule
