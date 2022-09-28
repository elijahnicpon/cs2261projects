# 1 "mode3.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "mode3.c"
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
# 2 "mode3.c" 2

void drawVerticalLine(u8 x, u8 y, u8 length, u16 color) {
  for(u8 i=0; i<length; i++){
    (((u16*)0x06000000)[(x) + (y + i)*240] = color);
  }
}

void drawHorizontalLine(u8 x, u8 y, u8 length, u16 color) {
  for(u8 i=0; i<length; i++){
    (((u16*)0x06000000)[(x + i) + (y)*240] = color);
  }
}

void drawSquare(u8 x, u8 y, u8 size, u16 color) {
  for (u8 i=0; i<size; i++){
    for (u8 j=0; j<size; j++){
      (((u16*)0x06000000)[(x+i) + (y+j)*240] = color);
    }
  }
}

void waitForVBlank() {
  while ((*(volatile u16*)0x04000006) >= 160);
  while ((*(volatile u16*)0x04000006) < 160);
}

void drawRectangle(u8 x, u8 y, u8 width, u8 height, u16 color) {
    for (u8 i = y; i < height + y; i++) {
        for (u8 j = x; j < width + x; j++) {
            (((u16*)0x06000000)[(j) + (i)*240] = color);
        }
    }
}

void draw45line(u8 x, u8 y, u8 size, u16 color) {
  for (int i = 0; i < size; i++, x--, y++) {
    (((u16*)0x06000000)[(x) + (y)*240] = color);
  }
}

void drawNeg45line(u8 x, u8 y, u8 size, u16 color) {
  for (int i = 0; i < size; i++, x++, y++) {
    (((u16*)0x06000000)[(x) + (y)*240] = color);
  }
}

void init3() {
  (*(unsigned short *)0x04000000) = 3 | (1<<10);
  u16 buttons = (*(volatile u16*)0x04000130);
  u16 oldButtons = 0;
  int timestep = 10;
  int time = 0;
}

void update3() {
  oldButtons = buttons;
  buttons = (*(volatile u16*)0x04000130);
}

void fillScreen(u16 color) {
  drawRectangle(0,0,240,180, color);
}
