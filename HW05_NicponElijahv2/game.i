# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
void goGame();
void doGame();
void resumeGame();
# 2 "game.c" 2
# 1 "states.h" 1
enum STATE {START, GAME, PAUSE, WIN, LOSE};
# 1 "start.h" 1
void goStart();
void doStart();
# 3 "states.h" 2
# 1 "game.h" 1
void goGame();
void doGame();
void resumeGame();
# 4 "states.h" 2
# 1 "pause.h" 1
void doPause();
void goPause();
# 5 "states.h" 2



int state;
# 3 "game.c" 2
# 1 "gba.h" 1





typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;





int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 41 "gba.h"
extern volatile unsigned short *videoBuffer;
# 66 "gba.h"
void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);
void waitForVBlank();





void flipPage();
void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 118 "gba.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;
# 147 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 158 "gba.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 198 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 255 "gba.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 311 "gba.h"
typedef void (*ihp)(void);
# 4 "game.c" 2
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
# 5 "game.c" 2

void updateLasts();
void updatePlayer();
void updateEnemies();
void checkButtons();
void updateLasts();
void initOrDeathPositionResets();
void die();
void doScore();
void DMADraw();
void shootPump();
int checkForWinTILES();
int checkForWinENEMIES();


int NUMPOOKAHS = 2;

u16 gameTileMap[1024] = {
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0,
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0,
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 0, 0,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 0, 0,
    6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 0, 0,
    6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 0, 0,
    6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 0, 0,
    6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 0, 0,
    6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0,
    6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0,
    6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0,
    6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 0, 0,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 0, 0,
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0
};

OBJ_ATTR shadowOAM[128];

int xtraLives;
int timeStep, paused, score;

typedef struct {
    int x;
    int y;
    int oam_entry;
    int fallStep;
    int fallDelay;
} Rock;

typedef struct {
    int x;
    int y;
    int timer;
    int oam_entry;
    int spriteSheetIndex;
    int height;
    int width;
} Pump;

Pump pump = {0,0,0,67,0,0,0};

Rock rocks[3] = {
    {0,32,10,0,32},
    {176,48,11,0,32},
    {80,64,12,0,32}
};

int NUMROCKS = 3;

typedef struct {
    int x;
    int y;
    int prev_x;
    int prev_y;
    int orientation;
    int frame;
    int frameStep;
} Player;

Player player;

const int playerFramesUP = {0, 2};
const int playerFramesDOWN = {4, 6};
const int playerFramesLEFT = {8, 10};
const int playerFramesRIGHT = {12, 14};

typedef struct {
    int x;
    int y;
    int dx;
    int dy;
    int frameStep;
    int oam_entry;
    int damage;
    int frame;
    int orientation;
    int active;
} Pookah;


Pookah pookahs[2] = {

    {192, 48, 0, 1, 0, 69, 0, 0, 0, 1},
    {176, 128,-1, 0, 0, 71, 0, 0, 0, 1}
};

typedef struct {
    int x;
    int y;
    int timer;
    int oam_entry;
    int spriteSheetIndex;
    int height;
    int width;
} Fire;

typedef struct {
    int x;
    int y;
    int dx;
    int dy;
    int frameStep;
    int oam_entry;
    int damage;
    int frame;
    int orientation;
    int active;
    int attackStep;
    Fire fire;
} Fygar;

Fygar fygars[2] = {
    {32,104,1,0,0,51,0,0,0,1,0,{0,0,0,47,0,0,0}},
    {48,64,0,1,0,52,0,0,0,1,60,{0,0,0,49,0,0,0}}
};
int NUMFYGARS = 2;


void shootPump() {
    pump.timer = 13;
    if (player.orientation == 0) {
        pump.spriteSheetIndex = ((2) * (32) + (4));
        pump.x = player.x + 16;
        pump.y = player.y + 8;
        pump.width = 32;
        pump.height = 8;
    } else if (player.orientation == 1) {
        pump.x = player.x + 4;
        pump.y = player.y - 32;
        pump.spriteSheetIndex = ((2) * (32) + (0));
        pump.width = 8;
        pump.height = 32;
    } else if (player.orientation == 2) {
        pump.x = player.x - 32;
        pump.y = player.y + 8;
        pump.spriteSheetIndex = ((2) * (32) + (12));
        pump.width = 32;
        pump.height = 8;
    } else if (player.orientation == 3) {
        pump.x = player.x + 8;
        pump.y = player.y + 16;
        pump.spriteSheetIndex = ((2) * (32) + (8));
        pump.width = 8;
        pump.height = 32;
    }

    for (int i = 0; i < NUMPOOKAHS; i++) {
        if (collision(pookahs[i].x, pookahs[i].y, 16, 16, pump.x, pump.y, pump.width,pump.height)) {
            if (pookahs[i].damage >= 4) {
                if (pookahs[i].active) {
                    score += 100;
                }
                pookahs[i].active = 0;
            } else {
                pookahs[i].damage += 1;
                pookahs[i].frameStep = 0;
            }
        }
    }
    for (int i = 0; i < NUMFYGARS; i++) {
        if (collision(fygars[i].x, fygars[i].y, 16, 16, pump.x, pump.y, pump.width,pump.height)) {
            if (fygars[i].damage >= 4) {
                if (fygars[i].active) {
                    score += 200;
                }
                fygars[i].active = 0;
            } else {
                fygars[i].damage += 1;
                fygars[i].frameStep = 0;
            }
        }
    }
}


void doGame() {
    timeStep++;
    updateLasts();
    checkButtons();
    doRocks();
    updateEnemies();
    updatePlayer();
    waitForVBlank();
    doScore();
    if (!paused) {
        DMADraw();
    }
    if (checkForWinTILES() || checkForWinENEMIES()) {
        goWin();
    }
}

void updateEnemies() {
    for (int i = 0; i < NUMPOOKAHS; i++) {
        pookahs[i].frameStep++;
        if (pookahs[i].frameStep % 60 == 0) {
            pookahs[i].damage--;
            if (pookahs[i].damage < 0) {
                pookahs[i].damage = 0;
            }
        }
        if (pookahs[i].active && pookahs[i].damage == 0) {
            if (pookahs[i].frameStep % 11 == 0) {
                pookahs[i].frame = (pookahs[i].frame + 1) % 2;
            }


            if (pookahs[i].x < 0 || pookahs[i].x > 224 ||
                    gameTileMap[(((pookahs[i].y)/8) * (32) + (((pookahs[i].x)/8)))] == 6 ||
                    gameTileMap[((((pookahs[i].y)/8)+1) * (32) + (((pookahs[i].x)/8)))] == 6 ||
                    gameTileMap[(((pookahs[i].y)/8) * (32) + (((pookahs[i].x)/8) + 2))] == 6 ||
                    gameTileMap[((((pookahs[i].y)/8)+1) * (32) + (((pookahs[i].x)/8) + 2))] == 6) {





                if (gameTileMap[((((pookahs[i].y)/8) - 1) * (32) + (((pookahs[i].x - pookahs[i].dx)/8) + 0))] == 0 &&
                gameTileMap[((((pookahs[i].y)/8) - 1) * (32) + (((pookahs[i].x - pookahs[i].dx)/8) + 1))] == 0 &&
                gameTileMap[((((pookahs[i].y)/8) - 1) * (32) + (((pookahs[i].x - pookahs[i].dx)/8) + 2))] == 0) {
                    pookahs[i].dy = 1;
                    pookahs[i].x -= pookahs[i].dx;
                    pookahs[i].dx = 0;
                } else {
                    pookahs[i].dx *= -1;
                }
# 263 "game.c"
            }

            if (pookahs[i].y < 8 || pookahs[i].y > 136 ||
                    gameTileMap[(((pookahs[i].y)/8) * (32) + (((pookahs[i].x)/8)))] == 6 ||
                    gameTileMap[((((pookahs[i].y)/8)) * (32) + (((pookahs[i].x)/8) + 1))] == 6 ||
                    gameTileMap[((((pookahs[i].y)/8)+2) * (32) + (((pookahs[i].x)/8)))] == 6 ||
                    gameTileMap[((((pookahs[i].y)/8)+2) * (32) + (((pookahs[i].x)/8) + 1))] == 6) {





                if (gameTileMap[(((pookahs[i].y)/8) * (32) + (((pookahs[i].x)/8)-1))] == 0 &&
                gameTileMap[((((pookahs[i].y)/8)+1) * (32) + (((pookahs[i].x)/8)-1))] == 0 &&
                gameTileMap[((((pookahs[i].y)/8)+2) * (32) + (((pookahs[i].x)/8)-1))] == 0) {
                    pookahs[i].dx = 1;
                    pookahs[i].y -= pookahs[i].dy;
                    pookahs[i].dy = 0;
                } else {
                    pookahs[i].dy *= -1;

                }

            }

            for (int j = 0; j < NUMROCKS; j++) {
                if (collision(pookahs[i].x, pookahs[i].y, 16,16,rocks[j].x, rocks[j].y, 16,16)) {
                    pookahs[i].dx *= -1;
                    pookahs[i].dy *= -1;
                }
            }

            if (pookahs[i].dy == 0) {
                if (pookahs[i].dx > 0) {
                    pookahs[i].orientation = 0;
                } else {
                    pookahs[i].orientation = 1;
                }
            } else {
                if (pookahs[i].dy > 0) {
                    pookahs[i].orientation = 3;
                } else {
                    pookahs[i].orientation = 2;
                }
            }

            pookahs[i].x += pookahs[i].dx;
            pookahs[i].y += pookahs[i].dy;



            if (collision(pookahs[i].x, pookahs[i].y, 16,16,player.x,player.y,16,16)) {
                die();
            }
        }
# 336 "game.c"
    }

    for (int i = 0 ; i < NUMFYGARS; i++) {
        fygars[i].frameStep++;
        fygars[i].attackStep++;
        fygars[i].fire.timer--;
        if (fygars[i].frameStep % 60 == 0) {
            fygars[i].damage--;
            if (fygars[i].damage < 0) {
                fygars[i].damage = 0;
            }
        }

        if (fygars[i].attackStep % 237 == 0 && fygars[i].damage == 0 && fygars[i].active) {

            fygars[i].fire.timer = 15;

            if (fygars[i].dx == 1) {
                fygars[i].fire.spriteSheetIndex = ((0) * (32) + (16));
                fygars[i].fire.x = fygars[i].x + 16;
                fygars[i].fire.y = fygars[i].y;
                fygars[i].fire.height = 16;
                fygars[i].fire.width = 48;

            } else if (fygars[i].dx == -1) {
                fygars[i].fire.spriteSheetIndex = ((0) * (32) + (24));
                fygars[i].fire.x = fygars[i].x - 52;
                fygars[i].fire.y = fygars[i].y;
                fygars[i].fire.height = 16;
                fygars[i].fire.width = 48;
            } else if (fygars[i].dy == 1) {
                fygars[i].fire.spriteSheetIndex = ((8) * (32) + (24));
                fygars[i].fire.x = fygars[i].x;
                fygars[i].fire.y = fygars[i].y + 16;
                fygars[i].fire.height = 48;
                fygars[i].fire.width = 16;
            } else if (fygars[i].dy == -1) {
                fygars[i].fire.spriteSheetIndex = ((8) * (32) + (16));
                fygars[i].fire.x = fygars[i].x;
                fygars[i].fire.y = fygars[i].y - 52;
                fygars[i].fire.height = 48;
                fygars[i].fire.width = 16;
            }

            if (collision(fygars[i].fire.x, fygars[i].fire.y,fygars[i].fire.width,fygars[i].fire.height, player.x, player.y, 16,16)) {
                die();
            }
        }

        if (fygars[i].active && fygars[i].damage == 0 && fygars[i].fire.timer < 0) {
            if (fygars[i].frameStep % 11 == 0) {
                fygars[i].frame = (fygars[i].frame + 1) % 2;
            }

            if (fygars[i].x < 0 || fygars[i].x > 224 ||
                    gameTileMap[(((fygars[i].y)/8) * (32) + (((fygars[i].x)/8)))] == 6 ||
                    gameTileMap[((((fygars[i].y)/8)+1) * (32) + (((fygars[i].x)/8)))] == 6 ||
                    gameTileMap[(((fygars[i].y)/8) * (32) + (((fygars[i].x)/8) + 2))] == 6 ||
                    gameTileMap[((((fygars[i].y)/8)+1) * (32) + (((fygars[i].x)/8) + 2))] == 6) {
                fygars[i].dx *= -1;
            }

            if (fygars[i].y < 8 || fygars[i].y > 136 ||
                    gameTileMap[(((fygars[i].y)/8) * (32) + (((fygars[i].x)/8)))] == 6 ||
                    gameTileMap[((((fygars[i].y)/8)) * (32) + (((fygars[i].x)/8) + 1))] == 6 ||
                    gameTileMap[((((fygars[i].y)/8)+2) * (32) + (((fygars[i].x)/8)))] == 6 ||
                    gameTileMap[((((fygars[i].y)/8)+2) * (32) + (((fygars[i].x)/8) + 1))] == 6) {
                fygars[i].dy *= -1;
            }



            for (int j = 0; j < NUMROCKS; j++) {
                if (collision(rocks[i].x, rocks[i].y, 16,16,fygars[j].x, fygars[j].y, 16,16)) {
                    fygars[i].dx *= -1;
                    fygars[i].dy *= -1;
                }
            }

            if (fygars[i].dy == 0) {
                if (fygars[i].dx > 0) {
                    fygars[i].orientation = 0;
                } else {
                    fygars[i].orientation = 1;
                }
            } else {
                if (fygars[i].dy > 0) {
                    fygars[i].orientation = 3;
                } else {
                    fygars[i].orientation = 2;
                }
            }

            fygars[i].x += fygars[i].dx;
            fygars[i].y += fygars[i].dy;



            if (collision(fygars[i].x, fygars[i].y, 16,16,player.x,player.y,16,16)) {
                die();
            }
        }
    }

}

void doScore() {
    shadowOAM[90].attr0 = (0 << 13) | (0 << 14) | (152 & 0xFF);
    shadowOAM[90].attr1 = (0 << 14) | (232 & 0x1FF);
    shadowOAM[90].attr2 = ((21) * (32) + (score % 10));

    shadowOAM[91].attr0 = (0 << 13) | (0 << 14) | (152 & 0xFF);
    shadowOAM[91].attr1 = (0 << 14) | (224 & 0x1FF);
    shadowOAM[91].attr2 = ((21) * (32) + ((score / 10) % 10));

    shadowOAM[92].attr0 = (0 << 13) | (0 << 14) | (152 & 0xFF);
    shadowOAM[92].attr1 = (0 << 14) | (216 & 0x1FF);
    shadowOAM[92].attr2 = ((21) * (32) + ((score / 100) % 10));

    shadowOAM[93].attr0 = (0 << 13) | (0 << 14) | (152 & 0xFF);
    shadowOAM[93].attr1 = (0 << 14) | (208 & 0x1FF);
    shadowOAM[93].attr2 = ((21) * (32) + (score / 1000));
}

int checkForWinTILES() {


    for (int i = 3; i < 19; i++) {
        for (int j = 0; j < 30; j++) {
            if (gameTileMap[((i) * (32) + (j))]) {
                return 0;
            }
        }
    }

    return 1;
}

int checkForWinENEMIES() {
    for (int i = 0; i < NUMPOOKAHS; i++) {
        if (pookahs[i].active) {
            return 0;
        }
    }

    for (int i = 0; i < NUMFYGARS; i++) {
        if (fygars[i].active) {
            return 0;
        }
    }
    return 1;
}

void die() {
    if (xtraLives <= 0) {
        paused = 1;
        goLose();
    } else {
        xtraLives--;
        switch (xtraLives) {
            case 0:
                shadowOAM[120].attr0 = (2 << 8);
                break;
            case 1:
                shadowOAM[121].attr0 = (2 << 8);
                break;
            default:
                break;
        }
        initOrDeathPositionResets();
    }
}

void doRocks() {
    for (int i = 0; i < NUMROCKS; i++) {

        if (gameTileMap[(((rocks[i].y/8) + 2) * (32) + (rocks[i].x/8))] == 0 && gameTileMap[(((rocks[i].y/8) + 2) * (32) + ((rocks[i].x/8) + 1))] == 0) {
            rocks[i].fallStep++;
            rocks[i].fallDelay--;
            if (rocks[i].fallStep % 6 == 0 && rocks[i].fallDelay < 0) {
                rocks[i].y += 8;

                if (collision(player.x, player.y, 16, 16, rocks[i].x, rocks[i].y, 16, 16)) {
                    die();
                }
                for (int j = 0; j < NUMPOOKAHS; j++) {
                    if (collision(rocks[i].x, rocks[i].y, 16, 16, pookahs[j].x,pookahs[j].y,16,16)) {
                        pookahs[j].active = 0;
                        score += 100;
                    }
                }
                for (int j = 0; j < NUMFYGARS; j++) {
                    if (collision(rocks[i].x, rocks[i].y, 16, 16, fygars[j].x, fygars[j].y, 16, 16)) {
                        fygars[j].active = 0;
                        score += 200;
                    }
                }
            }
        } else {
            rocks[i].fallDelay = 32;
        }

    }
}

void DMADraw() {

    shadowOAM[0].attr0 = (0 << 13) | (player.y & 0xFF);
    shadowOAM[0].attr1 = (1 << 14) | (player.x & 0x1FF) | (1<<14);
    shadowOAM[0].attr2 = (player.orientation * 4) + (player.frame * 2);

    if (gameTileMap[((((player.y + 4) / 8)) * (32) + (((player.x + 4 )/ 8)))] == 6) {
        gameTileMap[((((player.y + 4) / 8)) * (32) + (((player.x + 4 ) / 8)))] = 0;
        score++;
    }
    if (gameTileMap[((((player.y + 4) / 8)) * (32) + (((player.x + 4 ) / 8) + 1))] == 6) {
        gameTileMap[((((player.y + 4) / 8)) * (32) + (((player.x + 4 ) / 8) + 1))] = 0;
        score++;
    }
    if (gameTileMap[((((player.y + 4) / 8) + 1) * (32) + (((player.x + 4 ) / 8)))] == 6) {
        gameTileMap[((((player.y + 4) / 8) + 1) * (32) + (((player.x + 4 ) / 8)))] = 0;
        score++;
    }
    if (gameTileMap[((((player.y + 4) / 8) + 1) * (32) + (((player.x + 4 ) / 8) + 1))] == 6) {
        gameTileMap[((((player.y + 4) / 8) + 1) * (32) + (((player.x + 4 ) / 8) + 1))] = 0;
        score++;
    }

    for (int i = 0; i < NUMPOOKAHS; i++) {

        if (pookahs[i].active) {
            if (pookahs[i].damage == 0) {
                if (pookahs[i].dx) {
                    shadowOAM[pookahs[i].oam_entry].attr0 = (0 << 13) | (pookahs[i].y & 0xFF);
                    shadowOAM[pookahs[i].oam_entry].attr1 = (1 << 14) | (pookahs[i].x & 0x1FF) | (1<<14) | ((pookahs[i].orientation == 0) ? 0 : (1 << 12));
                    if (pookahs[i].damage == 0) {
                        shadowOAM[pookahs[i].oam_entry].attr2 = ((6) * (32) + (pookahs[i].frame * 2));
                    }
                } else {
                    shadowOAM[pookahs[i].oam_entry].attr0 = (0 << 13) | (pookahs[i].y & 0xFF);
                    shadowOAM[pookahs[i].oam_entry].attr1 = (1 << 14) | (pookahs[i].x & 0x1FF) | (1<<14) | ((pookahs[i].orientation == 3) ? 0 : (1 << 13));
                    if (pookahs[i].damage == 0) {
                        shadowOAM[pookahs[i].oam_entry].attr2 = ((8) * (32) + (pookahs[i].frame * 2));
                    }
                }
            } else {
                shadowOAM[pookahs[i].oam_entry].attr0 = (0 << 13) | (pookahs[i].y - 4 & 0xFF);
                shadowOAM[pookahs[i].oam_entry].attr1 = (2 << 14) | (pookahs[i].x - 4 & 0x1FF) | ((pookahs[i].orientation == 0) ? 0 : (1 << 12));
                shadowOAM[pookahs[i].oam_entry].attr2 = ((10) * (32) + ((pookahs[i].damage - 1)*4));
            }
        } else {
            shadowOAM[pookahs[i].oam_entry].attr0 = (2 << 8);
        }
    }

    for (int i = 0; i < NUMFYGARS; i++) {
        mgba_printf("fygar num %d: x=%d, y=%d, dx=%d, dy=%d, active=%d, orientation=%d", i, fygars[i].x, fygars[i].y, fygars[i].dx, fygars[i].dy, fygars[i].active);
        if (fygars[i].active) {
            if (fygars[i].damage == 0) {
                if (fygars[i].dx) {
                    shadowOAM[fygars[i].oam_entry].attr0 = (0 << 13) | (fygars[i].y & 0xFF);
                    shadowOAM[fygars[i].oam_entry].attr1 = (1 << 14) | (fygars[i].x & 0x1FF) | (1<<14) | ((fygars[i].orientation == 0) ? 0 : (1 << 12));
                    if (fygars[i].damage == 0) {
                        shadowOAM[fygars[i].oam_entry].attr2 = ((6) * (32) + ((fygars[i].frame * 2) + 4));
                    }
                } else {
                    shadowOAM[fygars[i].oam_entry].attr0 = (0 << 13) | (fygars[i].y & 0xFF);
                    shadowOAM[fygars[i].oam_entry].attr1 = (1 << 14) | (fygars[i].x & 0x1FF) | (1<<14) | ((fygars[i].orientation == 3) ? 0 : (1 << 13));
                    if (fygars[i].damage == 0) {
                        shadowOAM[fygars[i].oam_entry].attr2 = ((8) * (32) + ((fygars[i].frame * 2) + 4));
                    }
                }
            } else {
                shadowOAM[fygars[i].oam_entry].attr0 = (0 << 13) | (fygars[i].y - 4 & 0xFF);
                shadowOAM[fygars[i].oam_entry].attr1 = (2 << 14) | (fygars[i].x - 4 & 0x1FF) | ((fygars[i].orientation == 0) ? 0 : (1 << 12));
                shadowOAM[fygars[i].oam_entry].attr2 = ((14) * (32) + ((fygars[i].damage - 1)*4));
            }
        } else {
            shadowOAM[fygars[i].oam_entry].attr0 = (2 << 8);
        }
    }

    for (int i = 0; i < NUMROCKS; i++) {
        shadowOAM[rocks[i].oam_entry].attr0 = (0 << 13) | (rocks[i].y & 0xFF);
        shadowOAM[rocks[i].oam_entry].attr1 = (1 << 14) | (rocks[i].x & 0x1FF);
        shadowOAM[rocks[i].oam_entry].attr2 = ((6) * (32) + (8));
    }

    for (int i = 0; i < NUMFYGARS; i++) {
        if (fygars[i].fire.timer > 0) {
            shadowOAM[fygars[i].fire.oam_entry].attr0 = (0 << 13) | (fygars[i].fire.y & 0xFF);
            shadowOAM[fygars[i].fire.oam_entry].attr1 = (3 << 14) | (fygars[i].fire.x & 0x1FF);
            shadowOAM[fygars[i].fire.oam_entry].attr2 = fygars[i].fire.spriteSheetIndex;
        } else {
            shadowOAM[fygars[i].fire.oam_entry].attr0 = (2 << 8);
        }
    }

    pump.timer--;
    if (pump.timer > 0) {
        shadowOAM[pump.oam_entry].attr0 = (0 << 13) | (pump.y & 0xFF);
        shadowOAM[pump.oam_entry].attr1 = (2 << 14) | (pump.x & 0x1FF);
        shadowOAM[pump.oam_entry].attr2 = pump.spriteSheetIndex;
    } else {
        shadowOAM[pump.oam_entry].attr0 = (2 << 8);
    }

    DMANow(3, &gameTileMap, &((screenblock *)0x6000000)[31], 1024);
    DMANow(3, shadowOAM, (void*) 0x07000000, 512);
}

void updateLasts() {
    player.prev_x = player.x;
    player.prev_y = player.y;
}

void updatePlayer() {
    checkRockOrWallCollision();

    if (checkDeath()) {

    }
}

int checkDeath() {




    return 0;
}

void checkRockOrWallCollision() {

    for (int i = 0; i < NUMROCKS; i++) {
        if (collision(player.x, player.y, 16,16,rocks[i].x, rocks[i].y, 16,16)) {
            player.x = player.prev_x;
            player.y = player.prev_y;
        }
    }

    if (player.x < 0 || player.x > 224) {
        player.x = player.prev_x;
    }
    if (player.y < 8 || player.y > 136) {
        player.y = player.prev_y;
    }

}

void checkButtons() {
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        paused = 1;
        goPause();
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6))) || (~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
            player.y--;
            player.orientation = 1;
            player.frameStep++;
            if (player.frameStep % 6 == 0) {
                player.frame = (player.frame + 1) % 2;
            }
        } else {
            player.y++;
            player.orientation = 3;
            player.frameStep++;
            if (player.frameStep % 6 == 0) {
                player.frame = (player.frame + 1) % 2;
            }
        }
    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))) || (~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
            player.x--;
            player.orientation = 2;
            player.frameStep++;
            if (player.frameStep % 6 == 0) {
                player.frame = (player.frame + 1) % 2;
            }
        } else {
            player.x++;
            player.orientation = 0;
            player.frameStep++;
            if (player.frameStep % 6 == 0) {
                player.frame = (player.frame + 1) % 2;
            }
        }
    }
    if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
        shootPump();
    }

}

void initOrDeathPositionResets() {
    player.x = 112;
    player.y = 80;
}

void reset() {
# 786 "game.c"
}

void goGame() {
    hideSprites();
    state = GAME;
    timeStep = 0;
    paused = 0;
    xtraLives = 2;

    reset();
    score = 0;

    initOrDeathPositionResets();


    shadowOAM[0].attr0 = (0 << 13) | (player.y & 0xFF);
    shadowOAM[0].attr1 = (1 << 14) | (player.x & 0x1FF) | (1<<14);
    shadowOAM[0].attr2 = ((0) * (32) + (0));

    shadowOAM[120].attr0 = (0 << 13) | (152 & 0xFF);
    shadowOAM[120].attr1 = (0 << 14) | (1<<14);
    shadowOAM[120].attr2 = ((26) * (32) + (0));

    shadowOAM[121].attr0 = (0 << 13) | (152 & 0xFF);
    shadowOAM[121].attr1 = (0 << 14) | (9 & 0x1FF) | (1<<14);
    shadowOAM[121].attr2 = ((26) * (32) + (0));


    waitForVBlank();


    DMANow(3, &gameTileMap, &((screenblock *)0x6000000)[31], 1024);

    DMANow(3, shadowOAM, (void*) 0x07000000, 512);
}

void resumeGame() {
    switch (xtraLives) {
            case 2:
                shadowOAM[121].attr0 = (0 << 13) | (152 & 0xFF);
                shadowOAM[121].attr1 = (0 << 14) | (9 & 0x1FF) | (1<<14);
                shadowOAM[121].attr2 = ((26) * (32) + (0));
            case 1:
                shadowOAM[120].attr0 = (0 << 13) | (152 & 0xFF);
                shadowOAM[120].attr1 = (0 << 14) | (1<<14);
                shadowOAM[120].attr2 = ((26) * (32) + (0));
                break;
            default:
                break;
    }
    paused = 0;
    state = GAME;
    shadowOAM[100].attr0 = (2 << 8);
    DMANow(3, &gameTileMap, &((screenblock *)0x6000000)[31], 1024);
}
