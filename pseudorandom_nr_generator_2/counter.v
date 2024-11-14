module counter
(
    input wire clk,
    input wire rst,
    input wire en,
    output reg data
);

always@(posedge clk)
begin
    if(rst == 1)
        data <= 0;
    else
        if(en == 1)
            data<= data +1;
        else
            data<=data;
end
endmodule