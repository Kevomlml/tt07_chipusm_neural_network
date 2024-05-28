module shift_register_inputs(
    input clk,rstn,
    input [7:0] data_in,
    input [1:0] selector,  // From the state machine. Determines where do the neuron inputs come From
    input [1:0] selector_output,
    
    // The outputs of the neurons0..3 are inputs to the shift register, so it can use them as inputs to the next layer
    input [7:0] neuron0_output, // The output of the neuron0, is an input to the shift register 
    input [7:0] neuron1_output, // The output of the neuron1, is an input to the shift register
    input [7:0] neuron2_output, // The output of the neuron2, is an input to the shift register
    input [7:0] neuron3_output, // The output of the neuron3, is an input to the shift register

    // These 4 outputs are the inputs0..3 to each neuron.
    output reg [7:0] neuron_input0, // Input 0 for all neurons on the current layer
    output reg [7:0] neuron_input1, // Input 1 for all neurons on the current layer
    output reg [7:0] neuron_input2, // Input 2 for all neurons on the current layer
    output reg [7:0] neuron_input3, // Input 3 for all neurons on the current layer

    // Once all layers have passed, when we feed 4 new inputs to the network, the outputs of the network
    // will appear here, from neuron3_output to neuron0_output
    output reg [7:0] network_outputs
);




always@(posedge clk)
begin

    if(rstn) 
    begin
        neuron_input0 <= 8'b00000000;
        neuron_input1 <= 8'b00000000;
        neuron_input2 <= 8'b00000000;
        neuron_input3 <= 8'b00000000;
        network_outputs <= 8'b00000000;
    end

    else
    begin
        case(selector)
            2'b00   :   begin                                   // Receives new data
                            neuron_input0 <= data_in;           // and pases it thorugh the neurons.
                            neuron_input1 <= neuron_input0;
                            neuron_input2 <= neuron_input1;
                            neuron_input3 <= neuron_input2;

                        end
            2'b01   :   begin
                            neuron_input0 <= neuron_input0;
                            neuron_input1 <= neuron_input1;
                            neuron_input2 <= neuron_input2;
                            neuron_input3 <= neuron_input3;
                        end
            2'b10   :   begin
                            neuron_input0 <= neuron0_output;
                            neuron_input1 <= neuron1_output;
                            neuron_input2 <= neuron2_output;
                            neuron_input3 <= neuron3_output;
                        end
            default :   begin                               // The default state keeps everything as it was
                            neuron_input0 <= neuron_input0;
                            neuron_input1 <= neuron_input1;
                            neuron_input2 <= neuron_input2;
                            neuron_input3 <= neuron_input3;
                        end

        endcase
    end

    begin
        case(selector_output)
            2'b00   :   begin  
                            network_outputs <= neuron_input0;
            end 
            2'b01   :   begin  
                            network_outputs <= neuron_input1;
            end 
            2'b10   :   begin  
                            network_outputs <= neuron_input2;
            end 
            2'b11   :   begin  
                            network_outputs <= neuron_input3;
            end 
            default: begin
                    network_outputs <= network_outputs;
            end
        endcase
    end
end

endmodule
