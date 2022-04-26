#include "lcd.h"

#define LCD_REG	XPAR_GPIO_1_BASEADDR
#define LCD_RS	0
#define LCD_E	1

XGpio gpioLCDInst;
uint8_t lcdData = 0;

void LCD_CmdMode() {
	lcdData &= ~(1<<LCD_RS);
}

void LCD_DataMode() {
	lcdData |= (1<<LCD_RS);
}

void LCD_Enable() {
	lcdData |= (1<<LCD_E);
	Xil_Out8(LCD_REG, lcdData);
	usleep(1);
	lcdData &= ~(1<<LCD_E);
	Xil_Out8(LCD_REG, lcdData);
	usleep(2000);
}

void LCD_SendData(uint8_t data) {
	lcdData = (lcdData & 0x03) | ((data & 0xf0)>>2);
	LCD_Enable();
	lcdData = (lcdData & 0x03) | ((data & 0x0f)<<2);
	LCD_Enable();
}

void LCD_WriteCMD(uint8_t cmdData) {
	LCD_CmdMode();
	LCD_SendData(cmdData);
}

void LCD_WriteData(uint8_t charData) {
	LCD_DataMode();
	LCD_SendData(charData);
}

void LCD_Init() {
	XGpio_Initialize(&gpioLCDInst, XPAR_GPIO_1_DEVICE_ID);

	LCD_WriteCMD(0x03);
	usleep(5000);
	LCD_WriteCMD(0x02);
	usleep(1000);
	LCD_WriteCMD(CMD_FUNCSET_4BIT);
	LCD_WriteCMD(CMD_DISPLAY_OFF);
	LCD_WriteCMD(CMD_DISPLAY_CLEAR);
	LCD_WriteCMD(CMD_ENTRY_MODE_SET);
	LCD_WriteCMD(CMD_DISPLAY_ON);

	LCD_WriteStringXY(0, 0, "         1:Wash ");
	LCD_WriteStringXY(1, 0, "  2:Rins   3:Dry ");
}

void LCD_WriteString(char *str) {
	for(int i; str[i]; i++)
		LCD_WriteData(str[i]);
}

void LCD_GotoXY(uint8_t row, uint8_t col) {
	col %= 16;
	row %= 2;
	uint8_t addr = (0x40 * row) + col;
	uint8_t cmd = 0x80 + addr;
	LCD_WriteCMD(cmd);
}

void LCD_WriteStringXY(uint8_t row, uint8_t col, char *str) {
	LCD_GotoXY(row, col);
	LCD_WriteString(str);
}

void setLCD(uint8_t state) {
	switch(state) {
		case 0:
			LCD_WriteStringXY(0, 0, "         1:Wash ");
			LCD_WriteStringXY(1, 0, "  2:Rins   3:Dry ");
			break;
		case 1:
			LCD_WriteStringXY(0, 0, "           Wash ");
			LCD_WriteStringXY(1, 0, "  1:Stop         ");
			break;
		case 2:
			LCD_WriteStringXY(0, 0, "           Rins ");
			LCD_WriteStringXY(1, 0, "  1:Stop         ");
			break;
		case 3:
			LCD_WriteStringXY(0, 0, "            Dry ");
			LCD_WriteStringXY(1, 0, "  1:Stop         ");
			break;
	}
}

void setLCDTime() {
	char buff[10] = "0";
	char tmp[5] = "0";
	int h = getHour();
	int m = getMin();
	int s = getSec();

	// sprintf(buff, "%02d:%02d:%02d", h, m, s);
	itoa(h, tmp, 10);
	strcpy(buff, tmp);
	strcat(buff, ":");

	itoa(m, tmp, 10);
	strcat(buff, tmp);
	strcat(buff, ":");

	itoa(s, tmp, 10);
	strcat(buff, tmp);

	LCD_WriteStringXY(0, 0, buff);
}

void clearLCD() {
	LCD_WriteStringXY(0, 0, "        ");
}
