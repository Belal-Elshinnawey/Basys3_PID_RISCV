#ifndef __PID_DRIVER_H__
#define __PID_DRIVER_H__
#include "xparameters.h"
#include "xil_io.h"
#include <stdint.h>


#define PID_BASE_ADDR XPAR_AXILITES_S_AXI_REG_I_0_BASEADDR

#define INPUT_REG_BASE_OFFSET 0X80
#define BEEFBABE_INPUT_ADDR_OFFSET 0X00
#define MAC_SUB_INPUT_RESULTS_OFFSET 0X04
#define MAC_ADD_INPUT_RESULTS_OFFSET 0X08
#define MUL_INPUT_RESULTS_OFFSET 0X0C
#define ADD_INPUT_RESULTS_OFFSET 0X10
#define SUB_INPUT_RESULTS_OFFSET 0X14
#define INPUT_CONTROL_REG_OFFSET 0X18

#define OUTPUT_REG_BASE_OFFSET 0X00
#define LED_OUTPUT_REG_OFFSET 0X00
#define MAC_SUB_A_OFFSET 0X04
#define MAC_SUB_B_OFFSET 0X08
#define MAC_SUB_C_OFFSET 0X0C
#define MAC_ADD_A_OFFSET 0X10
#define MAC_ADD_B_OFFSET 0X14
#define MAC_ADD_C_OFFSET 0X18
#define MUL_A_OFFSET 0X1C
#define MUL_B_OFFSET 0X20
#define ADD_A_OFFSET 0X24
#define ADD_B_OFFSET 0X28
#define SUB_A_OFFSET 0X2C
#define SUB_B_OFFSET 0X30
#define OUTPUT_CONTROL_REG_OFFSET 0X34


/* ===== Bit indices ===== */
/* OUTPUT_CONTROL_REG (status from ALUs → CPU) */
#define MAC_SUB_A_READY_INDX   0
#define MAC_SUB_B_READY_INDX   1
#define MAC_SUB_C_READY_INDX   2
#define MAC_SUB_R_VALID_INDX   3

#define MAC_ADD_A_READY_INDX   4
#define MAC_ADD_B_READY_INDX   5
#define MAC_ADD_C_READY_INDX   6
#define MAC_ADD_R_VALID_INDX   7

#define MUL_A_READY_INDX       8
#define MUL_B_READY_INDX       9
#define MUL_R_VALID_INDX       10

#define SUB_A_READY_INDX       11
#define SUB_B_READY_INDX       12
#define SUB_R_VALID_INDX       13

#define ADD_A_READY_INDX       14
#define ADD_B_READY_INDX       15
#define ADD_R_VALID_INDX       16

/* INPUT_CONTROL_REG (CPU → ALUs) */
#define MAC_SUB_A_VALID_INDX   0
#define MAC_SUB_B_VALID_INDX   1
#define MAC_SUB_C_VALID_INDX   2
#define MAC_SUB_R_READY_INDX   3

#define MAC_ADD_A_VALID_INDX   4
#define MAC_ADD_B_VALID_INDX   5
#define MAC_ADD_C_VALID_INDX   6
#define MAC_ADD_R_READY_INDX   7

#define MUL_A_VALID_INDX       8
#define MUL_B_VALID_INDX       9
#define MUL_R_READY_INDX       10

#define SUB_A_VALID_INDX       11
#define SUB_B_VALID_INDX       12
#define SUB_R_READY_INDX       13

#define ADD_A_VALID_INDX       14
#define ADD_B_VALID_INDX       15
#define ADD_R_READY_INDX       16

/* ===== Bit test (no MMIO) ===== */
#define TEST_BIT_VAL(val, idx)   ( (uint32_t)(((val) >> (idx)) & 1u) )

/* ===== READ SIDE (OUTPUT_CONTROL_REG value → query READY/VALID from ALUs) ===== */
#define MAC_SUB_A_READY(v)       TEST_BIT_VAL((v), MAC_SUB_A_READY_INDX)
#define MAC_SUB_B_READY(v)       TEST_BIT_VAL((v), MAC_SUB_B_READY_INDX)
#define MAC_SUB_C_READY(v)       TEST_BIT_VAL((v), MAC_SUB_C_READY_INDX)
#define MAC_SUB_R_VALID(v)       TEST_BIT_VAL((v), MAC_SUB_R_VALID_INDX)

#define MAC_ADD_A_READY(v)       TEST_BIT_VAL((v), MAC_ADD_A_READY_INDX)
#define MAC_ADD_B_READY(v)       TEST_BIT_VAL((v), MAC_ADD_B_READY_INDX)
#define MAC_ADD_C_READY(v)       TEST_BIT_VAL((v), MAC_ADD_C_READY_INDX)
#define MAC_ADD_R_VALID(v)       TEST_BIT_VAL((v), MAC_ADD_R_VALID_INDX)

#define MUL_A_READY(v)           TEST_BIT_VAL((v), MUL_A_READY_INDX)
#define MUL_B_READY(v)           TEST_BIT_VAL((v), MUL_B_READY_INDX)
#define MUL_R_VALID(v)           TEST_BIT_VAL((v), MUL_R_VALID_INDX)

#define SUB_A_READY(v)           TEST_BIT_VAL((v), SUB_A_READY_INDX)
#define SUB_B_READY(v)           TEST_BIT_VAL((v), SUB_B_READY_INDX)
#define SUB_R_VALID(v)           TEST_BIT_VAL((v), SUB_R_VALID_INDX)

#define ADD_A_READY(v)           TEST_BIT_VAL((v), ADD_A_READY_INDX)
#define ADD_B_READY(v)           TEST_BIT_VAL((v), ADD_B_READY_INDX)
#define ADD_R_VALID(v)           TEST_BIT_VAL((v), ADD_R_VALID_INDX)

/* ===== WRITE SIDE (compose INPUT_CONTROL_REG value you’ll write) ===== */
#define SET_BIT(v, idx)          do { (v) |=  (1u << (idx)); } while (0)
#define CLR_BIT(v, idx)          do { (v) &= ~(1u << (idx)); } while (0)

#define SET_MAC_SUB_A_VALID(v)   SET_BIT((v), MAC_SUB_A_VALID_INDX)
#define CLR_MAC_SUB_A_VALID(v)   CLR_BIT((v), MAC_SUB_A_VALID_INDX)
#define SET_MAC_SUB_B_VALID(v)   SET_BIT((v), MAC_SUB_B_VALID_INDX)
#define CLR_MAC_SUB_B_VALID(v)   CLR_BIT((v), MAC_SUB_B_VALID_INDX)
#define SET_MAC_SUB_C_VALID(v)   SET_BIT((v), MAC_SUB_C_VALID_INDX)
#define CLR_MAC_SUB_C_VALID(v)   CLR_BIT((v), MAC_SUB_C_VALID_INDX)
#define SET_MAC_SUB_R_READY(v)   SET_BIT((v), MAC_SUB_R_READY_INDX)
#define CLR_MAC_SUB_R_READY(v)   CLR_BIT((v), MAC_SUB_R_READY_INDX)

#define SET_MAC_ADD_A_VALID(v)   SET_BIT((v), MAC_ADD_A_VALID_INDX)
#define CLR_MAC_ADD_A_VALID(v)   CLR_BIT((v), MAC_ADD_A_VALID_INDX)
#define SET_MAC_ADD_B_VALID(v)   SET_BIT((v), MAC_ADD_B_VALID_INDX)
#define CLR_MAC_ADD_B_VALID(v)   CLR_BIT((v), MAC_ADD_B_VALID_INDX)
#define SET_MAC_ADD_C_VALID(v)   SET_BIT((v), MAC_ADD_C_VALID_INDX)
#define CLR_MAC_ADD_C_VALID(v)   CLR_BIT((v), MAC_ADD_C_VALID_INDX)
#define SET_MAC_ADD_R_READY(v)   SET_BIT((v), MAC_ADD_R_READY_INDX)
#define CLR_MAC_ADD_R_READY(v)   CLR_BIT((v), MAC_ADD_R_READY_INDX)

#define SET_MUL_A_VALID(v)   SET_BIT((v), MUL_A_VALID_INDX)
#define CLR_MUL_A_VALID(v)   CLR_BIT((v), MUL_A_VALID_INDX)
#define SET_MUL_B_VALID(v)   SET_BIT((v), MUL_B_VALID_INDX)
#define CLR_MUL_B_VALID(v)   CLR_BIT((v), MUL_B_VALID_INDX)
#define SET_MUL_R_READY(v)   SET_BIT((v), MUL_R_READY_INDX)
#define CLR_MUL_R_READY(v)   CLR_BIT((v), MUL_R_READY_INDX)

#define SET_SUB_A_VALID(v)   SET_BIT((v), SUB_A_VALID_INDX)
#define CLR_SUB_A_VALID(v)   CLR_BIT((v), SUB_A_VALID_INDX)
#define SET_SUB_B_VALID(v)   SET_BIT((v), SUB_B_VALID_INDX)
#define CLR_SUB_B_VALID(v)   CLR_BIT((v), SUB_B_VALID_INDX)
#define SET_SUB_R_READY(v)   SET_BIT((v), SUB_R_READY_INDX)
#define CLR_SUB_R_READY(v)   CLR_BIT((v), SUB_R_READY_INDX)

#define SET_ADD_A_VALID(v)   SET_BIT((v), ADD_A_VALID_INDX)
#define CLR_ADD_A_VALID(v)   CLR_BIT((v), ADD_A_VALID_INDX)
#define SET_ADD_B_VALID(v)   SET_BIT((v), ADD_B_VALID_INDX)
#define CLR_ADD_B_VALID(v)   CLR_BIT((v), ADD_B_VALID_INDX)
#define SET_ADD_R_READY(v)   SET_BIT((v), ADD_R_READY_INDX)
#define CLR_ADD_R_READY(v)   CLR_BIT((v), ADD_R_READY_INDX)


static inline uint32_t pid_read_out_ctrl() {
    return Xil_In32(PID_BASE_ADDR+  INPUT_REG_BASE_OFFSET + INPUT_CONTROL_REG_OFFSET);
}

static inline void pid_write_in_ctrl(uint32_t v) {
    Xil_Out32(PID_BASE_ADDR + OUTPUT_REG_BASE_OFFSET + OUTPUT_CONTROL_REG_OFFSET, v);
}

static inline uint32_t f2u(float f) {
    union { float f; uint32_t u; } t; t.f = f; return t.u;
}
static inline float u2f(uint32_t u) {
    union { uint32_t u; float f; } t; t.u = u; return t.f;
}

static inline double f32_to_f64(uint32_t u) {
    union { uint32_t u; float f; } t; t.u = u;
    return (double)t.f;
}

void xil_print_f32_hp(uint32_t u);

float pid_mul(float a, float b);

void pid_calc_terms(
    float error, float Kp, float Gi, float Gd,
    float prev_I, float prev_D,
    float *out_P, float *out_I, float *out_D);

float pid_sum(float a, float b, float c);

float pid_sub(float a, float b);
#endif /* __PID_DRIVER_H__ */
