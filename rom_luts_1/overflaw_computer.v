module overflaw_compute
(
    input wire [1:0]in0,
    input wire [1:0] in1,
    output reg [1:0]out
);

wire [2:0]suma0;
assign suma0=in0+in1;

always @ (*) 
begin
    if(suma0>=4)
    begin
        out=1;
    end
    else
    begin
        out=0;
    end
end
endmodule

//in loc de toata aia cu if mergea assigng overflow= suma0[2], pe linia 10
//explicatie: suma0[2] e bitul 2, gen e ala care are 4+, 2 la a 2a. 