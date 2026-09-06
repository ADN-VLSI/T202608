module parity_generator(
    input logic[7:0]data_byte,
    output logic parity_even,
    output logic parity_odd
);
assign parity_even=~^data_byte;
assign parity_odd=^data_byte;
endmodule
