# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
void goGame();
void doGame();
# 2 "game.c" 2
# 1 "states.h" 1
# 1 "start_menu.h" 1
void goStartMenu();
void doStartMenu();
# 2 "states.h" 2
# 1 "info_menu.h" 1
void goInfoMenu();
void doInfoMenu();
# 3 "states.h" 2
# 1 "game.h" 1
void goGame();
void doGame();
# 4 "states.h" 2

enum STATE {START_MENU, INFO_MENU, CONTROLS_MENU, ABOUT_MENU, GAME, UPGRADE_MENU, END_ANIMATION, END_MENU, DEATH_ENERGY, DEATH_BAG, DEATH_STRAW, DEATH_6PACK, DEATH_OIL, DAETH_BOAT, DEATH_SHARK, DEATH_CYANIDE, DEATH_BLAST};
int state;
int shells;
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

# 1 "game_ss.h" 1
# 21 "game_ss.h"
extern const unsigned short game_ssTiles[16384];


extern const unsigned short game_ssPal[256];
# 6 "game.c" 2
# 1 "game_bg.h" 1
# 22 "game_bg.h"
extern const unsigned short game_bgTiles[176];


extern const unsigned short game_bgMap[1024];


extern const unsigned short game_bgPal[256];
# 7 "game.c" 2
# 1 "game_clouds_bg.h" 1
# 22 "game_clouds_bg.h"
extern const unsigned short game_clouds_bgTiles[1776];


extern const unsigned short game_clouds_bgMap[1024];


extern const unsigned short game_clouds_bgPal[240];
# 8 "game.c" 2

int state, vOff, cloudVOff, gameSpeed, time;
OBJ_ATTR shadowOAM[128];

void updateBackgrounds();
void initPlayer();
void checkButtons();
void updateAndDrawPlayer();

typedef struct {
    int x;
    int prevX;
    int y;
    int frame;
    int numFrames;
    int height;
    int width;
    int entry_OAM;
    int shieldsLeft;
    int agility;
    int energy;

    int shieldUpgradeValue;
    int agilityUpgradeValue;
    int energyUpgradeValue;
} Player;

typedef struct {
    int x;
    int value;
    int y;
    int dy;
    int height;
    int width;
    int entry_OAM;
    int active;
} Shell;

Player player;
int playerFrames[8] = {0, 2, 4, 6, 8, 6, 4, 2};

void doGame() {
    time++;
    waitForVBlank();
    checkButtons();
    updateBackgrounds();
    updateAndDrawPlayer();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}

void updateAndDrawPlayer() {

    if (time % (10 - gameSpeed) == 0) {
        player.frame = (player.frame + 1) % player.numFrames;
    }


    shadowOAM[player.entry_OAM].attr0 = (player.y & 0xFF) | (2 << 14) | (0 << 13);
    shadowOAM[player.entry_OAM].attr1 = (0 << 14) | (player.x / 8 & 0x1FF);
    shadowOAM[player.entry_OAM].attr2 = playerFrames[player.frame];


}

void checkButtons() {
    if ((!(~(oldButtons) & ((1<<2))) && (~buttons & ((1<<2))))) {

    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if ((player.x + (player.agility) / 8) >= 0) {
            player.x -= player.agility;
            player.energy--;
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if ((player.x + (player.agility) / 8) <= (241 - player.width) * 8) {
            player.x += player.agility;
            player.energy--;
        }
    }
}

void updateBackgrounds() {
    cloudVOff -= 1;
    (*(volatile unsigned short *)0x04000012) = cloudVOff / 8;

    vOff -= 2;
    (*(volatile unsigned short *)0x04000016) = vOff / 8;
    (*(volatile unsigned short *)0x04000014) = 0;
}

void goGame() {

    hideSprites();

    state = GAME;

    (*(volatile unsigned short *)0x4000000) = (1<<8) | (1<<9) | (1<<12) | 0;

    (*(volatile unsigned short*)0x400000A) = (0<<14) | ((0)<<2) | ((31)<<8);

    DMANow(3, game_bgPal, ((unsigned short *)0x5000000), 512/2);
    DMANow(3, game_bgTiles, &((charblock *)0x6000000)[0], 352/2);
    DMANow(3, game_bgMap, &((screenblock *)0x6000000)[31], 2048/2);

    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((1)<<2) | ((30)<<8);

    DMANow(3, game_clouds_bgPal, ((unsigned short *)0x5000000) + 32, 480/2);
    DMANow(3, game_clouds_bgTiles, &((charblock *)0x6000000)[1], 3552/2);
    DMANow(3, game_clouds_bgMap, &((screenblock *)0x6000000)[30], 2048/2);

    DMANow(3, game_ssPal, ((unsigned short *)0x5000200), 512/2);
    DMANow(3, game_ssTiles, &((charblock *)0x6000000)[4], 32768/2);


    shadowOAM[0].attr0 = (0 << 13) | (1 << 14) | (2 & 0xFF);
    shadowOAM[0].attr1 = (2 << 14) | (2 & 0x1FF);
    shadowOAM[0].attr2 = ((6) * (32) + (0));
    shadowOAM[1].attr0 = (0 << 13) | (1 << 14) | (2 & 0xFF);
    shadowOAM[1].attr1 = (2 << 14) | (34 & 0x1FF);
    shadowOAM[1].attr2 = ((6) * (32) + (4));

    initPlayer();

    vOff = 0;
    int cloudVOff = 0;
    int gameSpeed = 2;
    int time = 0;

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

}

void initPlayer() {
    player.x = 120 * 8;
    player.prevX = 120 * 8;
    player.y = 138;
    player.frame = 0;
    player.height = 16;
    player.width = 9;
    player.numFrames = 8;
    player.entry_OAM = 3;

    player.energyUpgradeValue = 0;
    player.shieldUpgradeValue = 0;
    player.agilityUpgradeValue = 0;

    player.shieldsLeft = player.shieldUpgradeValue;
    player.agility = 2 * (player.agilityUpgradeValue + 1);
    player.energy = 1800 * (player.energyUpgradeValue + 1);
}
