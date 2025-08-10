`timescale 1ns/1ps
module Quad_decoder #
(
    parameter integer COUNT_BITS = 16,   // width per channel (leave 16)
    parameter         SATURATE   = 0     // 0: wrap on overflow, 1: saturate
)
(
    input  wire clk,
    input  wire rst,         // synchronous, active-high

    // Quadrature inputs (unsynchronized pins)
    input  wire A1,
    input  wire B1,
    input  wire A2,
    input  wire B2,

    // Combined count: {ch2[15:0], ch1[15:0]}
    output wire [31:0] count_out
);

    // -------------------------
    // 2-flop synchronizers
    // -------------------------
    reg a1_ff1, a1_ff2, b1_ff1, b1_ff2;
    reg a2_ff1, a2_ff2, b2_ff1, b2_ff2;

    always @(posedge clk) begin
        a1_ff1 <= A1;  a1_ff2 <= a1_ff1;
        b1_ff1 <= B1;  b1_ff2 <= b1_ff1;
        a2_ff1 <= A2;  a2_ff2 <= a2_ff1;
        b2_ff1 <= B2;  b2_ff2 <= b2_ff1;
    end

    wire a1_s = a1_ff2, b1_s = b1_ff2;
    wire a2_s = a2_ff2, b2_s = b2_ff2;

    // -------------------------
    // State tracking per channel
    // -------------------------
    reg [1:0] st1, st2;              // previous {A,B}
    wire [1:0] now1 = {a1_s, b1_s};
    wire [1:0] now2 = {a2_s, b2_s};

    // 16-bit counters
    reg [COUNT_BITS-1:0] cnt1, cnt2;

    // Increment/decrement helpers with wrap/saturate
    function [COUNT_BITS-1:0] inc;
        input [COUNT_BITS-1:0] x;
        begin
            if (SATURATE && &x) inc = x;            // max -> stay
            else                inc = x + {{(COUNT_BITS-1){1'b0}},1'b1};
        end
    endfunction

    function [COUNT_BITS-1:0] dec;
        input [COUNT_BITS-1:0] x;
        begin
            if (SATURATE && (x == {COUNT_BITS{1'b0}})) dec = x; // min -> stay
            else                                       dec = x - {{(COUNT_BITS-1){1'b0}},1'b1};
        end
    endfunction

    // Quadrature step decode (x4). Returns 2'b01 = +1, 2'b11 = -1, 2'b00 = 0.
    function [1:0] quad_step;
        input [1:0] prev;
        input [1:0] curr;
        begin
            case ({prev,curr})
                // forward sequence: 00->01->11->10->00  (A leads B)
                4'b00_01, 4'b01_11, 4'b11_10, 4'b10_00: quad_step = 2'b01; // +1
                // reverse sequence: 00->10->11->01->00  (B leads A)
                4'b00_10, 4'b10_11, 4'b11_01, 4'b01_00: quad_step = 2'b11; // -1 (two's comp -1)
                default:                                   quad_step = 2'b00; // no valid step / glitch
            endcase
        end
    endfunction

    // Main update
    always @(posedge clk) begin
        if (rst) begin
            st1  <= 2'b00;
            st2  <= 2'b00;
            cnt1 <= {1'b1, {COUNT_BITS-1{1'b0}}};
            cnt2 <= {1'b1, {COUNT_BITS-1{1'b0}}};
        end else begin
            // Channel 1
            case (quad_step(st1, now1))
                2'b01: cnt1 <= inc(cnt1);
                2'b11: cnt1 <= dec(cnt1);
                default: ; // hold
            endcase
            st1 <= now1;

            // Channel 2
            case (quad_step(st2, now2))
                2'b01: cnt2 <= inc(cnt2);
                2'b11: cnt2 <= dec(cnt2);
                default: ; // hold
            endcase
            st2 <= now2;
        end
    end

    // Pack outputs: lower 16 = ch1, upper 16 = ch2
    // (If COUNT_BITS != 16, only the lower 16 of each are exposed in count_out)
    assign count_out = { cnt2[15:0], cnt1[15:0] };

endmodule