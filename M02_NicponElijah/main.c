#include "gba.h" // Mode 0 Scaffold
#include "print.h"
#include "states.h"

int state, shells;
u16 buttons, oldButtons;
void init();

int main() {
    init();
    mgba_open();
    mgba_printf("Debugging Initialized");
    while (1) {
        oldButtons = buttons;
        buttons = BUTTONS;
        switch (state) {
            case START_MENU:
                doStartMenu();
                break;

            case INFO_MENU:
                doInfoMenu();
                break;
            
            case GAME:
                doGame();
                break;
            
            default:
                break;
        }
    }
}

void init() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    int shells = 0; 
    u16 oldButtons = 0;
    u16 buttons = BUTTONS;

    hideSprites();
    goStartMenu();
}