#include "end.h"
#include "states.h"
#include "gba.h"
#include "text.h"
#include <stdlib.h>
#include <stdio.h>
#include "background.h"


void doEnd() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goStart();
    }
}

int max(int a, int b) {
    if (a > b) {
        return a;
    } else {
        return b;
    }
}

void goEnd(int score) {
    DMANow(3, backgroundPal, PALETTE, backgroundPalLen);
    state = END;
    fillScreen4(0);
    char buffer[10];
    drawString4(10,50,"you were caught!",1);
    drawString4(10,72,"press START to restart",1);
    drawString4(10,94,"highscore:",1);
    highScore = max(highScore, score); //update high score
    sprintf(buffer, "%d", highScore); //load buffer
    drawString4(74,94,buffer,1);    //display buffer

    drawString4(10,116,"your score:",1);
    sprintf(buffer, "%d", score); //load buffer
    drawString4(80,116,buffer,1); //display buffer

    waitForVBlank();
    flipPage();
}