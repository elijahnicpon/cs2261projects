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
	.file	"pause.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"pause\000"
	.align	2
.LC1:
	.ascii	"press START to resume\000"
	.align	2
.LC2:
	.ascii	"score:\000"
	.align	2
.LC3:
	.ascii	"%d\000"
	.text
	.align	2
	.global	goPause
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goPause, %function
goPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r3, #512
	sub	sp, sp, #20
	mov	r5, r0
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	mov	r1, #2
	ldr	r2, .L4+8
	mov	r0, #0
	ldr	r3, .L4+12
	ldr	r4, .L4+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #1
	mov	r1, #50
	mov	r0, #10
	ldr	r2, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r1, #72
	mov	r0, #10
	ldr	r2, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r1, #94
	mov	r0, #10
	ldr	r2, .L4+28
	mov	lr, pc
	bx	r4
	mov	r2, r5
	ldr	r1, .L4+32
	ldr	r3, .L4+36
	add	r0, sp, #4
	mov	lr, pc
	bx	r3
	mov	r1, #94
	mov	r0, #52
	add	r2, sp, #4
	mov	r3, #1
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+44
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	backgroundPal
	.word	DMANow
	.word	state
	.word	fillScreen4
	.word	drawString4
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	sprintf
	.word	waitForVBlank
	.word	flipPage
	.size	goPause, .-goPause
	.align	2
	.global	doPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	doPause, %function
doPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L18
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L7
	ldr	r2, .L18+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L16
.L7:
	tst	r3, #1
	beq	.L6
	ldr	r3, .L18+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L17
.L6:
	pop	{r4, lr}
	bx	lr
.L17:
	ldr	r3, .L18+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L16:
	ldr	r3, .L18+12
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L7
.L19:
	.align	2
.L18:
	.word	oldButtons
	.word	buttons
	.word	goHighScore
	.word	resumeGame
	.size	doPause, .-doPause
	.comm	NOTES,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
