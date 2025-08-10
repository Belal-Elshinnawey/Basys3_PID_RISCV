#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_io.h"
#include "pid_driver.h"  



void xil_print_f32_hp(uint32_t u)
{
    double v = f32_to_f64(u);

    int neg = (v < 0.0);
    if (neg) v = -v;

    unsigned int ip = (unsigned int)v;  // integer part
    double frac_d = (v - (double)ip) * 1000000.0 + 0.5; // round to µ
    unsigned int fp = (unsigned int)frac_d;
    if (fp >= 1000000u) { ip += 1u; fp = 0u; }

    if (neg) xil_printf("-");
    xil_printf("%u.%06u\r\n", ip, fp);
}

float pid_mul(float a, float b)
{
    const uint32_t base = PID_BASE_ADDR;
    uint32_t in = 0;
    uint32_t out = 0;
    // 1) Write operands
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + MUL_A_OFFSET, f2u(a));
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + MUL_B_OFFSET, f2u(b));

    // 2) Assert TVALID for A & B and KEEP them asserted
    SET_MUL_R_READY(in);
    SET_MUL_A_VALID(in);
    SET_MUL_B_VALID(in);
    pid_write_in_ctrl(in);
    do { out = pid_read_out_ctrl(); } while (!MUL_R_VALID(out));
    float res_u = u2f(Xil_In32(base + INPUT_REG_BASE_OFFSET + MUL_INPUT_RESULTS_OFFSET));
    pid_write_in_ctrl(0);
    return res_u;
}

void pid_calc_terms(
    float error, float Kp, float Gi, float Gd,
    float prev_I, float prev_D,
    float *out_P, float *out_I, float *out_D)
{
    uint32_t base = PID_BASE_ADDR;
    uint32_t in = 0;

    // ----- Write operands -----
    // MAC_SUB (D term) : error*Gd - prev_D
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + MAC_SUB_A_OFFSET, f2u(error));
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + MAC_SUB_B_OFFSET, f2u(Gd));
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + MAC_SUB_C_OFFSET, f2u(prev_D));

    // MAC_ADD (I term) : error*Gi + prev_I
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + MAC_ADD_A_OFFSET, f2u(error));
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + MAC_ADD_B_OFFSET, f2u(Gi));
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + MAC_ADD_C_OFFSET, f2u(prev_I));

    // MUL (P term) : error*Kp
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + MUL_A_OFFSET, f2u(error));
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + MUL_B_OFFSET, f2u(Kp));

    // ----- Set R_READY and A/B/C valids -----
    SET_MAC_SUB_R_READY(in);
    SET_MAC_SUB_A_VALID(in);
    SET_MAC_SUB_B_VALID(in);
    SET_MAC_SUB_C_VALID(in);

    SET_MAC_ADD_R_READY(in);
    SET_MAC_ADD_A_VALID(in);
    SET_MAC_ADD_B_VALID(in);
    SET_MAC_ADD_C_VALID(in);

    SET_MUL_R_READY(in);
    SET_MUL_A_VALID(in);
    SET_MUL_B_VALID(in);

    pid_write_in_ctrl(in);

    // ----- Wait for all R_VALID -----
    uint32_t out;
    do {
        out = pid_read_out_ctrl();
    } while (!(MAC_SUB_R_VALID(out) && MAC_ADD_R_VALID(out) && MUL_R_VALID(out)));

    // ----- Read results -----
    *out_D = u2f(Xil_In32(base + INPUT_REG_BASE_OFFSET + MAC_SUB_INPUT_RESULTS_OFFSET));
    *out_I = u2f(Xil_In32(base + INPUT_REG_BASE_OFFSET + MAC_ADD_INPUT_RESULTS_OFFSET));
    *out_P = u2f(Xil_In32(base + INPUT_REG_BASE_OFFSET + MUL_INPUT_RESULTS_OFFSET));

    // ----- Clear control -----
    pid_write_in_ctrl(0);
}

float pid_sum(float a, float b, float c)
{
    uint32_t base = PID_BASE_ADDR;
    uint32_t in = 0;
    uint32_t out;

    // Step 1: add a + b
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + ADD_A_OFFSET, f2u(a));
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + ADD_B_OFFSET, f2u(b));

    SET_ADD_R_READY(in);
    SET_ADD_A_VALID(in);
    SET_ADD_B_VALID(in);
    pid_write_in_ctrl(in);

    do { out = pid_read_out_ctrl(); } while (!ADD_R_VALID(out));
    float sum1 = u2f(Xil_In32(base + INPUT_REG_BASE_OFFSET + ADD_INPUT_RESULTS_OFFSET));
    pid_write_in_ctrl(0);

    // Step 2: add sum1 + c
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + ADD_A_OFFSET, f2u(sum1));
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + ADD_B_OFFSET, f2u(c));

    in = 0;
    SET_ADD_R_READY(in);
    SET_ADD_A_VALID(in);
    SET_ADD_B_VALID(in);
    pid_write_in_ctrl(in);

    do { out = pid_read_out_ctrl(); } while (!ADD_R_VALID(out));
    float sum2 = u2f(Xil_In32(base + INPUT_REG_BASE_OFFSET + ADD_INPUT_RESULTS_OFFSET));
    pid_write_in_ctrl(0);

    return sum2;
}

// === Subtract two floats (a - b) ===
float pid_sub(float a, float b)
{
    uint32_t base = PID_BASE_ADDR;
    uint32_t in = 0;
    uint32_t out;

    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + SUB_A_OFFSET, f2u(a));
    Xil_Out32(base + OUTPUT_REG_BASE_OFFSET + SUB_B_OFFSET, f2u(b));

    SET_SUB_R_READY(in);
    SET_SUB_A_VALID(in);
    SET_SUB_B_VALID(in);
    pid_write_in_ctrl(in);

    do { out = pid_read_out_ctrl(); } while (!SUB_R_VALID(out));
    float diff = u2f(Xil_In32(base + INPUT_REG_BASE_OFFSET + SUB_INPUT_RESULTS_OFFSET));
    pid_write_in_ctrl(0);
 
    return diff;
}
