#include "win.h"
#include "mode3.h"
#include "text.h"
#include "start.h"
#include "print.h"
#include "pause.h"
#include "lose.h"

typedef struct Player {
    int x;
    int y;
    int lastx;
    int lasty;
    int size;
    u16 color;
} Player;

typedef struct Bullet {
    int x;
    int y;
    int lastx;
    int lasty;
    int size;
    u16 color;
} Bullet;

typedef struct Cannon {
    int x;
    int y;
    Bullet bullets[12];
} Cannon;

void doPlaying() {
    checkButtons();
    drawUpdate();
    waitForVBlank();
}

void goPlaying() {
    initPlaying();
    resumePlaying();
}

void resumePlaying() {
    
}

void initPlaying() {

}
