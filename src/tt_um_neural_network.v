module tt_um_neural_network (
    input wire clk,
    input wire reset,
    input wire [2:0] uio_in,
    input wire [7:0] ui_in,
    
    output wire [7:0] uo_out
);

// Señales internas
wire [1:0] state;
wire [7:0] neuron_input0, neuron_input1, neuron_input2, neuron_input3;
wire [7:0] neuron0_output, neuron1_output, neuron2_output, neuron3_output;
wire [7:0] w00, w01, w02, w03, b0, th0;
wire [7:0] w10, w11, w12, w13, b1, th1;
wire [7:0] w20, w21, w22, w23, b2, th2;
wire [7:0] w30, w31, w32, w33, b3, th3;

// Instanciando los módulos
machine machine_inst (
    .clk(clk),
    .reset(reset),
    .changes([2]uio_in),
    .state(state)
);

shift_register_inputs shift_reg_inst (
    .clk(clk),
    .rstn(reset),
    .data_in(ui_in),
    .selector(state),
    .selector_output([1:0]uio_in),
    .neuron0_output(neuron0_output),
    .neuron1_output(neuron1_output),
    .neuron2_output(neuron2_output),
    .neuron3_output(neuron3_output),
    .neuron_input0(neuron_input0),
    .neuron_input1(neuron_input1),
    .neuron_input2(neuron_input2),
    .neuron_input3(neuron_input3),
    .network_outputs(uo_out)
);

perceptron perceptron0 (
    .in0(neuron_input0),
    .in1(neuron_input1),
    .in2(neuron_input2),
    .in3(neuron_input3),
    .weight0(w00),
    .weight1(w01),
    .weight2(w02),
    .weight3(w03),
    .bias(b0),
    .threshold(th0),
    .out(neuron0_output)
);

perceptron perceptron1 (
    .in0(neuron_input0),
    .in1(neuron_input1),
    .in2(neuron_input2),
    .in3(neuron_input3),
    .weight0(w10),
    .weight1(w11),
    .weight2(w12),
    .weight3(w13),
    .bias(b1),
    .threshold(th1),
    .out(neuron1_output)
);

perceptron perceptron2 (
    .in0(neuron_input0),
    .in1(neuron_input1),
    .in2(neuron_input2),
    .in3(neuron_input3),
    .weight0(w20),
    .weight1(w21),
    .weight2(w22),
    .weight3(w23),
    .bias(b2),
    .threshold(th2),
    .out(neuron2_output)
);

perceptron perceptron3 (
    .in0(neuron_input0),
    .in1(neuron_input1),
    .in2(neuron_input2),
    .in3(neuron_input3),
    .weight0(w30),
    .weight1(w31),
    .weight2(w32),
    .weight3(w33),
    .bias(b3),
    .threshold(th3),
    .out(neuron3_output)
);

register_parameters reg_params_inst (
    .clk(clk),
    .reset(reset),
    .data_in(ui_in),
    .selector(state),
    .th3(th3),
    .b3(b3),
    .w33(w33),
    .w32(w32),
    .w31(w31),
    .w30(w30),
    .th2(th2),
    .b2(b2),
    .w23(w23),
    .w22(w22),
    .w21(w21),
    .w20(w20),
    .th1(th1),
    .b1(b1),
    .w13(w13),
    .w12(w12),
    .w11(w11),
    .w10(w10),
    .th0(th0),
    .b0(b0),
    .w03(w03),
    .w02(w02),
    .w01(w01),
    .w00(w00)
);

endmodule
