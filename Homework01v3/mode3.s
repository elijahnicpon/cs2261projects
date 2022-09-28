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
	.file	"mode3.c"
	.text
	.align	2
	.global	drawVerticalLine
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVerticalLine, %function
drawVerticalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	subs	ip, r2, #0
	bxeq	lr
	sub	ip, ip, #1
	and	ip, ip, #255
	add	ip, ip, r1
	rsb	r2, r1, r1, lsl #4
	add	r1, r0, #50331648
	rsb	ip, ip, ip, lsl #4
	add	r2, r0, r2, lsl #4
	add	r1, r1, #240
	lsl	r2, r2, #1
	add	r1, r1, ip, lsl #4
	add	r2, r2, #100663296
	lsl	r1, r1, #1
.L3:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r2, r1
	bne	.L3
	bx	lr
	.size	drawVerticalLine, .-drawVerticalLine
	.align	2
	.global	drawHorizontalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine, %function
drawHorizontalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	subs	lr, r2, #0
	beq	.L7
	add	ip, r0, #50331648
	rsb	r2, r1, r1, lsl #4
	sub	lr, lr, #1
	add	ip, ip, #1
	add	r1, ip, r2, lsl #4
	and	lr, lr, #255
	add	r2, r0, r2, lsl #4
	add	r1, r1, lr
	lsl	r2, r2, #1
	lsl	r1, r1, #1
	add	r2, r2, #100663296
.L9:
	strh	r3, [r2], #2	@ movhi
	cmp	r2, r1
	bne	.L9
.L7:
	ldr	lr, [sp], #4
	bx	lr
	.size	drawHorizontalLine, .-drawHorizontalLine
	.align	2
	.global	drawSquare
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSquare, %function
drawSquare:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxeq	lr
	mov	ip, r0
	sub	r2, r2, #1
	push	{r4, lr}
	and	r4, r2, #255
	add	lr, r1, r4
	add	r2, r0, #50331648
	rsb	r1, r1, r1, lsl #4
	rsb	lr, lr, lr, lsl #4
	add	r0, r0, r1, lsl #4
	add	r2, r2, #240
	add	r2, r2, lr, lsl #4
	lsl	r0, r0, #1
	add	lr, ip, #1
	add	r0, r0, #100663296
	lsl	r1, r2, #1
	add	lr, lr, r4
.L15:
	mov	r2, r0
.L16:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	cmp	r1, r2
	bne	.L16
	add	ip, ip, #1
	cmp	ip, lr
	add	r0, r0, #2
	add	r1, r1, #2
	bne	.L15
	pop	{r4, lr}
	bx	lr
	.size	drawSquare, .-drawSquare
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L26:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L26
	mov	r2, #67108864
.L27:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L27
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	drawRectangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	add	r4, r3, r1
	cmp	r1, r4
	ldrh	r5, [sp, #12]
	bge	.L31
	add	lr, r2, r0
.L33:
	cmp	r0, lr
	rsblt	ip, r1, r1, lsl #4
	movlt	r2, r0
	movlt	r3, r0
	lsllt	ip, ip, #4
	bge	.L36
.L34:
	add	r3, ip, r3
	add	r2, r2, #1
	and	r2, r2, #255
	lsl	r3, r3, #1
	add	r3, r3, #100663296
	cmp	r2, lr
	strh	r5, [r3]	@ movhi
	mov	r3, r2
	blt	.L34
.L36:
	add	r1, r1, #1
	and	r1, r1, #255
	cmp	r1, r4
	blt	.L33
.L31:
	pop	{r4, r5, lr}
	bx	lr
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	draw45line
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw45line, %function
draw45line:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	bxeq	lr
	mov	ip, r0
	sub	r0, r0, r2
	and	r0, r0, #255
	add	r1, ip, r1
.L41:
	sub	r2, r1, ip
	and	r2, r2, #255
	rsb	r2, r2, r2, lsl #4
	add	r2, ip, r2, lsl #4
	sub	ip, ip, #1
	lsl	r2, r2, #1
	and	ip, ip, #255
	add	r2, r2, #100663296
	cmp	ip, r0
	strh	r3, [r2]	@ movhi
	bne	.L41
	bx	lr
	.size	draw45line, .-draw45line
	.align	2
	.global	drawNeg45line
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawNeg45line, %function
drawNeg45line:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	bxeq	lr
	mov	ip, r0
	add	r0, r0, r2
	and	r0, r0, #255
	sub	r1, r1, ip
.L48:
	add	r2, ip, r1
	and	r2, r2, #255
	rsb	r2, r2, r2, lsl #4
	add	r2, ip, r2, lsl #4
	add	ip, ip, #1
	lsl	r2, r2, #1
	and	ip, ip, #255
	add	r2, r2, #100663296
	cmp	ip, r0
	strh	r3, [r2]	@ movhi
	bne	.L48
	bx	lr
	.size	drawNeg45line, .-drawNeg45line
	.align	2
	.global	init3
	.syntax unified
	.arm
	.fpu softvfp
	.type	init3, %function
init3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	ldr	r1, .L54
	ldr	r3, .L54+4
	strh	r1, [r2]	@ movhi
	ldrh	r3, [r3, #48]
	bx	lr
.L55:
	.align	2
.L54:
	.word	1027
	.word	67109120
	.size	init3, .-init3
	.align	2
	.global	update3
	.syntax unified
	.arm
	.fpu softvfp
	.type	update3, %function
update3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L57
	ldr	r1, .L57+4
	ldrh	r0, [r3]
	ldr	r2, .L57+8
	strh	r0, [r1]	@ movhi
	ldrh	r2, [r2, #48]
	strh	r2, [r3]	@ movhi
	bx	lr
.L58:
	.align	2
.L57:
	.word	buttons
	.word	oldButtons
	.word	67109120
	.size	update3, .-update3
	.ident	"GCC: (devkitARM release 53) 9.1.0"
