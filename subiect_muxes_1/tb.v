module tb();

reg in0;
reg in1;
reg in2;
reg in3;
reg [1:0]sel;
reg [5:2]data;
wire out0;
wire out1;
wire out2;
wire out3;

top DUT
(
     .in0_top(in0), 
     .in1_top(in1), 
     .in2_top(in2), 
     .in3_top(in3),
     .sel(sel),
     .data(data),
     .out0(out0),
     .out1(out1),
     .out2(out2),
     .out3(out3)
 );
 
initial
 begin
    in0=0;
    #20 in0=1;
    #20 in0=0;
    #10 in0=1;
 end
 
initial
 begin
    in1=0;
    #20 in1=1;
 end
 
initial
 begin
    in2=0;
    #20 in2=1;
    #20 in2=0;
 end
 
initial
 begin
    in3=0;
    #20 in3=1;
    #20 in3=0;
    #10 in3=1;
 end
 
initial
 begin
    sel=0;
   #10 sel=1;
    #10 sel=2;
    #5 sel =3;
    #5 sel=2;
    #5 sel=0;
 end
 
initial
 begin
     data=0;
   #10 data=1;
    #10 data=2;
    #5 data =3;
    #5 data=4;
     #5 data=5;
      #5 data=6;
       #5 data=7;
    #5 data=0;
 end
 
initial
 begin
    #90 $stop();
 end
 
 
endmodule
