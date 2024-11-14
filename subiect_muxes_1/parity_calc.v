module parity_calc
(
    input wire [3:0]in,
    output reg out
);
wire [3:0] tip;
assign tip=in%2;
 
always @(*)
begin
    case(tip)
        0: begin out=0; end 
        1: begin out=1; end 
    endcase
end  
endmodule