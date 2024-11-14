`timescale 1ns / 1ps

module tb();
reg clk;
reg reset;
reg start;
reg [7:0] data_in;
wire out_tx;

top dut
(
   .start(start),
   .clk_top(clk),
   .rst_top(reset),
   .data_in(data_in),
   .out_tx(out_tx)
);

initial
begin
	clk =0;
	forever
		begin
		  #5 clk = ~clk;
		end
end
	
initial
	begin
	reset <= 1;
	start <= 0;
	data_in <= 0;
	
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	reset <= 0;
	@(negedge clk);
	@(negedge clk);
	@(negedge clk);
	start <= 1;
	data_in <= "m";
	@(negedge clk);
	start <= 0;
	data_in <= 0;
	
	
	#3_000_000
	$stop();
	
	end

endmodule
