#include <stdio.h>
#include "rtc.h"
#include "xparameters.h"
#include "xil_io.h"


uint8_t getMSec() {
	return Xil_In8(RTC_DIGIT_0_REG);
}

uint8_t getSec() {
	return Xil_In8(RTC_DIGIT_1_REG);
}

uint8_t getMin() {
	return Xil_In8(RTC_DIGIT_2_REG);
}

uint8_t getHour() {
	return Xil_In8(RTC_DIGIT_3_REG);
}

