module mux2_v2
(
   input wire [1:0]in0,
   input wire [1:0]in1, 
   input wire sel,
   output reg [1:0]out0
);

always @ (*)
begin
    case(sel)
        0: begin out0=in0; end
        1: begin out0=in1; end
    endcase
end

endmodule