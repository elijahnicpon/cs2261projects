#include "mode3.h"
#include "print.h"
#include "start.h"
#include "win.h"
#include "lose.h"
#include "playing.h"
#include "pause.h"
#include <stddef.h>

int state;
u16 buttons, oldButtons;

void init();

int main() {
    mgba_open();
    mgba_printf("Debugging Initialized");
    init();

    while(1) {
        update3();
        switch(state) {
            case START:
                doStart();
                break;
            
            case PLAYING:
                doPlaying();
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
        }
    }
    return 0;
}

void init() {
    init3();
    goStart();
    
}