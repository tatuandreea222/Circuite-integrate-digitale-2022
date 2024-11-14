module compute_structural
(
    input wire [7:0] in0,
    input wire [7:0] in1,
    output reg [7:0] out
);

wire [7:0] nr_par;
wire [7:0] nr_impar;
wire [7:0] comun;
wire [7:0] shiftare;
always@(*)
begin
if( in0[0] == 0)
begin
   out = nr_par; 
end
else
begin
    out = nr_impar;
end
end
// _ _ _ _ _ 
 //if ( in0%2 == 0) 

assign nr_par = comun + 3;
assign nr_impar = comun -1;
assign shiftare = {in1,1'b0};
assign comun = shiftare + in0; 
endmodule