#include "win.h"
#include "mode3.h"
#include "text.h"
#include "start.h"
#include "print.h"
#include "pause.h"
#include "lose.h"

typedef struct Key {
    int x;
    int y;
    u16 color;
    int active;
} Key;

int keyWidth = 4;
int keyHeight = 9;

int NUMKEYS = 5;
Key keys[] = {
    {115,75,CYAN,1},
    {50,90,MAGENTA,1},
    {10,10,ORANGE,1},
    {160,55,YELLOW,1},
    {225,50,GREEN,1}
};

typedef struct Border {
    int x;
    int y;
    u16 color;
    int active;
} Border;

int NUMBORDERS = 5;
int borderHeight = 13;
int borderWidth = 8;

Border borders[] = {
    {113,73,YELLOW,1},
    {48,88,GREEN,1},
    {8,8,CYAN,1},
    {158,53,MAGENTA,1},
    {233,118,ORANGE,1}
};

typedef struct Player {
    int x;
    int y;
    int lastx;
    int lasty;
    u16 color;
} Player;

int player_size = 5;
Player player = {10,72,10,72,WHITE};

// Player player;

typedef struct Obstacle {
    int x;
    int y;
    int lastx;
    int lasty;
    int xVelocity;
    int yVelocity;
} Obstacle;

int obstacle_size = 2;
u16 obstacleColor = RED;
Obstacle obstacleArrayTemplate[] = {
    {0,0,0,0,1,0},
    {20,0,20,0,1,0},
    {40,0,40,0,1,0},
    {60,0,60,0,1,0},
    {80,0,80,0,1,0},
    {100,0,100,0,1,0},
    {120,0,120,0,0,1},
    {120,20,120,20,0,1},
    {120,40,120,40,0,1},
    {120,60,120,60,0,1},
    {120,80,180,80,-1,0},
    {100,80,100,80,-1,0},
    {80,80,80,80,-1,0},
    {60,80,60,80,-1,0},
    {40,80,40,80,-1,0},
    {20,80,20,80,-1,0},
    {0,80,0,80,0,-1},
    {0,60,0,60,0,-1},
    {0,40,0,40,0,-1},
    {0,20,0,20,0,-1}
};

int ObstacleArrayTemplateSize = 20;

typedef struct ObstacleGroup {
    int x;
    int y;
    Obstacle obstacles[20];
} ObstacleGroup;
int obstacleGroupHeight = 80;
int obstacleGroupWidth = 120;

ObstacleGroup leftObstacleGroup = {40,60,{
    {0,0,0,0},
    {20,0,20,0},
    {40,0,40,0},
    {60,0,60,0},
    {80,0,80,0},
    {100,0,100,0},
    {120,0,120,0},
    {120,20,120,20},
    {120,40,120,40},
    {120,60,120,60},
    {120,80,180,80},
    {100,80,100,80},
    {80,80,80,80},
    {60,80,60,80},
    {40,80,40,80},
    {20,80,20,80},
    {0,80,0,80},
    {0,60,0,60},
    {0,40,0,40},
    {0,20,0,20}
}};

ObstacleGroup rightObstacleGroup = {80,20,{
    {0,0,0,0},
    {20,0,20,0},
    {40,0,40,0},
    {60,0,60,0},
    {80,0,80,0},
    {100,0,100,0},
    {120,0,120,0},
    {120,20,120,20},
    {120,40,120,40},
    {120,60,120,60},
    {120,80,180,80},
    {100,80,100,80},
    {80,80,80,80},
    {60,80,60,80},
    {40,80,40,80},
    {20,80,20,80},
    {0,80,0,80},
    {0,60,0,60},
    {0,40,0,40},
    {0,20,0,20}
}};


int obstacle_group_height;
int obstacle_group_width;

void checkBorderCollision(Border *border, Player *player);
int checkKeyCollision(Key *key, Player *player);


int state;

void doPlaying() {
    checkButtons();
    drawUpdate();
    waitForVBlank();
}

void drawUpdate() {
    //draw player stuff

    for (int x = 0; x < NUMBORDERS; x++) {
        if (borders[x].color != player.color) {
            checkBorderCollision(&borders[x], &player);
        }
    }

    for (int x = 0; x < NUMKEYS; x++) {
        if (keys[x].active) {
            if (checkKeyCollision(&keys[x], &player)) {
                if (BUTTON_PRESSED(BUTTON_A)) {
                    player.color = keys[x].color;
                    keys[x].active = 0;
                    drawRectangle(player.x - 7, player.y - 10, 15, 20, BLACK);
                }
            }
        }
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

    //draw borders
    for (int x = 0; x < NUMBORDERS; x++) {
        drawBorder(&borders[x]);
    }

    //draw obstacles
    drawObstacles(&leftObstacleGroup);
    drawObstacles(&rightObstacleGroup);

    updateObstacles(&leftObstacleGroup);
    updateObstacles(&rightObstacleGroup);

    if (checkObstacleCollision(&rightObstacleGroup) || checkObstacleCollision(&leftObstacleGroup)) {
        goLose();
    }

    //update player's last value
    player.lastx = player.x;
    player.lasty = player.y;

    //update obstacle's last value
    for (int i = 0; i < ObstacleArrayTemplateSize; i++) {
        leftObstacleGroup.obstacles[i].lastx = leftObstacleGroup.obstacles[i].x;
        rightObstacleGroup.obstacles[i].lastx = rightObstacleGroup.obstacles[i].x;
        leftObstacleGroup.obstacles[i].lasty = leftObstacleGroup.obstacles[i].y;
        rightObstacleGroup.obstacles[i].lasty = rightObstacleGroup.obstacles[i].y;
    }
}

void initPlaying() {
    // Player player = {10,72,0,0,WHITE};
    // player.x = 10;
    // player.y = 72;
    // player.lastx = 0;
    // player.lasty = 0;
    // player.color = WHITE;

    // Key keys[] = {
    //     {10,50,BLUE,1},
    //     {10,50,BLUE,1},
    //     {10,50,BLUE,1},
    //     {10,50,BLUE,1},
    //     {10,50,BLUE,1}
    // };
    // keys[1].color = RED;
    // keys[2].color = GREEN;
    // keys[3].color = YELLOW;
    // keys[4].color = ORANGE;
}

void goPlaying() {
    fillScreen(BLACK);
    initPlaying();
    state = PLAYING;
}

void resumePlaying() {
    fillScreen(BLACK);
    state = PLAYING;
}

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
    }
}

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

void drawBorder(Border *border) {
    drawVerticalLine(border->x, border->y, borderHeight, border->color);
    drawVerticalLine(border->x + borderWidth - 1, border->y, borderHeight, border->color);
    drawHorizontalLine(border->x, border->y, borderWidth, border->color);
    drawHorizontalLine(border->x, border->y + borderHeight - 1, borderWidth, border->color);
}

void checkBorderCollision(Border *border, Player *player) {
    if (player->x < border->x + borderWidth && player->x + player_size > border->x && player->y < border->y + borderHeight && player->y + player_size > border->y) {
        player->x = player->lastx;
        player->y = player->lasty;
    }
}

int checkKeyCollision(Key *key, Player *player) {
    if (player->x < key->x + keyWidth && player->x + player_size > key->x && player->y < key->y + keyHeight && player->y + player_size > key->y) {
        return 1;
    } else {
        return 0;
    }
}

void drawObstacles(ObstacleGroup *group) {
    for (int i = 0; i < ObstacleArrayTemplateSize; i++) {
        drawSquare(group->obstacles[i].lastx + group->x, group->obstacles[i].lasty + group->y, obstacle_size, BLUE);
        drawSquare(group->obstacles[i].x + group->x, group->obstacles[i].y + group->y, obstacle_size, obstacleColor);
    }
}

void updateObstacles(ObstacleGroup *group) {
    for (int i = 0; i < ObstacleArrayTemplateSize; i++) {
        // if (group->obstacles[i].x <= 0) {
        //     group->obstacles[i].yVelocity = 1;
        //     group->obstacles[i].xVelocity = 0;
        // } else if (group->obstacles[i].x >= 120) {
        //     group->obstacles[i].yVelocity = -1;
        //     group->obstacles[i].xVelocity = 0;
        // } else if (group->obstacles[i].y <= 0) {
        //     group->obstacles[i].xVelocity = -1;
        //     group->obstacles[i].yVelocity = 0;
        // } else if (group->obstacles[i].y >= 80) {
        //     group->obstacles[i].xVelocity = 1;
        //     group->obstacles[i].yVelocity = 0;
        // }

        if (group->obstacles[i].x <= 0 && group->obstacles[i].y <= 0) {
            group->obstacles[i].xVelocity = 1;
            group->obstacles[i].yVelocity = 0;
        } else if (group->obstacles[i].x >= 120 && group->obstacles[i].y <= 0) {
            group->obstacles[i].xVelocity = 0;
            group->obstacles[i].yVelocity = 1;
        } else if (group->obstacles[i].x >= 120 && group->obstacles[i].y >= 80) {
            group->obstacles[i].xVelocity = -1;
            group->obstacles[i].yVelocity = 0;
        } else if (group->obstacles[i].x <= 0 && group->obstacles[i].y >= 80) {
            group->obstacles[i].xVelocity = 0;
            group->obstacles[i].yVelocity = -1;
        }
        

        // group->obstacles[i].xVelocity = -1;
        // group->obstacles[i].yVelocity = -1;

        group->obstacles[i].x += group->obstacles[i].xVelocity;
        group->obstacles[i].y += group->obstacles[i].yVelocity;
    }
}

int checkObstacleCollision(ObstacleGroup *group) {
    return 0;
}