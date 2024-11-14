module ram_vowels
(
    input wire clk,
    input wire w_en,
    input wire [5:0]addr,
    input wire [7:0]w_data,
    output wire [7:0]r_data
);

reg [7:0] memorie_efectiva [0:63]; // memorie cu locatiile de la 0 la 63, fiecare avand 8 biti    

assign r_data = memorie_efectiva[addr]; // fara registru pe iesire => citire asincrona fata de clock 
    
always@(posedge clk)
begin    
    if(w_en == 1)
    	begin
    	memorie_efectiva[addr] <= w_data; // scriu la locatia data de "addr_write" din memoria efectiva datele "data_write"
    	end 
end    

endmodule