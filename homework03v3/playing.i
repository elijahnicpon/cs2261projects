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

    for (int x = 0; x < NUMBORDERS; x++) {
        if (borders[x].active) {
            checkBorderCollision(&borders[x], &player);
        }
    }


    for (int x = 0; x < NUMKEYS; x++) {
        if (keys[x].active) {
            if (checkKeyCollision(&keys[x], &player)) {
                if (( (!(~oldButtons & (0x0001))) && (~(*(volatile u16*)0x04000130) & (0x0001)) ) && pickupCooldown <= 0) {
                    player.color = keys[x].color;
                    keys[x].active = 0;
                    drawRectangle(player.x - 7, player.y - 10, 20, 30, ((0) | (0) << 5 | (0) << 10));
                }
            }
        }
    }


    for (int x = 0; x < NUMBORDERS; x++) {
        drawBorder(&borders[x]);
    }


    drawSquare(player.lastx, player.lasty, player_size, ((0) | (0) << 5 | (0) << 10));
    drawSquare(player.x, player.y, player_size, player.color);


    for (int x = 0; x < NUMKEYS; x++) {
        if (keys[x].active) {
            drawKey(&keys[x]);
        }
    }


    for (int i = 0; i < NUMOBSTACLES; i++) {

        if (obstacles[i].x == 0 || obstacles[i].x == 238) {
            obstacles[i].xVel *= -1;
        }
        if (obstacles[i].y == -1 || obstacles[i].y == 159) {
            obstacles[i].yVel *= -1;
        }

        obstacles[i].x += obstacles[i].xVel;
        obstacles[i].y += obstacles[i].yVel;

        drawSquare(obstacles[i].lastx,obstacles[i].lasty,2,((0) | (0) << 5 | (0) << 10));
        drawSquare(obstacles[i].x,obstacles[i].y,2,((31) | (0) << 5 | (0) << 10));


        if (checkObstacleCollision(&obstacles[i], &player)) {
            goLose();
        }

    }


    player.lastx = player.x;
    player.lasty = player.y;

    for (int i = 0; i < NUMOBSTACLES; i++) {
        obstacles[i].lastx = obstacles[i].x;
        obstacles[i].lasty = obstacles[i].y;
    }
}


void initPlaying() {
    player.x = 10;
    player.y = 72;
    player.lastx = 0;
    player.lasty = 0;
    player.color = ((31) | (31) << 5 | (31) << 10);

    keys[0].color = ((0) | (31) << 5 | (31) << 10);
    keys[1].color = ((31) | (0) << 5 | (31) << 10);
    keys[2].color = ((31) | (20) << 5 | (0) << 10);
    keys[3].color = ((31) | (31) << 5 | (0) << 10);
    keys[4].color = ((0) | (31) << 5 | (0) << 10);

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

    borders[0].color = ((31) | (0) << 5 | (31) << 10);
    borders[1].color = ((31) | (20) << 5 | (0) << 10);
    borders[2].color = ((31) | (31) << 5 | (0) << 10);
    borders[3].color = ((0) | (31) << 5 | (0) << 10);
    borders [4].color = ((0) | (31) << 5 | (31) << 10);

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

void goPlaying() {
    fillScreen(((0) | (0) << 5 | (0) << 10));
    initPlaying();
    state = PLAYING;
}

void resumePlaying() {
    fillScreen(((0) | (0) << 5 | (0) << 10));
    state = PLAYING;
    pause = 0;
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
        pause = 1;
    }
    if (player.color != ((31) | (31) << 5 | (31) << 10)) {
        if (( (!(~oldButtons & (0x0001))) && (~(*(volatile u16*)0x04000130) & (0x0001)) ) && pickupCooldown <= 0) {
            for (int i = 0; i < NUMKEYS; i++) {
                if (keys[i].color == player.color) {
                    pickupCooldown = 5;
                    keys[i].active = 1;
                    player.color = ((31) | (31) << 5 | (31) << 10);
                    keys[i].x = player.x;
                    keys[i].y = player.y;

                    mgba_printf("%d", keys[i].active);
                }
            }
        }
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
        if ((~(*(volatile u16*)0x04000130) & 0x0002)) {
            if (player->color == border->color) {
                border->active = 0;
                border->color = ((0) | (0) << 5 | (0) << 10);
            }
        }
    }
}

int checkKeyCollision(Key *key, Player *player) {
    if (player->x < key->x + keyWidth && player->x + player_size > key->x && player->y < key->y + keyHeight && player->y + player_size > key->y) {
        return 1;
    } else {
        return 0;
    }
}

int checkObstacleCollision(Obstacle *obstacle, Player *player) {
    if (player->x < obstacle->x + 2 && player->x + player_size > obstacle->x && player->y < obstacle->y + 2 && player->y + player_size > obstacle->y) {
        return 1;
    } else {
        return 0;
    }
}

void always() {
    drawSquare(210,77,6,((31) | (31) << 5 | (31) << 10));
    drawVerticalLine(216,75,10,((31) | (31) << 5 | (31) << 10));
    drawVerticalLine(217,76,8,((31) | (31) << 5 | (31) << 10));
    drawVerticalLine(218,77,6,((31) | (31) << 5 | (31) << 10));
    drawVerticalLine(219,78,4,((31) | (31) << 5 | (31) << 10));
    drawVerticalLine(220,79,2,((31) | (31) << 5 | (31) << 10));
}
