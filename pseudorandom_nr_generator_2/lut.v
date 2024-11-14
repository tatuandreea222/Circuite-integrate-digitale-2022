module lut
(
    input wire [3:0] addr,
    output reg [3:0]data
);
 always@(addr) begin
    case(addr)
      4'b0000: data = 4'b0000; //la adresa 0 avem valoarea 1
      4'b0001: data = 4'b1000; //la adresa 1 avem valoarea 2
      4'b0010: data = 4'b0100; //la adresa 2 avem valoarea 4
      4'b0011: data = 4'b1100; //la adresa 3 avem valoarea 8
      4'b0100: data = 4'b0010;
      4'b0101: data = 4'b1010;
      4'b0110: data = 4'b0110;
      4'b0111: data = 4'b1110;
      4'b1000: data = 4'b0001;
      4'b1001: data = 4'b1001;
      4'b1010: data = 4'b0101;
      4'b1011: data = 4'b1101;
      4'b1100: data = 4'b0011;
      4'b1101: data = 4'b1011;
      4'b1110: data = 4'b0111;
      4'b1111: data = 4'b1111;
    endcase
  end

endmodule