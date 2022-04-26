#include "PSSL_Controller.h"

#define IDLE_STATE 	0
#define RUN_STATE	1

uint8_t state = IDLE_STATE;
u32 btn_state = 0;

uint8_t getState() {
	return state;
}

void setState(uint8_t next) {
	state = next;
}

void PSSL_Controller() {
	btn_state = getBTNState();

	switch(getState()) {
		case IDLE_STATE:
			if (btn_state == 0b110) {
				changeMode(1);
				setLCD(1);
				setState(RUN_STATE);
			}
			else if (btn_state == 0b101) {
				changeMode(2);
				setLCD(2);
				setState(RUN_STATE);
			}
			else if (btn_state == 0b011) {
				changeMode(3);
				setLCD(3);
				setState(RUN_STATE);
			}
			break;

		case RUN_STATE:
			if (btn_state == 0b001) {
				changeMode(0);
				setLCD(0);
				setState(IDLE_STATE);
			}
			break;
	}
}
