# 1 "win.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "win.c"
# 1 "win.h" 1
void goWin();
void doWin();
# 2 "win.c" 2
# 1 "mode3.h" 1
# 15 "mode3.h"
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 46 "mode3.h"
void drawVerticalLine(u8 x, u8 y, u8 length, u16 color);
void drawHorizontalLine(u8 x, u8 y, u8 length, u16 color);
void drawSquare(u8 x, u8 y, u8 size, u16 color);
void waitForVBlank();
void drawRectangle(u8 x, u8 y, u8 width, u8 height, u16 color);
void init3();
void update3();
void draw45line(u8 x, u8 y, u8 size, u16 color);
void drawNeg45line(u8 x, u8 y, u8 size, u16 color);
void fillScreen(u16 color);


extern u16 oldButtons;
extern u16 buttons;
extern int timestep;
extern int time;

enum STATE {START, PLAYING, PAUSE, WIN, LOSE};
# 3 "win.c" 2
# 1 "text.h" 1



void drawChar(int col, int row, char ch, unsigned short color);
void drawString(int col, int row, char *str, unsigned short color);
# 4 "win.c" 2
# 1 "start.h" 1
void doStart();
void goStart();
# 5 "win.c" 2

int state;

void goWin() {
    state = WIN;
    fillScreen(((12) | (12) << 5 | (17) << 10));
    drawString(10,50,"congrats! you won!",((7) | (6) << 5 | (5) << 10));
    drawString(10,72,"press start to return to start",((7) | (6) << 5 | (5) << 10));
}

void doWin() {
    if (( (!(~oldButtons & (0x0008))) && (~(*(volatile u16*)0x04000130) & (0x0008)) )) {
        goStart();
    }
}
