module compute_behav
(
    input wire [7:0] in0, //f(n-1)
    input wire [7:0] in1, // f(n-2)
    output reg [7:0] out
);

always @ (*) 
begin
    if(in0[0] == 0)
    begin
       out = 2*in0 + in1 +3;
    end
    else
    begin
       out = 2*in0 + in1 -1;
    end
end

endmodule