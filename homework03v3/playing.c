#include "win.h"
#include "mode3.h"
#include "text.h"
#include "start.h"
#include "print.h"
#include "pause.h"
#include "lose.h"

int pause = 0;
int pickupCooldown = 0;

typedef struct Key {
    int x;
    int y;
    u16 color;
    int active;
} Key;

int keyWidth = 4;
int keyHeight = 9;

int NUMKEYS = 5;
Key keys[5];

typedef struct Border {
    int x;
    int y;
    u16 color;
    int active;
} Border;

int NUMBORDERS = 5;
int borderHeight = 13;
int borderWidth = 8;

Border borders[5];

typedef struct Player {
    int x;
    int y;
    int lastx;
    int lasty;
    u16 color;
} Player;

int player_size = 5;
Player player;

typedef struct Obstacle {
    int x;
    int y;
    int lastx;
    int lasty;
    int xVel;
    int yVel;
    int active;
} Obstacle;

Obstacle obstacles[] = {
    {10,0,10,0,1,1,1},
    {30,0,30,0,1,1,1},
    {50,0,50,0,1,1,1},
    {70,0,70,0,1,1,1},
    {90,0,90,0,1,1,1},
    {110,0,110,0,1,1,1},
    {130,0,130,0,1,1,1},
    {150,0,150,0,1,1,1},
    {170,0,170,0,1,1,1},
    {190,0,190,0,1,1,1},
    {210,0,210,0,1,1,1},
    {230,0,230,0,1,1,1}
};

int NUMOBSTACLES = 12;

void checkBorderCollision(Border *border, Player *player);
int checkKeyCollision(Key *key, Player *player);
int checkObstacleCollision(Obstacle *obstacle, Player *player);
void checkBorderCollision();
void drawUpdate();


int state;

void doPlaying() {
    checkButtons();
    if (!pause) {
         always();
        drawUpdate();
    }
    pickupCooldown--;
    if (checkWin()) {
        goWin();
    }
    waitForVBlank();
}

int checkWin() {
    for (int i = 0; i < NUMBORDERS; i++) {
        if (borders[i].active) {
            return 0;
        }
    }
    return 1;
}

void drawUpdate() {
    //check border collision
    for (int x = 0; x < NUMBORDERS; x++) {
        if (borders[x].active) {
            checkBorderCollision(&borders[x], &player);
        }
    }

    //check key collision and pickup
    for (int x = 0; x < NUMKEYS; x++) {
        if (keys[x].active) {
            if (checkKeyCollision(&keys[x], &player)) {
                if (BUTTON_PRESSED(BUTTON_A) && pickupCooldown <= 0) {
                    player.color = keys[x].color;
                    keys[x].active = 0;
                    drawRectangle(player.x - 7, player.y - 10, 20, 30, BLACK);
                }
            }
        }
    }

    //draw borders
    for (int x = 0; x < NUMBORDERS; x++) {
        drawBorder(&borders[x]);
    }

    //draw player
    drawSquare(player.lastx, player.lasty, player_size, BLACK);
    drawSquare(player.x, player.y, player_size, player.color);

    //draw keys
    for (int x = 0; x < NUMKEYS; x++) {
        if (keys[x].active) {
            drawKey(&keys[x]);
        }
    }

    //draw obstacles, update obstacles, check obstacle collision
    for (int i = 0; i < NUMOBSTACLES; i++) {
        //update velocity
        if (obstacles[i].x == 0 || obstacles[i].x == 238) {
            obstacles[i].xVel *= -1;
        }
        if (obstacles[i].y == -1 || obstacles[i].y == 159) {
            obstacles[i].yVel *= -1;
        }
        //update position
        obstacles[i].x += obstacles[i].xVel;
        obstacles[i].y += obstacles[i].yVel;

        drawSquare(obstacles[i].lastx,obstacles[i].lasty,2,BLACK);
        drawSquare(obstacles[i].x,obstacles[i].y,2,RED);

        //check collision
        if (checkObstacleCollision(&obstacles[i], &player)) {
            goLose();
        }

    }

    //update player's last coordinate values
    player.lastx = player.x;
    player.lasty = player.y;
    //update obstacle's last coordinate values
    for (int i = 0; i < NUMOBSTACLES; i++) {
        obstacles[i].lastx = obstacles[i].x;
        obstacles[i].lasty = obstacles[i].y;
    }
}

//initialize a new game
void initPlaying() {
    player.x = 10;
    player.y = 72;
    player.lastx = 0;
    player.lasty = 0;
    player.color = WHITE;

    keys[0].color = CYAN;
    keys[1].color = MAGENTA;
    keys[2].color = ORANGE;
    keys[3].color = YELLOW;
    keys[4].color = GREEN;

    keys[0].x = 20;
    keys[1].x = 220;
    keys[2].x = 120;
    keys[3].x = 20;
    keys[4].x = 220;

    keys[0].y = 20;
    keys[1].y = 20;
    keys[2].y = 80;
    keys[3].y = 140;
    keys[4].y = 140;

    keys[0].active = 1;
    keys[1].active = 1;
    keys[2].active = 1;
    keys[3].active = 1;
    keys[4].active = 1;

    borders[0].active = 1;
    borders[1].active = 1;
    borders[2].active = 1;
    borders[3].active = 1;
    borders[4].active = 1;

    borders[0].x = 18;
    borders[1].x = 218;
    borders[2].x = 232;
    borders[3].x = 18;
    borders[4].x = 218;

    borders[0].y = 18;
    borders[1].y = 18;
    borders[2].y = 73;
    borders[3].y = 138;
    borders[4].y = 138;

    borders[0].color = MAGENTA;
    borders[1].color = ORANGE;
    borders[2].color = YELLOW;
    borders[3].color = GREEN;
    borders [4].color = CYAN;

    for (int i = 0; i < NUMOBSTACLES; i++) {
        obstacles[i].x = 10 + (20 * i);
        obstacles[i].y = 0;
        obstacles[i].lastx = 10 + (20 * i);
        obstacles[i].lasty = 0;
        obstacles[i].xVel = 1;
        obstacles[i].yVel = 1;
        obstacles[i].active = 1;
    }
}
// go playing state machine -- new game
void goPlaying() {
    fillScreen(BLACK);
    initPlaying();
    state = PLAYING;
}
// go playing state machine -- resume game
void resumePlaying() {
    fillScreen(BLACK);
    state = PLAYING;
    pause = 0;
}
// check buttons
void checkButtons() {
    if (BUTTON_HELD(BUTTON_UP)) {
        player.y--;
        if (player.y < 0) {
            player.y = 0;
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player.y++;
        if (player.y > 160 - player_size) {
            player.y = 160 - player_size;
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.x--;
        if (player.x < 0) {
            player.x = 0;
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.x++;
        if (player.x > 240 - player_size) {
            player.x = 240 - player_size;
        }
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        mgba_printf("START pressed. x:%d, y:%d, lastx:%d, lasty:%d", player.x, player.y, player.lastx, player.lasty);
        goPause();
        pause = 1;
    }
    if (player.color != WHITE) {
        if (BUTTON_PRESSED(BUTTON_A) && pickupCooldown <= 0) {
            for (int i = 0; i < NUMKEYS; i++) {
                if (keys[i].color == player.color) {
                    pickupCooldown = 5;
                    keys[i].active = 1;
                    player.color = WHITE;
                    keys[i].x = player.x;
                    keys[i].y = player.y;

                    mgba_printf("%d", keys[i].active);
                }
            }
        }
    }
}
//draw key
void drawKey(Key *key) {
    SetPixel(key->x + 1, key->y + 0, key->color);
    SetPixel(key->x + 2, key->y + 0, key->color);
    SetPixel(key->x + 1, key->y + 1, key->color);
    SetPixel(key->x + 1, key->y + 2, key->color);
    SetPixel(key->x + 2, key->y + 2, key->color);
    SetPixel(key->x + 1, key->y + 3, key->color);
    SetPixel(key->x + 1, key->y + 4, key->color);
    SetPixel(key->x + 1, key->y + 5, key->color);
    SetPixel(key->x + 2, key->y + 5, key->color);
    SetPixel(key->x + 0, key->y + 6, key->color);
    SetPixel(key->x + 3, key->y + 6, key->color);
    SetPixel(key->x + 0, key->y + 7, key->color);
    SetPixel(key->x + 3, key->y + 7, key->color);
    SetPixel(key->x + 1, key->y + 8, key->color);
    SetPixel(key->x + 2, key->y + 8, key->color);
}
// draw border
void drawBorder(Border *border) {
    drawVerticalLine(border->x, border->y, borderHeight, border->color);
    drawVerticalLine(border->x + borderWidth - 1, border->y, borderHeight, border->color);
    drawHorizontalLine(border->x, border->y, borderWidth, border->color);
    drawHorizontalLine(border->x, border->y + borderHeight - 1, borderWidth, border->color);
}
// checks border collision
void checkBorderCollision(Border *border, Player *player) {
    if (player->x < border->x + borderWidth && player->x + player_size > border->x && player->y < border->y + borderHeight && player->y + player_size > border->y) {
        player->x = player->lastx;
        player->y = player->lasty;
        if (BUTTON_HELD(BUTTON_B)) {
            if (player->color == border->color) {
                border->active = 0;
                border->color = BLACK;
            }
        }
    }
}
//checks key collision
int checkKeyCollision(Key *key, Player *player) {
    if (player->x < key->x + keyWidth && player->x + player_size > key->x && player->y < key->y + keyHeight && player->y + player_size > key->y) {
        return 1;
    } else {
        return 0;
    }
}
//checks obstacle collision
int checkObstacleCollision(Obstacle *obstacle, Player *player) {
    if (player->x < obstacle->x + 2 && player->x + player_size > obstacle->x && player->y < obstacle->y + 2 && player->y + player_size > obstacle->y) {
        return 1;
    } else {
        return 0;
    }
}
//draws the arrow that points at goal
void always() {
    drawSquare(210,77,6,WHITE);
    drawVerticalLine(216,75,10,WHITE);
    drawVerticalLine(217,76,8,WHITE);
    drawVerticalLine(218,77,6,WHITE);
    drawVerticalLine(219,78,4,WHITE);
    drawVerticalLine(220,79,2,WHITE);
}