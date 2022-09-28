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
	.file	"main.c"
	.text
	.align	2
	.global	always
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	always, %function
always:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #40
	push	{r4, r5, lr}
	ldr	r4, .L4
	sub	sp, sp, #12
	ldr	r5, .L4+4
	mov	r1, r3
	mov	r2, #10
	mov	r0, #230
	str	r4, [sp]
	mov	lr, pc
	bx	r5
	mov	r2, #31
	mov	r3, #3
	str	r2, [sp]
	mov	r1, #75
	mov	r2, #30
	mov	r0, #200
	mov	lr, pc
	bx	r5
	ldr	r2, .L4+8
	mov	r3, #100
	str	r2, [sp]
	mov	r1, #80
	mov	r2, #2
	mov	r0, #235
	mov	lr, pc
	bx	r5
	ldr	r5, .L4+12
	mov	r3, r4
	mov	r2, #12
	mov	r1, #78
	mov	r0, #202
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #12
	mov	r1, #78
	mov	r0, #212
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #6
	mov	r1, #78
	mov	r0, #222
	mov	lr, pc
	bx	r5
	ldr	r5, .L4+16
	mov	r3, r4
	mov	r2, #6
	mov	r1, #78
	mov	r0, #208
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #12
	mov	r1, #78
	mov	r0, #218
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #12
	mov	r1, #78
	mov	r0, #228
	mov	lr, pc
	bx	r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	32767
	.word	drawRectangle
	.word	15855
	.word	drawNeg45line
	.word	draw45line
	.size	always, .-always
	.align	2
	.global	init
	.syntax unified
	.arm
	.fpu softvfp
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	mov	r2, #1
	mov	r3, #0
	ldr	r1, .L8+4
	ldr	lr, .L8+8
	strh	r2, [r1]	@ movhi
	ldr	ip, .L8+12
	ldr	r0, .L8+16
	ldr	r1, .L8+20
	strh	r2, [lr]	@ movhi
	pop	{r4, lr}
	strh	r3, [ip]	@ movhi
	strh	r3, [r0]	@ movhi
	str	r3, [r1]
	b	always
.L9:
	.align	2
.L8:
	.word	init3
	.word	looping
	.word	forward
	.word	frame
	.word	prevFrame
	.word	buttonBuffer
	.size	init, .-init
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	mov	r4, r1
	mov	r2, #17
	ldr	r3, .L12
	ldr	r6, .L12+4
	mov	lr, pc
	bx	r6
	add	r0, r5, #13
	ldr	r6, .L12+8
	mov	r1, r4
	mov	r3, #0
	mov	r2, #7
	and	r0, r0, #255
	mov	lr, pc
	bx	r6
	add	r0, r5, #14
	mov	r1, r4
	mov	r3, #0
	mov	r2, #5
	and	r0, r0, #255
	mov	lr, pc
	bx	r6
	add	r7, r5, #16
	add	r0, r5, #15
	and	r7, r7, #255
	mov	r1, r4
	mov	r3, #0
	mov	r2, #3
	and	r0, r0, #255
	add	fp, r4, #13
	mov	lr, pc
	bx	r6
	and	fp, fp, #255
	mov	r0, r7
	mov	r1, r4
	mov	r3, #0
	mov	r2, #1
	add	r10, r4, #14
	mov	lr, pc
	bx	r6
	and	r10, r10, #255
	mov	r1, fp
	mov	r0, r5
	mov	r3, #0
	mov	r2, #7
	add	r9, r4, #15
	mov	lr, pc
	bx	r6
	and	r9, r9, #255
	mov	r1, r10
	mov	r0, r5
	mov	r3, #0
	mov	r2, #5
	add	r8, r4, #16
	mov	lr, pc
	bx	r6
	and	r8, r8, #255
	mov	r1, r9
	mov	r0, r5
	mov	r3, #0
	mov	r2, #3
	mov	lr, pc
	bx	r6
	mov	r1, r8
	mov	r0, r5
	mov	r3, #0
	mov	r2, #1
	mov	lr, pc
	bx	r6
	add	r0, r5, #3
	ldr	r6, .L12+12
	mov	r1, r4
	mov	r3, #0
	mov	r2, #7
	and	r0, r0, #255
	mov	lr, pc
	bx	r6
	add	r0, r5, #2
	mov	r1, r4
	mov	r3, #0
	mov	r2, #5
	and	r0, r0, #255
	mov	lr, pc
	bx	r6
	add	r0, r5, #1
	mov	r1, r4
	mov	r3, #0
	mov	r2, #3
	and	r0, r0, #255
	mov	lr, pc
	bx	r6
	mov	r1, r4
	mov	r0, r5
	mov	r3, #0
	mov	r2, #1
	mov	lr, pc
	bx	r6
	mov	r1, fp
	mov	r0, r7
	mov	r3, #0
	mov	r2, #7
	mov	lr, pc
	bx	r6
	mov	r1, r10
	mov	r0, r7
	mov	r3, #0
	mov	r2, #5
	mov	lr, pc
	bx	r6
	mov	r1, r9
	mov	r0, r7
	mov	r3, #0
	mov	r2, #3
	mov	lr, pc
	bx	r6
	mov	r1, r8
	mov	r0, r7
	mov	r3, #0
	mov	r2, #1
	mov	lr, pc
	bx	r6
	add	r0, r5, #8
	mov	r1, r4
	mov	r3, #0
	mov	r2, #17
	ldr	r6, .L12+16
	and	r0, r0, #255
	mov	lr, pc
	bx	r6
	add	r1, r4, #4
	ldr	r6, .L12+20
	mov	r0, r5
	mov	r3, #0
	mov	r2, #17
	and	r1, r1, #255
	mov	lr, pc
	bx	r6
	add	r1, r4, #8
	mov	r0, r5
	mov	r3, #0
	mov	r2, #17
	and	r1, r1, #255
	mov	lr, pc
	bx	r6
	add	r1, r4, #12
	mov	r0, r5
	mov	r3, #0
	mov	r2, #17
	and	r1, r1, #255
	mov	lr, pc
	bx	r6
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	671
	.word	drawSquare
	.word	drawNeg45line
	.word	draw45line
	.word	drawVerticalLine
	.word	drawHorizontalLine
	.size	drawBall, .-drawBall
	.align	2
	.global	frame0
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame0, %function
frame0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #130
	mov	r0, #15
	b	drawBall
	.size	frame0, .-frame0
	.align	2
	.global	yeetFrame0
	.syntax unified
	.arm
	.fpu softvfp
	.type	yeetFrame0, %function
yeetFrame0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #0
	ldr	r4, .L17
	mov	r2, #17
	mov	r1, #130
	mov	r0, #15
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	drawSquare
	.size	yeetFrame0, .-yeetFrame0
	.align	2
	.global	frame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame1, %function
frame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #60
	mov	r0, #75
	b	drawBall
	.size	frame1, .-frame1
	.align	2
	.global	yeetFrame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	yeetFrame1, %function
yeetFrame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #0
	ldr	r4, .L22
	mov	r2, #17
	mov	r1, #60
	mov	r0, #75
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	drawSquare
	.size	yeetFrame1, .-yeetFrame1
	.align	2
	.global	frame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame2, %function
frame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #40
	mov	r0, #135
	b	drawBall
	.size	frame2, .-frame2
	.align	2
	.global	yeetFrame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	yeetFrame2, %function
yeetFrame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #0
	ldr	r4, .L27
	mov	r2, #17
	mov	r1, #40
	mov	r0, #135
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	drawSquare
	.size	yeetFrame2, .-yeetFrame2
	.align	2
	.global	frame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame3, %function
frame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #68
	mov	r0, #206
	bl	drawBall
	pop	{r4, lr}
	b	always
	.size	frame3, .-frame3
	.align	2
	.global	yeetFrame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	yeetFrame3, %function
yeetFrame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #0
	ldr	r4, .L33
	mov	r2, #17
	mov	r1, #68
	mov	r0, #206
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	always
.L34:
	.align	2
.L33:
	.word	drawSquare
	.size	yeetFrame3, .-yeetFrame3
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"UPDATE CALLED! VARS@TERMINATION\012frame: %d; prevF"
	.ascii	"rame: %d; time: %d; timestep:%d; buttonBuffer:%d\000"
	.text
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L55
	sub	sp, sp, #16
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+4
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L53
	ldr	r4, .L55+8
.L36:
	ldr	r5, .L55+12
	ldrh	r3, [r5]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L39
.L41:
	.word	.L44
	.word	.L43
	.word	.L42
	.word	.L40
.L40:
	bl	yeetFrame3
.L39:
	ldrh	r2, [r4]
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L45
.L47:
	.word	.L50
	.word	.L49
	.word	.L48
	.word	.L46
.L46:
	mov	r1, #68
	mov	r0, #206
	bl	drawBall
	bl	always
	ldrh	r2, [r4]
.L45:
	ldr	r0, .L55+16
	ldr	r1, .L55+20
	ldr	r3, .L55+24
	ldr	ip, [r0]
	ldr	r0, [r1]
	ldr	r1, [r3]
	ldr	r4, .L55+28
	stmib	sp, {r0, ip}
	str	r1, [sp]
	mov	r0, #4
	ldrh	r3, [r5]
	ldr	r1, .L55+32
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L48:
	mov	r1, #40
	mov	r0, #135
	bl	drawBall
	ldrh	r2, [r4]
	b	.L45
.L49:
	mov	r1, #60
	mov	r0, #75
	bl	drawBall
	ldrh	r2, [r4]
	b	.L45
.L50:
	mov	r1, #130
	mov	r0, #15
	bl	drawBall
	ldrh	r2, [r4]
	b	.L45
.L53:
	ldr	r3, .L55+36
	ldr	r4, .L55+8
	ldrh	r3, [r3]
	cmp	r3, #0
	ldrh	r3, [r4]
	addne	r3, r3, #1
	subeq	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	and	r3, r3, #3
	strh	r3, [r4]	@ movhi
	b	.L36
.L44:
	mov	r3, #0
	mov	r2, #17
	mov	r1, #130
	mov	r0, #15
	ldr	r6, .L55+40
	mov	lr, pc
	bx	r6
	b	.L39
.L43:
	mov	r3, #0
	mov	r2, #17
	mov	r1, #60
	mov	r0, #75
	ldr	r6, .L55+40
	mov	lr, pc
	bx	r6
	b	.L39
.L42:
	mov	r3, #0
	mov	r2, #17
	mov	r1, #40
	mov	r0, #135
	ldr	r6, .L55+40
	mov	lr, pc
	bx	r6
	b	.L39
.L56:
	.align	2
.L55:
	.word	update3
	.word	looping
	.word	frame
	.word	prevFrame
	.word	buttonBuffer
	.word	timestep
	.word	time
	.word	mgba_printf_level
	.word	.LC0
	.word	forward
	.word	drawSquare
	.size	update, .-update
	.align	2
	.global	checkButtons
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkButtons, %function
checkButtons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L109
	ldrh	r3, [r3]
	ldr	r1, .L109+4
	ands	r2, r3, #1
	str	lr, [sp, #-4]!
	ldrh	ip, [r1]
	beq	.L58
	ldr	r2, .L109+8
	ldrh	r2, [r2, #48]
	tst	r2, #1
	addeq	r2, ip, #1
	andeq	r2, r2, #3
	strheq	r2, [r1]	@ movhi
	movne	r2, #0
	moveq	r2, #1
.L58:
	tst	r3, #2
	beq	.L59
	ldr	r0, .L109+8
	ldrh	r0, [r0, #48]
	tst	r0, #2
	moveq	r2, #1
	ldrheq	r0, [r1]
	subeq	r0, r0, #1
	andeq	r0, r0, #3
	strheq	r0, [r1]	@ movhi
.L59:
	tst	r3, #8
	beq	.L60
	ldr	r0, .L109+8
	ldrh	r0, [r0, #48]
	ands	r0, r0, #8
	beq	.L107
.L60:
	tst	r3, #4
	beq	.L62
	ldr	r0, .L109+8
	ldrh	r0, [r0, #48]
	ands	r0, r0, #4
	beq	.L108
.L62:
	tst	r3, #32
	beq	.L64
	ldr	r0, .L109+8
	ldrh	r0, [r0, #48]
	ands	r0, r0, #32
	moveq	r2, #1
	strheq	r0, [r1]	@ movhi
.L64:
	tst	r3, #16
	beq	.L65
	ldr	r0, .L109+8
	ldrh	r0, [r0, #48]
	tst	r0, #16
	moveq	r0, #3
	moveq	r2, #1
	strheq	r0, [r1]	@ movhi
.L65:
	tst	r3, #64
	beq	.L66
	ldr	r1, .L109+8
	ldrh	r1, [r1, #48]
	tst	r1, #64
	bne	.L66
	ldr	r2, .L109+12
	ldr	r1, [r2]
	sub	r1, r1, #1
	cmp	r1, #0
	movle	r1, #1
	strle	r1, [r2]
	strgt	r1, [r2]
.L68:
	tst	r3, #128
	beq	.L72
	ldr	r3, .L109+8
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L74
.L72:
	mov	r1, #8
	ldr	r2, .L109+16
	ldr	r3, .L109+20
	ldr	lr, [sp], #4
	str	r1, [r2]
	strh	ip, [r3]	@ movhi
	b	update
.L66:
	tst	r3, #128
	beq	.L69
	ldr	r3, .L109+8
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L69
	ldr	r2, .L109+12
.L74:
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #20
	movgt	r3, #20
	str	r3, [r2]
	b	.L72
.L69:
	cmp	r2, #0
	bne	.L72
	ldr	lr, [sp], #4
	bx	lr
.L108:
	ldr	lr, .L109+24
	ldrh	r2, [lr]
	cmp	r2, #0
	moveq	r0, #1
	movne	r2, #1
	moveq	r2, r0
	strhne	r0, [lr]	@ movhi
	strheq	r0, [lr]	@ movhi
	b	.L62
.L107:
	ldr	lr, .L109+28
	ldrh	r2, [lr]
	cmp	r2, #0
	moveq	r0, #1
	movne	r2, #1
	moveq	r2, r0
	strhne	r0, [lr]	@ movhi
	strheq	r0, [lr]	@ movhi
	b	.L60
.L110:
	.align	2
.L109:
	.word	oldButtons
	.word	frame
	.word	67109120
	.word	timestep
	.word	buttonBuffer
	.word	prevFrame
	.word	forward
	.word	looping
	.size	checkButtons, .-checkButtons
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Debugging Initialized\000"
	.align	2
.LC2:
	.ascii	"checkButtons!\000"
	.global	__aeabi_idivmod
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L116
	mov	lr, pc
	bx	r3
	ldr	r5, .L116+4
	ldr	r3, .L116+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L116+12
	ldr	r0, .L116+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L116+20
	ldr	r3, [r5]
	ldr	r8, .L116+24
	ldr	r7, .L116+28
	ldr	fp, .L116+32
	ldr	r10, .L116+36
	ldr	r9, .L116+40
	ldr	r6, .L116+44
	b	.L114
.L112:
	ldr	r1, [r8]
	ldr	r0, [r4]
	mov	lr, pc
	bx	r7
	cmp	r1, #0
	ldrheq	r3, [r10]
	strheq	r3, [fp]	@ movhi
	moveq	lr, pc
	bxeq	r9
.L113:
	mov	lr, pc
	bx	r6
	ldr	r2, [r4]
	ldr	r3, [r5]
	add	r2, r2, #1
	sub	r3, r3, #1
	str	r2, [r4]
	str	r3, [r5]
.L114:
	cmp	r3, #0
	bgt	.L112
	ldr	r0, .L116+48
	ldr	r3, .L116+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L116+52
	mov	lr, pc
	bx	r3
	b	.L112
.L117:
	.align	2
.L116:
	.word	init
	.word	buttonBuffer
	.word	mgba_open
	.word	mgba_printf
	.word	.LC1
	.word	time
	.word	timestep
	.word	__aeabi_idivmod
	.word	prevFrame
	.word	frame
	.word	update
	.word	waitForVBlank
	.word	.LC2
	.word	checkButtons
	.size	main, .-main
	.text
	.align	2
	.global	erase
	.syntax unified
	.arm
	.fpu softvfp
	.type	erase, %function
erase:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #0
	ldr	r4, .L120
	mov	r2, #17
	mov	r1, #130
	mov	r0, #15
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r2, #17
	mov	r1, #60
	mov	r0, #75
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r2, #17
	mov	r1, #40
	mov	r0, #135
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	yeetFrame3
.L121:
	.align	2
.L120:
	.word	drawSquare
	.size	erase, .-erase
	.comm	buttonBuffer,4,4
	.comm	timestep,4,4
	.comm	time,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	frame,2,2
	.comm	prevFrame,2,2
	.comm	forward,2,2
	.comm	looping,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
