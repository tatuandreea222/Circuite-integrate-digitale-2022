module reg0
(
    input clk,
		input reset,
		input load, // en
		input [10:0] data_in,
		output reg [10:0] data_out
);
always@(posedge clk)
	begin
	if(reset == 1)
		begin
		data_out <=0;
		end
	else
		begin
		if(load == 1)
			begin
			data_out <= data_in;
			end
		else
			begin
			data_out <= data_out;
			end
		end
	end
endmodule