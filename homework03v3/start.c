#include "mode3.h"
#include "text.h"
#include "start.h"
#include "win.h"

int state;

void goStart() {
    fillScreen(RGB(30,30,29));
    drawString(10,50,"welcome to idk game!",RGB(7,6,5));
    drawString(10,72,"press start to begin",RGB(7,6,5));
    state = START;
}

void doStart() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goPlaying();
        //goWin();
    }
}