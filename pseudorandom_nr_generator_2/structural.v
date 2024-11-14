module structural
(
    input wire [11:0]seed,
     input wire [11:0]prev,
     output reg [3:0]data_out
);

always@(*)
begin
   if (seed[0] == 0 & seed[1] == 0)
    begin
        data_out = seed[3:0];
    end
    else if (seed[0] == 0 & seed[1] == 1)
    begin
        data_out = seed[7:4];
    end
    else if (seed[0] == 1 & seed[1] == 0)
    begin
        data_out = seed[11:8];
    end
    else if (seed[0] == 1 & seed[1] == 1)
    begin
        data_out = 2*prev + prev + 4;
    end
end
endmodule