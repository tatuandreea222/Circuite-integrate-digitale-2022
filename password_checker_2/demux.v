module demux
(
    input wire sel,
    input wire [7:0]in,
    output reg out0,
    output reg out1
);

always@(*)
begin
    case(sel)
        0:
            begin
                out0=1;
                out1=0;
            end
        1: 
            begin
                out1=1;
                out0=0;
            end
     endcase
end
endmodule