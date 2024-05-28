module machine (
    input wire clk,
    input wire reset,
    input wire changes,
    output reg [1:0] state
);

parameter state_data_IN = 2'b00;
parameter state_data_BUFF = 2'b01;
parameter state_data_OUT = 2'b10;


//Definir current_state y next_state
reg [1:0] current_state, next_state;

always@(posedge clk) begin 
    if (reset)
        current_state <= state_data_IN;
    else
        current_state <= next_state;
end 

always @(*) begin
    next_state = current_state;
    case (current_state)
        state_data_IN: if (changes) begin
                        next_state = state_data_BUFF;
                        end
        state_data_BUFF: if (changes) begin
                        next_state = state_data_OUT;
                        end
        state_data_OUT: if (changes) begin
                        next_state = state_data_BUFF;
                        end
        default: if (changes) begin
                next_state=current_state;
                end
    endcase
end

always@(posedge clk) begin 
    if (reset)
        state <= state_data_IN;
    else
        state <= current_state;
end 
endmodule
