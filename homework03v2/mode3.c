#include "mode3.h"

void drawVerticalLine(u8 x, u8 y, u8 length, u16 color) {  // typedefs from 2261lib.h
  for(u8 i=0; i<length; i++){
    SetPixel(x, y + i, color);  // uses macro from 2261lib.h
  }
}

void drawHorizontalLine(u8 x, u8 y, u8 length, u16 color) {
  for(u8 i=0; i<length; i++){
    SetPixel(x + i, y, color);
  }
}

void drawSquare(u8 x, u8 y, u8 size, u16 color) {
  for (u8 i=0; i<size; i++){
    for (u8 j=0; j<size; j++){
      SetPixel(x+i, y+j, color);
    }
  }
}

void waitForVBlank() {
  while (V_COUNT >= 160);  // wait until current VBlank ends
  while (V_COUNT < 160);  // wait until next VBlank starts
}

void drawRectangle(u8 x, u8 y, u8 width, u8 height, u16 color) {
    for (u8 i = y; i < height + y; i++) {
        for (u8 j = x; j < width + x; j++) {
            SetPixel(j, i, color);
        }
    }
}

void draw45line(u8 x, u8 y, u8 size, u16 color) {
  for (int i = 0; i < size; i++, x--, y++) {
    SetPixel(x, y, color);
  }
}

void drawNeg45line(u8 x, u8 y, u8 size, u16 color) {
  for (int i = 0; i < size; i++, x++, y++) {
    SetPixel(x, y, color);
  }
}

void init3() {
  REG_DISPCTRL = MODE3 | BG2_ENABLE;
  u16 buttons = REG_KEYINPUT;
  u16 oldButtons = 0;
  int timestep = 10;
  int time = 0;
}

void update3() {
  oldButtons = buttons;
  buttons = REG_KEYINPUT;
}

void fillScreen(u16 color) {
  drawRectangle(0,0,240,160, color);
}