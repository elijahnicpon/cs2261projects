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
	.file	"end.c"
	.text
	.align	2
	.global	doEnd
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	doEnd, %function
doEnd:
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
	.size	doEnd, .-doEnd
	.align	2
	.global	max
	.syntax unified
	.arm
	.fpu softvfp
	.type	max, %function
max:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, r1
	movlt	r0, r1
	bx	lr
	.size	max, .-max
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"you were caught!\000"
	.align	2
.LC1:
	.ascii	"press START to restart\000"
	.align	2
.LC2:
	.ascii	"highscore:\000"
	.align	2
.LC3:
	.ascii	"%d\000"
	.align	2
.LC4:
	.ascii	"your score:\000"
	.text
	.align	2
	.global	goEnd
	.syntax unified
	.arm
	.fpu softvfp
	.type	goEnd, %function
goEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r3, #512
	sub	sp, sp, #20
	mov	r5, r0
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16
	ldr	r4, .L16+4
	mov	lr, pc
	bx	r4
	mov	r1, #3
	ldr	r2, .L16+8
	mov	r0, #0
	ldr	r3, .L16+12
	ldr	r4, .L16+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #1
	mov	r1, #50
	mov	r0, #10
	ldr	r2, .L16+20
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r1, #72
	mov	r0, #10
	ldr	r2, .L16+24
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r1, #94
	mov	r0, #10
	ldr	r2, .L16+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+32
	ldr	r2, [r3]
	cmp	r5, r2
	movge	r2, r5
	ldr	r7, .L16+36
	ldr	r6, .L16+40
	mov	r1, r7
	add	r0, sp, #4
	str	r2, [r3]
	mov	lr, pc
	bx	r6
	add	r2, sp, #4
	mov	r3, #1
	mov	r1, #94
	mov	r0, #74
	mov	lr, pc
	bx	r4
	mov	r3, #1
	mov	r1, #116
	mov	r0, #10
	ldr	r2, .L16+44
	mov	lr, pc
	bx	r4
	mov	r2, r5
	mov	r1, r7
	add	r0, sp, #4
	mov	lr, pc
	bx	r6
	mov	r1, #116
	mov	r0, #80
	add	r2, sp, #4
	mov	r3, #1
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+52
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	backgroundPal
	.word	DMANow
	.word	state
	.word	fillScreen4
	.word	drawString4
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	highScore
	.word	.LC3
	.word	sprintf
	.word	.LC4
	.word	waitForVBlank
	.word	flipPage
	.size	goEnd, .-goEnd
	.comm	NOTES,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
