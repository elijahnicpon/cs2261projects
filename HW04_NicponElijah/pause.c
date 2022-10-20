#include "pause.h"
#include "states.h"
#include "gba.h"
#include "text.h"
#include "background.h"

int state;

void goPause(int score) {
    DMANow(3, backgroundPal, PALETTE, backgroundPalLen);
    state = PAUSE;
    fillScreen4(0);
    drawString4(10,50,"pause",1);
    drawString4(10,72,"press START to resume",1);

    drawString4(10,94,"score:",1);
    char buffer[10];
    sprintf(buffer, "%d", score);
    drawString4(52,94,buffer,1);

    waitForVBlank();
    flipPage();
    
}
 
void doPause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        resumeGame();
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        goHighScore();
    }
}