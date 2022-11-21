#include "hazards.h"
#include "gba.h"
#include "game_ss.h"
#include "states.h"

#include "print.h"

#include <stdio.h>
#include <stdlib.h>

int time, shieldTime;
Player player;
OBJ_ATTR shadowOAM[128];


typedef struct {
    int x;
    int y;
    int dx;
    int dy;
    int height;
    int width;
    int isTall;
    int isWide;
    int size; //0 = teeny, 1 = small, 2 = medium, 3 = large

    int hazardType;
    int oam_entry;
    int spriteIndex;
    int isAnimated;
    int numFrames;
    int timeToDisplayFrame;
    int active;
    void (*deathfn)(void);

} Hazard;

enum HAZARD_TYPES {BAG, STRAW, SIX_PACK, NET, OIL, BOAT, SHARK, CYANIDE, DYNAMITE};

Hazard hazards[20];

int NUM_HAZARDS = 20;

void initHazards();
void newHazard();
void updateAndDrawHazards();
int checkHazardCollision();
void hazardFactory(int htype);
int checkHazardSpawnLocation(int x, int width, int height);

void hazardFactory(int htype) {
    for (int i = 0; i < NUM_HAZARDS; i++) {
        if (!hazards[i].active) {
            hazards[i].active = 1;
            int x = (rand() % 240) * 8;
            switch (htype) {
                case BAG:
                    //mgba_printf("hazards[%d] instantiated. type: %d, oam: %d", i, htype, hazards[i].oam_entry);
                    hazards[i].hazardType = BAG;
                    hazards[i].active = 1;
                    hazards[i].height = 12;
                    hazards[i].width = 22;
                    //hazards[i].x = (rand() % 240) * 8;

                    while (checkHazardSpawnLocation(x, hazards[i].width, hazards[i].height)) {
                        x = (rand() % 240) * 8;
                    }
                    hazards[i].x = x;

                    hazards[i].y = -hazards[i].height * 8;
                    hazards[i].spriteIndex = OFFSET(0,19,32);
                    hazards[i].size = 2;
                    //TODO:
                    // hazards[i].deathfn = goDeathPlastic();
                    
                    
                    // defaults
                    hazards[i].isTall = 0;
                    hazards[i].isWide = 0;
                    hazards[i].isAnimated = 0;
                    hazards[i].dx = 0;
                    hazards[i].dy = 1;
                    break;

                case STRAW:
                    hazards[i].hazardType = STRAW;
                    hazards[i].active = 1;
                    hazards[i].height = 12;
                    hazards[i].width = 22;
                    hazards[i].spriteIndex = OFFSET(0,19,32);
                    hazards[i].size = 2;
                    //TODO:
                    // hazards[i].deathfn = goDeathPlastic();

                    while (checkHazardSpawnLocation(x, hazards[i].width, hazards[i].height)) {
                        x = (rand() % 240) * 8;
                    }
                    hazards[i].x = x;
                    hazards[i].y = -hazards[i].height * 8;
                    // reset defaults
                    hazards[i].isTall = 0;
                    hazards[i].isWide = 0;
                    hazards[i].isAnimated = 0;
                    hazards[i].dx = 0;
                    hazards[i].dy = 1;
                    break;

                case SIX_PACK:
                    break;
                
                default:
                    break;
            }
            break;
        }
    }
}

checkHazardSpawnLocation(int x, int width, int height) {
    mgba_printf("checkHazardSpawnLocation(%d, %d, %d) called", x, width, height);
    for (int i = 0; i < NUM_HAZARDS; i++) {
        if (hazards[i].active) {
            if (hazards[i].y < 10) {
                if (collision(x / 8, -height, width, height, hazards[i].x / 8, hazards[i].y, hazards[i].width, hazards[i].height)) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

void newShield() {
    shieldTime = time + 60;
}

void updateAndDrawShield() {
    //mgba_printf("draw shield if (%d >= %d)?", shieldTime, time);
    if (shieldTime >= time) {
        if (time % 2 != 0) {
            shadowOAM[11].attr0 = (player.y & 0xFF) | ATTR0_4BPP;
            shadowOAM[11].attr1 = ATTR1_SMALL | ((player.x / 8) - 2 & 0x1FF);
            //shadowOAM[2].attr2 = OFFSET(20,9,32) | ATTR2_PRIORITY(1);
            shadowOAM[11].attr2 = OFFSET(21,8,32) | ATTR2_PRIORITY(0);
        } else {
            shadowOAM[11].attr0 = ATTR0_HIDE;
        }
        
    } else {
        shadowOAM[11].attr0 = ATTR0_HIDE; // intentionally creates flicker
    }
    
}

void updateAndDrawHazards() { // MATCH UPDATE AND DRAW SHELLS

    if (time % 60 == 0) { // every 3 seconds
        newHazard();
    }

    for (int i = 0; i < NUM_HAZARDS; i++) {
        if (hazards[i].active) {
            //shadowOAM[hazards[i].oam_entry].attr0 = ((hazards[i].y / 8) & (0xFF)) | ATTR0_4BPP | (hazards[i].isTall == 0) ? 0 : ATTR0_TALL | (hazards[i].isWide == 0) ? 0 : ATTR0_WIDE;
            shadowOAM[hazards[i].oam_entry].attr0 = (hazards[i].y / 8) & (0xFF) | ATTR0_4BPP;
            shadowOAM[hazards[i].oam_entry].attr1 = ((hazards[i].x / 8) & (0x1FF)) | (hazards[i].size << 14); 
            //shadowOAM[hazards[i].oam_entry].attr1 = ((hazards[i].x / 8) & (0x1FF)) | (hazards[i].size == 1) ? ATTR1_SMALL : 0 | (hazards[i].size == 2) ? ATTR1_MEDIUM : 0 | (hazards[i].size == 3) ? ATTR1_LARGE : 0;
            //shadowOAM[hazards[i].oam_entry].attr1 = ((hazards[i].x / 8) & (0x1FF));
            shadowOAM[hazards[i].oam_entry].attr2 = hazards[i].spriteIndex | ATTR2_PRIORITY(1);

            if (collision(hazards[i].x / 8, hazards[i].y / 8, hazards[i].height, hazards[i].width, player.x / 8, player.y, player.width, player.height)) {
                if (player.shieldsLeft > 0) {
                    player.shieldsLeft--;
                    newShield();
                } else {
                    //TODO:
                    //hazards[i].deathfn();
                    goDeathPlastic();
                }
                
                hazards[i].active = 0;
                
            }

            if (hazards[i].y > 160 * 8) {
                hazards[i].active = 0;
            } else { // TODO: replace with gameSpeed
                hazards[i].y += 2;
                //mgba_printf("%d", hazards[i].y);
            }

            //TODO: finish this lol
            // if (hazards[i].isAnimated && time % hazards[i].timeToDisplayFrame) {
                //hazards[i].sprite
            // }

        } else {
            shadowOAM[hazards[i].oam_entry].attr0 = ATTR0_HIDE;
        }
    }
}

void initHazards() {
    for (int i = 0; i < NUM_HAZARDS; i++) {
        hazards[i].oam_entry = 60 + i;
        hazards[i].active = 0;
    }
    int shieldTime = 0;
}

int checkHazardCollision() {
    for (int i = 0; i < NUM_HAZARDS; i++) {
        if (hazards[i].active) {
            if (collision(hazards[i].x, hazards[i].y, hazards[i].width, hazards[i].height,
                            player.x, player.y, player.width, player.height)) {
                return 1;
            }
        }
    }
    return 0;
}

void newHazard() {
    int timeInSeconds = time / 60;
    int timeBlock;

    if (0 < timeInSeconds && timeInSeconds < 15){
        timeBlock = 0;
    } else if (15 < timeInSeconds && timeInSeconds < 30) {
        timeBlock = 1;
    } else if (30 < timeInSeconds && timeInSeconds < 45) {
        timeBlock = 2;
    } else if (45 < timeInSeconds && timeInSeconds < 60) {
        timeBlock = 3;
    } else if (60 < timeInSeconds && timeInSeconds < 75) {
        timeBlock = 4;
    } else if (75 < timeInSeconds && timeInSeconds < 90) {
        timeBlock = 5;
    } else if (90 < timeInSeconds && timeInSeconds < 105) {
        timeBlock = 6;
    } else {
        timeBlock = 7;
    }

    int randVal = rand() % 100;

    hazardFactory(BAG);


    //TODO: replace newXXX functions with hazardFactory() calls
    // switch (timeBlock) {
    //     case 0: // 0-15sec
    //         if (0 < randVal && randVal < 50) {
    //             hazardFactory(BAG);
    //         } else {
    //             newPlasticStraw();
    //         } 
    //         break;

    //     case 1: // 15-30sec
    //         if (0 < randVal && randVal < 25) {
    //             newPlasticBag();
    //         } else if (25 < randVal && randVal < 50) {
    //             newPlasticStraw();
    //         } else if (50 < randVal && randVal < 75) {
    //             newSixPack();
    //         } else {
    //             newNet();
    //         }

    //     case 2: // 30-45sec
    //         if (0 < randVal && randVal < 33) {
    //             newSixPack();
    //         } else if (33 < randVal && randVal < 66) {
    //             newNet();
    //         } else {
    //             newOilSpill();
    //         }

    //     case 3: // 45-60sec
    //         if (0 < randVal && randVal < 25) {
    //             newNet();
    //         } else if (25 < randVal && randVal < 50) {
    //             newOilSpill();
    //         } else if (50 < randVal && randVal < 75) {
    //             newShark();
    //         } else {
    //             newCyanide();
    //         }

    //     case 4: // 60-75sec
    //         if (0 < randVal && randVal < 25) {
    //             newNet();
    //         } else if (25 < randVal && randVal < 50) {
    //             newOilSpill();
    //         } else if (50 < randVal && randVal < 75) {
    //             newShark();
    //         } else {
    //             newCyanide();
    //         }

    //     case 5: // 75-90sec
    //         if (0 < randVal && randVal < 50) {
    //             newShark();
    //         } else {
    //             newCyanide();
    //         }

    //     case 6: // 90-105sec
    //         if (0 < randVal && randVal < 50) {
    //             newShark();
    //         } else {
    //             newBoat();
    //         }

    //     case 7: // 105-120sec
    //         if (0 < randVal && randVal < 33) {
    //             newShark();
    //         } else if (33 < randVal && randVal < 66) {
    //             newBoat();
    //         } else {
    // }
    //             newDynamite();
    //         }

    //     default:
    //         break;
}