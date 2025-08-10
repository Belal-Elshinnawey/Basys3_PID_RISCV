`timescale 1ns/1ps
module AXILiteS_s_axi_Reg_Interface
#(parameter
    C_S_AXI_ADDR_WIDTH = 8,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire [31:0]                   reg0_out,
    output wire [31:0]                   reg1_out,
    output wire [31:0]                   reg2_out,
    output wire [31:0]                   reg3_out,
    output wire [31:0]                   reg4_out,
    output wire [31:0]                   reg5_out,
    output wire [31:0]                   reg6_out,
    output wire [31:0]                   reg7_out,
    output wire [31:0]                   reg8_out,
    output wire [31:0]                   reg9_out,
    output wire [31:0]                   reg10_out,
    output wire [31:0]                   reg11_out,
    output wire [31:0]                   reg12_out,
    output wire [31:0]                   reg13_out,
    output wire [31:0]                   reg14_out,
    output wire [31:0]                   reg15_out,
    output wire [31:0]                   reg16_out,
    output wire [31:0]                   reg17_out,
    output wire [31:0]                   reg18_out,
    output wire [31:0]                   reg19_out,
    output wire [31:0]                   reg20_out,
    output wire [31:0]                   reg21_out,
    output wire [31:0]                   reg22_out,
    output wire [31:0]                   reg23_out,
    output wire [31:0]                   reg24_out,
    output wire [31:0]                   reg25_out,
    output wire [31:0]                   reg26_out,
    output wire [31:0]                   reg27_out,
    output wire [31:0]                   reg28_out,
    output wire [31:0]                   reg29_out,
    output wire [31:0]                   reg30_out,
    output wire [31:0]                   reg31_out,        

    input wire [31:0]                   reg0_in,
    input wire [31:0]                   reg1_in,
    input wire [31:0]                   reg2_in,
    input wire [31:0]                   reg3_in,
    input wire [31:0]                   reg4_in,
    input wire [31:0]                   reg5_in,
    input wire [31:0]                   reg6_in,
    input wire [31:0]                   reg7_in,
    input wire [31:0]                   reg8_in,
    input wire [31:0]                   reg9_in,
    input wire [31:0]                   reg10_in,
    input wire [31:0]                   reg11_in,
    input wire [31:0]                   reg12_in,
    input wire [31:0]                   reg13_in,
    input wire [31:0]                   reg14_in,
    input wire [31:0]                   reg15_in,
    input wire [31:0]                   reg16_in,
    input wire [31:0]                   reg17_in,
    input wire [31:0]                   reg18_in,
    input wire [31:0]                   reg19_in,
    input wire [31:0]                   reg20_in,
    input wire [31:0]                   reg21_in,
    input wire [31:0]                   reg22_in,
    input wire [31:0]                   reg23_in,
    input wire [31:0]                   reg24_in,
    input wire [31:0]                   reg25_in,
    input wire [31:0]                   reg26_in,
    input wire [31:0]                   reg27_in,
    input wire [31:0]                   reg28_in,
    input wire [31:0]                   reg29_in,
    input wire [31:0]                   reg30_in,
    input wire [31:0]                   reg31_in        

);
//------------------------Parameter----------------------
localparam
    ADDR_OUT_REG0             = 8'h00,
    ADDR_OUT_REG1             = 8'h04,
    ADDR_OUT_REG2             = 8'h08,
    ADDR_OUT_REG3             = 8'h0C,
    ADDR_OUT_REG4             = 8'h10,
    ADDR_OUT_REG5             = 8'h14,
    ADDR_OUT_REG6             = 8'h18,
    ADDR_OUT_REG7             = 8'h1C,
    ADDR_OUT_REG8             = 8'h20,
    ADDR_OUT_REG9             = 8'h24,
    ADDR_OUT_REG10            = 8'h28,
    ADDR_OUT_REG11            = 8'h2C,
    ADDR_OUT_REG12            = 8'h30,
    ADDR_OUT_REG13            = 8'h34,
    ADDR_OUT_REG14            = 8'h38,
    ADDR_OUT_REG15            = 8'h3C,
    ADDR_OUT_REG16            = 8'h40,
    ADDR_OUT_REG17            = 8'h44,
    ADDR_OUT_REG18            = 8'h48,
    ADDR_OUT_REG19            = 8'h4C,
    ADDR_OUT_REG20            = 8'h50,
    ADDR_OUT_REG21            = 8'h54,
    ADDR_OUT_REG22            = 8'h58,
    ADDR_OUT_REG23            = 8'h5C,
    ADDR_OUT_REG24            = 8'h60,
    ADDR_OUT_REG25            = 8'h64,
    ADDR_OUT_REG26            = 8'h68,
    ADDR_OUT_REG27            = 8'h6C,
    ADDR_OUT_REG28            = 8'h70,
    ADDR_OUT_REG29            = 8'h74,
    ADDR_OUT_REG30            = 8'h78,
    ADDR_OUT_REG31            = 8'h7C,
    ADDR_IN_REG0             = 8'h80,
    ADDR_IN_REG1             = 8'h84,
    ADDR_IN_REG2             = 8'h88,
    ADDR_IN_REG3             = 8'h8C,
    ADDR_IN_REG4             = 8'h90,
    ADDR_IN_REG5             = 8'h94,
    ADDR_IN_REG6             = 8'h98,
    ADDR_IN_REG7             = 8'h9C,
    ADDR_IN_REG8             = 8'hA0,
    ADDR_IN_REG9             = 8'hA4,
    ADDR_IN_REG10            = 8'hA8,
    ADDR_IN_REG11            = 8'hAC,
    ADDR_IN_REG12            = 8'hB0,
    ADDR_IN_REG13            = 8'hB4,
    ADDR_IN_REG14            = 8'hB8,
    ADDR_IN_REG15            = 8'hBC,
    ADDR_IN_REG16            = 8'hC0,
    ADDR_IN_REG17            = 8'hC4,
    ADDR_IN_REG18            = 8'hC8,
    ADDR_IN_REG19            = 8'hCC,
    ADDR_IN_REG20            = 8'hD0,
    ADDR_IN_REG21            = 8'hD4,
    ADDR_IN_REG22            = 8'hD8,
    ADDR_IN_REG23            = 8'hDC,
    ADDR_IN_REG24            = 8'hE0,
    ADDR_IN_REG25            = 8'hE4,
    ADDR_IN_REG26            = 8'hE8,
    ADDR_IN_REG27            = 8'hEC,
    ADDR_IN_REG28            = 8'hF0,
    ADDR_IN_REG29            = 8'hF4,
    ADDR_IN_REG30            = 8'hF8,
    ADDR_IN_REG31            = 8'hFC,
    WRIDLE                  = 2'd0,
    WRDATA                  = 2'd1,
    WRRESP                  = 2'd2,
    WRRESET                 = 2'd3,
    RDIDLE                  = 2'd0,
    RDDATA                  = 2'd1,
    RDRESET                 = 2'd2,
    ADDR_BITS         = C_S_AXI_ADDR_WIDTH;

    wire                          ACLK_EN;
    assign ACLK_EN = 1'b1;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [31:0]                   wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [31:0]                   rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg [31:0]                   reg0_out_r;
    reg [31:0]                   reg1_out_r;
    reg [31:0]                   reg2_out_r;
    reg [31:0]                   reg3_out_r;
    reg [31:0]                   reg4_out_r;
    reg [31:0]                   reg5_out_r;
    reg [31:0]                   reg6_out_r;
    reg [31:0]                   reg7_out_r;
    reg [31:0]                   reg8_out_r;
    reg [31:0]                   reg9_out_r;
    reg [31:0]                   reg10_out_r;
    reg [31:0]                   reg11_out_r;
    reg [31:0]                   reg12_out_r;
    reg [31:0]                   reg13_out_r;
    reg [31:0]                   reg14_out_r;
    reg [31:0]                   reg15_out_r;
    reg [31:0]                   reg16_out_r;
    reg [31:0]                   reg17_out_r;
    reg [31:0]                   reg18_out_r;
    reg [31:0]                   reg19_out_r;
    reg [31:0]                   reg20_out_r;
    reg [31:0]                   reg21_out_r;
    reg [31:0]                   reg22_out_r;
    reg [31:0]                   reg23_out_r;
    reg [31:0]                   reg24_out_r;
    reg [31:0]                   reg25_out_r;
    reg [31:0]                   reg26_out_r;
    reg [31:0]                   reg27_out_r;
    reg [31:0]                   reg28_out_r;
    reg [31:0]                   reg29_out_r;
    reg [31:0]                   reg30_out_r;
    reg [31:0]                   reg31_out_r;      

    //------------------------AXI write fsm------------------
    assign AWREADY = (wstate == WRIDLE);
    assign WREADY  = (wstate == WRDATA);
    assign BRESP   = 2'b00;  // OKAY
    assign BVALID  = (wstate == WRRESP);
    assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
    assign aw_hs   = AWVALID & AWREADY;
    assign w_hs    = WVALID & WREADY;

    // wstate
    always @(posedge ACLK) begin
        if (ARESET)
            wstate <= WRRESET;
        else if (ACLK_EN)
            wstate <= wnext;
    end

    // wnext
    always @(*) begin
        case (wstate)
            WRIDLE:
                if (AWVALID)
                    wnext = WRDATA;
                else
                    wnext = WRIDLE;
            WRDATA:
                if (WVALID)
                    wnext = WRRESP;
                else
                    wnext = WRDATA;
            WRRESP:
                if (BREADY)
                    wnext = WRIDLE;
                else
                    wnext = WRRESP;
            default:
                wnext = WRIDLE;
        endcase
    end

    // waddr
    always @(posedge ACLK) begin
        if (ACLK_EN) begin
            if (aw_hs)
                waddr <= AWADDR[ADDR_BITS-1:0];
        end
    end

    //------------------------AXI read fsm-------------------
    assign ARREADY = (rstate == RDIDLE);
    assign RDATA   = rdata;
    assign RRESP   = 2'b00;  // OKAY
    assign RVALID  = (rstate == RDDATA);
    assign ar_hs   = ARVALID & ARREADY;
    assign raddr   = ARADDR[ADDR_BITS-1:0];

    // rstate
    always @(posedge ACLK) begin
        if (ARESET)
            rstate <= RDRESET;
        else if (ACLK_EN)
            rstate <= rnext;
    end

    // rnext
    always @(*) begin
        case (rstate)
            RDIDLE:
                if (ARVALID)
                    rnext = RDDATA;
                else
                    rnext = RDIDLE;
            RDDATA:
                if (RREADY & RVALID)
                    rnext = RDIDLE;
                else
                    rnext = RDDATA;
            default:
                rnext = RDIDLE;
        endcase
    end

    always @(posedge ACLK) begin
        if (ACLK_EN) begin
            if (ar_hs) begin
                rdata <= 32'b0;
                case (raddr)
                    ADDR_IN_REG0: begin
                        rdata <= reg0_in;
                    end
                    ADDR_IN_REG1: begin
                        rdata <= reg1_in;
                    end
                    ADDR_IN_REG2: begin
                        rdata <= reg2_in;
                    end
                    ADDR_IN_REG3: begin
                        rdata <= reg3_in;
                    end
                    ADDR_IN_REG4: begin
                        rdata <= reg4_in;
                    end
                    ADDR_IN_REG5: begin
                        rdata <= reg5_in;
                    end
                    ADDR_IN_REG6: begin
                        rdata <= reg6_in;
                    end
                    ADDR_IN_REG7: begin
                        rdata <= reg7_in;
                    end
                    ADDR_IN_REG8: begin
                        rdata <= reg8_in;
                    end
                    ADDR_IN_REG9: begin
                        rdata <= reg9_in;
                    end
                    ADDR_IN_REG10: begin
                        rdata <= reg10_in;
                    end
                    ADDR_IN_REG11: begin
                        rdata <= reg11_in;
                    end
                    ADDR_IN_REG12: begin
                        rdata <= reg12_in;
                    end
                    ADDR_IN_REG13: begin
                        rdata <= reg13_in;
                    end
                    ADDR_IN_REG14: begin
                        rdata <= reg14_in;
                    end
                    ADDR_IN_REG15: begin
                        rdata <= reg15_in;
                    end
                    ADDR_IN_REG16: begin
                        rdata <= reg16_in;
                    end
                    ADDR_IN_REG17: begin
                        rdata <= reg17_in;
                    end
                    ADDR_IN_REG18: begin
                        rdata <= reg18_in;
                    end
                    ADDR_IN_REG19: begin
                        rdata <= reg19_in;
                    end
                    ADDR_IN_REG20: begin
                        rdata <= reg20_in;
                    end
                    ADDR_IN_REG21: begin
                        rdata <= reg21_in;
                    end
                    ADDR_IN_REG22: begin
                        rdata <= reg22_in;
                    end
                    ADDR_IN_REG23: begin
                        rdata <= reg23_in;
                    end
                    ADDR_IN_REG24: begin
                        rdata <= reg24_in;
                    end
                    ADDR_IN_REG25: begin
                        rdata <= reg25_in;
                    end
                    ADDR_IN_REG26: begin
                        rdata <= reg26_in;
                    end
                    ADDR_IN_REG27: begin
                        rdata <= reg27_in;
                    end
                    ADDR_IN_REG28: begin
                        rdata <= reg28_in;
                    end
                    ADDR_IN_REG29: begin
                        rdata <= reg29_in;
                    end
                    ADDR_IN_REG30: begin
                        rdata <= reg30_in;
                    end
                    ADDR_IN_REG31: begin
                        rdata <= reg31_in;
                    end
                endcase
            end
        end
    end

    //------------------------Register logic-----------------
    assign reg0_out   = reg0_out_r;
    assign reg1_out   = reg1_out_r;
    assign reg2_out   = reg2_out_r;
    assign reg3_out   = reg3_out_r;
    assign reg4_out   = reg4_out_r;
    assign reg5_out   = reg5_out_r;
    assign reg6_out   = reg6_out_r;
    assign reg7_out   = reg7_out_r;
    assign reg8_out   = reg8_out_r;
    assign reg9_out   = reg9_out_r;
    assign reg10_out   = reg10_out_r;
    assign reg11_out   = reg11_out_r;
    assign reg12_out   = reg12_out_r;
    assign reg13_out   = reg13_out_r;
    assign reg14_out   = reg14_out_r;
    assign reg15_out   = reg15_out_r;
    assign reg16_out   = reg16_out_r;
    assign reg17_out   = reg17_out_r;
    assign reg18_out   = reg18_out_r;
    assign reg19_out   = reg19_out_r;
    assign reg20_out   = reg20_out_r;
    assign reg21_out   = reg21_out_r;
    assign reg22_out   = reg22_out_r;
    assign reg23_out   = reg23_out_r;
    assign reg24_out   = reg24_out_r;
    assign reg25_out   = reg25_out_r;
    assign reg26_out   = reg26_out_r;
    assign reg27_out   = reg27_out_r;
    assign reg28_out   = reg28_out_r;
    assign reg29_out   = reg29_out_r;
    assign reg30_out   = reg30_out_r;
    assign reg31_out   = reg31_out_r;

    always @(posedge ACLK) begin
        if (ARESET) begin
            reg0_out_r <= 0;
            reg1_out_r <= 0;
            reg2_out_r <= 0;
            reg3_out_r <= 0;
            reg4_out_r <= 0;
            reg5_out_r <= 0;
            reg6_out_r <= 0;
            reg7_out_r <= 0;
            reg8_out_r <= 0;
            reg9_out_r <= 0;
            reg10_out_r <= 0;
            reg11_out_r <= 0;
            reg12_out_r <= 0;
            reg13_out_r <= 0;
            reg14_out_r <= 0;
            reg15_out_r <= 0;
            reg16_out_r <= 0;
            reg17_out_r <= 0;
            reg18_out_r <= 0;
            reg19_out_r <= 0;
            reg20_out_r <= 0;
            reg21_out_r <= 0;
            reg22_out_r <= 0;
            reg23_out_r <= 0;
            reg24_out_r <= 0;
            reg25_out_r <= 0;
            reg26_out_r <= 0;
            reg27_out_r <= 0;
            reg28_out_r <= 0;
            reg29_out_r <= 0;
            reg30_out_r <= 0;
            reg31_out_r <= 0;
        end else if (ACLK_EN) begin
            if (w_hs) begin
                case (waddr)
                    ADDR_OUT_REG0: reg0_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg0_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG1: reg1_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg1_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG2: reg2_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg2_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG3: reg3_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg3_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG4: reg4_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg4_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG5: reg5_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg5_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG6: reg6_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg6_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG7: reg7_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg7_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG8: reg8_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg8_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG9: reg9_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg9_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG10: reg10_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg10_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG11: reg11_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg11_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG12: reg12_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg12_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG13: reg13_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg13_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG14: reg14_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg14_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG15: reg15_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg15_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG16: reg16_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg16_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG17: reg17_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg17_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG18: reg18_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg18_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG19: reg19_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg19_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG20: reg20_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg20_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG21: reg21_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg21_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG22: reg22_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg22_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG23: reg23_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg23_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG24: reg24_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg24_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG25: reg25_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg25_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG26: reg26_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg26_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG27: reg27_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg27_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG28: reg28_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg28_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG29: reg29_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg29_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG30: reg30_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg30_out_r[31:0] & ~wmask);
                    ADDR_OUT_REG31: reg31_out_r[31:0] <= (WDATA[31:0] & wmask) | (reg31_out_r[31:0] & ~wmask);
                endcase
            end  
        end
    end
endmodule
