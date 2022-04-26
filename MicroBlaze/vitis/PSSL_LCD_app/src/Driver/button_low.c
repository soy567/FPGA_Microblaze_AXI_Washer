#include "button_low.h"


#define CHANNEL1	1
#define BTN_ADDR	XPAR_AXI_GPIO_0_BASEADDR + 0
#define BTN_DEV_ID	XPAR_AXI_GPIO_0_DEVICE_ID

#define PUSHED		0
#define RELEASED	1


XGpio gpioButton_Inst;


void initBtn() {
	XGpio_Initialize(&gpioButton_Inst, BTN_DEV_ID);
	// XGpio_SetDataDirection(&gpioButton_Inst, CHANNEL1, 0x03);
}

int getBTNState() {
	static u32 prev = RELEASED;
	u32 btn = XGpio_DiscreteRead(&gpioButton_Inst, 1);

	if (btn != 0b111 && prev == RELEASED) {
		prev = PUSHED;
		return btn;
	}
	else if (btn == 0b111 && prev == PUSHED) {
		prev = RELEASED;
		return 0;
	}
	else return 0;
}

int getBTN1State() {
	static u32 prev = RELEASED;
	u32 btn = XGpio_DiscreteRead(&gpioButton_Inst, 1) & 0x01;

	if (btn == 0 && prev == RELEASED) {
		prev = PUSHED;
		return btn;
	}
	else if (btn != 0 && prev == PUSHED) {
		prev = RELEASED;
		return 0;
	}
	else return 0;
}

int getBTN2State() {
	static u32 prev = RELEASED;
	u32 btn = XGpio_DiscreteRead(&gpioButton_Inst, 1) & 0x02;

	if (btn == 0 && prev == RELEASED) {
		prev = PUSHED;
		return btn;
	}
	else if (btn != 0 && prev == PUSHED) {
		prev = RELEASED;
		return 0;
	}
	else return 0;
}

int getBTN3State() {
	static u32 prev = RELEASED;
	u32 btn = XGpio_DiscreteRead(&gpioButton_Inst, 1) & 0x04;

	if (btn == 0 && prev == RELEASED) {
		prev = PUSHED;
		return btn;
	}
	else if (btn != 0 && prev == PUSHED) {
		prev = RELEASED;
		return 0;
	}
	else return 0;
}
