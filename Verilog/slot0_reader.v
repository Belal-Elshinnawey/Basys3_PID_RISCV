module slot0_reader #(
    parameter integer NUM_LOC  = 4,
    parameter integer WORD_W   = 32
)(
    input  wire                      clk,
    input  wire                      rstn,         // active-low

    // From custom_bram_controller
    input  wire [WORD_W*NUM_LOC-1:0] read_data,
    input  wire [NUM_LOC-1:0]        read_done,

    // To custom_bram_controller
    output wire [NUM_LOC-1:0]        read_strobe,

    // Output latest value from slot 0
    output reg  [WORD_W-1:0]         slot0_value
);
    // Always keep slot 0 read request active
    assign read_strobe = { {(NUM_LOC-1){1'b0}}, 1'b1 };

    always @(posedge clk) begin
        if (!rstn) begin
            slot0_value <= {WORD_W{1'b0}};
        end else if (read_done[0]) begin
            slot0_value <= read_data[0*WORD_W +: WORD_W];
        end
    end
endmodule
