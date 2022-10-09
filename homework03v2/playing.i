# 1 "playing.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "playing.c"
# 1 "win.h" 1
void goWin();
void doWin();
# 2 "playing.c" 2
# 1 "mode3.h" 1
# 15 "mode3.h"
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 46 "mode3.h"
void drawVerticalLine(u8 x, u8 y, u8 length, u16 color);
void drawHorizontalLine(u8 x, u8 y, u8 length, u16 color);
void drawSquare(u8 x, u8 y, u8 size, u16 color);
void waitForVBlank();
void drawRectangle(u8 x, u8 y, u8 width, u8 height, u16 color);
void init3();
void update3();
void draw45line(u8 x, u8 y, u8 size, u16 color);
void drawNeg45line(u8 x, u8 y, u8 size, u16 color);
void fillScreen(u16 color);


extern u16 oldButtons;
extern u16 buttons;
extern int timestep;
extern int time;

enum STATE {START, PLAYING, PAUSE, WIN, LOSE};
# 3 "playing.c" 2
# 1 "text.h" 1



void drawChar(int col, int row, char ch, unsigned short color);
void drawString(int col, int row, char *str, unsigned short color);
# 4 "playing.c" 2
# 1 "start.h" 1
void doStart();
void goStart();
# 5 "playing.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 6 "playing.c" 2
# 1 "pause.h" 1
void goPause();
void doPause();
# 7 "playing.c" 2
# 1 "lose.h" 1
void doLose();
void goLose();
# 8 "playing.c" 2

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
    {115,75,((0) | (31) << 5 | (31) << 10),1},
    {50,90,((31) | (0) << 5 | (31) << 10),1},
    {10,10,((31) | (20) << 5 | (0) << 10),1},
    {160,55,((31) | (31) << 5 | (0) << 10),1},
    {225,50,((0) | (31) << 5 | (0) << 10),1}
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
    {113,73,((31) | (31) << 5 | (0) << 10),1},
    {48,88,((0) | (31) << 5 | (0) << 10),1},
    {8,8,((0) | (31) << 5 | (31) << 10),1},
    {158,53,((31) | (0) << 5 | (31) << 10),1},
    {233,118,((31) | (20) << 5 | (0) << 10),1}
};

typedef struct Player {
    int x;
    int y;
    int lastx;
    int lasty;
    u16 color;
} Player;

int player_size = 5;
Player player = {10,72,10,72,((31) | (31) << 5 | (31) << 10)};



typedef struct Obstacle {
    int x;
    int y;
    int lastx;
    int lasty;
    int xVelocity;
    int yVelocity;
} Obstacle;

int obstacle_size = 2;
u16 obstacleColor = ((31) | (0) << 5 | (0) << 10);
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


    for (int x = 0; x < NUMBORDERS; x++) {
        if (borders[x].color != player.color) {
            checkBorderCollision(&borders[x], &player);
        }
    }

    for (int x = 0; x < NUMKEYS; x++) {
        if (keys[x].active) {
            if (checkKeyCollision(&keys[x], &player)) {
                if (( (!(~oldButtons & (0x0001))) && (~(*(volatile u16*)0x04000130) & (0x0001)) )) {
                    player.color = keys[x].color;
                    keys[x].active = 0;
                    drawRectangle(player.x - 7, player.y - 10, 15, 20, ((0) | (0) << 5 | (0) << 10));
                }
            }
        }
    }


    drawSquare(player.lastx, player.lasty, player_size, ((0) | (0) << 5 | (0) << 10));
    drawSquare(player.x, player.y, player_size, player.color);


    for (int x = 0; x < NUMKEYS; x++) {
        if (keys[x].active) {
            drawKey(&keys[x]);
        }
    }


    for (int x = 0; x < NUMBORDERS; x++) {
        drawBorder(&borders[x]);
    }


    drawObstacles(&leftObstacleGroup);
    drawObstacles(&rightObstacleGroup);

    updateObstacles(&leftObstacleGroup);
    updateObstacles(&rightObstacleGroup);

    if (checkObstacleCollision(&rightObstacleGroup) || checkObstacleCollision(&leftObstacleGroup)) {
        goLose();
    }


    player.lastx = player.x;
    player.lasty = player.y;


    for (int i = 0; i < ObstacleArrayTemplateSize; i++) {
        leftObstacleGroup.obstacles[i].lastx = leftObstacleGroup.obstacles[i].x;
        rightObstacleGroup.obstacles[i].lastx = rightObstacleGroup.obstacles[i].x;
        leftObstacleGroup.obstacles[i].lasty = leftObstacleGroup.obstacles[i].y;
        rightObstacleGroup.obstacles[i].lasty = rightObstacleGroup.obstacles[i].y;
    }
}

void initPlaying() {
# 246 "playing.c"
}

void goPlaying() {
    fillScreen(((0) | (0) << 5 | (0) << 10));
    initPlaying();
    state = PLAYING;
}

void resumePlaying() {
    fillScreen(((0) | (0) << 5 | (0) << 10));
    state = PLAYING;
}

void checkButtons() {
    if ((~(*(volatile u16*)0x04000130) & 0x0040)) {
        player.y--;
        if (player.y < 0) {
            player.y = 0;
        }
    }
    if ((~(*(volatile u16*)0x04000130) & 0x0080)) {
        player.y++;
        if (player.y > 160 - player_size) {
            player.y = 160 - player_size;
        }
    }
    if ((~(*(volatile u16*)0x04000130) & 0x0020)) {
        player.x--;
        if (player.x < 0) {
            player.x = 0;
        }
    }
    if ((~(*(volatile u16*)0x04000130) & 0x0010)) {
        player.x++;
        if (player.x > 240 - player_size) {
            player.x = 240 - player_size;
        }
    }
    if (( (!(~oldButtons & (0x0008))) && (~(*(volatile u16*)0x04000130) & (0x0008)) )) {
        mgba_printf("START pressed. x:%d, y:%d, lastx:%d, lasty:%d", player.x, player.y, player.lastx, player.lasty);
        goPause();
    }
}

void drawKey(Key *key) {
    (((u16*)0x06000000)[(key->x + 1) + (key->y + 0)*240] = key->color);
    (((u16*)0x06000000)[(key->x + 2) + (key->y + 0)*240] = key->color);
    (((u16*)0x06000000)[(key->x + 1) + (key->y + 1)*240] = key->color);
    (((u16*)0x06000000)[(key->x + 1) + (key->y + 2)*240] = key->color);
    (((u16*)0x06000000)[(key->x + 2) + (key->y + 2)*240] = key->color);
    (((u16*)0x06000000)[(key->x + 1) + (key->y + 3)*240] = key->color);
    (((u16*)0x06000000)[(key->x + 1) + (key->y + 4)*240] = key->color);
    (((u16*)0x06000000)[(key->x + 1) + (key->y + 5)*240] = key->color);
    (((u16*)0x06000000)[(key->x + 2) + (key->y + 5)*240] = key->color);
    (((u16*)0x06000000)[(key->x + 0) + (key->y + 6)*240] = key->color);
    (((u16*)0x06000000)[(key->x + 3) + (key->y + 6)*240] = key->color);
    (((u16*)0x06000000)[(key->x + 0) + (key->y + 7)*240] = key->color);
    (((u16*)0x06000000)[(key->x + 3) + (key->y + 7)*240] = key->color);
    (((u16*)0x06000000)[(key->x + 1) + (key->y + 8)*240] = key->color);
    (((u16*)0x06000000)[(key->x + 2) + (key->y + 8)*240] = key->color);
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
        drawSquare(group->obstacles[i].lastx + group->x, group->obstacles[i].lasty + group->y, obstacle_size, ((0) | (0) << 5 | (31) << 10));
        drawSquare(group->obstacles[i].x + group->x, group->obstacles[i].y + group->y, obstacle_size, obstacleColor);
    }
}

void updateObstacles(ObstacleGroup *group) {
    for (int i = 0; i < ObstacleArrayTemplateSize; i++) {
# 353 "playing.c"
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





        group->obstacles[i].x += group->obstacles[i].xVelocity;
        group->obstacles[i].y += group->obstacles[i].yVelocity;
    }
}

int checkObstacleCollision(ObstacleGroup *group) {
    return 0;
}
