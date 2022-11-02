#include "game.h"
#include "states.h"
#include "gba.h"
#include "print.h"

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
    int orientation; // 0:up, 1:down, 2:left, 3:right
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
    int orientation; // 0:right (+dx || dx == 0), 1:left (-dx), 2: UP, 3: DOWN
    int active;
} Pookah;


Pookah pookahs[2] = {
    //{48 ,  64, 1, 0, 0, 70,  0, 0, 0, 1},
    {192,  48, 0, 1, 0, 69,  0, 0, 0, 1},
    {176, 128,-1, 0, 0, 71,  0, 0, 0, 1}
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
    int orientation; // 0:right (+dx || dx == 0), 1:left (-dx), 2: UP, 3: DOWN
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
    if (player.orientation == 0) { //right
        pump.spriteSheetIndex = OFFSET(4,2,32);
        pump.x = player.x + 16;
        pump.y = player.y + 8;
        pump.width = 32;
        pump.height = 8;
    } else if (player.orientation == 1) { // up
        pump.x = player.x + 4;
        pump.y = player.y - 32;
        pump.spriteSheetIndex = OFFSET(0,2,32);
        pump.width = 8;
        pump.height = 32;
    } else if (player.orientation == 2) { // left
        pump.x = player.x - 32;
        pump.y = player.y + 8;
        pump.spriteSheetIndex = OFFSET(12,2,32);
        pump.width = 32;
        pump.height = 8;
    } else if (player.orientation == 3) { // down
        pump.x = player.x + 8;
        pump.y = player.y + 16;
        pump.spriteSheetIndex = OFFSET(8,2,32);
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
                    gameTileMap[OFFSET(((pookahs[i].x)/8), (pookahs[i].y)/8, 32)] == 6 || 
                    gameTileMap[OFFSET(((pookahs[i].x)/8), ((pookahs[i].y)/8)+1, 32)] == 6 || 
                    gameTileMap[OFFSET(((pookahs[i].x)/8) + 2, (pookahs[i].y)/8, 32)] == 6 || 
                    gameTileMap[OFFSET(((pookahs[i].x)/8) + 2, ((pookahs[i].y)/8)+1, 32)] == 6) {
                

                // if (gameTileMap[OFFSET(((pookahs[i].x)/8), (pookahs[i].y)/8, 32)] == 0 && 
                //     gameTileMap[OFFSET(((pookahs[i].x)/8) + 1, ((pookahs[i].y)/8), 32)] == 0) {
                //         pookahs[i].dy = -1;
                //         pookahs[i].dx = 0;
                // } else {
                    pookahs[i].dx *= -1;
                // }
            }

            if (pookahs[i].y < 8 || pookahs[i].y > 136 ||
                    gameTileMap[OFFSET(((pookahs[i].x)/8), (pookahs[i].y)/8, 32)] == 6 || 
                    gameTileMap[OFFSET(((pookahs[i].x)/8) + 1, ((pookahs[i].y)/8), 32)] == 6 || 
                    gameTileMap[OFFSET(((pookahs[i].x)/8), ((pookahs[i].y)/8)+2, 32)] == 6 || 
                    gameTileMap[OFFSET(((pookahs[i].x)/8) + 1, ((pookahs[i].y)/8)+2, 32)] == 6) {
                pookahs[i].dy *= -1;
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

        
        
        // for (int j = 0; j < NUMROCKS; j++) {
        //     if (collision(pookahs[i].x, pookahs[i].y, 16,16,rocks[j].x, rocks[j].y, 16,16)) {
        //         pookahs[i].x -= pookahs[i].dx;
        //         pookahs[i].y -= pookahs[i].dy;
        //     }
        // }


        // //check walls
        // if (pookahs[i].x < 0 || pookahs[i].x > 224) {
        //     pookahs[i].x -= pookahs[i].dx;
        // }
        // if (pookahs[i].y < 8 || pookahs[i].y > 136) {
        //     pookahs[i].y -= pookahs[i].dy;
        // }
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
            //shoot fire
            fygars[i].fire.timer = 15;

            if (fygars[i].dx == 1) {
                fygars[i].fire.spriteSheetIndex = OFFSET(16,0,32);
                fygars[i].fire.x = fygars[i].x + 16;
                fygars[i].fire.y = fygars[i].y;
                fygars[i].fire.height = 16;
                fygars[i].fire.width = 48;

            } else if (fygars[i].dx == -1) {
                fygars[i].fire.spriteSheetIndex = OFFSET(24,0,32);
                fygars[i].fire.x = fygars[i].x - 52;
                fygars[i].fire.y = fygars[i].y;
                fygars[i].fire.height = 16;
                fygars[i].fire.width = 48;
            } else if (fygars[i].dy == 1) { // down
                fygars[i].fire.spriteSheetIndex = OFFSET(24,8,32);
                fygars[i].fire.x = fygars[i].x;
                fygars[i].fire.y = fygars[i].y + 16;
                fygars[i].fire.height = 48;
                fygars[i].fire.width = 16;
            } else if (fygars[i].dy == -1) { // up
                fygars[i].fire.spriteSheetIndex = OFFSET(16,8,32);
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
                    gameTileMap[OFFSET(((fygars[i].x)/8), (fygars[i].y)/8, 32)] == 6 || 
                    gameTileMap[OFFSET(((fygars[i].x)/8), ((fygars[i].y)/8)+1, 32)] == 6 || 
                    gameTileMap[OFFSET(((fygars[i].x)/8) + 2, (fygars[i].y)/8, 32)] == 6 || 
                    gameTileMap[OFFSET(((fygars[i].x)/8) + 2, ((fygars[i].y)/8)+1, 32)] == 6) {
                fygars[i].dx *= -1;
            }

            if (fygars[i].y < 8 || fygars[i].y > 136 ||
                    gameTileMap[OFFSET(((fygars[i].x)/8), (fygars[i].y)/8, 32)] == 6 || 
                    gameTileMap[OFFSET(((fygars[i].x)/8) + 1, ((fygars[i].y)/8), 32)] == 6 || 
                    gameTileMap[OFFSET(((fygars[i].x)/8), ((fygars[i].y)/8)+2, 32)] == 6 || 
                    gameTileMap[OFFSET(((fygars[i].x)/8) + 1, ((fygars[i].y)/8)+2, 32)] == 6) {
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
    shadowOAM[90].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (152 & 0xFF);
    shadowOAM[90].attr1 = ATTR1_TINY | (232 & 0x1FF);
    shadowOAM[90].attr2 = OFFSET(score % 10, 21, 32);

    shadowOAM[91].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (152 & 0xFF);
    shadowOAM[91].attr1 = ATTR1_TINY | (224 & 0x1FF);
    shadowOAM[91].attr2 = OFFSET((score / 10) % 10, 21, 32);
    
    shadowOAM[92].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (152 & 0xFF);
    shadowOAM[92].attr1 = ATTR1_TINY | (216 & 0x1FF);
    shadowOAM[92].attr2 = OFFSET((score / 100) % 10, 21, 32);

    shadowOAM[93].attr0 = ATTR0_4BPP | ATTR0_SQUARE | (152 & 0xFF);
    shadowOAM[93].attr1 = ATTR1_TINY | (208 & 0x1FF);
    shadowOAM[93].attr2 = OFFSET(score / 1000, 21, 32);
}

int checkForWinTILES() {
    
    //check 
    for (int i = 3; i < 19; i++) {
        for (int j = 0; j < 30; j++) {
            if (gameTileMap[OFFSET(j,i,32)]) {
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
    //TODO: check green ones
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
                shadowOAM[120].attr0 = ATTR0_HIDE;
                break;
            case 1:
                shadowOAM[121].attr0 = ATTR0_HIDE;
                break;
            default:
                break;
        }
        initOrDeathPositionResets();
    }
}

void doRocks() {
    for (int i = 0; i < NUMROCKS; i++) {
        
        if (gameTileMap[OFFSET(rocks[i].x/8,(rocks[i].y/8) + 2,32)] == 0 && gameTileMap[OFFSET((rocks[i].x/8) + 1,(rocks[i].y/8) + 2,32)] == 0) {
            rocks[i].fallStep++;
            rocks[i].fallDelay--;
            if (rocks[i].fallStep % 6 == 0 && rocks[i].fallDelay < 0) {
                rocks[i].y += 8;
                //TODO: ENEMY COLLISIONS
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
    //update player sprite
    shadowOAM[0].attr0 = ATTR0_4BPP | (player.y & 0xFF);
    shadowOAM[0].attr1 = ATTR1_SMALL | (player.x & 0x1FF) | (1<<14);
    shadowOAM[0].attr2 = (player.orientation * 4) + (player.frame * 2);
    //dig
    if (gameTileMap[OFFSET(((player.x + 4 )/ 8), ((player.y + 4) / 8), 32)] == 6) {
        gameTileMap[OFFSET(((player.x + 4 ) / 8), ((player.y + 4) / 8), 32)] = 0;
        score++;
    }
    if (gameTileMap[OFFSET(((player.x + 4 ) / 8) + 1, ((player.y + 4) / 8), 32)] == 6) {
        gameTileMap[OFFSET(((player.x + 4 ) / 8) + 1, ((player.y + 4) / 8), 32)] = 0;
        score++;
    }
    if (gameTileMap[OFFSET(((player.x + 4 ) / 8), ((player.y + 4) / 8) + 1, 32)] == 6) {
        gameTileMap[OFFSET(((player.x + 4 ) / 8), ((player.y + 4) / 8) + 1, 32)] = 0;
        score++;
    }
    if (gameTileMap[OFFSET(((player.x + 4 ) / 8) + 1, ((player.y + 4) / 8) + 1, 32)] == 6) {
        gameTileMap[OFFSET(((player.x + 4 ) / 8) + 1, ((player.y + 4) / 8) + 1, 32)] = 0;
        score++;
    }

    for (int i = 0; i < NUMPOOKAHS; i++) {
        //mgba_printf("pookah num %d: x=%d, y=%d", i, pookahs[i].x, pookahs[i].y);
        if (pookahs[i].active) {
            if (pookahs[i].damage == 0) {
                if (pookahs[i].dx) {
                    shadowOAM[pookahs[i].oam_entry].attr0 = ATTR0_4BPP | (pookahs[i].y & 0xFF);
                    shadowOAM[pookahs[i].oam_entry].attr1 = ATTR1_SMALL | (pookahs[i].x & 0x1FF) | (1<<14) | ((pookahs[i].orientation == 0) ? 0 : ATTR1_HFLIP);
                    if (pookahs[i].damage == 0) {
                        shadowOAM[pookahs[i].oam_entry].attr2 = OFFSET(pookahs[i].frame * 2,6,32);
                    }
                } else {
                    shadowOAM[pookahs[i].oam_entry].attr0 = ATTR0_4BPP | (pookahs[i].y & 0xFF);
                    shadowOAM[pookahs[i].oam_entry].attr1 = ATTR1_SMALL | (pookahs[i].x & 0x1FF) | (1<<14) | ((pookahs[i].orientation == 3) ? 0 : ATTR1_VFLIP);
                    if (pookahs[i].damage == 0) {
                        shadowOAM[pookahs[i].oam_entry].attr2 = OFFSET(pookahs[i].frame * 2,8,32);
                    }
                }
            } else {
                shadowOAM[pookahs[i].oam_entry].attr0 = ATTR0_4BPP | (pookahs[i].y - 4 & 0xFF);
                shadowOAM[pookahs[i].oam_entry].attr1 = ATTR1_MEDIUM | (pookahs[i].x - 4 & 0x1FF) | ((pookahs[i].orientation == 0) ? 0 : ATTR1_HFLIP);
                shadowOAM[pookahs[i].oam_entry].attr2 = OFFSET((pookahs[i].damage - 1)*4 , 10, 32);
            }
        } else {
            shadowOAM[pookahs[i].oam_entry].attr0 = ATTR0_HIDE;
        }
    }

    for (int i = 0; i < NUMFYGARS; i++) {
        mgba_printf("fygar num %d: x=%d, y=%d, dx=%d, dy=%d, active=%d, orientation=%d", i, fygars[i].x, fygars[i].y, fygars[i].dx, fygars[i].dy, fygars[i].active);
        if (fygars[i].active) {
            if (fygars[i].damage == 0) {
                if (fygars[i].dx) {
                    shadowOAM[fygars[i].oam_entry].attr0 = ATTR0_4BPP | (fygars[i].y & 0xFF);
                    shadowOAM[fygars[i].oam_entry].attr1 = ATTR1_SMALL | (fygars[i].x & 0x1FF) | (1<<14) | ((fygars[i].orientation == 0) ? 0 : ATTR1_HFLIP);
                    if (fygars[i].damage == 0) {
                        shadowOAM[fygars[i].oam_entry].attr2 = OFFSET((fygars[i].frame * 2) + 4,6,32);
                    }
                } else {
                    shadowOAM[fygars[i].oam_entry].attr0 = ATTR0_4BPP | (fygars[i].y & 0xFF);
                    shadowOAM[fygars[i].oam_entry].attr1 = ATTR1_SMALL | (fygars[i].x & 0x1FF) | (1<<14) | ((fygars[i].orientation == 3) ? 0 : ATTR1_VFLIP);
                    if (fygars[i].damage == 0) {
                        shadowOAM[fygars[i].oam_entry].attr2 = OFFSET((fygars[i].frame * 2) + 4,8,32);
                    }
                }
            } else {
                shadowOAM[fygars[i].oam_entry].attr0 = ATTR0_4BPP | (fygars[i].y - 4 & 0xFF);
                shadowOAM[fygars[i].oam_entry].attr1 = ATTR1_MEDIUM | (fygars[i].x - 4 & 0x1FF) | ((fygars[i].orientation == 0) ? 0 : ATTR1_HFLIP);
                shadowOAM[fygars[i].oam_entry].attr2 = OFFSET((fygars[i].damage - 1)*4 , 14, 32);
            }
        } else {
            shadowOAM[fygars[i].oam_entry].attr0 = ATTR0_HIDE;
        }
    }

    for (int i = 0; i < NUMROCKS; i++) {
        shadowOAM[rocks[i].oam_entry].attr0 = ATTR0_4BPP | (rocks[i].y & 0xFF);
        shadowOAM[rocks[i].oam_entry].attr1 = ATTR1_SMALL | (rocks[i].x & 0x1FF);
        shadowOAM[rocks[i].oam_entry].attr2 = OFFSET(8,6,32);
    }

    for (int i = 0; i < NUMFYGARS; i++) {
        if (fygars[i].fire.timer > 0) {
            shadowOAM[fygars[i].fire.oam_entry].attr0 = ATTR0_4BPP | (fygars[i].fire.y & 0xFF);
            shadowOAM[fygars[i].fire.oam_entry].attr1 = ATTR1_LARGE | (fygars[i].fire.x & 0x1FF);
            shadowOAM[fygars[i].fire.oam_entry].attr2 = fygars[i].fire.spriteSheetIndex;
        } else {
            shadowOAM[fygars[i].fire.oam_entry].attr0 = ATTR0_HIDE;
        }
    }

    pump.timer--;
    if (pump.timer > 0) {
        shadowOAM[pump.oam_entry].attr0 = ATTR0_4BPP | (pump.y & 0xFF);
        shadowOAM[pump.oam_entry].attr1 = ATTR1_MEDIUM | (pump.x & 0x1FF);
        shadowOAM[pump.oam_entry].attr2 = pump.spriteSheetIndex;
    } else {
        shadowOAM[pump.oam_entry].attr0 = ATTR0_HIDE;
    }

    DMANow(3, &gameTileMap, &SCREENBLOCK[31], 1024);
    DMANow(3, shadowOAM, (void*) 0x07000000, 512);
}

void updateLasts() {
    player.prev_x = player.x;
    player.prev_y = player.y;
}

void updatePlayer() {
    checkRockOrWallCollision();
    
    if (checkDeath()) {
        //lives--;
    }
}

int checkDeath() {
    //TODO: check fire
    //TODO: check fygar
    //TODO: check fygar fires
    //TODO: check pookas
    return 0;
}

void checkRockOrWallCollision() {
    //TODO: check rocks
    for (int i = 0; i < NUMROCKS; i++) {
        if (collision(player.x, player.y, 16,16,rocks[i].x, rocks[i].y, 16,16)) {
            player.x = player.prev_x;
            player.y = player.prev_y;
        }
    }
    //check walls
    if (player.x < 0 || player.x > 224) {
        player.x = player.prev_x;
    }
    if (player.y < 8 || player.y > 136) {
        player.y = player.prev_y;
    }

}

void checkButtons() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        paused = 1;
        goPause();
    }
    if (BUTTON_HELD(BUTTON_UP) || BUTTON_HELD(BUTTON_DOWN)) {
        if (BUTTON_HELD(BUTTON_UP)) {
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
    } else if (BUTTON_HELD(BUTTON_LEFT) || BUTTON_HELD(BUTTON_RIGHT)) {
        if (BUTTON_HELD(BUTTON_LEFT)) {
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
    if (BUTTON_PRESSED(BUTTON_A)) {
        shootPump();
    }
    
}

void initOrDeathPositionResets() {
    player.x = 112;
    player.y = 80;
}

void reset() {
    // for (int i = 0; i < 32 * 3; i++) {
    //     gameTileMap[i] = 2;
    // }
    // for (int row = 3; row < 19; row++) {
    //     for (int col = 0; col < 30; col++) {
    //         gameTileMap[OFFSET(col,row,32)] = 6;
    //     }
    // }
    // for (int i = 3; i < 9 + 3; i++) {
    //     gameTileMap[OFFSET(14, i,32)] = 0;
    //     gameTileMap[OFFSET(15, i,32)] = 0;
    // }
    // for (int i = 12; i < 12 + 6; i++) {
    //     gameTileMap[OFFSET(i, 10, 32)] = 0;
    //     gameTileMap[OFFSET(i, 11, 32)] = 0; 
    // }

    // u16 gameTileMap[0] = {
    // 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 
    // 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 
    // 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 
    // 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 
    // 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 0, 0, 
    // 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 0, 0, 
    // 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 0, 0, 
    // 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 0, 0, 
    // 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 0, 0, 
    // 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 6, 6, 6, 6, 0, 0, 
    // 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 
    // 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 
    // 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 
    // 6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 
    // 6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 
    // 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 
    // 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 0, 0,
    // 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 0, 0, 
    // 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0
    // };


    // Rock rocks[0] = {
    //     {0,32,10,0,32},
    //     {176,48,11,0,32},
    //     {80,64,12,0,32}
    // };

    // Pookah pookahs[0] = {
    //     {64,64,1,0,0,1,70},
    //     {176,128,-1,0,0,1,71}
    // };
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

    //update player sprite
    shadowOAM[0].attr0 = ATTR0_4BPP | (player.y & 0xFF);
    shadowOAM[0].attr1 = ATTR1_SMALL | (player.x & 0x1FF) | (1<<14);
    shadowOAM[0].attr2 = OFFSET(0,0,32);
    
    shadowOAM[120].attr0 = ATTR0_4BPP | (152 & 0xFF); 
    shadowOAM[120].attr1 = ATTR1_TINY | (1<<14); 
    shadowOAM[120].attr2 = OFFSET(0,26,32); 

    shadowOAM[121].attr0 = ATTR0_4BPP | (152 & 0xFF); 
    shadowOAM[121].attr1 = ATTR1_TINY | (9 & 0x1FF) | (1<<14); 
    shadowOAM[121].attr2 = OFFSET(0,26,32); 

   
    waitForVBlank();

    // SCREENBLOCK[31].tilemap = tileMap;
    DMANow(3, &gameTileMap, &SCREENBLOCK[31], 1024);

    DMANow(3, shadowOAM, (void*) 0x07000000, 512);
}

void resumeGame() {
    switch (xtraLives) {
            case 2:
                shadowOAM[121].attr0 = ATTR0_4BPP | (152 & 0xFF); 
                shadowOAM[121].attr1 = ATTR1_TINY | (9 & 0x1FF) | (1<<14); 
                shadowOAM[121].attr2 = OFFSET(0,26,32); 
            case 1:
                shadowOAM[120].attr0 = ATTR0_4BPP | (152 & 0xFF); 
                shadowOAM[120].attr1 = ATTR1_TINY | (1<<14); 
                shadowOAM[120].attr2 = OFFSET(0,26,32); 
                break;
            default:
                break;
    }
    paused = 0;
    state = GAME;
    shadowOAM[100].attr0 = ATTR0_HIDE;
    DMANow(3, &gameTileMap, &SCREENBLOCK[31], 1024);
}

