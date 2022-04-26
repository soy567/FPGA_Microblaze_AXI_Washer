#ifndef SRC_CONTROLLER_PSSL_CONTROLLER_H_
#define SRC_CONTROLLER_PSSL_CONTROLLER_H_

#include <stdio.h>
#include "xintc.h"
#include "../Driver/button_low.h"
#include "../Driver/dc_motor.h"
#include "../Driver/lcd.h"

uint8_t getState();
void setState(uint8_t next);
void PSSL_Controller();

#endif /* SRC_CONTROLLER_PSSL_CONTROLLER_H_ */
