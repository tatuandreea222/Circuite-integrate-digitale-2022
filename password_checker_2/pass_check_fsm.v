module pass_check_fsm
(
    input wire clock,
    input wire reset,
    input wire enable,
    input wire [7:0] data_in,
    output reg pass_ok
);

reg [3:0] state, state_next;

localparam INTRODU_PAROLA = 0;
localparam T = 1;
localparam A = 2;
localparam U = 3;
localparam L = 4;
localparam E = 5;
localparam PASS_OK = 6;


always@ (posedge clock)
begin
    if (reset == 1)
    begin
        state <= INTRODU_PAROLA;
    end
    else begin
        state <= state_next;
    end
    
end

always@(posedge clock)
begin
    case(state)
        INTRODU_PAROLA:
            if(data_in == "T")
                if(enable == 1 )
                    state_next <= T;
            else 
                state_next <= INTRODU_PAROLA;
        T: 
            if(data_in == "A")
                if(enable == 1 )
                    state_next <= A; 
            else 
                state_next <= INTRODU_PAROLA;
       A: 
            if(data_in == "U")
                if(enable == 1 )
                    state_next <= U; 
            else 
                state_next <= INTRODU_PAROLA;
       U: 
            if(data_in == "L")
                if(enable == 1 )
                    state_next <= L; 
            else 
                state_next <= INTRODU_PAROLA;
       L: 
            if(data_in == "E")
                if(enable == 1 )
                    state_next <= E; 
            else 
                state_next <= INTRODU_PAROLA;
        E: 
                state_next <= INTRODU_PAROLA;
       
    endcase
end

always@(*)
begin
    case(state)
    INTRODU_PAROLA:pass_ok = 0;
    T: pass_ok = 0;
    A: pass_ok = 0;
    U: pass_ok = 0;
    L: pass_ok = 0;
    E: pass_ok = 1;
    endcase
end



endmodule