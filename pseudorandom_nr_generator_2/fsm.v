module fsm
(
    input wire clk,
    input wire rst,
    input wire start,
    input wire stop,
    input wire [11:0]seed,
    input wire [11:0]prev,
    output reg [3:0] data_out
);
localparam Q1 = 1; 
localparam Q2 = 2;
reg [1:0] state, state_next;

always@(posedge clk) begin
    if(rst == 1)
        state <= seed[3:0];
    else
        state <= state_next;
end

always@(posedge clk) 
begin
    //state_next = state;
    case(state)
        Q1: begin
                if(start == 1)
                 begin
                    //data_out <= data_out + state;
                    state_next = Q2;
                 end
            end
        Q2: begin
                if(stop== 1) 
                begin
                   // data_out <= data_out;
                    state_next = Q1;
                end
//                else
//                begin
//                    data_out <= 2*prev + prev + 4;
//                end
            end
        //default: state_next = Q1;
	endcase
end

always@(posedge clk) 
begin
    //state_next = state;
    case(state)
        Q1: begin
                if(start == 1)
                 begin
                    data_out <= data_out + state;
                   // state_next = Q2;
                 end
            end
        Q2: begin
                if(stop== 1) 
                begin
                    data_out <= data_out;
                   // state_next = Q1;
                end
                else
                begin
                    data_out <= 2*prev + prev + 4;
                end
            end
        //default: state_next = Q1;
	endcase
end

//assign data_out   = (state == Q1);




endmodule