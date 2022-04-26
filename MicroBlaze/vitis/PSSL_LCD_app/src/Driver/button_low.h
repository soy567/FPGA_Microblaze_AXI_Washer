#ifndef SRC_DRIVER_BUTTON_LOW_H_
#define SRC_DRIVER_BUTTON_LOW_H_

#include "stdio.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "xintc.h"
#include "xgpio.h"
#include "sleep.h"


void initBtn();
int getBTNState();
int getBTN1State();
int getBTN2State();
int getBTN3State();

#endif /* SRC_DRIVER_BUTTON_LOW_H_ */
