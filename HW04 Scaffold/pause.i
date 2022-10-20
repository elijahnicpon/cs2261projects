# 1 "pause.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "pause.c"
# 1 "pause.h" 1
void goPause(int time);
void doPause();
# 2 "pause.c" 2
# 1 "states.h" 1
enum STATE {START, GAME, PAUSE, END, HIGHSCORE};
# 1 "start.h" 1
void goStart();
void doStart();

extern int highScore;
# 3 "states.h" 2
# 1 "game.h" 1
void goGame(int seed);
void resumeGame();
void doGame();
# 4 "states.h" 2
# 1 "pause.h" 1
void goPause(int time);
void doPause();
# 5 "states.h" 2
# 1 "end.h" 1
void doEnd();
void goEnd(int score);
# 6 "states.h" 2
# 1 "highscore.h" 1
void doHighScore();
void goHighScore();
# 7 "states.h" 2

int state;
extern int highScore;
# 3 "pause.c" 2
# 1 "gba.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;







int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
void waitForVBlank();
# 43 "gba.h"
extern volatile unsigned short *videoBuffer;
# 64 "gba.h"
void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);





void flipPage();
void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);
# 104 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 115 "gba.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 155 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 201 "gba.h"
enum {
  REST = 0,
  NOTE_C2 =44,
  NOTE_CS2 =157,
  NOTE_D2 =263,
  NOTE_DS2 =363,
  NOTE_E2 =457,
  NOTE_F2 =547,
  NOTE_FS2 =631,
  NOTE_G2 =711,
  NOTE_GS2 =786,
  NOTE_A2 =856,
  NOTE_AS2 =923,
  NOTE_B2 =986,
  NOTE_C3 =1046,
  NOTE_CS3 =1102,
  NOTE_D3 =1155,
  NOTE_DS3 =1205,
  NOTE_E3 =1253,
  NOTE_F3 =1297,
  NOTE_FS3 =1339,
  NOTE_G3 =1379,
  NOTE_GS3 =1417,
  NOTE_A3 =1452,
  NOTE_AS3 =1486,
  NOTE_B3 =1517,
  NOTE_C4 =1547,
  NOTE_CS4 =1575,
  NOTE_D4 =1602,
  NOTE_DS4 =1627,
  NOTE_E4 =1650,
  NOTE_F4 =1673,
  NOTE_FS4 =1694,
  NOTE_G4 =1714,
  NOTE_GS4 =1732,
  NOTE_A4 =1750,
  NOTE_AS4 =1767,
  NOTE_B4 =1783,
  NOTE_C5 =1798,
  NOTE_CS5 =1812,
  NOTE_D5 =1825,
  NOTE_DS5 =1837,
  NOTE_E5 =1849,
  NOTE_F5 =1860,
  NOTE_FS5 =1871,
  NOTE_G5 =1881,
  NOTE_GS5 =1890,
  NOTE_A5 =1899,
  NOTE_AS5 =1907,
  NOTE_B5 =1915,
  NOTE_C6 =1923,
  NOTE_CS6 =1930,
  NOTE_D6 =1936,
  NOTE_DS6 =1943,
  NOTE_E6 =1949,
  NOTE_F6 =1954,
  NOTE_FS6 =1959,
  NOTE_G6 =1964,
  NOTE_GS6 =1969,
  NOTE_A6 =1974,
  NOTE_AS6 =1978,
  NOTE_B6 =1982,
  NOTE_C7 =1985,
  NOTE_CS7 =1989,
  NOTE_D7 =1992,
  NOTE_DS7 =1995,
  NOTE_E7 =1998,
  NOTE_F7 =2001,
  NOTE_FS7 =2004,
  NOTE_G7 =2006,
  NOTE_GS7 =2009,
  NOTE_A7 =2011,
  NOTE_AS7 =2013,
  NOTE_B7 =2015,
  NOTE_C8 =2017
} NOTES;
# 4 "pause.c" 2
# 1 "text.h" 1


void drawChar3(int, int, char, unsigned short);
void drawString3(int, int, char *, unsigned short);


void drawChar4(int col, int row, char ch, unsigned char colorIndex);
void drawString4(int col, int row, char *str, unsigned char colorIndex);
# 5 "pause.c" 2
# 1 "background.h" 1
# 21 "background.h"
extern const unsigned short backgroundBitmap[19200];


extern const unsigned short backgroundPal[256];
# 6 "pause.c" 2

int state;

void goPause(int score) {
    DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 512);
    state = PAUSE;
    fillScreen4(0);
    drawString4(10,50,"pause",1);
    drawString4(10,72,"press START to resume",1);

    drawString4(10,94,"score:",1);
    char buffer[10];
    sprintf(buffer, "%d", score);
    drawString4(52,94,buffer,1);

    waitForVBlank();
    flipPage();

}

void doPause() {
    if ((!(~(oldButtons) & ((1<<3))) && (~buttons & ((1<<3))))) {
        resumeGame();
    }
    if ((!(~(oldButtons) & ((1<<0))) && (~buttons & ((1<<0))))) {
        goHighScore();
    }
}
