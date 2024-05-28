<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

From an 8-bit input, the inputs will be entered into a reusable neural network of 4 neurons, through a shift register 4 different inputs are captured. Furthermore, thanks to a state machine, the parameters associated with each neuron are obtained; 4 weights and 1 bias, in total 20 parameters.

State changes are made using a binary signal, where the input data, neuron parameters are received and finally the neurons are fed back. During the first state it is possible to observe the result of the applied network.

| First State  | Second State |
| ------------- | ------------- |
| State_IN  | State_BUFF  |
| State_BUFF  | State_OUT  |
| State_OUT  | State_BUFF  |
| State_OUT  | State_IN  |

Below is the structure when entering the neuronas entries:

![ChipUSM1](https://github.com/Kevomlml/tt07_chipusm_neural_network/assets/158077239/9a57e34c-e0b8-4f2e-9458-a361a5374c8a)

Node A corresponds to the state machine, and node B to the parameters of each neuron.

Regarding the parameters, they are in series from neuron 3 to neuron 0.

![ChipUSM2](https://github.com/Kevomlml/tt07_chipusm_neural_network/assets/158077239/abb3bc67-820e-453c-9c4b-f3741869816d)

## How to test

The input signals must be coordinated to achieve correct testing, where the following order must be followed to enter the inputs and parameters considering multiple layers.

in_3 > in_2 > in_1 > in_0 > b3 > w33 > w32 > w31 > w30 > b2 > w23 > w22 > w21 > w20 > b1 > w13 > w12 > w11 > w10 > b0 > w03 > w02 > w01 > w00

Each entry must be maintained for 2 clk, to be captured on the rising edge and thus there is displacement with the shift registers.

## External hardware

Requires an FPGA to perform the tests correctly.
