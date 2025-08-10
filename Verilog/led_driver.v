module led_driver (
    input  wire [31:0] data_in,              // 32-bit input
    output wire [15:0] led_16bits_tri_o      // Mapped in XDC constraints
);

    // Map upper 16 bits of data_in to LEDs
    assign led_16bits_tri_o = data_in[31:16];

endmodule