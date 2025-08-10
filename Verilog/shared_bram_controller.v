module custom_bram_controller #(
    parameter BASE_ADDR = 32'h4000_0000,  // Base address for BRAM
    parameter NUM_LOC  = 4          // Number of read-only locations
)(
    // Clock and Reset
    input A_CLK,
    input A_RESETN,
    // PL Interface (Inputs)
    input [32*NUM_LOC -1:0] write_data,  // Packed write data
    input [NUM_LOC-1:0]  read_strobe,    // Read strobes
    input [NUM_LOC-1:0] write_strobe,   // Write strobes
    
    // PL Interface (Outputs)
    output reg [32*NUM_LOC - 1:0] read_data,
    output reg [NUM_LOC-1:0]  read_done,    // Read completion
    output reg [NUM_LOC-1:0] write_done,   // Write completion
    
    // BRAM Port B Interface
    output reg [31:0] addrb,
    output clkb,
    output reg [31:0] dinb,
    input [31:0] doutb,
    output reg enb,
    output rstb,
    output reg [3:0] web

);
    assign clkb = A_CLK;
    assign rstb = !A_RESETN;
    
    reg [$clog2(NUM_LOC)-1:0] reg_counter;
    reg [$clog2(NUM_LOC)-1:0] last_reg_counter;
    localparam  ST_CHECK_READ   = 2'b00,
                ST_READ_VAL     = 2'b01,
                ST_CHECK_WRITE  = 2'b10,
                ST_WRITE_VAL    = 2'b11;
    reg [1:0] state;
    
    always @(posedge A_CLK) begin
        if (!A_RESETN) begin
            state <= ST_CHECK_READ;
            reg_counter <= 0;
        end else begin
            case (state)
                ST_CHECK_READ: begin
                    if (read_strobe[reg_counter]) begin
                        state <= ST_READ_VAL;
                    end else begin
                        state <= ST_CHECK_WRITE;
                    end
                end
                ST_READ_VAL: begin
                    state <= ST_CHECK_WRITE;
                end
                ST_CHECK_WRITE: begin
                    if (write_strobe[reg_counter]) begin
                        state <= ST_WRITE_VAL;
                    end else begin
                        state <= ST_CHECK_READ;
                        if (reg_counter == NUM_LOC - 1) begin
                            reg_counter <= 0;
                        end else begin
                            reg_counter <= reg_counter + 1;
                        end
                        last_reg_counter <= reg_counter;
                    end
                end
                ST_WRITE_VAL: begin
                    state <= ST_CHECK_READ;
                    if (reg_counter == NUM_LOC - 1) begin
                        reg_counter <= 0;
                    end else begin
                        reg_counter <= reg_counter + 1;
                    end
                    last_reg_counter <= reg_counter;
                end
                default: begin
                    state <= ST_CHECK_READ;
                    reg_counter <= 0;
                end
            endcase
        end
    end
    
    always @(posedge A_CLK) begin
        if (!A_RESETN) begin
            enb        <= 1'b0;
            web        <= 4'b0000;
            addrb      <= 32'b0;
            dinb       <= 32'd0;
            write_done <= 'd0;
            read_done  <= 'd0;
            read_data  <= 'd0;
        end else begin
            enb        <= 1'b0;
            web        <= 4'b0000;
            dinb       <= 32'd0;
            case (state)
                ST_WRITE_VAL: begin
                    enb   <= 1'b1;
                    web   <= 4'b1111;
                    addrb <= BASE_ADDR + (reg_counter << 2);
                    dinb  <= write_data[reg_counter*32 +: 32];  
                    write_done[reg_counter] <= 1'b1;
                end
    
                ST_READ_VAL: begin
                    enb   <= 1'b1;
                    web   <= 4'b0000;
                    addrb <= BASE_ADDR + (reg_counter << 2);
                    read_data[reg_counter*32 +: 32] <= doutb;
                    read_done[reg_counter] <= 1'b1;
                end
    
                default: begin
                    write_done[last_reg_counter] <= 1'b0;
                    read_done[last_reg_counter]  <= 1'b0;
                end
            endcase
        end
    end

    
endmodule