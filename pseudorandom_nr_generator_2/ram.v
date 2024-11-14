module ram
(
    input wire clk,
    input wire en,
    input wire [5:0]r_addr, //read adress
    input wire [5:0]w_addr, // write adress
    input wire [11:0]w_data, // write data
    output reg [11:0]r_data // read data
);

reg [11:0] memorie_efectiva [0:63]; // memorie cu locatiile de la 0 la 63, fiecare avand 8 biti    

always@(*) //  citire asincrona fata de clock 
begin
     r_data= memorie_efectiva[r_addr]; // fara registru pe iesire => citire asincrona fata de clock 
 end 
    
always@(posedge clk)
begin    
    if(en == 1)
    	begin
    	memorie_efectiva[w_addr] <= w_data; // scriu la locatia data de "addr_write" din memoria efectiva datele "data_write"
    	end 
end    
endmodule