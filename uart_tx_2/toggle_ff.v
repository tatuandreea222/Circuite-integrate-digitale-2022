
module toggle_ff
(
    input wire toggle,
    input wire clk,
    input wire reset,
    output reg out
);

always@(posedge clk) 
begin
    if(reset == 1)
        begin
            out <=0;
        end
    else
        begin
            if(toggle == 1)
                begin
                    out <= ~out;
                end
             else
                begin
                    out <= out;
                end
        end
end

endmodule