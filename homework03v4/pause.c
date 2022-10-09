#include "text.h"
#include "mode3.h"
#include "playing.h"

int state;

void goPause() {
    fillScreen(RGB(30,30,29));
    drawString(10,50,"pause",RGB(7,6,5));
    drawString(10,72,"press start to resume",RGB(7,6,5));
    state = PAUSE;
}

void doPause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        resumePlaying();
    }
}