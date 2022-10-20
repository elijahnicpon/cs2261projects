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
	.file	"start.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"welcome to poke-run\000"
	.align	2
.LC1:
	.ascii	"press START to begin\000"
	.align	2
.LC2:
	.ascii	"highscore:\000"
	.align	2
.LC3:
	.ascii	"%d\000"
	.text
	.align	2
	.global	goStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goStart, %function
goStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	ip, .L4
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	r3, #512
	mov	r0, #3
	ldr	r4, .L4+8
	str	r5, [ip]
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+12
	ldr	r0, .L4+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+20
	mov	r3, #1
	mov	r1, #50
	mov	r0, #10
	ldr	r2, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r1, #72
	mov	r0, #10
	ldr	r2, .L4+28
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r1, #94
	mov	r0, #10
	ldr	r2, .L4+32
	mov	lr, pc
	bx	r4
	ldr	r6, .L4+36
	ldr	r3, .L4+40
	mov	r0, r6
	ldr	r2, [r3]
	ldr	r1, .L4+44
	ldr	r3, .L4+48
	mov	lr, pc
	bx	r3
	mov	r2, r6
	mov	r1, #94
	mov	r0, #74
	mov	r3, #1
	mov	lr, pc
	bx	r4
	ldr	r2, .L4+52
	ldr	r3, .L4+56
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+60
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	state
	.word	backgroundPal
	.word	DMANow
	.word	drawFullScreenImage4
	.word	backgroundBitmap
	.word	drawString4
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	buffer
	.word	highScore
	.word	.LC3
	.word	sprintf
	.word	time
	.word	waitForVBlank
	.word	flipPage
	.size	goStart, .-goStart
	.align	2
	.global	doStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	doStart, %function
doStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L19
	ldr	r3, .L19+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #8
	bne	.L15
	ldr	r4, .L19+8
.L7:
	tst	r3, #1
	beq	.L8
	ldr	r3, .L19+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L18
.L8:
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	ldr	r2, .L19+12
	ldrh	r2, [r2]
	tst	r2, #8
	ldr	r4, .L19+8
	bne	.L7
	ldr	r3, .L19+16
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L7
.L18:
	ldr	r3, .L19+20
	mov	lr, pc
	bx	r3
	b	.L8
.L20:
	.align	2
.L19:
	.word	oldButtons
	.word	waitForVBlank
	.word	time
	.word	buttons
	.word	goGame
	.word	goHighScore
	.size	doStart, .-doStart
	.comm	buffer,10,4
	.comm	highScore,4,4
	.comm	time,4,4
	.comm	state,4,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
