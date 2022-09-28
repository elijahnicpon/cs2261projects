#ifndef MODE_3
#define MODE_3

// Common Macros
#define RGB(R, G, B) ((R) | (G) << 5 | (B) << 10)
// Display Control Register Macros
#define REG_DISPCTRL (*(unsigned short *)0x04000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)
#define VIDEO_BUFFER ((u16*)0x06000000)
#define SetPixel(x, y, val) (VIDEO_BUFFER[(x) + (y)*240] = val)
#define V_COUNT (*(volatile u16*)0x04000006)

// Commmon Typedefs
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

// Colors
#define BLACK   RGB(0,0,0)
#define WHITE   RGB(31,31,31)
#define GRAY    RGB(15,15,15)
#define RED     RGB(31,0,0)
#define GREEN   RGB(0,31,0)
#define BLUE    RGB(0,0,31)
#define CYAN    RGB(0,31,31)
#define MAGENTA RGB(31,0,31)
#define YELLOW  RGB(31,31,0)
#define ORANGE  RGB(31,20,0)

#define REG_KEYINPUT (*(volatile u16*)0x04000130)
#define BUTTON_A        0x0001
#define BUTTON_B        0x0002
#define BUTTON_SELECT   0x0004
#define BUTTON_START    0x0008
#define BUTTON_RIGHT    0x0010
#define BUTTON_LEFT     0x0020
#define BUTTON_UP       0x0040
#define BUTTON_DOWN     0x0080
#define BUTTON_R        0x0100
#define BUTTON_L        0x0200
#define BUTTON_HELD(key) (~REG_KEYINPUT & key)
#define BUTTON_PRESSED(key) ( (!(~oldButtons & (key))) && (~REG_KEYINPUT & (key)) )

// definitions are in mode3.c
void drawVerticalLine(u8 x, u8 y, u8 length, u16 color);
void drawHorizontalLine(u8 x, u8 y, u8 length, u16 color);
void drawSquare(u8 x, u8 y, u8 size, u16 color);
void waitForVBlank();
void drawRectangle(u8 x, u8 y, u8 width, u8 height, u16 color);
void init3();
void update3();
void draw45line(u8 x, u8 y, u8 size, u16 color);
void drawNeg45line(u8 x, u8 y, u8 size, u16 color);

// global variable declarations
extern u16 oldButtons;
extern u16 buttons;
extern int timestep;
extern int time;

#endif