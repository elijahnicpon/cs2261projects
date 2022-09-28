#include "mode3.h"
#include "print.h"

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
    // testing
    // frame0();
    // frame1();
    // frame2();
    // frame3();
    // yeetFrame0();
    // yeetFrame1();
    // yeetFrame2();
    // yeetFrame3();
    while(1) {
        if (buttonBuffer <= 0) {
            mgba_printf("checkButtons!");
            checkButtons();
        }
        // checkButtons();
        if (time % timestep == 0) { //timestep not working??
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
    looping = 1; // 0 -> not playing; 1 -> playing  
    forward = 1; // 1 -> animation going forward; 0 -> animation going back
    frame = 0; // 0-3
    prevFrame = 0; // 0-3
    buttonBuffer = 0;
    always();
}

void always() {
    drawRectangle(230, 40, 10, 40, WHITE); // board
    drawRectangle(200, 75, 30, 3, RED); // rim
    drawRectangle(235, 80, 2, 100, GRAY); // pole
    //net
    drawNeg45line(202, 78, 12, WHITE);
    drawNeg45line(212, 78, 12, WHITE);
    drawNeg45line(222, 78, 6, WHITE);
    draw45line(208, 78, 6, WHITE);
    draw45line(218, 78, 12, WHITE);
    draw45line(228, 78, 12, WHITE);
}

void drawBall(u8 x, u8 y) {
    //ball
    drawSquare(x, y, 17, ORANGE);
    //right top corner
    drawNeg45line(x + 13, y, 7, BLACK);
    drawNeg45line(x + 14, y, 5, BLACK);
    drawNeg45line(x + 15, y, 3, BLACK);
    drawNeg45line(x + 16, y, 1, BLACK);
    //left bot corner
    drawNeg45line(x, y + 13, 7, BLACK);
    drawNeg45line(x, y + 14, 5, BLACK);
    drawNeg45line(x, y + 15, 3, BLACK);
    drawNeg45line(x, y + 16, 1, BLACK);
    //top left corner
    draw45line(x + 3, y, 7, BLACK);
    draw45line(x + 2, y, 5, BLACK);
    draw45line(x + 1, y, 3, BLACK);
    draw45line(x, y, 1, BLACK);
    //bottom right corner
    draw45line(x + 16, y + 13, 7, BLACK);
    draw45line(x + 16, y + 14, 5, BLACK);
    draw45line(x + 16, y + 15, 3, BLACK);
    draw45line(x + 16, y + 16, 1, BLACK);
    //stripes
    drawVerticalLine(x + 8, y, 17, BLACK);
    drawHorizontalLine(x, y + 4, 17, BLACK);
    drawHorizontalLine(x, y + 8, 17, BLACK);
    drawHorizontalLine(x, y + 12, 17, BLACK);
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

    //erase();

    switch (frame) {
        case 0: frame0(); break;
        case 1: frame1(); break;
        case 2: frame2(); break;
        case 3: frame3(); break;
    }
    mgba_printf_level(MGBA_LOG_DEBUG, "UPDATE CALLED! VARS@TERMINATION\nframe: %d; prevFrame: %d; time: %d; timestep:%d; buttonBuffer:%d", frame, prevFrame, time, timestep, buttonBuffer);
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
    // NEXT FRAME
    if (BUTTON_PRESSED(BUTTON_A)) {
        frame++;
        frame = frame % 4;
        aButtonWasPushed = 1;
    }
    // PREV FRAME
	if (BUTTON_PRESSED(BUTTON_B)) {
        frame--;
        frame = frame % 4;
        aButtonWasPushed = 1;
	}
    // TOGGLE PLAYING
    if (BUTTON_PRESSED(BUTTON_START)) {
        if (looping) {
            looping = 0;
        } else {
            looping = 1;
        }
        aButtonWasPushed = 1;
    }
    // TOGGLE DIRECTION
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        if (forward) {
            forward = 0;
        } else {
            forward = 1;
        }
        aButtonWasPushed = 1;
    }
    // TO FIRST FRAME
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        frame = 0;
        aButtonWasPushed = 1;
    }
    // TO LAST FRAME
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        frame = 3;
        aButtonWasPushed = 1;
    }
    // SPEED UP note: need 5 speeds.
    if (BUTTON_PRESSED(BUTTON_UP)) {
        timestep = timestep - 1;
        if (timestep < 1) {
            timestep = 1;
        }
        aButtonWasPushed = 1;
    }
    // SPEED DOWN
    if (BUTTON_PRESSED(BUTTON_DOWN)) {
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
    drawSquare(15,130,17,BLACK);
}

void frame1() {
    drawBall(75, 60);
}
void yeetFrame1() {
    drawSquare(75,60,17,BLACK);
}

void frame2() {
    drawBall(135, 40);
}
void yeetFrame2(){
    drawSquare(135,40,17,BLACK);
}

void frame3() {
    drawBall(206,68);
    always();
}
void yeetFrame3() {
    drawSquare(206,68,17,BLACK);
    always();
}
