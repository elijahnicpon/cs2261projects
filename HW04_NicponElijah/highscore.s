	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"highscore.c"
	.text
	.align	2
	.global	doHighScore
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	doHighScore, %function
doHighScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L11
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L11+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L11+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	oldButtons
	.word	buttons
	.word	goStart
	.size	doHighScore, .-doHighScore
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"HIGHSCORES\000"
	.align	2
.LC1:
	.ascii	"press START to return to start\000"
	.align	2
.LC2:
	.ascii	"highscore:\000"
	.align	2
.LC3:
	.ascii	"%d\000"
	.text
	.align	2
	.global	goHighScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	goHighScore, %function
goHighScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #4
	ldr	ip, .L15
	sub	sp, sp, #16
	mov	r2, #83886080
	ldr	r1, .L15+4
	mov	r3, #512
	mov	r0, #3
	ldr	r4, .L15+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	ldr	r3, .L15+12
	ldr	r0, .L15+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L15+20
	mov	r3, #1
	mov	r1, #50
	mov	r0, #10
	ldr	r2, .L15+24
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r1, #72
	mov	r0, #10
	ldr	r2, .L15+28
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r1, #94
	mov	r0, #10
	ldr	r2, .L15+32
	mov	lr, pc
	bx	r4
	ldr	r3, .L15+36
	ldr	r1, .L15+40
	ldr	r2, [r3]
	add	r0, sp, #4
	ldr	r3, .L15+44
	mov	lr, pc
	bx	r3
	mov	r1, #94
	mov	r0, #74
	add	r2, sp, #4
	mov	r3, #1
	mov	lr, pc
	bx	r4
	ldr	r3, .L15+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+52
	mov	lr, pc
	bx	r3
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	state
	.word	backgroundPal
	.word	DMANow
	.word	drawFullScreenImage4
	.word	backgroundBitmap
	.word	drawString4
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	highScore
	.word	.LC3
	.word	sprintf
	.word	waitForVBlank
	.word	flipPage
	.size	goHighScore, .-goHighScore
	.comm	NOTES,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
