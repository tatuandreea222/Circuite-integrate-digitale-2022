module counter_11b
(
    input wire clk,
    input wire en,
    input wire reset,
    output reg [10:0]out
);
always @ (posedge clk)
begin
    if(reset == 1)
        begin
            out <=0;
        end
    else 
        begin
            if(en==1)
                begin 
                    out <= out + 1;
                end
            else
                begin
                    out<=out;
                end
        end
        
end


endmodule