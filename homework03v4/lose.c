#include "win.h"
#include "mode3.h"
#include "text.h"
#include "start.h"

int state;

void doLose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goStart();
    }
}

void goLose() {
    state = LOSE;
    fillScreen(RGB(20,10,10));
    drawString(10,50,"you lost :(", RGB(7,6,5));
    drawString(10,72,"press start to return to start",RGB(7,6,5));
}