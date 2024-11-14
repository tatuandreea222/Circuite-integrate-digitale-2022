module counter_6b
(
    input wire clk,
    input wire rst,
    input wire en,
    output reg [5:0]counter
);

always@(posedge clk)
begin
    if(rst == 1)
        counter <= 0;
    else
        if(en==1)
            counter <= counter + 1;  
        else
            counter <=counter;
end
endmodule