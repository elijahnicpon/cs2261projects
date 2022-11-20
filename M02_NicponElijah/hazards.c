#include "hazards.h"
#include "gba.h"
#include "game_ss.h"
#include "states.h"

#include <stdio.h>
#include <stdlib.h>

int time;
Player player;

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

} Hazard;

enum HAZARD_TYPES {BAG, STRAW, SIX_PACK, NET, OIL, BOAT, SHARK, CYANIDE, DYNAMITE};

Hazard hazards[20];

int NUM_HAZARDS = 20;

void initHazards();
void newHazard();
void updateAndDrawHazards();
int checkHazardCollision();
void hazardFactory(int hazard_type);

void hazardFactory(int hazard_type) {
    for (int i = 0; i < NUM_HAZARDS;)
    switch (hazard_type) {
        case BAG:
            
            break;
        
        default:
            break;
    }
}

void updateAndDrawHazards() {
    for (int i = 0; i < NUM_HAZARDS; i++) {
        if (hazards[i].active) {
            shadowOAM[hazards[i].oam_entry].attr0 = (hazards[i].y & (0xFF)) | ATTR0_4BPP | (hazards[i].isTall) ? ATTR0_TALL : 0 | (hazards[i].isWide) ? ATTR0_WIDE : 0;
            shadowOAM[hazards[i].oam_entry].attr1 = (hazards[i].x & (0x1FF)) | (hazards[i].size == 1) ? ATTR1_SMALL : 0 | (hazards[i].size == 2) ? ATTR1_MEDIUM : 0 | (hazards[i].size == 3) ? ATTR1_LARGE : 0;
            shadowOAM[hazards[i].oam_entry].attr2 = hazards[i].spriteIndex;

            //TODO: finish this lol
            if (hazards[i].isAnimated && time % hazards[i].timeToDisplayFrame) {
                //hazards[i].sprite
            }
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

    switch (timeBlock) {
        case 0: // 0-15sec
            if (0 < randVal && randVal < 50) {
                newPlasticBag();
            } else {
                newPlasticStraw();
            } 
            break;

        case 1: // 15-30sec
            if (0 < randVal && randVal < 25) {
                newPlasticBag();
            } else if (25 < randVal && randVal < 50) {
                newPlasticStraw();
            } else if (50 < randVal && randVal < 75) {
                newSixPack();
            } else {
                newNet();
            }

        case 2: // 30-45sec
            if (0 < randVal && randVal < 33) {
                newSixPack();
            } else if (33 < randVal && randVal < 66) {
                newNet();
            } else {
                newOilSpill();
            }

        case 3: // 45-60sec
            if (0 < randVal && randVal < 25) {
                newNet();
            } else if (25 < randVal && randVal < 50) {
                newOilSpill();
            } else if (50 < randVal && randVal < 75) {
                newShark();
            } else {
                newCyanide();
            }

        case 4: // 60-75sec
            if (0 < randVal && randVal < 25) {
                newNet();
            } else if (25 < randVal && randVal < 50) {
                newOilSpill();
            } else if (50 < randVal && randVal < 75) {
                newShark();
            } else {
                newCyanide();
            }

        case 5: // 75-90sec
            if (0 < randVal && randVal < 50) {
                newShark();
            } else {
                newCyanide();
            }

        case 6: // 90-105sec
            if (0 < randVal && randVal < 50) {
                newShark();
            } else {
                newBoat();
            }

        case 7: // 105-120sec
            if (0 < randVal && randVal < 33) {
                newShark();
            } else if (33 < randVal && randVal < 66) {
                newBoat();
            } else {
                newDynamite();
            }

        default:
            break;
    }
}