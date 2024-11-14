module counter_bit_select
(
    input wire clk,
    input wire reset,
    input wire en,
    output reg [3:0]out
);

always @(posedge clk)
begin
    if(reset == 1)
       begin 
            out <= 0;
       end
    else
    begin
        if(en == 1) 
           begin 
            out <= out + 1; 
           end
         else
            out <= out;
    end 
end
endmodule