#include "gba.h"
#include "states.h"
#include "text.h"
#include <stdlib.h>
#include <stdio.h>
#include "background.h"

extern int state;
int time;
int highScore;
char buffer[10];

void goStart() {
    state = START;
    DMANow(3, &backgroundPal, PALETTE, backgroundPalLen);
    drawFullScreenImage4(backgroundBitmap);
    //drawImage4(0,0,240,160,backgroundBitmap);
    drawString4(10,50,"welcome to poke-run",1);
    drawString4(10,72,"press START to begin",1);
    drawString4(10,94,"highscore:",1);
    sprintf(buffer, "%d", highScore);
    drawString4(74,94,buffer,1);
    time = 0;
    waitForVBlank();
    flipPage();
}

void doStart() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        //goGame(time);
        goGame(time);
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        goHighScore();
    }
    time++;
}