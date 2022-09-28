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
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"switch to finished\000"
	.text
	.align	2
	.global	goFinished
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goFinished, %function
goFinished:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	ldr	r2, .L6
	push	{r4, lr}
	ldr	r0, .L6+4
	ldr	r3, .L6+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r2, .L6+12
	ldr	r3, .L6+16
	ldr	r2, [r2]
	ldr	r3, [r3]
	cmp	r2, r3
	movgt	r0, #31744
	movle	r0, #31
	ldr	r3, .L6+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	state
	.word	.LC0
	.word	mgba_printf
	.word	p1
	.word	p2
	.word	fillScreen
	.size	goFinished, .-goFinished
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"new ball at %d\000"
	.text
	.align	2
	.global	addNewBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	addNewBall, %function
addNewBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L17
	ldr	r1, [r3]
	cmp	r1, #0
	bxle	lr
	push	{r4, r5, r6, lr}
	ldr	r4, .L17+4
	mov	ip, #0
	mov	r3, r4
	b	.L11
.L10:
	add	ip, ip, #1
	cmp	ip, r1
	add	r3, r3, #28
	beq	.L8
.L11:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L10
	mov	lr, r0
	rsb	r5, ip, ip, lsl #3
	ldmia	lr!, {r0, r1, r2, r3}
	add	r4, r4, r5, lsl #2
	stmia	r4!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2}
	ldr	r3, .L17+8
	stm	r4, {r0, r1, r2}
	mov	r1, ip
	ldr	r0, .L17+12
	mov	lr, pc
	bx	r3
.L8:
	pop	{r4, r5, r6, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	NUM_BALLS
	.word	balls
	.word	mgba_printf
	.word	.LC1
	.size	addNewBall, .-addNewBall
	.align	2
	.global	initBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalls, %function
initBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L26
	ldr	ip, [r3]
	cmp	ip, #0
	push	{r4, lr}
	ldr	r4, .L26+4
	ble	.L20
	mov	r0, #120
	mov	r3, r4
	mov	r1, #80
	mov	r2, #1
	mov	lr, #0
	rsb	ip, ip, ip, lsl #3
	add	ip, r4, ip, lsl #2
.L21:
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	lr, [r3, #24]
	stm	r3, {r0, r1}
	add	r3, r3, #28
	cmp	r3, ip
	bne	.L21
.L20:
	mov	r3, #1
	str	r3, [r4, #24]
	pop	{r4, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	NUM_BALLS
	.word	balls
	.size	initBalls, .-initBalls
	.align	2
	.global	initPlayers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayers, %function
initPlayers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1
	mov	r0, #0
	ldr	r1, .L29
	ldr	r2, .L29+4
	str	r3, [r1, #4]
	stm	r2, {r0, r3}
	str	r3, [r1, #8]
	str	r0, [r1]
	str	r3, [r2, #8]
	bx	lr
.L30:
	.align	2
.L29:
	.word	p1
	.word	p2
	.size	initPlayers, .-initPlayers
	.align	2
	.global	drawPaddles
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPaddles, %function
drawPaddles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, .L33
	ldr	r6, .L33+4
	ldr	r5, .L33+8
	ldr	r4, .L33+12
	mov	r0, r3
	ldrb	r2, [r7]	@ zero_extendqisi2
	ldrb	r1, [r6, #8]	@ zero_extendqisi2
	mov	lr, pc
	bx	r4
	ldrb	r2, [r7]	@ zero_extendqisi2
	ldrb	r1, [r5, #8]	@ zero_extendqisi2
	mov	r3, #0
	mov	r0, #239
	mov	lr, pc
	bx	r4
	ldrb	r1, [r6, #4]	@ zero_extendqisi2
	mov	r3, #31744
	mov	r2, #50
	mov	r0, #0
	mov	lr, pc
	bx	r4
	ldrb	r1, [r5, #4]	@ zero_extendqisi2
	mov	r3, #31
	mov	r2, #50
	mov	r0, #239
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	paddleHeight
	.word	p1
	.word	p2
	.word	drawVerticalLine
	.size	drawPaddles, .-drawPaddles
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r6, r0
	ldr	r5, .L46
	rsb	r2, r0, r0, lsl #3
	add	r0, r5, r2, lsl #2
	ldr	ip, [r0, #20]
	ldr	r3, [r0, #4]
	lsl	r2, r2, #2
	add	r3, ip, r3
	ldr	r1, [r5, r2]
	sub	r4, r3, #8
	ldr	lr, [r0, #16]
	cmp	r4, #143
	add	r1, lr, r1
	rsbhi	ip, ip, #0
	strhi	ip, [r0, #20]
	cmp	r1, #1
	str	r3, [r0, #4]
	str	r1, [r5, r2]
	sub	sp, sp, #44
	lsl	r4, r6, #3
	ble	.L45
	cmp	r1, #231
	ble	.L39
	ldr	r2, .L46+4
	ldr	r2, [r2, #4]
	add	r0, r3, #5
	cmp	r0, r2
	blt	.L41
	ldr	r0, .L46+8
	ldr	r0, [r0]
	add	r2, r2, r0
	sub	r0, r3, #5
	cmp	r0, r2
	ble	.L43
.L41:
	mov	ip, #0
	mov	r3, #7
	ldr	r0, .L46+12
	b	.L44
.L45:
	ldr	r2, .L46+12
	ldr	r2, [r2, #4]
	add	r0, r3, #5
	cmp	r0, r2
	blt	.L38
	ldr	r0, .L46+8
	ldr	r0, [r0]
	add	r2, r2, r0
	sub	r0, r3, #5
	cmp	r0, r2
	bgt	.L38
.L43:
	mov	ip, #1
	rsb	r2, lr, #0
	str	r2, [sp, #28]
	str	r1, [sp, #12]
	sub	r0, r4, r6
	add	r0, r5, r0, lsl #2
	ldr	r1, [r0, #20]
	str	r3, [sp, #16]
	str	r2, [r0, #16]
	add	r2, r0, #8
	ldm	r2, {r2, r3}
	rsb	r1, r1, #0
	add	r0, sp, #12
	str	r1, [sp, #32]
	str	r2, [sp, #20]
	str	r3, [sp, #24]
	str	ip, [sp, #36]
	bl	addNewBall
.L39:
	mov	r3, #7
	mov	r2, #0
	sub	r4, r4, r6
	add	r6, r5, r4, lsl #2
	ldrb	r1, [r6, #12]	@ zero_extendqisi2
	ldrb	r0, [r6, #8]	@ zero_extendqisi2
	ldr	r7, .L46+16
	str	r2, [sp]
	mov	r2, r3
	mov	lr, pc
	bx	r7
	mov	r3, #7
	ldr	ip, .L46+20
	lsl	r4, r4, #2
	mov	r2, r3
	ldrb	r1, [r6, #4]	@ zero_extendqisi2
	ldrb	r0, [r5, r4]	@ zero_extendqisi2
	str	ip, [sp]
	mov	lr, pc
	bx	r7
	ldr	r2, [r5, r4]
	ldr	r3, [r6, #4]
	str	r2, [r6, #8]
	str	r3, [r6, #12]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L38:
	mov	ip, #0
	mov	r3, #7
	ldr	r0, .L46+4
.L44:
	ldr	r2, [r0]
	sub	r4, r4, r6
	str	ip, [sp]
	add	r5, r5, r4, lsl #2
	add	r2, r2, #1
	ldrb	r1, [r5, #12]	@ zero_extendqisi2
	str	r2, [r0]
	ldr	r4, .L46+16
	mov	r2, r3
	ldrb	r0, [r5, #8]	@ zero_extendqisi2
	str	ip, [r5, #24]
	mov	lr, pc
	bx	r4
	bl	drawPaddles
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	balls
	.word	p2
	.word	paddleHeight
	.word	p1
	.word	drawRectangle
	.word	32767
	.size	updateBall, .-updateBall
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"updating %d\000"
	.text
	.align	2
	.global	updateBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBalls, %function
updateBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r10, .L67
	ldr	r3, [r10]
	cmp	r3, #0
	ldrle	r7, .L67+4
	ble	.L49
	ldr	r4, .L67+4
	mov	r5, #0
	mov	r7, r4
	mov	r6, r4
	mov	r2, #1
	ldr	r9, .L67+8
	ldr	r8, .L67+12
	b	.L51
.L50:
	ldr	r3, [r10]
	add	r5, r5, #1
	cmp	r3, r5
	add	r6, r6, #28
	ble	.L65
.L51:
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L50
	mov	r0, r5
	bl	updateBall
	mov	r1, r5
	mov	r0, r9
	mov	lr, pc
	bx	r8
	mov	r2, #0
	b	.L50
.L65:
	cmp	r2, #0
	bne	.L66
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L66:
	cmp	r3, #0
	ble	.L49
	mov	r0, #120
	mov	r1, #80
	mov	r2, #1
	mov	ip, #0
	rsb	r3, r3, r3, lsl #3
	add	r3, r4, r3, lsl #2
.L53:
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	ip, [r4, #24]
	stm	r4, {r0, r1}
	add	r4, r4, #28
	cmp	r4, r3
	bne	.L53
.L49:
	mov	r3, #1
	str	r3, [r7, #24]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	NUM_BALLS
	.word	balls
	.word	.LC2
	.word	mgba_printf
	.size	updateBalls, .-updateBalls
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
	@ link register save eliminated.
	ldr	r2, .L94
	ldrh	r3, [r2, #48]
	tst	r3, #128
	bne	.L85
	ldr	r3, .L94+4
	ldr	r1, [r3, #4]
	add	r0, r1, #1
	cmp	r0, #108
	str	r1, [r3, #8]
	strle	r0, [r3, #4]
	movle	r1, #1
	bgt	.L91
	ldr	r3, .L94
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bne	.L73
.L92:
	ldr	r3, .L94+4
	ldr	r1, [r3, #4]
	sub	r2, r1, #1
	cmp	r2, #1
	str	r1, [r3, #8]
	bgt	.L84
	mov	r2, #1
	mov	r1, r2
	str	r2, [r3, #4]
.L73:
	ldr	r2, .L94
	ldrh	r3, [r2, #48]
	tst	r3, #2
	bne	.L75
.L93:
	ldr	r3, .L94+8
	ldr	r0, [r3, #4]
	add	r1, r0, #1
	cmp	r1, #108
	str	r0, [r3, #8]
	str	r1, [r3, #4]
	ble	.L76
	mov	r1, #109
	ldrh	r2, [r2, #48]
	tst	r2, #512
	str	r1, [r3, #4]
	moveq	r2, #108
	streq	r1, [r3, #8]
	streq	r2, [r3, #4]
.L78:
	b	drawPaddles
.L85:
	ldr	r3, .L94
	ldrh	r3, [r3, #48]
	tst	r3, #64
	mov	r1, #0
	bne	.L73
	b	.L92
.L91:
	mov	r1, #109
	ldrh	r2, [r2, #48]
	tst	r2, #64
	str	r1, [r3, #4]
	bne	.L90
	mov	r2, #108
	str	r1, [r3, #8]
.L84:
	str	r2, [r3, #4]
.L90:
	ldr	r2, .L94
	ldrh	r3, [r2, #48]
	tst	r3, #2
	mov	r1, #1
	beq	.L93
.L75:
	ldrh	r3, [r2, #48]
	tst	r3, #512
	bne	.L81
	ldr	r3, .L94+8
	ldr	r1, [r3, #4]
	sub	r0, r1, #1
.L79:
	cmp	r0, #1
	movle	r2, #1
	str	r1, [r3, #8]
	strgt	r0, [r3, #4]
	strle	r2, [r3, #4]
	b	drawPaddles
.L76:
	ldrh	r2, [r2, #48]
	tst	r2, #512
	beq	.L79
	b	.L78
.L81:
	cmp	r1, #0
	bxeq	lr
	b	.L78
.L95:
	.align	2
.L94:
	.word	67109120
	.word	p2
	.word	p1
	.size	checkButtons, .-checkButtons
	.align	2
	.global	doPlaying
	.syntax unified
	.arm
	.fpu softvfp
	.type	doPlaying, %function
doPlaying:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	checkButtons
	bl	updateBalls
	ldr	r3, .L100
	mov	lr, pc
	bx	r3
	ldr	r3, .L100+4
	ldr	r3, [r3]
	cmp	r3, #2
	bgt	.L97
	ldr	r3, .L100+8
	ldr	r3, [r3]
	cmp	r3, #2
	ble	.L96
.L97:
	pop	{r4, lr}
	b	goFinished
.L96:
	pop	{r4, lr}
	bx	lr
.L101:
	.align	2
.L100:
	.word	waitForVBlank
	.word	p1
	.word	p2
	.size	doPlaying, .-doPlaying
	.align	2
	.global	drawBoarders
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoarders, %function
drawBoarders:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, lr}
	ldr	r4, .L104
	mov	r0, r1
	mov	r3, r4
	ldr	r5, .L104+4
	mov	r2, #240
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #240
	mov	r1, #159
	mov	r0, #0
	mov	lr, pc
	bx	r5
	ldr	r2, .L104+8
	mov	r3, r4
	ldrb	r1, [r2, #4]	@ zero_extendqisi2
	ldr	r5, .L104+12
	mov	r2, #50
	mov	r0, #0
	mov	lr, pc
	bx	r5
	ldr	r2, .L104+16
	mov	r3, r4
	ldrb	r1, [r2, #4]	@ zero_extendqisi2
	mov	r0, #239
	mov	r2, #50
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L105:
	.align	2
.L104:
	.word	32767
	.word	drawHorizontalLine
	.word	p1
	.word	drawVerticalLine
	.word	p2
	.size	drawBoarders, .-drawBoarders
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"switch to playing\000"
	.text
	.align	2
	.global	goPlaying
	.syntax unified
	.arm
	.fpu softvfp
	.type	goPlaying, %function
goPlaying:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	ldr	r3, .L108
	str	r2, [r3]
	bl	drawBoarders
	ldr	r0, .L108+4
	ldr	r3, .L108+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	drawPaddles
.L109:
	.align	2
.L108:
	.word	state
	.word	.LC3
	.word	mgba_printf
	.size	goPlaying, .-goPlaying
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r6, #0
	ldr	r3, .L114
	mov	lr, pc
	bx	r3
	mov	ip, #1
	ldr	r4, .L114+4
	mov	r7, #13
	mov	lr, r6
	mov	r3, r4
	mov	r0, #120
	mov	r1, #80
	ldr	r5, .L114+8
	str	ip, [r5, #4]
	str	ip, [r5, #8]
	str	r6, [r5]
	ldr	r5, .L114+12
	mov	r2, ip
	stm	r5, {r6, ip}
	str	ip, [r5, #8]
	ldr	ip, .L114+16
	str	r7, [ip]
	add	ip, r4, #364
.L111:
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	lr, [r3, #24]
	stm	r3, {r0, r1}
	add	r3, r3, #28
	cmp	r3, ip
	bne	.L111
	mov	r1, #50
	ldr	r3, .L114+20
	str	r2, [r4, #24]
	pop	{r4, r5, r6, r7, r8, lr}
	str	r1, [r3]
	b	goPlaying
.L115:
	.align	2
.L114:
	.word	init3
	.word	balls
	.word	p1
	.word	p2
	.word	NUM_BALLS
	.word	paddleHeight
	.size	init, .-init
	.align	2
	.global	doFinished
	.syntax unified
	.arm
	.fpu softvfp
	.type	doFinished, %function
doFinished:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L126
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L126+4
	ldrh	r0, [r3, #48]
	push	{r4, lr}
	ands	r4, r0, #8
	beq	.L125
	pop	{r4, lr}
	bx	lr
.L125:
	bl	init
	mov	r0, r4
	ldr	r3, .L126+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goPlaying
.L127:
	.align	2
.L126:
	.word	oldButtons
	.word	67109120
	.word	fillScreen
	.size	doFinished, .-doFinished
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Debugging Initialized\000"
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
	push	{r7, lr}
	ldr	r3, .L135
	mov	lr, pc
	bx	r3
	ldr	r0, .L135+4
	ldr	r3, .L135+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L135+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L135+16
	ldr	r4, .L135+20
	ldr	r7, .L135+24
	ldr	r6, .L135+28
.L132:
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L130
	cmp	r3, #1
	bne	.L132
	mov	lr, pc
	bx	r6
	b	.L132
.L130:
	mov	lr, pc
	bx	r7
	b	.L132
.L136:
	.align	2
.L135:
	.word	mgba_open
	.word	.LC4
	.word	mgba_printf
	.word	init
	.word	update3
	.word	state
	.word	doPlaying
	.word	doFinished
	.size	main, .-main
	.comm	balls,364,4
	.comm	p2,12,4
	.comm	p1,12,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	NUM_BALLS,4,4
	.comm	paddleHeight,4,4
	.comm	timestep,4,4
	.comm	time,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
