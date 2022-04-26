#ifndef SRC_DRIVER_RTC_H_
#define SRC_DRIVER_RTC_H_

#include <stdio.h>

#define RTC_DIGIT_0_REG 	XPAR_AXI_RTC_V1_0_BASEADDR + 0
#define RTC_DIGIT_1_REG 	XPAR_AXI_RTC_V1_0_BASEADDR + 1
#define RTC_DIGIT_2_REG 	XPAR_AXI_RTC_V1_0_BASEADDR + 2
#define RTC_DIGIT_3_REG 	XPAR_AXI_RTC_V1_0_BASEADDR + 3


uint8_t getMSec();
uint8_t getSec();
uint8_t getMin();
uint8_t getHour();

#endif /* SRC_DRIVER_RTC_H_ */
