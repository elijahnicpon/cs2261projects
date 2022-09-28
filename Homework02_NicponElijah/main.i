# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
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
# 2 "main.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 3 "main.c" 2
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 4 "main.c" 2


# 5 "main.c"
int time, timestep, paddleHeight, NUM_BALLS;
int state;
u16 buttons, oldButtons;


void drawBoarders();
void init();
void checkButtons();
void drawPaddles();
void doPlaying();



typedef struct {
    int score;
    int y;
    int previousY;

} Player;

typedef struct Ball {
    int x;
    int y;
    int previousX;
    int previousY;
    int xSpeed;
    int ySpeed;
    int active;
} Ball;
# 44 "main.c"
void initBalls();
void updateBalls();
void updateBall(int i);
void initPlayers();
void draw11circle(int x, int y, u16 color);
void addNewBall(Ball *newBall);


Player p1, p2;

Ball balls[13];

enum STATE {PLAYING, FINISHED};

void doFinished() {
    if (( (!(~oldButtons & (0x0008))) && (~(*(volatile u16*)0x04000130) & (0x0008)) )) {
        init();
        fillScreen(((0) | (0) << 5 | (0) << 10));
        goPlaying();
    }
}

void goFinished() {
    state = FINISHED;
    mgba_printf("switch to finished");
    if (p1.score > p2.score) {
        fillScreen(((0) | (0) << 5 | (31) << 10));
    } else {
        fillScreen(((31) | (0) << 5 | (0) << 10));
    }
}
void goPlaying() {
    state = PLAYING;
    drawBoarders();
    mgba_printf("switch to playing");
    drawPaddles();
}

int main() {

    mgba_open();
    mgba_printf("Debugging Initialized");
    init();


    while(1) {
        update3();
       switch (state)
       {
       case PLAYING:

        doPlaying();
        break;
       case FINISHED:
        doFinished();
        break;
       default:
        break;
       }
    }
}

void init() {
    init3();
    NUM_BALLS = 13;
    initPlayers();
    initBalls();
    paddleHeight = 50;
    goPlaying();
}
# 125 "main.c"
void updateBalls() {
    int noBalls = 1;
    for (int i = 0; i < NUM_BALLS; i++) {
        if (balls[i].active) {
            updateBall(i);
            noBalls = 0;
            mgba_printf("updating %d", i);
        }
    }
    if (noBalls) {
        initBalls();
    }
}

void addNewBall(Ball *newBall) {
    for (int i = 0; i < NUM_BALLS; i++) {
        if (balls[i].active == 0) {
            balls[i] = *newBall;
            mgba_printf("new ball at %d", i);
            return;
        }
    }
}

void updateBall(int i) {
    balls[i].x += balls[i].xSpeed;
    balls[i].y += balls[i].ySpeed;
    if (balls[i].y <= 7|| balls[i].y >= 152) {
        balls[i].ySpeed *= -1;
    }
    if (balls[i].x <= 1) {
        if (balls[i].y + 6 > p1.y && balls[i].y - 6 < p1.y + paddleHeight) {
            balls[i].xSpeed *= -1;
            Ball newBall = {.x = balls[i].x, .y = balls[i].y, .active = 1, .previousX = balls[i].previousX, .previousY = balls[i].previousY, .xSpeed = balls[i].xSpeed, .ySpeed = balls[i].ySpeed * -1};
            addNewBall(&newBall);

        } else {
            p2.score++;
            balls[i].active = 0;
            drawRectangle(balls[i].previousX, balls[i].previousY, 7,7, ((0) | (0) << 5 | (0) << 10));
            drawPaddles();
            return;
        }
    } else if (balls[i].x >= 232) {
        if (balls[i].y + 6 > p2.y && balls[i].y - 6 < p2.y + paddleHeight) {
            balls[i].xSpeed *= -1;
            Ball newBall = {.x = balls[i].x, .y = balls[i].y, .active = 1, .previousX = balls[i].previousX, .previousY = balls[i].previousY, .xSpeed = balls[i].xSpeed, .ySpeed = balls[i].ySpeed * -1};
            addNewBall(&newBall);

        } else {
            p1.score++;
            balls[i].active = 0;
            drawRectangle(balls[i].previousX, balls[i].previousY, 7,7, ((0) | (0) << 5 | (0) << 10));
            drawPaddles();
            return;
        }
    }
    drawRectangle(balls[i].previousX, balls[i].previousY, 7,7, ((0) | (0) << 5 | (0) << 10));
    drawRectangle(balls[i].x, balls[i].y, 7,7, ((31) | (31) << 5 | (31) << 10));
    balls[i].previousX = balls[i].x;
    balls[i].previousY = balls[i].y;


}

void initBalls() {
    for (int i = 0; i < NUM_BALLS; i++) {
        balls[i].x = 120;
        balls[i].y = 80;
        balls[i].previousX = 120;
        balls[i].previousY = 80;
        balls[i].xSpeed = 1;
        balls[i].ySpeed = 1;
        balls[i].active = 0;
    }
    balls[0].active = 1;
}

void initPlayers() {
    p1.y = 1;
    p1.previousY = 1;
    p1.score = 0;

    p2.y = 1;
    p2.previousY = 1;
    p2.score = 0;
}

void doPlaying() {
    checkButtons();
    updateBalls();
    waitForVBlank();
    if (p1.score >= 3 || p2.score >= 3) {
        goFinished();
    }
}

void checkButtons() {
    int needtoupdatepaddles = 0;
    if ((~(*(volatile u16*)0x04000130) & 0x0080)) {
        p2.previousY = p2.y;
        p2.y += 1;
        if (p2.y >= 109) {
            p2.y = 109;
        }
        needtoupdatepaddles = 1;
    }
    if ((~(*(volatile u16*)0x04000130) & 0x0040)) {
        p2.previousY = p2.y;
        p2.y -= 1;
        if (p2.y <= 1) {
            p2.y = 1;
        }
        needtoupdatepaddles = 1;
    }

    if ((~(*(volatile u16*)0x04000130) & 0x0002)) {
        p1.previousY = p1.y;
        p1.y += 1;
        if (p1.y >= 109) {
            p1.y = 109;
        }
        needtoupdatepaddles = 1;
    }
    if ((~(*(volatile u16*)0x04000130) & 0x0200)) {
        p1.previousY = p1.y;
        p1.y -= 1;
        if (p1.y <= 1) {
            p1.y = 1;
        }
        needtoupdatepaddles = 1;
    }

    if (needtoupdatepaddles) {

        drawPaddles();
    }

}

void drawPaddles() {
    drawVerticalLine(0, p1.previousY, paddleHeight, ((0) | (0) << 5 | (0) << 10));
    drawVerticalLine(239, p2.previousY, paddleHeight, ((0) | (0) << 5 | (0) << 10));


    drawVerticalLine(0,p1.y,50,((0) | (0) << 5 | (31) << 10));
    drawVerticalLine(239,p2.y,50,((31) | (0) << 5 | (0) << 10));
}

void drawBoarders() {
    drawHorizontalLine(0,0,240,((31) | (31) << 5 | (31) << 10));
    drawHorizontalLine(0,159,240, ((31) | (31) << 5 | (31) << 10));
    drawVerticalLine(0,p1.y,50,((31) | (31) << 5 | (31) << 10));
    drawVerticalLine(239,p2.y,50,((31) | (31) << 5 | (31) << 10));
}
