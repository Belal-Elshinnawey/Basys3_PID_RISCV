`timescale 1ns/1ps
module split32 (
    input  wire [31:0] data_in,
    output wire out16,
    output wire out15, output wire out14, output wire out13, output wire out12,
    output wire out11, output wire out10, output wire out9,  output wire out8,
    output wire out7,  output wire out6,  output wire out5,  output wire out4,
    output wire out3,  output wire out2,  output wire out1,  output wire out0
);
    // Map only the bits you care about
    assign {out16,
            out15, out14, out13, out12,
            out11, out10, out9,  out8,
            out7,  out6,  out5,  out4,
            out3,  out2,  out1,  out0} = data_in[16:0];
endmodule