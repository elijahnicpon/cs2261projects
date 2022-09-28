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

void init();
void update();
void frame0();
void yeetFrame0();
void frame1();
void yeetFrame1();
void frame2();
void yeetFrame2();
void frame3();
void yeetFrame3();
void drawBall(u8 x, u8 y);
void checkButtons();
void erase();

u16 looping, forward, prevFrame, frame, buttons, oldButtons;
int time, timestep, buttonBuffer;


int main() {
    init();
    mgba_open();
    mgba_printf("Debugging Initialized");
# 35 "main.c"
    while(1) {
        if (buttonBuffer <= 0) {
            mgba_printf("checkButtons!");
            checkButtons();
        }

        if (time % timestep == 0) {
            prevFrame = frame;
            update();
        }

        waitForVBlank();
        time++;
        buttonBuffer--;
    }
    return 0;
}

void init() {
    init3();
    looping = 1;
    forward = 1;
    frame = 0;
    prevFrame = 0;
    buttonBuffer = 0;
    always();
}

void always() {
    drawRectangle(230, 40, 10, 40, ((31) | (31) << 5 | (31) << 10));
    drawRectangle(200, 75, 30, 3, ((31) | (0) << 5 | (0) << 10));
    drawRectangle(235, 80, 2, 100, ((15) | (15) << 5 | (15) << 10));

    drawNeg45line(202, 78, 12, ((31) | (31) << 5 | (31) << 10));
    drawNeg45line(212, 78, 12, ((31) | (31) << 5 | (31) << 10));
    drawNeg45line(222, 78, 6, ((31) | (31) << 5 | (31) << 10));
    draw45line(208, 78, 6, ((31) | (31) << 5 | (31) << 10));
    draw45line(218, 78, 12, ((31) | (31) << 5 | (31) << 10));
    draw45line(228, 78, 12, ((31) | (31) << 5 | (31) << 10));
}

void drawBall(u8 x, u8 y) {

    drawSquare(x, y, 17, ((31) | (20) << 5 | (0) << 10));

    drawNeg45line(x + 13, y, 7, ((0) | (0) << 5 | (0) << 10));
    drawNeg45line(x + 14, y, 5, ((0) | (0) << 5 | (0) << 10));
    drawNeg45line(x + 15, y, 3, ((0) | (0) << 5 | (0) << 10));
    drawNeg45line(x + 16, y, 1, ((0) | (0) << 5 | (0) << 10));

    drawNeg45line(x, y + 13, 7, ((0) | (0) << 5 | (0) << 10));
    drawNeg45line(x, y + 14, 5, ((0) | (0) << 5 | (0) << 10));
    drawNeg45line(x, y + 15, 3, ((0) | (0) << 5 | (0) << 10));
    drawNeg45line(x, y + 16, 1, ((0) | (0) << 5 | (0) << 10));

    draw45line(x + 3, y, 7, ((0) | (0) << 5 | (0) << 10));
    draw45line(x + 2, y, 5, ((0) | (0) << 5 | (0) << 10));
    draw45line(x + 1, y, 3, ((0) | (0) << 5 | (0) << 10));
    draw45line(x, y, 1, ((0) | (0) << 5 | (0) << 10));

    draw45line(x + 16, y + 13, 7, ((0) | (0) << 5 | (0) << 10));
    draw45line(x + 16, y + 14, 5, ((0) | (0) << 5 | (0) << 10));
    draw45line(x + 16, y + 15, 3, ((0) | (0) << 5 | (0) << 10));
    draw45line(x + 16, y + 16, 1, ((0) | (0) << 5 | (0) << 10));

    drawVerticalLine(x + 8, y, 17, ((0) | (0) << 5 | (0) << 10));
    drawHorizontalLine(x, y + 4, 17, ((0) | (0) << 5 | (0) << 10));
    drawHorizontalLine(x, y + 8, 17, ((0) | (0) << 5 | (0) << 10));
    drawHorizontalLine(x, y + 12, 17, ((0) | (0) << 5 | (0) << 10));
}

void update() {
    update3();
    if (looping) {
        if (forward) {
            frame++;
        } else {
            frame--;
        }
        frame = frame % 4;
    }
    switch (prevFrame) {
        case 0: yeetFrame0(); break;
        case 1: yeetFrame1(); break;
        case 2: yeetFrame2(); break;
        case 3: yeetFrame3(); break;
    }



    switch (frame) {
        case 0: frame0(); break;
        case 1: frame1(); break;
        case 2: frame2(); break;
        case 3: frame3(); break;
    }
    mgba_printf_level(4, "UPDATE CALLED! VARS@TERMINATION\nframe: %d; prevFrame: %d; time: %d; timestep:%d; buttonBuffer:%d", frame, prevFrame, time, timestep, buttonBuffer);
}

void erase() {
    yeetFrame0();
    yeetFrame1();
    yeetFrame2();
    yeetFrame3();
}

void checkButtons() {
    int aButtonWasPushed = 0;
    int oldFrame = frame;

    if (( (!(~oldButtons & (0x0001))) && (~(*(volatile u16*)0x04000130) & (0x0001)) )) {
        frame++;
        frame = frame % 4;
        aButtonWasPushed = 1;
    }

 if (( (!(~oldButtons & (0x0002))) && (~(*(volatile u16*)0x04000130) & (0x0002)) )) {
        frame--;
        frame = frame % 4;
        aButtonWasPushed = 1;
 }

    if (( (!(~oldButtons & (0x0008))) && (~(*(volatile u16*)0x04000130) & (0x0008)) )) {
        if (looping) {
            looping = 0;
        } else {
            looping = 1;
        }
        aButtonWasPushed = 1;
    }

    if (( (!(~oldButtons & (0x0004))) && (~(*(volatile u16*)0x04000130) & (0x0004)) )) {
        if (forward) {
            forward = 0;
        } else {
            forward = 1;
        }
        aButtonWasPushed = 1;
    }

    if (( (!(~oldButtons & (0x0020))) && (~(*(volatile u16*)0x04000130) & (0x0020)) )) {
        frame = 0;
        aButtonWasPushed = 1;
    }

    if (( (!(~oldButtons & (0x0010))) && (~(*(volatile u16*)0x04000130) & (0x0010)) )) {
        frame = 3;
        aButtonWasPushed = 1;
    }

    if (( (!(~oldButtons & (0x0040))) && (~(*(volatile u16*)0x04000130) & (0x0040)) )) {
        timestep = timestep - 1;
        if (timestep < 1) {
            timestep = 1;
        }
        aButtonWasPushed = 1;
    }

    if (( (!(~oldButtons & (0x0080))) && (~(*(volatile u16*)0x04000130) & (0x0080)) )) {
        timestep = timestep + 1;
        if (timestep > 20) {
            timestep = 20;
        }
        aButtonWasPushed = 1;
    }

    if (aButtonWasPushed) {
        prevFrame = oldFrame;
        buttonBuffer = 8;
        update();
    }
}

void frame0() {
    drawBall(15, 130);
}
void yeetFrame0(){
    drawSquare(15,130,17,((0) | (0) << 5 | (0) << 10));
}

void frame1() {
    drawBall(75, 60);
}
void yeetFrame1() {
    drawSquare(75,60,17,((0) | (0) << 5 | (0) << 10));
}

void frame2() {
    drawBall(135, 40);
}
void yeetFrame2(){
    drawSquare(135,40,17,((0) | (0) << 5 | (0) << 10));
}

void frame3() {
    drawBall(206,68);
    always();
}
void yeetFrame3() {
    drawSquare(206,68,17,((0) | (0) << 5 | (0) << 10));
    always();
}
