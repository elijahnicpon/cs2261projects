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
	.global	checkWin
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkWin, %function
checkWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L4
	mov	r3, #0
	ldr	r0, .L9+4
	b	.L3
.L8:
	cmp	r3, r1
	beq	.L4
.L3:
	ldr	r2, [r0, r3, lsl #4]
	cmp	r2, #0
	add	r3, r3, #1
	beq	.L8
	mov	r0, #0
	bx	lr
.L4:
	mov	r0, #1
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.word	borders+12
	.size	checkWin, .-checkWin
	.align	2
	.global	initPlaying
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlaying, %function
initPlaying:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #10
	ldr	r1, .L16
	str	r8, [r1]
	mov	r8, #72
	mvn	r10, #32768
	mov	r6, #140
	mov	ip, #20
	mov	r2, #0
	str	r8, [r1, #4]
	mov	r9, #120
	mov	r8, #80
	mov	r3, #1
	mov	r0, #18
	mvn	r5, #64512
	mov	fp, #992
	mov	r7, #220
	mov	r4, #218
	strh	r10, [r1, #16]	@ movhi
	ldr	r10, .L16+4
	str	r6, [r10, #52]
	str	r6, [r10, #68]
	mov	r6, #232
	str	r2, [r1, #8]
	str	r2, [r1, #12]
	str	r9, [r10, #32]
	ldr	r1, .L16+8
	ldr	r9, .L16+12
	str	r8, [r10, #36]
	str	ip, [r10]
	ldr	r8, .L16+16
	str	ip, [r10, #48]
	str	ip, [r10, #4]
	str	ip, [r10, #20]
	ldr	ip, .L16+20
	mov	lr, #138
	strh	r5, [r10, #56]	@ movhi
	strh	r1, [r10, #8]	@ movhi
	strh	r9, [r10, #24]	@ movhi
	strh	r8, [r10, #40]	@ movhi
	strh	fp, [r10, #72]	@ movhi
	str	r7, [r10, #16]
	str	r7, [r10, #64]
	str	r3, [r10, #12]
	str	r3, [r10, #28]
	str	r3, [r10, #44]
	str	r3, [r10, #60]
	str	r3, [r10, #76]
	str	r3, [ip, #12]
	str	r3, [ip, #28]
	str	r3, [ip, #44]
	str	r3, [ip, #60]
	str	r3, [ip, #76]
	str	r0, [ip]
	str	r4, [ip, #16]
	strh	r1, [ip, #72]	@ movhi
	mov	r1, #73
	str	r6, [ip, #32]
	ldr	r6, .L16+24
	strh	r5, [ip, #40]	@ movhi
	ldr	r5, [r6, #4]
	cmp	r5, r2
	str	r0, [ip, #48]
	str	r4, [ip, #64]
	str	r0, [ip, #4]
	str	r0, [ip, #20]
	strh	r9, [ip, #8]	@ movhi
	strh	r8, [ip, #24]	@ movhi
	strh	fp, [ip, #56]	@ movhi
	str	r1, [ip, #36]
	str	lr, [ip, #52]
	str	lr, [ip, #68]
	ble	.L11
	mov	r0, #10
	add	r5, r5, r5, lsl #2
	lsl	r5, r5, #2
	add	r5, r5, r0
	add	r1, r6, #8
.L13:
	str	r0, [r1]
	str	r0, [r1, #8]
	add	r0, r0, #20
	cmp	r0, r5
	str	r2, [r1, #4]
	str	r2, [r1, #12]
	str	r3, [r1, #16]
	str	r3, [r1, #20]
	str	r3, [r1, #24]
	add	r1, r1, #28
	bne	.L13
.L11:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	player
	.word	keys
	.word	32736
	.word	31775
	.word	671
	.word	borders
	.word	.LANCHOR0
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
	ldr	r3, .L20
	mov	r0, #0
	mov	lr, pc
	bx	r3
	bl	initPlaying
	mov	r2, #1
	ldr	r3, .L20+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L21:
	.align	2
.L20:
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
	mov	r0, #0
	push	{r4, lr}
	ldr	r3, .L24
	mov	lr, pc
	bx	r3
	mov	r0, #1
	mov	r2, #0
	ldr	r1, .L24+4
	ldr	r3, .L24+8
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	fillScreen
	.word	state
	.word	.LANCHOR1
	.size	resumePlaying, .-resumePlaying
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"START pressed. x:%d, y:%d, lastx:%d, lasty:%d\000"
	.align	2
.LC1:
	.ascii	"%d\000"
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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L53
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	ldr	r4, .L53+4
	sub	sp, sp, #12
	bne	.L28
	ldr	r2, [r4, #4]
	subs	r2, r2, #1
	movpl	r3, r2
	str	r3, [r4, #4]
.L28:
	ldr	r3, .L53
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L32
	ldr	r2, .L53+8
	ldr	r3, [r4, #4]
	ldr	r2, [r2, #344]
	add	r1, r3, #1
	rsb	r3, r2, #160
	cmp	r3, r1
	movge	r3, r1
	str	r3, [r4, #4]
.L32:
	ldr	r3, .L53
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	bne	.L35
	ldr	r2, [r4]
	subs	r2, r2, #1
	movpl	r3, r2
	str	r3, [r4]
.L35:
	ldr	r3, .L53
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L39
	ldr	r2, .L53+8
	ldr	r3, [r4]
	ldr	r2, [r2, #344]
	add	r1, r3, #1
	rsb	r3, r2, #240
	cmp	r3, r1
	movge	r3, r1
	str	r3, [r4]
.L39:
	ldr	r5, .L53+12
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L41
	ldr	r3, .L53
	ldrh	r3, [r3, #48]
	tst	r3, #8
	beq	.L52
.L41:
	ldrh	r3, [r4, #16]
	ldr	r2, .L53+16
	cmp	r3, r2
	beq	.L26
	ldrh	r2, [r5]
	tst	r2, #1
	beq	.L26
	ldr	r2, .L53
	ldrh	r5, [r2, #48]
	ands	r5, r5, #1
	bne	.L26
	ldr	r10, .L53+20
	ldr	r2, [r10, #4]
	cmp	r2, #0
	bgt	.L26
	ldr	r7, .L53+8
	ldr	r2, [r7, #348]
	cmp	r2, #0
	ble	.L26
	mov	r9, #5
	ldr	r6, .L53+24
	ldr	fp, .L53+28
	ldr	r8, .L53+32
	b	.L44
.L43:
	ldr	r3, [r7, #348]
	cmp	r3, r5
	add	r6, r6, #16
	ble	.L26
	ldrh	r3, [r4, #16]
.L44:
	ldrh	r2, [r6, #8]
	cmp	r2, r3
	add	r5, r5, #1
	bne	.L43
	mvn	r3, #32768
	mov	r1, #1
	ldr	r2, [r4]
	strh	r3, [r4, #16]	@ movhi
	ldr	r3, [r4, #4]
	mov	r0, fp
	str	r1, [r6, #12]
	str	r2, [r6]
	str	r3, [r6, #4]
	str	r9, [r10, #4]
	mov	lr, pc
	bx	r8
	b	.L43
.L26:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L52:
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	str	r2, [sp]
	ldr	r0, .L53+36
	ldm	r4, {r1, r2}
	ldr	r6, .L53+32
	mov	lr, pc
	bx	r6
	ldr	r3, .L53+40
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L53+20
	str	r2, [r3]
	b	.L41
.L54:
	.align	2
.L53:
	.word	67109120
	.word	player
	.word	.LANCHOR0
	.word	oldButtons
	.word	32767
	.word	.LANCHOR1
	.word	keys
	.word	.LC1
	.word	mgba_printf
	.word	.LC0
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
	ldr	r5, .L59
	ldrh	r3, [r0, #8]
	ldrb	r1, [r0, #4]	@ zero_extendqisi2
	ldrb	r2, [r5, #352]	@ zero_extendqisi2
	ldr	r6, .L59+4
	ldrb	r0, [r0]	@ zero_extendqisi2
	mov	lr, pc
	bx	r6
	ldr	r0, [r5, #356]
	ldr	r3, [r4]
	sub	r0, r0, #1
	add	r0, r0, r3
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	ldrh	r3, [r4, #8]
	ldrb	r2, [r5, #352]	@ zero_extendqisi2
	and	r0, r0, #255
	mov	lr, pc
	bx	r6
	ldr	r6, .L59+8
	ldrh	r3, [r4, #8]
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	ldrb	r0, [r4]	@ zero_extendqisi2
	ldrb	r2, [r5, #356]	@ zero_extendqisi2
	mov	lr, pc
	bx	r6
	ldr	r1, [r5, #352]
	ldr	r3, [r4, #4]
	sub	r1, r1, #1
	add	r1, r1, r3
	ldrb	r2, [r5, #356]	@ zero_extendqisi2
	ldrh	r3, [r4, #8]
	ldrb	r0, [r4]	@ zero_extendqisi2
	and	r1, r1, #255
	mov	lr, pc
	bx	r6
	pop	{r4, r5, r6, lr}
	bx	lr
.L60:
	.align	2
.L59:
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
	ldr	ip, .L66
	str	lr, [sp, #-4]!
	ldr	r3, [ip, #356]
	ldr	lr, [r0]
	ldr	r2, [r1]
	add	r3, lr, r3
	cmp	r2, r3
	bge	.L61
	ldr	r3, [ip, #344]
	add	r2, r2, r3
	cmp	lr, r2
	bge	.L61
	ldr	r2, [ip, #352]
	ldr	ip, [r0, #4]
	ldr	lr, [r1, #4]
	add	r2, ip, r2
	cmp	lr, r2
	bge	.L61
	add	r3, r3, lr
	cmp	ip, r3
	bge	.L61
	ldr	r3, .L66+4
	ldrh	r3, [r3, #48]
	ldr	ip, [r1, #8]
	ldr	r2, [r1, #12]
	ands	r3, r3, #2
	str	ip, [r1]
	str	r2, [r1, #4]
	bne	.L61
	ldrh	r1, [r1, #16]
	ldrh	r2, [r0, #8]
	cmp	r1, r2
	streq	r3, [r0, #12]
	strheq	r3, [r0, #8]	@ movhi
.L61:
	ldr	lr, [sp], #4
	bx	lr
.L67:
	.align	2
.L66:
	.word	.LANCHOR0
	.word	67109120
	.size	checkBorderCollision, .-checkBorderCollision
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r6, .L123
	ldr	r3, [r6]
	cmp	r3, #0
	sub	sp, sp, #8
	ble	.L69
	mov	r4, #0
	ldr	r0, .L123+4
	ldr	r5, .L123+8
	b	.L71
.L70:
	ldr	r3, [r6]
	cmp	r3, r4
	add	r0, r0, #16
	ble	.L120
.L71:
	ldr	r3, [r0, #12]
	cmp	r3, #0
	add	r4, r4, #1
	beq	.L70
	mov	r1, r5
	bl	checkBorderCollision
	ldr	r3, [r6]
	cmp	r3, r4
	add	r0, r0, #16
	bgt	.L71
.L120:
	ldr	r2, [r6, #348]
	cmp	r2, #0
	ldrle	r7, .L123+8
	ble	.L72
.L92:
	mov	r5, #0
	ldr	r4, .L123+12
	ldr	r7, .L123+8
	ldr	r8, .L123+16
	ldr	r9, .L123+20
	ldr	r10, .L123+24
.L74:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L73
	ldr	r1, [r4]
	ldr	r3, [r6, #360]
	ldr	r2, [r7]
	add	r3, r1, r3
	cmp	r2, r3
	bge	.L73
	ldr	r3, [r6, #344]
	add	r0, r2, r3
	cmp	r1, r0
	bge	.L73
	ldr	ip, [r4, #4]
	ldr	r1, [r6, #364]
	ldr	r0, [r7, #4]
	add	r1, ip, r1
	cmp	r0, r1
	add	r3, r3, r0
	bge	.L73
	cmp	ip, r3
	bge	.L73
	ldrh	r3, [r8]
	tst	r3, #1
	ldr	r1, .L123+28
	beq	.L73
	ldrh	ip, [r1, #48]
	ands	ip, ip, #1
	bne	.L73
	ldr	r3, [r9, #4]
	cmp	r3, #0
	ble	.L121
.L73:
	ldr	r3, [r6, #348]
	cmp	r3, r5
	add	r4, r4, #16
	bgt	.L74
	ldr	r3, [r6]
.L72:
	cmp	r3, #0
	movgt	r5, #0
	ldrgt	r4, .L123+4
	ble	.L79
.L78:
	mov	r0, r4
	bl	drawBorder
	ldr	r3, [r6]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #16
	bgt	.L78
.L79:
	mov	r3, #0
	ldrb	r2, [r6, #344]	@ zero_extendqisi2
	ldrb	r1, [r7, #12]	@ zero_extendqisi2
	ldrb	r0, [r7, #8]	@ zero_extendqisi2
	ldr	r9, .L123+32
	mov	lr, pc
	bx	r9
	ldrh	r3, [r7, #16]
	ldrb	r2, [r6, #344]	@ zero_extendqisi2
	ldrb	r1, [r7, #4]	@ zero_extendqisi2
	ldrb	r0, [r7]	@ zero_extendqisi2
	mov	lr, pc
	bx	r9
	ldr	r3, [r6, #348]
	cmp	r3, #0
	ble	.L77
	mov	r5, #0
	ldr	r4, .L123+12
	b	.L83
.L82:
	ldr	r3, [r6, #348]
	cmp	r3, r5
	add	r4, r4, #16
	ble	.L77
.L83:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L82
	mov	r0, r4
	bl	drawKey
	ldr	r3, [r6, #348]
	cmp	r3, r5
	add	r4, r4, #16
	bgt	.L83
.L77:
	ldr	r3, [r6, #4]
	cmp	r3, #0
	ble	.L122
	ldr	r5, .L123+36
	mov	r8, #0
	mov	r4, r5
	ldr	r10, .L123+40
.L87:
	ldr	r2, [r4]
	cmp	r2, #238
	cmpne	r2, #0
	ldr	lr, [r4, #16]
	ldr	ip, [r4, #4]
	rsbeq	lr, lr, #0
	streq	lr, [r4, #16]
	cmn	ip, #1
	cmpne	ip, #159
	ldr	r3, [r4, #20]
	rsbeq	r3, r3, #0
	add	lr, lr, r2
	add	ip, r3, ip
	streq	r3, [r4, #20]
	mov	r2, #2
	mov	r3, #0
	ldrb	r1, [r4, #12]	@ zero_extendqisi2
	ldrb	r0, [r4, #8]	@ zero_extendqisi2
	str	lr, [r4]
	str	ip, [r4, #4]
	mov	lr, pc
	bx	r9
	mov	r3, #31
	mov	r2, #2
	ldrb	r1, [r4, #4]	@ zero_extendqisi2
	ldrb	r0, [r4]	@ zero_extendqisi2
	mov	lr, pc
	bx	r9
	ldr	r2, [r4]
	ldr	r3, [r7]
	add	r1, r2, #1
	cmp	r1, r3
	blt	.L86
	ldr	r1, [r6, #344]
	add	r3, r3, r1
	cmp	r2, r3
	bge	.L86
	ldr	r3, [r4, #4]
	ldr	r2, [r7, #4]
	add	r0, r3, #1
	cmp	r0, r2
	blt	.L86
	add	r1, r1, r2
	cmp	r3, r1
	movlt	lr, pc
	bxlt	r10
.L86:
	ldr	r3, [r6, #4]
	add	r8, r8, #1
	cmp	r3, r8
	add	r4, r4, #28
	bgt	.L87
	ldm	r7, {r1, r2}
	cmp	r3, #0
	str	r1, [r7, #8]
	str	r2, [r7, #12]
	ble	.L68
	rsb	r3, r3, r3, lsl #3
	add	r3, r5, r3, lsl #2
.L90:
	ldm	r5, {r1, r2}
	add	r5, r5, #28
	str	r1, [r5, #-20]
	str	r2, [r5, #-16]
	cmp	r3, r5
	bne	.L90
.L68:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L69:
	ldr	r3, [r6, #348]
	cmp	r3, #0
	ldrle	r7, .L123+8
	bgt	.L92
	b	.L79
.L122:
	ldm	r7, {r2, r3}
	str	r2, [r7, #8]
	str	r3, [r7, #12]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L121:
	ldrh	lr, [r4, #8]
	sub	r1, r0, #10
	sub	r2, r2, #7
	str	ip, [sp]
	and	r0, r2, #255
	mov	r3, #30
	mov	r2, #20
	str	ip, [r4, #12]
	and	r1, r1, #255
	strh	lr, [r7, #16]	@ movhi
	mov	lr, pc
	bx	r10
	b	.L73
.L124:
	.align	2
.L123:
	.word	.LANCHOR0
	.word	borders
	.word	player
	.word	keys
	.word	oldButtons
	.word	.LANCHOR1
	.word	drawRectangle
	.word	67109120
	.word	drawSquare
	.word	.LANCHOR0+8
	.word	goLose
	.size	drawUpdate, .-drawUpdate
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
	ldr	ip, .L131
	str	lr, [sp, #-4]!
	ldr	r3, [ip, #360]
	ldr	lr, [r0]
	ldr	r2, [r1]
	add	r3, lr, r3
	cmp	r2, r3
	bge	.L129
	ldr	r3, [ip, #344]
	add	r2, r2, r3
	cmp	lr, r2
	bge	.L129
	ldr	r0, [r0, #4]
	ldr	r2, [ip, #364]
	ldr	r1, [r1, #4]
	add	r2, r0, r2
	cmp	r1, r2
	bge	.L129
	add	r3, r3, r1
	cmp	r0, r3
	movge	r0, #0
	movlt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
.L129:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L132:
	.align	2
.L131:
	.word	.LANCHOR0
	.size	checkKeyCollision, .-checkKeyCollision
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
	ldr	r2, [r0]
	ldr	r3, [r1]
	add	ip, r2, #1
	cmp	ip, r3
	blt	.L137
	ldr	ip, .L138
	ldr	ip, [ip, #344]
	add	r3, r3, ip
	cmp	r2, r3
	bge	.L137
	ldr	r0, [r0, #4]
	ldr	r3, [r1, #4]
	add	r2, r0, #1
	cmp	r2, r3
	blt	.L137
	add	ip, ip, r3
	cmp	r0, ip
	movge	r0, #0
	movlt	r0, #1
	bx	lr
.L137:
	mov	r0, #0
	bx	lr
.L139:
	.align	2
.L138:
	.word	.LANCHOR0
	.size	checkObstacleCollision, .-checkObstacleCollision
	.align	2
	.global	always
	.syntax unified
	.arm
	.fpu softvfp
	.type	always, %function
always:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L142
	mov	r2, #6
	mov	r3, r4
	mov	r1, #77
	mov	r0, #210
	ldr	r5, .L142+4
	mov	lr, pc
	bx	r5
	ldr	r5, .L142+8
	mov	r3, r4
	mov	r2, #10
	mov	r1, #75
	mov	r0, #216
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #8
	mov	r1, #76
	mov	r0, #217
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #6
	mov	r1, #77
	mov	r0, #218
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #4
	mov	r1, #78
	mov	r0, #219
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r2, #2
	mov	r1, #79
	mov	r0, #220
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L143:
	.align	2
.L142:
	.word	32767
	.word	drawSquare
	.word	drawVerticalLine
	.size	always, .-always
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
	ldr	r4, .L154
	bl	checkButtons
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L152
.L145:
	ldr	r2, .L154+4
	ldr	r3, [r4, #4]
	ldr	r1, [r2]
	sub	r3, r3, #1
	cmp	r1, #0
	str	r3, [r4, #4]
	ble	.L146
	mov	r3, #0
	ldr	r0, .L154+8
	b	.L148
.L153:
	cmp	r3, r1
	beq	.L146
.L148:
	ldr	r2, [r0, r3, lsl #4]
	cmp	r2, #0
	add	r3, r3, #1
	beq	.L153
.L147:
	ldr	r3, .L154+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L152:
	bl	always
	bl	drawUpdate
	b	.L145
.L146:
	ldr	r3, .L154+16
	mov	lr, pc
	bx	r3
	b	.L147
.L155:
	.align	2
.L154:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	borders+12
	.word	waitForVBlank
	.word	goWin
	.size	doPlaying, .-doPlaying
	.comm	state,4,4
	.global	NUMOBSTACLES
	.global	obstacles
	.comm	player,20,4
	.global	player_size
	.comm	borders,80,4
	.global	borderWidth
	.global	borderHeight
	.global	NUMBORDERS
	.comm	keys,80,4
	.global	NUMKEYS
	.global	keyHeight
	.global	keyWidth
	.global	pickupCooldown
	.global	pause
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	NUMBORDERS, %object
	.size	NUMBORDERS, 4
NUMBORDERS:
	.word	5
	.type	NUMOBSTACLES, %object
	.size	NUMOBSTACLES, 4
NUMOBSTACLES:
	.word	12
	.type	obstacles, %object
	.size	obstacles, 336
obstacles:
	.word	10
	.word	0
	.word	10
	.word	0
	.word	1
	.word	1
	.word	1
	.word	30
	.word	0
	.word	30
	.word	0
	.word	1
	.word	1
	.word	1
	.word	50
	.word	0
	.word	50
	.word	0
	.word	1
	.word	1
	.word	1
	.word	70
	.word	0
	.word	70
	.word	0
	.word	1
	.word	1
	.word	1
	.word	90
	.word	0
	.word	90
	.word	0
	.word	1
	.word	1
	.word	1
	.word	110
	.word	0
	.word	110
	.word	0
	.word	1
	.word	1
	.word	1
	.word	130
	.word	0
	.word	130
	.word	0
	.word	1
	.word	1
	.word	1
	.word	150
	.word	0
	.word	150
	.word	0
	.word	1
	.word	1
	.word	1
	.word	170
	.word	0
	.word	170
	.word	0
	.word	1
	.word	1
	.word	1
	.word	190
	.word	0
	.word	190
	.word	0
	.word	1
	.word	1
	.word	1
	.word	210
	.word	0
	.word	210
	.word	0
	.word	1
	.word	1
	.word	1
	.word	230
	.word	0
	.word	230
	.word	0
	.word	1
	.word	1
	.word	1
	.type	player_size, %object
	.size	player_size, 4
player_size:
	.word	5
	.type	NUMKEYS, %object
	.size	NUMKEYS, 4
NUMKEYS:
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
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	pause, %object
	.size	pause, 4
pause:
	.space	4
	.type	pickupCooldown, %object
	.size	pickupCooldown, 4
pickupCooldown:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
