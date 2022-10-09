#include "win.h"
#include "mode3.h"
#include "text.h"
#include "start.h"

int state;

void goWin() {
    state = WIN;
    fillScreen(RGB(12,12,17));
    drawString(10,50,"congrats! you won!",RGB(7,6,5));
    drawString(10,72,"press start to return to start",RGB(7,6,5));
}

void doWin() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goStart();
    }
}