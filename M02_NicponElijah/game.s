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
	.file	"game.c"
	.text
	.global	__aeabi_idivmod
	.align	2
	.global	updateAndDrawPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAndDrawPlayer, %function
updateAndDrawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L5
	ldr	r3, .L5+4
	ldr	r1, [r2]
	push	{r4, r5, r6, lr}
	ldr	r0, [r3]
	ldr	r5, .L5+8
	rsb	r1, r1, #10
	mov	lr, pc
	bx	r5
	ldr	r4, .L5+12
	cmp	r1, #0
	ldr	r1, [r4, #12]
	bne	.L2
	add	r0, r1, #1
	ldr	r1, [r4, #16]
	mov	lr, pc
	bx	r5
	str	r1, [r4, #12]
.L2:
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	mvn	r3, r3, lsl #17
	ldr	r2, [r4]
	add	r0, r2, #7
	cmp	r2, #0
	movlt	r2, r0
	mvn	r3, r3, lsr #17
	ldr	r5, .L5+16
	ldr	ip, [r4, #28]
	ldr	lr, .L5+20
	ldr	r0, .L5+24
	ldr	r4, [r5, r1, lsl #2]
	and	r2, r0, r2, asr #3
	add	r1, lr, ip, lsl #3
	lsl	ip, ip, #3
	strh	r3, [lr, ip]	@ movhi
	strh	r4, [r1, #4]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	gameSpeed
	.word	time
	.word	__aeabi_idivmod
	.word	player
	.word	.LANCHOR0
	.word	shadowOAM
	.word	511
	.size	updateAndDrawPlayer, .-updateAndDrawPlayer
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
	ldr	r3, .L10
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L8
	ldr	r3, .L10+4
	ldr	r2, [r3, #36]
	cmp	r2, #0
	add	r1, r2, #7
	movge	r1, r2
	ldr	r0, [r3]
	adds	r1, r0, r1, asr #3
	ldrpl	r1, [r3, #40]
	subpl	r2, r0, r2
	subpl	r1, r1, #1
	strpl	r2, [r3]
	strpl	r1, [r3, #40]
.L8:
	ldr	r3, .L10
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bxne	lr
	ldr	r2, .L10+4
	ldr	r1, [r2, #36]
	cmp	r1, #0
	add	r3, r1, #7
	movge	r3, r1
	ldr	ip, [r2]
	ldr	r0, [r2, #24]
	add	r3, ip, r3, asr #3
	rsb	r0, r0, #241
	cmp	r3, r0, lsl #3
	ldrle	r3, [r2, #40]
	addle	r1, ip, r1
	suble	r3, r3, #1
	strle	r1, [r2]
	strle	r3, [r2, #40]
	bx	lr
.L11:
	.align	2
.L10:
	.word	67109120
	.word	player
	.size	checkButtons, .-checkButtons
	.align	2
	.global	doGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	doGame, %function
doGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L14
	ldr	r3, [r2]
	push	{r4, lr}
	add	r3, r3, #1
	ldr	r1, .L14+4
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	bl	checkButtons
	ldr	r0, .L14+8
	ldr	r3, [r0]
	sub	r1, r3, #1
	cmp	r1, #0
	addlt	r3, r3, #6
	movge	r3, r1
	mov	r2, #67108864
	asr	r3, r3, #3
	str	r1, [r0]
	lsl	r3, r3, #16
	ldr	r0, .L14+12
	lsr	r3, r3, #16
	strh	r3, [r2, #18]	@ movhi
	ldr	r3, [r0]
	sub	r1, r3, #2
	cmp	r1, #0
	addlt	r3, r3, #5
	movge	r3, r1
	mov	ip, #0
	asr	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r1, [r0]
	strh	r3, [r2, #22]	@ movhi
	strh	ip, [r2, #20]	@ movhi
	bl	updateAndDrawPlayer
	ldr	r4, .L14+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L14+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	time
	.word	waitForVBlank
	.word	cloudVOff
	.word	vOff
	.word	DMANow
	.word	shadowOAM
	.size	doGame, .-doGame
	.align	2
	.global	updateBackgrounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBackgrounds, %function
updateBackgrounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L17
	ldr	r3, [r0]
	sub	r1, r3, #1
	cmp	r1, #0
	addlt	r3, r3, #6
	movge	r3, r1
	mov	r2, #67108864
	asr	r3, r3, #3
	str	r1, [r0]
	lsl	r3, r3, #16
	ldr	r0, .L17+4
	lsr	r3, r3, #16
	strh	r3, [r2, #18]	@ movhi
	ldr	r3, [r0]
	sub	r1, r3, #2
	cmp	r1, #0
	addlt	r3, r3, #5
	movge	r3, r1
	mov	ip, #0
	asr	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r1, [r0]
	strh	r3, [r2, #22]	@ movhi
	strh	ip, [r2, #20]	@ movhi
	bx	lr
.L18:
	.align	2
.L17:
	.word	cloudVOff
	.word	vOff
	.size	updateBackgrounds, .-updateBackgrounds
	.align	2
	.global	goGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goGame, %function
goGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L21
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	ip, #4
	mov	r1, #4864
	mov	r0, #7936
	ldr	r2, .L21+4
	ldr	r4, .L21+8
	str	ip, [r2]
	mov	r3, #256
	strh	r1, [r5]	@ movhi
	mov	r2, #83886080
	strh	r0, [r5, #10]	@ movhi
	ldr	r1, .L21+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L21+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L21+20
	ldr	r1, .L21+24
	mov	lr, pc
	bx	r4
	ldr	r2, .L21+28
	mov	r3, #240
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L21+32
	ldr	r1, .L21+36
	mov	lr, pc
	bx	r4
	mov	r3, #1776
	mov	r0, #3
	ldr	r2, .L21+40
	ldr	r1, .L21+44
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L21+48
	ldr	r1, .L21+52
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L21+56
	ldr	r1, .L21+60
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L21+64
	ldr	r1, .L21+68
	mov	lr, pc
	bx	r4
	mov	r1, #2
	mov	r2, #0
	mov	ip, #960
	mov	r0, #3
	mov	r9, #138
	mov	r8, #16
	mov	r7, #9
	mov	r6, #8
	mov	r5, #192
	mov	lr, #196
	ldr	r3, .L21+72
	str	r1, [r3, #36]
	ldr	r1, .L21+76
	str	ip, [r3]
	str	r9, [r3, #8]
	str	r8, [r3, #20]
	str	r7, [r3, #24]
	str	r6, [r3, #16]
	str	r1, [r3, #40]
	str	ip, [r3, #4]
	ldr	r1, .L21+80
	str	r2, [r3, #12]
	str	r2, [r3, #52]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #32]
	str	r0, [r3, #28]
	ldr	r3, .L21+84
	ldr	ip, .L21+88
	str	r2, [r3]
	strh	r5, [r1, #4]	@ movhi
	ldr	r3, .L21+92
	ldr	r5, .L21+96
	strh	r3, [r1, #10]	@ movhi
	strh	r5, [r1, #2]	@ movhi
	strh	lr, [r1, #12]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	strh	ip, [r1]	@ movhi
	strh	ip, [r1, #8]	@ movhi
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	hideSprites
	.word	state
	.word	DMANow
	.word	game_bgPal
	.word	game_bgTiles
	.word	100726784
	.word	game_bgMap
	.word	7684
	.word	83886144
	.word	game_clouds_bgPal
	.word	100679680
	.word	game_clouds_bgTiles
	.word	100724736
	.word	game_clouds_bgMap
	.word	83886592
	.word	game_ssPal
	.word	100728832
	.word	game_ssTiles
	.word	player
	.word	1800
	.word	shadowOAM
	.word	vOff
	.word	16386
	.word	-32734
	.word	-32766
	.size	goGame, .-goGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #960
	mov	r6, #138
	mov	r2, #0
	mov	r5, #16
	mov	r4, #9
	mov	lr, #8
	mov	ip, #3
	mov	r0, #2
	ldr	r3, .L25
	stmib	r3, {r1, r6}
	str	r1, [r3]
	add	r1, r1, #840
	str	r5, [r3, #20]
	str	r4, [r3, #24]
	str	lr, [r3, #16]
	str	ip, [r3, #28]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #12]
	str	r2, [r3, #52]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	player
	.size	initPlayer, .-initPlayer
	.global	playerFrames
	.comm	player,56,4
	.comm	shadowOAM,1024,4
	.comm	time,4,4
	.comm	gameSpeed,4,4
	.comm	cloudVOff,4,4
	.comm	vOff,4,4
	.comm	shells,4,4
	.comm	state,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	playerFrames, %object
	.size	playerFrames, 32
playerFrames:
	.word	0
	.word	2
	.word	4
	.word	6
	.word	8
	.word	6
	.word	4
	.word	2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
