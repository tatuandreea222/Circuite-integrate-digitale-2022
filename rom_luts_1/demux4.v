module demux4
(
    input wire [1:0] in0,
    input wire [1:0]sel,
    output reg [1:0] out0, 
    output reg [1:0] out1,
    output reg [1:0] out2,
    output reg [1:0] out3 
 );
 
 always @ (*)
 begin
     case(sel)
         0: begin out0=in0; out1=0; out2=0; out3=0; end
         1: begin out0=0; out1=in0; out2=0; out3=0; end
         2: begin out0=0; out1=0; out2=in0; out3=0; end
         3: begin out0=0; out1=0; out2=0; out3=in0; end
     endcase
 end
endmodule