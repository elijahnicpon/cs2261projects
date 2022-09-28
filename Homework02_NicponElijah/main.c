#include "mode3.h"
#include "print.h"
#include <stddef.h>

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

// typedef struct ballListNode {
//     Ball *ball;
//     struct ballListNode *next;
// } BallListNode;

// typedef struct {
//     BallListNode *head;
// } BallList;

void initBalls();
void updateBalls();
void updateBall(int i);
void initPlayers();
void draw11circle(int x, int y, u16 color);
void addNewBall(Ball *newBall);

// BallList balls;
Player p1, p2;

Ball balls[13];

enum STATE {PLAYING, FINISHED};

void doFinished() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        init();
        fillScreen(BLACK);
        goPlaying();
    }
}

void goFinished() {
    state = FINISHED;
    mgba_printf("switch to finished");
    if (p1.score > p2.score) {
        fillScreen(BLUE);
    } else {
        fillScreen(RED);
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
        /* code */
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

// void updateBalls() {
//     BallListNode *curr = balls.head;
//     while (curr->ball != NULL) {
//         if (curr->ball->active) {
//             updateBall(curr->ball);
//             curr = curr->next;
//         }
//     }
// }

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
            //TODO: spawn another
        } else {
            p2.score++;
            balls[i].active = 0;
            drawRectangle(balls[i].previousX, balls[i].previousY, 7,7, BLACK);
            drawPaddles();
            return;
        }
    } else if (balls[i].x >= 232) {
        if (balls[i].y + 6 > p2.y && balls[i].y - 6 < p2.y + paddleHeight) {
            balls[i].xSpeed *= -1;
            Ball newBall = {.x = balls[i].x, .y = balls[i].y, .active = 1, .previousX = balls[i].previousX, .previousY = balls[i].previousY, .xSpeed = balls[i].xSpeed, .ySpeed = balls[i].ySpeed * -1};
            addNewBall(&newBall);
            //TODO: spawn another
        } else {
            p1.score++;
            balls[i].active = 0;
            drawRectangle(balls[i].previousX, balls[i].previousY, 7,7, BLACK);
            drawPaddles();
            return;
        }
    }
    drawRectangle(balls[i].previousX, balls[i].previousY, 7,7, BLACK);
    drawRectangle(balls[i].x, balls[i].y, 7,7, WHITE);
    balls[i].previousX = balls[i].x;
    balls[i].previousY = balls[i].y;

    //mgba_printf("%d, %d", balls[i].x, balls[i].y);
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
    if (BUTTON_HELD(BUTTON_DOWN)) {
        p2.previousY = p2.y;
        p2.y += 1;
        if (p2.y >= 109) {
            p2.y = 109;
        }
        needtoupdatepaddles = 1;
    }
    if (BUTTON_HELD(BUTTON_UP)) {
        p2.previousY = p2.y;
        p2.y -= 1;
        if (p2.y <= 1) {
            p2.y = 1;
        }
        needtoupdatepaddles = 1;
    }

    if (BUTTON_HELD(BUTTON_B)) {
        p1.previousY = p1.y;
        p1.y += 1;
        if (p1.y >= 109) {
            p1.y = 109;
        }
        needtoupdatepaddles = 1;
    }
    if (BUTTON_HELD(BUTTON_L)) {
        p1.previousY = p1.y;
        p1.y -= 1;
        if (p1.y <= 1) {
            p1.y = 1;
        }
        needtoupdatepaddles = 1;
    }

    if (needtoupdatepaddles) {
        //mgba_printf("updating paddles");
        drawPaddles();
    }
    
}

void drawPaddles() {
    drawVerticalLine(0, p1.previousY, paddleHeight, BLACK);
    drawVerticalLine(239, p2.previousY, paddleHeight, BLACK);


    drawVerticalLine(0,p1.y,50,BLUE);
    drawVerticalLine(239,p2.y,50,RED);
}

void drawBoarders() {
    drawHorizontalLine(0,0,240,WHITE);
    drawHorizontalLine(0,159,240, WHITE);
    drawVerticalLine(0,p1.y,50,WHITE);
    drawVerticalLine(239,p2.y,50,WHITE);
}

//     /**
//  * @brief draws a circle with diameter 11 from center. 
//  * 
//  * @param x center coord
//  * @param y center coord
//  */
// void draw11circle(int x, int y, u16 color) {
//     //main circle
//     drawRectangle(x-5, y+5, 11, 11, color);
//     //erase left top corner
//     drawRectangle(x-5, y+5, 4 , 1, RED);
//     drawRectangle(x-5, y+5, 1 , 4, RED);
//     drawRectangle(x-4, y+4, 1 ,1, RED);
//     //erase right top corner
//     drawRectangle(x+2, y-5, 4 , 1, RED);
//     drawRectangle(x+5, y-5, 1 , 4, RED);
//     drawRectangle(x+4, y-4, 1 ,1, RED);
//     //erase bottom left corner
//     drawRectangle(x-5, y-2, 1 , 4, RED);
//     drawRectangle(x-5, y-5, 4 , 1, RED);
//     drawRectangle(x-4, y-4, 1 ,1, RED);
//     //erase bottom right corner
//     drawRectangle(x+2, y-5, 4 , 1, RED);
//     drawRectangle(x+5, y+2, 1 , 4, RED);
//     drawRectangle(x+4, y+4, 1 ,1, RED);
// }