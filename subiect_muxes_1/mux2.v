module mux2
(
   input wire in0,
   input wire in1, 
   input wire sel,
   output reg out0
);

always @ (*)
begin
    case(sel)
        0: begin out0=in0; end
        1: begin out0=in1; end
    endcase
end

endmodule