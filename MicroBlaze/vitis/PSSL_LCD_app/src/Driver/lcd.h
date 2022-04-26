#ifndef SRC_DRIVER_LCD_H_
#define SRC_DRIVER_LCD_H_

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "sleep.h"
#include "xparameters.h"
#include "xgpio.h"
#include "rtc.h"


#define CMD_DISPLAY_CLEAR	0x01
#define CMD_ENTRY_MODE_SET	0x06
#define CMD_DISPLAY_OFF		0x08
#define CMD_DISPLAY_ON		0x0c
#define CMD_FUNCSET_4BIT	0x28


void LCD_CmdMode();
void LCD_DataMode();
void LCD_Enable();
void LCD_SendData(uint8_t data);
void LCD_WriteCMD(uint8_t cmdData);
void LCD_WriteData(uint8_t charData);
void LCD_Init();
void LCD_WriteString(char *str);
void LCD_GotoXY(uint8_t row, uint8_t col);
void LCD_WriteStringXY(uint8_t row, uint8_t col, char *str);
void setLCD(uint8_t state);
void setLCDTime();
void clearLCD();


#endif /* SRC_DRIVER_LCD_H_ */
