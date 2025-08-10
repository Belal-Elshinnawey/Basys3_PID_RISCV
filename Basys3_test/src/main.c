#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_io.h"
#include "pid_driver.h"  

#define SHARED_MEM_ADDR XPAR_AXILITES_S_AXI_REG_I_0_BASEADDR
#define PWM_MEM_ADDR XPAR_AXILITES_S_AXI_REG_I_0_BASEADDR + 0X38
#define ENCODER_MEM_ADDR ((XPAR_AXILITES_S_AXI_REG_I_0_BASEADDR + 0X80 + 0X1C))
#define SHARED_BRAM_ADDR XPAR_AXI_BRAM_CTRL_0_BASEADDR
float kp = 0.00450;
float Gi = 0.00015;
float Gd = 0.01800;
float prev_I = 0.0;
float prev_D = 0.0;
float out_P = 0.0;
float out_I = 0.0;
float out_D = 0.0;
float error = 0.0;
float pid_out = 0.0;
const float PWM_MAX = 4096.0*(0.6);
float PWM_val = 0.0;
uint32_t encoder_out = 0;
uint32_t position = 0;
uint32_t setpoint  = 0;

void delay(volatile unsigned int cycles)
{
    while (cycles--)
    {
        asm volatile("nop");
    }
}

void read_encoders(void)
{
    encoder_out = Xil_In32(ENCODER_MEM_ADDR);
    position = (uint32_t)((uint16_t)(encoder_out >> 16));
    setpoint  = (uint32_t)((uint16_t)(encoder_out & 0xFFFF));
    uint32_t val = 0xFFFF0000;
    Xil_Out32(SHARED_BRAM_ADDR, encoder_out & val);
    xil_printf("Position: %u, Setpoint: %u\n\r", position, setpoint);
}

int main()
{
    init_platform();
    // print("UART Started\n\r");
    // u32 data = Xil_In32(SHARED_MEM_ADDR + 0x80);
	// xil_printf("Checking If BEEFBABE at ADDR: %x, Data: 0x%x.\n",SHARED_MEM_ADDR + 0x80, data);
    // Xil_Out32(PWM_MEM_ADDR, (uint32_t)(0));
	while (1) {
        read_encoders();
        // compute error
        error = pid_sub((float) setpoint, (float)position);
        // if (error < 20.0f && error > -20.0f)  error = 0.0f;
        //use error to compute terms
        pid_calc_terms(
            error, kp, Gi, Gd,
            prev_I, prev_D,
            &out_P,  &out_I, &out_D);
        // sum the terms
        pid_out = pid_sum(out_P,out_I, out_D);
        if (pid_out > 1.0f)  pid_out = 1.0f;
        if (pid_out < -1.0f) pid_out = -1.0f;
        //Calculate PWM value
        PWM_val = pid_mul(pid_out, PWM_MAX);
        //Write PWM val
        Xil_Out32(PWM_MEM_ADDR, (uint32_t)(((int)PWM_val)));
        //update prev values
        prev_I = out_I;
        prev_D = pid_mul(error, Gd);
    }
    cleanup_platform();
    return 0;
}
