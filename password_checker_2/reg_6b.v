module reg_6b
(
    input wire clk,
    input wire [5:0]in,
    input wire rst,
    output reg [5:0]out
);
always@(posedge clk) // clock sincronizeaza actiunile circuitului
begin    // doar pe edge-ul pozitiv circuitul actioneaza
    if(rst == 1)
    	begin
    	out <= 0;
    	end
    else
		begin
			out <= in;
		end
end
endmodule