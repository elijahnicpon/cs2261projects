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
	.file	"playing.c"
	.text
	.align	2
	.global	initPlaying
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlaying, %function
initPlaying:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	initPlaying, .-initPlaying
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
	push	{r4, lr}
	ldr	r3, .L5
	mov	r0, #0
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L5+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L6:
	.align	2
.L5:
	.word	fillScreen
	.word	state
	.size	goPlaying, .-goPlaying
	.align	2
	.global	resumePlaying
	.syntax unified
	.arm
	.fpu softvfp
	.type	resumePlaying, %function
resumePlaying:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	goPlaying
	.size	resumePlaying, .-resumePlaying
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"START pressed. x:%d, y:%d, lastx:%d, lasty:%d\000"
	.text
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
	ldr	r3, .L31
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	bne	.L10
	ldr	r1, .L31+4
	ldr	r2, [r1, #4]
	subs	r2, r2, #1
	movpl	r3, r2
	str	r3, [r1, #4]
.L10:
	ldr	r3, .L31
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L14
	ldr	r0, .L31+4
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #20]
	add	r1, r3, #1
	rsb	r3, r2, #160
	cmp	r3, r1
	movge	r3, r1
	str	r3, [r0, #4]
.L14:
	ldr	r3, .L31
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	bne	.L17
	ldr	r1, .L31+4
	ldr	r2, [r1]
	subs	r2, r2, #1
	movpl	r3, r2
	str	r3, [r1]
.L17:
	ldr	r3, .L31
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L21
	ldr	r0, .L31+4
	ldr	r3, [r0]
	ldr	r2, [r0, #20]
	add	r1, r3, #1
	rsb	r3, r2, #240
	cmp	r3, r1
	movge	r3, r1
	str	r3, [r0]
.L21:
	ldr	r3, .L31+8
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L31
	ldrh	r3, [r3, #48]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r1, .L31+4
	ldr	r2, [r1, #12]
	sub	sp, sp, #8
	ldr	r3, [r1, #8]
	str	r2, [sp]
	ldr	r0, .L31+12
	ldm	r1, {r1, r2}
	ldr	r4, .L31+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L31+20
	mov	lr, pc
	bx	r3
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	67109120
	.word	.LANCHOR0
	.word	oldButtons
	.word	.LC0
	.word	mgba_printf
	.word	goPause
	.size	checkButtons, .-checkButtons
	.align	2
	.global	drawKey
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawKey, %function
drawKey:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldm	r0, {r2, r3}
	add	ip, r2, #1
	add	r1, r2, #2
	rsb	r3, r3, r3, lsl #4
	push	{r4, r5, r6, r7, lr}
	add	lr, ip, r3, lsl #4
	add	r5, r1, r3, lsl #4
	ldrh	r6, [r0, #8]
	lsl	r4, lr, #1
	lsl	r5, r5, #1
	lsl	r3, r3, #4
	add	r4, r4, #100663296
	add	r5, r5, #100663296
	strh	r6, [r4]	@ movhi
	strh	r6, [r5]	@ movhi
	add	r4, r3, #480
	add	r5, ip, r4
	lsl	r6, lr, #1
	ldrh	r7, [r0, #8]
	add	r6, r6, #100663296
	lsl	r5, r5, #1
	add	r6, r6, #480
	add	r5, r5, #100663296
	strh	r7, [r6]	@ movhi
	strh	r7, [r5]	@ movhi
	add	r4, r1, r4
	lsl	r6, lr, #1
	ldrh	r7, [r0, #8]
	lsl	r4, r4, #1
	add	r6, r6, #100663296
	add	r4, r4, #100663296
	add	r6, r6, #1440
	strh	r7, [r4]	@ movhi
	add	r5, r3, #1200
	strh	r7, [r6]	@ movhi
	lsl	lr, lr, #1
	add	r6, ip, r5
	ldrh	r7, [r0, #8]
	add	lr, lr, #100663296
	lsl	r6, r6, #1
	add	lr, lr, #1920
	add	r6, r6, #100663296
	strh	r7, [lr]	@ movhi
	add	r4, r3, #1440
	strh	r7, [r6]	@ movhi
	add	r5, r1, r5
	add	r6, r2, r4
	ldrh	r7, [r0, #8]
	lsl	r5, r5, #1
	lsl	r6, r6, #1
	add	r5, r5, #100663296
	add	r6, r6, #100663296
	strh	r7, [r5]	@ movhi
	add	lr, r2, #3
	strh	r7, [r6]	@ movhi
	add	r5, r3, #1680
	add	r4, r4, lr
	add	r2, r2, r5
	ldrh	r6, [r0, #8]
	lsl	r4, r4, #1
	lsl	r2, r2, #1
	add	r4, r4, #100663296
	add	r2, r2, #100663296
	strh	r6, [r4]	@ movhi
	add	r3, r3, #1920
	strh	r6, [r2]	@ movhi
	add	lr, lr, r5
	add	ip, ip, r3
	ldrh	r2, [r0, #8]
	lsl	lr, lr, #1
	lsl	ip, ip, #1
	add	lr, lr, #100663296
	add	ip, ip, #100663296
	strh	r2, [lr]	@ movhi
	strh	r2, [ip]	@ movhi
	add	r1, r1, r3
	lsl	r1, r1, #1
	ldrh	r3, [r0, #8]
	add	r1, r1, #100663296
	strh	r3, [r1]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
	.size	drawKey, .-drawKey
	.align	2
	.global	drawBorder
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBorder, %function
drawBorder:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L37
	ldrh	r3, [r0, #8]
	ldrb	r1, [r0, #4]	@ zero_extendqisi2
	ldrb	r2, [r5, #24]	@ zero_extendqisi2
	ldr	r6, .L37+4
	ldrb	r0, [r0]	@ zero_extendqisi2
	mov	lr, pc
	bx	r6
	ldr	r0, [r5, #28]
	ldr	r3, [r4]
	sub	r0, r0, #1
	add	r0, r0, r3
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	ldrh	r3, [r4, #8]
	ldrb	r2, [r5, #24]	@ zero_extendqisi2
	and	r0, r0, #255
	mov	lr, pc
	bx	r6
	ldr	r6, .L37+8
	ldrh	r3, [r4, #8]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	ldrb	r0, [r4]	@ zero_extendqisi2
	ldrb	r2, [r5, #28]	@ zero_extendqisi2
	mov	lr, pc
	bx	r6
	ldr	r1, [r5, #24]
	ldr	r3, [r4, #4]
	sub	r1, r1, #1
	add	r1, r1, r3
	ldrb	r2, [r5, #28]	@ zero_extendqisi2
	ldrh	r3, [r4, #8]
	ldrb	r0, [r4]	@ zero_extendqisi2
	and	r1, r1, #255
	mov	lr, pc
	bx	r6
	pop	{r4, r5, r6, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.word	drawVerticalLine
	.word	drawHorizontalLine
	.size	drawBorder, .-drawBorder
	.align	2
	.global	checkBorderCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkBorderCollision, %function
checkBorderCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L42
	str	lr, [sp, #-4]!
	ldr	r3, [ip, #28]
	ldr	lr, [r0]
	ldr	r2, [r1]
	add	r3, lr, r3
	cmp	r2, r3
	bge	.L39
	ldr	r3, [ip, #20]
	add	r2, r2, r3
	cmp	lr, r2
	bge	.L39
	ldr	r2, [ip, #24]
	ldr	r0, [r0, #4]
	ldr	ip, [r1, #4]
	add	r2, r0, r2
	cmp	ip, r2
	bge	.L39
	add	r3, r3, ip
	cmp	r0, r3
	addlt	r2, r1, #8
	ldmlt	r2, {r2, r3}
	stmlt	r1, {r2, r3}
.L39:
	ldr	lr, [sp], #4
	bx	lr
.L43:
	.align	2
.L42:
	.word	.LANCHOR0
	.size	checkBorderCollision, .-checkBorderCollision
	.align	2
	.global	checkKeyCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkKeyCollision, %function
checkKeyCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L50
	str	lr, [sp, #-4]!
	ldr	r3, [ip, #32]
	ldr	lr, [r0]
	ldr	r2, [r1]
	add	r3, lr, r3
	cmp	r2, r3
	bge	.L48
	ldr	r3, [ip, #20]
	add	r2, r2, r3
	cmp	lr, r2
	bge	.L48
	ldr	r0, [r0, #4]
	ldr	r2, [ip, #36]
	ldr	r1, [r1, #4]
	add	r2, r0, r2
	cmp	r1, r2
	bge	.L48
	add	r3, r3, r1
	cmp	r0, r3
	movge	r0, #0
	movlt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
.L48:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L51:
	.align	2
.L50:
	.word	.LANCHOR0
	.size	checkKeyCollision, .-checkKeyCollision
	.align	2
	.global	drawObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawObstacles, %function
drawObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L57
	ldr	r3, [r6, #40]
	cmp	r3, #0
	ble	.L52
	mov	r5, r0
	mov	r4, r0
	mov	r7, #0
	ldr	r8, .L57+4
.L54:
	ldr	r1, [r4, #20]
	ldr	r2, [r5, #4]
	ldr	r0, [r4, #16]
	ldr	r3, [r5]
	add	r1, r1, r2
	add	r0, r0, r3
	ldrb	r2, [r6, #44]	@ zero_extendqisi2
	mov	r3, #31744
	and	r1, r1, #255
	and	r0, r0, #255
	mov	lr, pc
	bx	r8
	ldr	r1, [r4, #12]
	ldr	r2, [r5, #4]
	ldr	r0, [r4, #8]
	ldr	r3, [r5]
	add	r1, r1, r2
	add	r0, r0, r3
	ldrb	r2, [r6, #44]	@ zero_extendqisi2
	ldrh	r3, [r6, #48]
	and	r1, r1, #255
	and	r0, r0, #255
	mov	lr, pc
	bx	r8
	ldr	r3, [r6, #40]
	add	r7, r7, #1
	cmp	r3, r7
	add	r4, r4, #24
	bgt	.L54
.L52:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	.LANCHOR0
	.word	drawSquare
	.size	drawObstacles, .-drawObstacles
	.align	2
	.global	updateObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateObstacles, %function
updateObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L71
	push	{r4, r5, r6, r7, lr}
	ldr	r4, [r3, #40]
	cmp	r4, #0
	ble	.L59
	mov	ip, #0
	mvn	r7, #0
	mov	r5, ip
	mov	r6, #1
	b	.L65
.L61:
	cmp	r1, #119
	ble	.L63
	cmp	r3, #0
	strle	r5, [r0, #24]
	strle	r6, [r0, #28]
	ble	.L63
	cmp	r3, #79
	strgt	r7, [r0, #24]
	strgt	r5, [r0, #28]
.L63:
	add	r2, r0, #24
	ldm	r2, {r2, lr}
	add	ip, ip, #1
	add	r2, r2, r1
	add	r3, r3, lr
	cmp	ip, r4
	str	r2, [r0, #8]
	str	r3, [r0, #12]
	add	r0, r0, #24
	beq	.L59
.L65:
	add	r1, r0, #8
	ldm	r1, {r1, r3}
	cmp	r1, #0
	bgt	.L61
	cmp	r3, #0
	strle	r6, [r0, #24]
	strle	r5, [r0, #28]
	ble	.L63
	cmp	r3, #79
	strgt	r5, [r0, #24]
	strgt	r7, [r0, #28]
	b	.L63
.L59:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	.LANCHOR0
	.size	updateObstacles, .-updateObstacles
	.align	2
	.global	drawUpdate
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawUpdate, %function
drawUpdate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r5, .L107
	ldr	r3, [r5, #52]
	cmp	r3, #0
	movgt	r6, #0
	movgt	r1, r5
	sub	sp, sp, #12
	addgt	r4, r5, #60
	ble	.L79
.L78:
	ldrh	r2, [r4, #8]
	ldrh	r3, [r5, #16]
	cmp	r2, r3
	add	r6, r6, #1
	movne	r0, r4
	blne	checkBorderCollision
.L77:
	ldr	r3, [r5, #52]
	cmp	r3, r6
	add	r4, r4, #16
	bgt	.L78
.L79:
	ldr	r3, [r5, #56]
	cmp	r3, #0
	ldr	r2, [r5, #20]
	ble	.L76
	mov	r6, #0
	ldr	r4, .L107+4
	ldr	r7, .L107+8
	ldr	r8, .L107+12
	ldr	r9, .L107+16
.L81:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	add	r6, r6, #1
	beq	.L80
	ldr	r1, [r4]
	ldr	r3, [r5, #32]
	ldr	r0, [r5]
	add	r3, r1, r3
	cmp	r0, r3
	add	ip, r0, r2
	bge	.L80
	cmp	r1, ip
	bge	.L80
	ldr	ip, [r4, #4]
	ldr	r3, [r5, #36]
	ldr	r1, [r5, #4]
	add	r3, ip, r3
	cmp	r1, r3
	add	lr, r1, r2
	bge	.L80
	cmp	ip, lr
	bge	.L80
	ldrh	r3, [r7]
	tst	r3, #1
	beq	.L80
	ldrh	ip, [r8, #48]
	ands	ip, ip, #1
	bne	.L80
	ldrh	lr, [r4, #8]
	sub	r1, r1, #10
	sub	r0, r0, #7
	mov	r2, #15
	str	ip, [sp]
	mov	r3, #20
	str	ip, [r4, #12]
	and	r1, r1, #255
	and	r0, r0, #255
	strh	lr, [r5, #16]	@ movhi
	mov	lr, pc
	bx	r9
	ldr	r2, [r5, #20]
.L80:
	ldr	r3, [r5, #56]
	cmp	r6, r3
	add	r4, r4, #16
	blt	.L81
.L76:
	mov	r3, #0
	ldrb	r1, [r5, #12]	@ zero_extendqisi2
	ldrb	r0, [r5, #8]	@ zero_extendqisi2
	ldr	r4, .L107+20
	and	r2, r2, #255
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5, #16]
	ldrb	r2, [r5, #20]	@ zero_extendqisi2
	ldrb	r1, [r5, #4]	@ zero_extendqisi2
	ldrb	r0, [r5]	@ zero_extendqisi2
	mov	lr, pc
	bx	r4
	ldr	r3, [r5, #56]
	cmp	r3, #0
	ble	.L87
	mov	r6, #0
	ldr	r4, .L107+4
	b	.L86
.L85:
	ldr	r3, [r5, #56]
	cmp	r6, r3
	add	r4, r4, #16
	bge	.L87
.L86:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	add	r6, r6, #1
	beq	.L85
	mov	r0, r4
	bl	drawKey
	ldr	r3, [r5, #56]
	cmp	r6, r3
	add	r4, r4, #16
	blt	.L86
.L87:
	ldr	r3, [r5, #52]
	cmp	r3, #0
	movgt	r6, #0
	ldrgt	r4, .L107+24
	ble	.L84
.L90:
	mov	r0, r4
	bl	drawBorder
	ldr	r3, [r5, #52]
	add	r6, r6, #1
	cmp	r6, r3
	add	r4, r4, #16
	blt	.L90
.L84:
	ldr	r4, .L107+28
	mov	r0, r4
	bl	drawObstacles
	add	r0, r4, #488
	bl	drawObstacles
	mov	r0, r4
	bl	updateObstacles
	add	r0, r4, #488
	bl	updateObstacles
	ldr	ip, [r5, #40]
	cmp	ip, #0
	movgt	r0, r4
	ldm	r5, {r2, r3}
	addgt	ip, ip, ip, lsl #1
	str	r3, [r5, #12]
	str	r2, [r5, #8]
	addgt	ip, r0, ip, lsl #3
	addgt	r3, r0, #488
	ble	.L73
.L91:
	add	r1, r0, #8
	ldm	r1, {r1, r2}
	add	r0, r0, #24
	str	r1, [r0, #-8]
	str	r2, [r0, #-4]
	ldr	r1, [r3, #8]
	ldr	r2, [r3, #12]
	cmp	r0, ip
	str	r1, [r3, #16]
	str	r2, [r3, #20]
	add	r3, r3, #24
	bne	.L91
.L73:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L108:
	.align	2
.L107:
	.word	.LANCHOR0
	.word	.LANCHOR0+140
	.word	oldButtons
	.word	67109120
	.word	drawRectangle
	.word	drawSquare
	.word	.LANCHOR0+60
	.word	.LANCHOR0+220
	.size	drawUpdate, .-drawUpdate
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
	bl	drawUpdate
	ldr	r3, .L111
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L112:
	.align	2
.L111:
	.word	waitForVBlank
	.size	doPlaying, .-doPlaying
	.align	2
	.global	checkObstacleCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkObstacleCollision, %function
checkObstacleCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.size	checkObstacleCollision, .-checkObstacleCollision
	.comm	state,4,4
	.comm	obstacle_group_width,4,4
	.comm	obstacle_group_height,4,4
	.global	rightObstacleGroup
	.global	leftObstacleGroup
	.global	obstacleGroupWidth
	.global	obstacleGroupHeight
	.global	ObstacleArrayTemplateSize
	.global	obstacleArrayTemplate
	.global	obstacleColor
	.global	obstacle_size
	.global	player
	.global	player_size
	.global	borders
	.global	borderWidth
	.global	borderHeight
	.global	NUMBORDERS
	.global	keys
	.global	NUMKEYS
	.global	keyHeight
	.global	keyWidth
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	player, %object
	.size	player, 20
player:
	.word	10
	.word	72
	.word	10
	.word	72
	.short	32767
	.space	2
	.type	player_size, %object
	.size	player_size, 4
player_size:
	.word	5
	.type	borderHeight, %object
	.size	borderHeight, 4
borderHeight:
	.word	13
	.type	borderWidth, %object
	.size	borderWidth, 4
borderWidth:
	.word	8
	.type	keyWidth, %object
	.size	keyWidth, 4
keyWidth:
	.word	4
	.type	keyHeight, %object
	.size	keyHeight, 4
keyHeight:
	.word	9
	.type	ObstacleArrayTemplateSize, %object
	.size	ObstacleArrayTemplateSize, 4
ObstacleArrayTemplateSize:
	.word	20
	.type	obstacle_size, %object
	.size	obstacle_size, 4
obstacle_size:
	.word	2
	.type	obstacleColor, %object
	.size	obstacleColor, 2
obstacleColor:
	.short	31
	.space	2
	.type	NUMBORDERS, %object
	.size	NUMBORDERS, 4
NUMBORDERS:
	.word	5
	.type	NUMKEYS, %object
	.size	NUMKEYS, 4
NUMKEYS:
	.word	5
	.type	borders, %object
	.size	borders, 80
borders:
	.word	113
	.word	73
	.short	1023
	.space	2
	.word	1
	.word	48
	.word	88
	.short	992
	.space	2
	.word	1
	.word	8
	.word	8
	.short	32736
	.space	2
	.word	1
	.word	158
	.word	53
	.short	31775
	.space	2
	.word	1
	.word	233
	.word	118
	.short	671
	.space	2
	.word	1
	.type	keys, %object
	.size	keys, 80
keys:
	.word	115
	.word	75
	.short	32736
	.space	2
	.word	1
	.word	50
	.word	90
	.short	31775
	.space	2
	.word	1
	.word	10
	.word	10
	.short	671
	.space	2
	.word	1
	.word	160
	.word	55
	.short	1023
	.space	2
	.word	1
	.word	225
	.word	50
	.short	992
	.space	2
	.word	1
	.type	leftObstacleGroup, %object
	.size	leftObstacleGroup, 488
leftObstacleGroup:
	.word	40
	.word	60
	.word	0
	.word	0
	.word	0
	.word	0
	.space	8
	.word	20
	.word	0
	.word	20
	.word	0
	.space	8
	.word	40
	.word	0
	.word	40
	.word	0
	.space	8
	.word	60
	.word	0
	.word	60
	.word	0
	.space	8
	.word	80
	.word	0
	.word	80
	.word	0
	.space	8
	.word	100
	.word	0
	.word	100
	.word	0
	.space	8
	.word	120
	.word	0
	.word	120
	.word	0
	.space	8
	.word	120
	.word	20
	.word	120
	.word	20
	.space	8
	.word	120
	.word	40
	.word	120
	.word	40
	.space	8
	.word	120
	.word	60
	.word	120
	.word	60
	.space	8
	.word	120
	.word	80
	.word	180
	.word	80
	.space	8
	.word	100
	.word	80
	.word	100
	.word	80
	.space	8
	.word	80
	.word	80
	.word	80
	.word	80
	.space	8
	.word	60
	.word	80
	.word	60
	.word	80
	.space	8
	.word	40
	.word	80
	.word	40
	.word	80
	.space	8
	.word	20
	.word	80
	.word	20
	.word	80
	.space	8
	.word	0
	.word	80
	.word	0
	.word	80
	.space	8
	.word	0
	.word	60
	.word	0
	.word	60
	.space	8
	.word	0
	.word	40
	.word	0
	.word	40
	.space	8
	.word	0
	.word	20
	.word	0
	.word	20
	.space	8
	.type	rightObstacleGroup, %object
	.size	rightObstacleGroup, 488
rightObstacleGroup:
	.word	80
	.word	20
	.word	0
	.word	0
	.word	0
	.word	0
	.space	8
	.word	20
	.word	0
	.word	20
	.word	0
	.space	8
	.word	40
	.word	0
	.word	40
	.word	0
	.space	8
	.word	60
	.word	0
	.word	60
	.word	0
	.space	8
	.word	80
	.word	0
	.word	80
	.word	0
	.space	8
	.word	100
	.word	0
	.word	100
	.word	0
	.space	8
	.word	120
	.word	0
	.word	120
	.word	0
	.space	8
	.word	120
	.word	20
	.word	120
	.word	20
	.space	8
	.word	120
	.word	40
	.word	120
	.word	40
	.space	8
	.word	120
	.word	60
	.word	120
	.word	60
	.space	8
	.word	120
	.word	80
	.word	180
	.word	80
	.space	8
	.word	100
	.word	80
	.word	100
	.word	80
	.space	8
	.word	80
	.word	80
	.word	80
	.word	80
	.space	8
	.word	60
	.word	80
	.word	60
	.word	80
	.space	8
	.word	40
	.word	80
	.word	40
	.word	80
	.space	8
	.word	20
	.word	80
	.word	20
	.word	80
	.space	8
	.word	0
	.word	80
	.word	0
	.word	80
	.space	8
	.word	0
	.word	60
	.word	0
	.word	60
	.space	8
	.word	0
	.word	40
	.word	0
	.word	40
	.space	8
	.word	0
	.word	20
	.word	0
	.word	20
	.space	8
	.type	obstacleGroupWidth, %object
	.size	obstacleGroupWidth, 4
obstacleGroupWidth:
	.word	120
	.type	obstacleGroupHeight, %object
	.size	obstacleGroupHeight, 4
obstacleGroupHeight:
	.word	80
	.type	obstacleArrayTemplate, %object
	.size	obstacleArrayTemplate, 480
obstacleArrayTemplate:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	20
	.word	0
	.word	20
	.word	0
	.word	1
	.word	0
	.word	40
	.word	0
	.word	40
	.word	0
	.word	1
	.word	0
	.word	60
	.word	0
	.word	60
	.word	0
	.word	1
	.word	0
	.word	80
	.word	0
	.word	80
	.word	0
	.word	1
	.word	0
	.word	100
	.word	0
	.word	100
	.word	0
	.word	1
	.word	0
	.word	120
	.word	0
	.word	120
	.word	0
	.word	0
	.word	1
	.word	120
	.word	20
	.word	120
	.word	20
	.word	0
	.word	1
	.word	120
	.word	40
	.word	120
	.word	40
	.word	0
	.word	1
	.word	120
	.word	60
	.word	120
	.word	60
	.word	0
	.word	1
	.word	120
	.word	80
	.word	180
	.word	80
	.word	-1
	.word	0
	.word	100
	.word	80
	.word	100
	.word	80
	.word	-1
	.word	0
	.word	80
	.word	80
	.word	80
	.word	80
	.word	-1
	.word	0
	.word	60
	.word	80
	.word	60
	.word	80
	.word	-1
	.word	0
	.word	40
	.word	80
	.word	40
	.word	80
	.word	-1
	.word	0
	.word	20
	.word	80
	.word	20
	.word	80
	.word	-1
	.word	0
	.word	0
	.word	80
	.word	0
	.word	80
	.word	0
	.word	-1
	.word	0
	.word	60
	.word	0
	.word	60
	.word	0
	.word	-1
	.word	0
	.word	40
	.word	0
	.word	40
	.word	0
	.word	-1
	.word	0
	.word	20
	.word	0
	.word	20
	.word	0
	.word	-1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
