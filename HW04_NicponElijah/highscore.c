#include "highscore.h"
#include "states.h"
#include "gba.h"
#include "text.h"
#include <stdio.h>
#include "background.h"

void doHighScore() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goStart();
    }
}

void goHighScore() {
    state = HIGHSCORE;
    DMANow(3, &backgroundPal, PALETTE, backgroundPalLen);
    drawFullScreenImage4(backgroundBitmap);
    //drawImage4(0,0,240,160,backgroundBitmap);
    drawString4(10,50,"HIGHSCORES",1);
    drawString4(10,72,"press START to return to start",1);
    drawString4(10,94,"highscore:",1);
    char buffer[10];
    sprintf(buffer, "%d", highScore);
    drawString4(74,94,buffer,1);
    waitForVBlank();
    flipPage();
}