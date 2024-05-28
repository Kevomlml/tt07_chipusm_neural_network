module register_parameters(
    input wire clk,
    input wire reset,
    input wire [7:0] data_in,
    input [1:0] selector,

    output reg [7:0] th3,
    output reg [7:0] b3,
    output reg [7:0] w33,
    output reg [7:0] w32,
    output reg [7:0] w31,
    output reg [7:0] w30,
    output reg [7:0] th2,
    output reg [7:0] b2,
    output reg [7:0] w23,
    output reg [7:0] w22,
    output reg [7:0] w21,
    output reg [7:0] w20,
    output reg [7:0] th1,
    output reg [7:0] b1,
    output reg [7:0] w13,
    output reg [7:0] w12,
    output reg [7:0] w11,
    output reg [7:0] w10,
    output reg [7:0] th0,
    output reg [7:0] b0,
    output reg [7:0] w03,
    output reg [7:0] w02,
    output reg [7:0] w01,
    output reg [7:0] w00
);

always @(posedge clk)
begin
    if (reset) begin
    w00<=8'd0;
    w01<=8'd0;
    w02<=8'd0;
    w03<=8'd0;
    b0<=8'd0;
    th0<=8'd0;
    w10<=8'd0;
    w11<=8'd0;
    w12<=8'd0;
    w13<=8'd0;
    b1<=8'd0;
    th1<=8'd0;
    w20<=8'd0;
    w21<=8'd0;
    w22<=8'd0;
    w23<=8'd0;
    b2<=8'd0;
    th2<=8'd0;
    w30<=8'd0;
    w31<=8'd0;
    w32<=8'd0;
    w33<=8'd0;
    b3<=8'd0;
    th3<=8'd0;
    end

    else begin
        case(selector)
            2'b00   :   begin 
                        w00<=w00;
                        w01<=w01;
                        w02<=w02;
                        w03<=w03;
                        b0<=b0;
                        th0<=th0;
                        w10<=w11;
                        w11<=w11;
                        w12<=w12;
                        w13<=w13;
                        b1<=b1;
                        th1<=th1;
                        w20<=w21;
                        w21<=w21;
                        w22<=w22;
                        w23<=w23;
                        b2<=b2;
                        th2<=th2;
                        w30<=w31;
                        w31<=w31;
                        w32<=w32;
                        w33<=w33;
                        b3<=b3;
                        th3<=th3;
                        end
            2'b01   :   begin 
                        w00<=w01;
                        w01<=w02;
                        w02<=w03;
                        w03<=b0;
                        b0<=th0;
                        th0<=w10;
                        w10<=w11;
                        w11<=w12;
                        w12<=w13;
                        w13<=b1;
                        b1<=th1;
                        th1<=w20;
                        w20<=w21;
                        w21<=w22;
                        w22<=w23;
                        w23<=b2;
                        b2<=th2;
                        th2<=w30;
                        w30<=w31;
                        w31<=w32;
                        w32<=w33;
                        w33<=b3;
                        b3<=th3;
                        th3<=data_in;
                        end
            2'b10   :   begin 
                        w00<=w00;
                        w01<=w01;
                        w02<=w02;
                        w03<=w03;
                        b0<=b0;
                        th0<=th0;
                        w10<=w11;
                        w11<=w11;
                        w12<=w12;
                        w13<=w13;
                        b1<=b1;
                        th1<=th1;
                        w20<=w21;
                        w21<=w21;
                        w22<=w22;
                        w23<=w23;
                        b2<=b2;
                        th2<=th2;
                        w30<=w31;
                        w31<=w31;
                        w32<=w32;
                        w33<=w33;
                        b3<=b3;
                        th3<=th3;
                        end
            default :   begin 
                        w00<=w00;
                        w01<=w01;
                        w02<=w02;
                        w03<=w03;
                        b0<=b0;
                        th0<=th0;
                        w10<=w11;
                        w11<=w11;
                        w12<=w12;
                        w13<=w13;
                        b1<=b1;
                        th1<=th1;
                        w20<=w21;
                        w21<=w21;
                        w22<=w22;
                        w23<=w23;
                        b2<=b2;
                        th2<=th2;
                        w30<=w31;
                        w31<=w31;
                        w32<=w32;
                        w33<=w33;
                        b3<=b3;
                        th3<=th3;
                        end
            endcase
    end
end
    
endmodule
