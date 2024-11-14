module counter_baud_rate
(
    input wire clk,
    input wire en,
    input wire rst_sync,
    input wire rst_async,
    output reg out
);
always@(posedge clk or posedge rst_async) 
begin
    if(rst_sync == 1 | rst_async == 1)
        begin out <= 0; end
    else
		begin
		if(en == 1)
			begin
			out <= out + 1;
			end
		else
			begin
			out <= out;
			end
		end	 
end

endmodule