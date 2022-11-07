#include "game.h"
#include "states.h"
#include "gba.h"

#include "game_ss.h"
#include "game_bg.h"
#include "game_clouds_bg.h"

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
    int startingEnergy;
    
    int shieldUpgradeValue;
    int agilityUpgradeValue;
    int energyUpgradeValue;
} Player;

Player player;
int playerFrames[8] = {0, 2, 4, 6, 8, 6, 4, 2};

typedef struct {
    int x;
    int value;
    int y;
    int dy;
    int height;
    int width;
    int entry_OAM;
    int active;
    int spriteIndex;
    int paletteIndex;
} Shell;

Shell shells[20] = {};
int NUM_SHELLS = 20;

void doGame() {
    time++;
    waitForVBlank();
    checkButtons();
    updateBackgrounds();
    updateAndDrawPlayer();
    DMANow(3, shadowOAM, OAM, 512);
}

void updateAndDrawShells() {

}

void newShell() {
    for (int i = 0; i < NUM_SHELLS; i++) {
        shells[i].value = 
    }
}

void updateAndDrawPlayer() {
    
    if (time % (10 - gameSpeed) == 0) {
        player.frame = (player.frame + 1) % player.numFrames;
    }


    shadowOAM[player.entry_OAM].attr0 = (player.y & 0xFF) | ATTR0_TALL | ATTR0_4BPP;
    shadowOAM[player.entry_OAM].attr1 = ATTR1_TINY | (player.x / 8 & 0x1FF);
    shadowOAM[player.entry_OAM].attr2 = playerFrames[player.frame];

    //TODO: hazard collision checks here
}

void checkButtons() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        //goPause();
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if ((player.x + (player.agility) / 8) >= 0) {
            player.x -= player.agility;
            player.energy--;
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if ((player.x + (player.agility) / 8) <= (241 - player.width) * 8) {
            player.x += player.agility;
            player.energy--;
        }
    }
}

void updateBackgrounds() {
    cloudVOff -= 1;
    REG_BG0VOFF = cloudVOff / 8;

    vOff -= 2;
    REG_BG1VOFF = vOff / 8;
    REG_BG1HOFF = 0;
}

void goGame() {

    hideSprites();

    state = GAME;

    REG_DISPCTL = BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE | MODE0;

    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, game_bgPal, PALETTE, game_bgPalLen/2);
    DMANow(3, game_bgTiles, &CHARBLOCK[0], game_bgTilesLen/2);
    DMANow(3, game_bgMap, &SCREENBLOCK[31], game_bgMapLen/2);

    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);

    DMANow(3, game_clouds_bgPal, PALETTE + 32, game_clouds_bgPalLen/2);
    DMANow(3, game_clouds_bgTiles, &CHARBLOCK[1], game_clouds_bgTilesLen/2);
    DMANow(3, game_clouds_bgMap, &SCREENBLOCK[30], game_clouds_bgMapLen/2);

    DMANow(3, game_ssPal, SPRITEPALETTE, game_ssPalLen/2);
    DMANow(3, game_ssTiles, &CHARBLOCK[4], game_ssTilesLen/2);

    //TODO: Replace w real HUD
    shadowOAM[0].attr0 = ATTR0_4BPP | ATTR0_WIDE | (2 & 0xFF);
    shadowOAM[0].attr1 = ATTR1_MEDIUM | (2 & 0x1FF);
    shadowOAM[0].attr2 = OFFSET(0,6,32); //real@(0,4,32)
    shadowOAM[1].attr0 = ATTR0_4BPP | ATTR0_WIDE | (2 & 0xFF);
    shadowOAM[1].attr1 = ATTR1_MEDIUM | (34 & 0x1FF);
    shadowOAM[1].attr2 = OFFSET(4,6,32); //real@(4,4,32)

    initPlayer();

    vOff = 0;
    int cloudVOff = 0;
    int gameSpeed = 2;
    int time = 0;

    DMANow(3, shadowOAM, OAM, 512);

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
    player.startingEnergy = 1800 * (player.energyUpgradeValue + 1);
}