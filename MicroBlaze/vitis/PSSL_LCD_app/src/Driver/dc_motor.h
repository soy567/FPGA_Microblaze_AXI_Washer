#ifndef SRC_DRIVER_DC_MOTOR_H_
#define SRC_DRIVER_DC_MOTOR_H_

#include "stdio.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "xintc.h"
#include "xgpio.h"
#include "lcd.h"
#include "../Controller/PSSL_Controller.h"



int init_XIntc_DC_Motor();
void init_DC_Motor();
void DC_Handler(void *CallBackRef);
void changeMode(int mode);

#endif /* SRC_DRIVER_DC_MOTOR_H_ */
