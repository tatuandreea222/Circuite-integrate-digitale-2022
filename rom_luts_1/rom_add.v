module rom_add
(
    input wire [3:0] in,
    output reg [1:0] out
);

always @ (*)
begin 
    case(in)
    4'b0000: begin out = 2'b00; end
    4'b0001: begin out = 2'b01; end
    4'b0010: begin out = 2'b10; end
    4'b0011: begin out = 2'b11; end
    4'b0100: begin out = 2'b01; end
    4'b0101: begin out = 2'b10; end
    4'b0110: begin out = 2'b11; end
    4'b0111: begin out = 2'b00; end
    4'b1000: begin out = 2'b10; end
    4'b1001: begin out = 2'b11; end
    4'b1010: begin out = 2'b00; end
    4'b1011: begin out = 2'b01; end
    4'b1100: begin out = 2'b11; end
    4'b1101: begin out = 2'b00; end
    4'b1110: begin out = 2'b01; end
    4'b1111: begin out = 2'b00; end
    
    endcase
end

endmodule