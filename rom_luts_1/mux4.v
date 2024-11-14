module mux4
(
    input wire [1:0]in0,
    input wire [1:0]in1,
    input wire [1:0]in2,
    input wire [1:0]in3,
    output reg[1:0] out0,
    input wire [1:0]sel
);

 always @ (*)
 begin
     case(sel)
         0: begin out0=in0;  end
         1: begin out0=in1;  end
         2: begin out0=in2;  end
         3: begin out0=in3;  end
     endcase
 end

endmodule