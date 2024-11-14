module delay_reg
(
    input wire clk,
    input wire rst,
    input wire [11:0] data_in,
    output reg [11:0] data_out
);

always@(posedge clk) // clock sincronizeaza actiunile circuitului
begin    // doar pe edge-ul pozitiv circuitul actioneaza
    if(rst == 1)
    	begin
    	data_out <= 0;
    	end
    else
    	begin
			data_out <= data_in;
		end
end
endmodule