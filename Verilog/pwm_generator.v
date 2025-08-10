`timescale 1ns/1ps
module pwm_generator #(
    parameter integer MAX_COUNT = 10000  // PWM period (number of clk cycles)
)(
    input  wire                  clk,
    input  wire                  rst,          // synchronous reset, active high
    input  wire signed [31:0]    duty_in,      // signed duty request

    output reg                   Dir_A,        // 1 when duty > 0
    output reg                   Dir_B,        // 1 when duty < 0
    output reg                   PWM_Out       // high for |duty| cycles each period
);

    // Free-running period counter [0 .. MAX_COUNT-1]
    reg [31:0] cnt = 32'd0;

    // Latched magnitude (0..MAX_COUNT) used for the whole period
    reg [31:0] duty_mag_lat = 32'd0;

    // Compute absolute value (two's complement) of duty_in
    wire [31:0] duty_abs = duty_in[31] ? (~duty_in + 32'd1) : duty_in;

    // Period counter & latching at period boundary
    always @(posedge clk) begin
        if (rst) begin
            cnt          <= 32'd0;
            duty_mag_lat <= 32'd0;
            Dir_A        <= 1'b0;
            Dir_B        <= 1'b0;
            PWM_Out      <= 1'b0;
        end else begin
            // Advance counter
            if (cnt >= (MAX_COUNT-1))
                cnt <= 32'd0;
            else
                cnt <= cnt + 32'd1;

            // At the start of each period, sample inputs & decide direction
            if (cnt == 32'd0) begin
                // Direction from sign (0 means both low)
                if (duty_in > 0) begin
                    Dir_A <= 1'b1;
                    Dir_B <= 1'b0;
                end else if (duty_in < 0) begin
                    Dir_A <= 1'b0;
                    Dir_B <= 1'b1;
                end else begin
                    Dir_A <= 1'b0;
                    Dir_B <= 1'b0;
                end

                // Clip magnitude to [0 .. MAX_COUNT]
                if (duty_abs >= MAX_COUNT[31:0])
                    duty_mag_lat <= MAX_COUNT[31:0];
                else
                    duty_mag_lat <= duty_abs;
            end

            // PWM output: high for duty_mag_lat clocks each period
            // If duty is zero, stays low.
            PWM_Out <= (duty_mag_lat != 32'd0) && (cnt < duty_mag_lat);
        end
    end

endmodule

