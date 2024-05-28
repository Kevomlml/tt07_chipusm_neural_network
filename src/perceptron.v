module perceptron(
    input [7:0] in0,
    input [7:0] in1,
    input [7:0] in2,
    input [7:0] in3,

    input [7:0] weight0, //aaa
    input [7:0] weight1,
    input [7:0] weight2,
    input [7:0] weight3,
    input [7:0] bias,
    input [7:0] threshold,

    output reg [7:0] out
);

reg [7:0] sum_p;
reg [7:0] res;

always@(*)
begin
    sum_p=in0*weight0+in1*weight1+in2*weight2+in3*weight3+bias;
    res = sum_p - threshold;
    if (res[7])
        out = 8'b00000000;
    else
        out = sum_p;
end

endmodule
