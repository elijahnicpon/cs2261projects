# 1 "pause.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "pause.c"
# 1 "text.h" 1



void drawChar(int col, int row, char ch, unsigned short color);
void drawString(int col, int row, char *str, unsigned short color);
# 2 "pause.c" 2
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
# 3 "pause.c" 2
# 1 "playing.h" 1
void doPlaying();
void goPlaying();
void resumePlaying();
# 4 "pause.c" 2

int state;

void goPause() {
    fillScreen(((30) | (30) << 5 | (29) << 10));
    drawString(10,50,"pause",((7) | (6) << 5 | (5) << 10));
    drawString(10,72,"press start to resume",((7) | (6) << 5 | (5) << 10));
    state = PAUSE;
}

void doPause() {
    if (( (!(~oldButtons & (0x0008))) && (~(*(volatile u16*)0x04000130) & (0x0008)) )) {
        resumePlaying();
    }
}
