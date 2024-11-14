module ram 
(
    input wire clock,
		//interfata de citire
		input wire [10:0] addr_r, // 2048 locatii => 11 biti de adresa 
		output wire [7:0] data_r, // fiecare locatie are 8b  
		// interfata de scriere
		input wire we,
		input wire [10:0] addr_w,
		input wire [7:0] data_w
);
reg [7:0] memorie_efectiva [0:2047]; // memorie cu locatiile de la 0 la 2047, fiecare avand 8 biti

assign data_r = memorie_efectiva[addr_r]; // fara registru pe iesire => citire asincrona fata de clock 
    
always@(posedge clock)
begin    
    if(we == 1)
    	begin
    	memorie_efectiva[addr_w] <= data_w; // scriu la locatia data de "addr_write" din memoria efectiva datele "data_write"
    	end 
end    
   

endmodule