#include "dc_motor.h"

#define DC_MOTOR_MODE   XPAR_AXI_DC_MOTOR_INT_V1_0_BASEADDR + 0
#define DC_MOTOR_RESET 	XPAR_AXI_DC_MOTOR_INT_V1_0_BASEADDR + 0b0011
#define DC_MOTOR_FIN 	XPAR_AXI_DC_MOTOR_INT_V1_0_BASEADDR + 0b0100

#define CHANNEL_1		1

XIntc intControllerInst;

void DC_Handler(void *CallBackRef) {
	changeMode(0);
	setLCD(0);
	setState(0);
	xil_printf("Exec Interrupt!\n");
};

int init_XIntc_DC_Motor() {
	int status = 0;

	status = XIntc_Initialize(&intControllerInst,
			XPAR_MICROBLAZE_0_AXI_INTC_DEVICE_ID);
	if (status != XST_SUCCESS) return XST_FAILURE;

	status = XIntc_Connect(&intControllerInst, XPAR_INTC_0_DEVICE_ID,
			(Xil_ExceptionHandler) DC_Handler, (void *)0);
	if (status != XST_SUCCESS) return XST_FAILURE;

	status = XIntc_Start(&intControllerInst, XIN_REAL_MODE);
	if (status != XST_SUCCESS) return XST_FAILURE;

	XIntc_Enable(&intControllerInst, XPAR_INTC_0_DEVICE_ID);

	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler)XIntc_InterruptHandler, &intControllerInst);
	Xil_ExceptionEnable();

	return XST_SUCCESS;
}


void init_DC_Motor() {
	Xil_Out8(DC_MOTOR_MODE, 0x00);
}

void changeMode(int mode) {
	switch(mode) {
		case 0: Xil_Out8(DC_MOTOR_MODE, 0b000); break;
		case 1: Xil_Out8(DC_MOTOR_MODE, 0b001); break;
		case 2: Xil_Out8(DC_MOTOR_MODE, 0b010); break;
		case 3: Xil_Out8(DC_MOTOR_MODE, 0b100); break;
		default: Xil_Out8(DC_MOTOR_MODE, 0b000); break;
	}
}
