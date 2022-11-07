#include "gba.h" // Mode 0 Scaffold
#include "print.h"
#include "states.h"
#include "ss.h"
#include "tiles.h"

int state;
u16 buttons, oldButtons;

void init();

int main() {
    init();
    mgba_open();
    mgba_printf("Debugging Initialized");
    while (1) {
        oldButtons = buttons;
        buttons = BUTTONS;
        switch (state)
        {
        case START:
            doStart();
            break;
        case GAME:
            doGame();
            break;
        case PAUSE:
            doPause();
            break;
        case WIN:
            doWin();
            break;
        case LOSE:
            doLose();
            break;
        
        default:
            break;
        }
    }
}

void init() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    u16 oldButtons = 0;
    u16 buttons = BUTTONS;

    DMANow(3, ssPal, SPRITEPALETTE, ssPalLen/2);
    DMANow(3, ssTiles, &CHARBLOCK[4], ssTilesLen/2);

    DMANow(3, tilesPal, PALETTE, tilesPalLen/2);
    DMANow(3, tilesTiles, &CHARBLOCK[0], tilesTilesLen/2);
    hideSprites();
    goStart();
}