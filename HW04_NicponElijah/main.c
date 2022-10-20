#include "gba.h" // HW04 Scaffold
#include "print.h"
#include "states.h"

int state;
u16 buttons, oldButtons;
int highscore;

void init();

int main() {
    mgba_open();
    mgba_printf("Debugging Initialized");
    init();

    while (1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        switch (state) {
        case START:
            /* code */
            doStart();
            break;
        
        case GAME:
            doGame();
            break;
        
        case PAUSE:
            doPause();
            break;
            
        case END:
            doEnd();
            break;

        case HIGHSCORE:
            doHighScore();
            break;
        
        default:
            break;
        }
    }
}

void init() {
    REG_DISPCTL = MODE4 | BG2_ENABLE | DISP_BACKBUFFER;

    //sound
    REG_SOUNDCNT_X = SOUND_ENABLED;
    REG_SOUNDCNT_L = DMG_VOL_LEFT(5) | DMG_VOL_RIGHT(5) | DMG_SND2_LEFT | DMG_SND2_RIGHT;
    REG_SOUNDCNT_H = DMG_MASTER_VOL(2);

    u16 buttons = BUTTONS;
    u16 oldButtons = 0;
    highScore = 0;
    goStart();
}