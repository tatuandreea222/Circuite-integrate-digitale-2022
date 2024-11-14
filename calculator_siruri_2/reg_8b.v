`timescale 1ns / 1ps
module reg_8b
(
    input wire clk,
    input wire en,
    input wire reset,
    input wire [7:0]in,
    output reg [7:0]out
);
always@(posedge clk) // clock sincronizeaza actiunile circuitului
begin    // doar pe edge-ul pozitiv circuitul actioneaza
    if(reset == 1)
    	begin
    	out <= 0;
    	end
    else
    	begin
		if(en == 1) // comanda de scriere
			begin
			out <= in;
			end
		else // puteam sa omit acest else
			begin
			out <= out; // raman datele salvate anterior
			end
		end
end

