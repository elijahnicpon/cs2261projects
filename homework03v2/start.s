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
	.ascii	"welcome to idk game!\000"
	.align	2
.LC1:
	.ascii	"press start to begin\000"
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
	ldr	r5, .L4
	ldr	r0, .L4+4
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+12
	mov	r3, r5
	mov	r1, #50
	mov	r0, #10
	ldr	r2, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, r5
	ldr	r2, .L4+20
	mov	r1, #72
	mov	r0, #10
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+24
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	5319
	.word	30686
	.word	fillScreen
	.word	drawString
	.word	.LC0
	.word	.LC1
	.word	state
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
	ldr	r3, .L15
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L15+4
	ldrh	r3, [r3, #48]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L15+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	oldButtons
	.word	67109120
	.word	goPlaying
	.size	doStart, .-doStart
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
