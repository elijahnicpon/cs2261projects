#include "game.h"
#include "gba.h"
#include "text.h"
#include "states.h"
#include <stdlib.h>
#include <stdio.h>
#include "pikachu.h"
#include "print.h"

int state;
int time;
int paused;
int gameover;

typedef struct Pikachu {
    int x;
    int y;
    int height;
    int width;
    int dy;
} Pikachu;

Pikachu player;

typedef struct Ball{
    int x;
    int y;
    int size;
    int dy;
    int dx;
    int active;
} Ball;

Ball balls[10];
int BALLCOUNT = 10;

void goGame(int seed) {
    state = GAME;
    DMANow(3, pikachuPal, PALETTE, pikachuPalLen);
    fillScreen4(1);
    time = 0;
    srand(seed);
    initGame();
    waitForVBlank();
    flipPage();
}

void initGame() {
    gameover = 0;

    player.x = 2;
    player.y = 80;
    player.dy = 1;
    player.height = 16;
    player.width = 28;

    for (int i = 0; i < BALLCOUNT; i++) {
        balls[i].x = -1;
        balls[i].y = 0;
        balls[i].size = 8;
        balls[i].dy = 0;
        balls[i].dx = 1;
        balls[i].active = 0;
    }
}

void resumeGame() {
    paused = 0;
    state = GAME;
    DMANow(3, pikachuPal, PALETTE, pikachuPalLen);
}

void doGame() {
    checkButtons();
    updateBalls();
    
    if (!paused) {
        fillScreen4(1);
        drawHUD();
        drawPlayer();
        drawBalls();
    }
    
    time++;
    waitForVBlank();
    flipPage();
    if (BUTTON_PRESSED(BUTTON_START)) {
            paused = 1;
            goPause(time);
    }
    if (gameover) {
        goEnd(time);
    }
}

void drawPlayer() {
    player.y += player.dy * 2;
    if (player.y < 40) {
        player.y = 40;
    } else if (player.y > 104) {
        player.y = 104;
    }
    drawImage4(player.x, player.y, player.width, player.height, pikachuBitmap);
}

void drawBalls() {
    for (int i = 0; i < BALLCOUNT; i++) {
        if (balls[i].active) {
            drawRect4(balls[i].x, balls[i].y, balls[i].size, balls[i].size/2, 255);
            drawRect4(balls[i].x, balls[i].y + balls[i].size/2, balls[i].size, balls[i].size/2, 254);
            drawRect4(balls[i].x + balls[i].size/2 - 1, balls[i].y + balls[i].size/2 - 1, 2,2,253);
        }
        if (collision(balls[i].x, balls[i].y, balls[i].size, balls[i].size, player.x+1, player.y+2, player.width-2, player.height-4)) { // 1x2 padding added
            gameover = 1;
        }
    }
}

void updateBalls() {
    int there_is_a_ball = 0;
    
    for (int i = 0; i < BALLCOUNT; i++) {
        if (balls[i].active) {
            balls[i].x--;
            there_is_a_ball = 1;
        }
    }
    if (time % 60 == 0 || !there_is_a_ball) { // create a ball once a second or if there are none
        createBall();
    }
}

void createBall() {
    for (int i = 0; i < BALLCOUNT; i++) {
        if (balls[i].active == 0) {
            balls[i].active = 1;
            balls[i].x = 232;
            balls[i].y = 40 + rand() % 72;
            mgba_printf("ball created at index: %d, with y value: %d", i, balls[i].y);
            break;
        }
    }
}

void drawHUD() {
    drawRect4(0,0,SCREENWIDTH,40, 0);
    drawRect4(0,120,SCREENWIDTH,40,0);
    if (time < 60*10) {
        drawString4(2,2, "use the arrow keys to move up/down!",1);
    }
    drawString4(2,122, "score:",1);
    char buffer[10];
    sprintf(buffer, "%d", time);
    drawString4(44,122,buffer,1);
}

void checkButtons() {
    if (player.dy == 1 && BUTTON_PRESSED(BUTTON_UP)) {
        player.dy = -1;
        //: PLAYUPSOUND
        REG_SND2CNT = DMG_ENV_VOL(3) | DMG_DIRECTION_DECR | DMG_STEP_TIME(0) | DMG_DUTY_50;
        REG_SND2FREQ = NOTE_D4 | SND_RESET | (1<<14);
    }
    if (player.dy == -1 && BUTTON_PRESSED(BUTTON_DOWN)) {
        player.dy = 1;
        //: PLAYDOWNSOUND
        REG_SND2CNT = DMG_ENV_VOL(3) | DMG_DIRECTION_DECR | DMG_STEP_TIME(0) | DMG_DUTY_50;
        REG_SND2FREQ = NOTE_D3 | SND_RESET | (1<<14);
    }
    // if (BUTTON_PRESSED(BUTTON_START)) {
    //     paused = 1;
    //     goPause();
    // }
    // if (BUTTON_PRESSED(BUTTON_SELECT)) {
    //     goEnd(time);
    // }
}