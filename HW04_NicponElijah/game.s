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
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, lr}
	mov	ip, #28
	mov	r5, #2
	mov	r4, #80
	mov	lr, #16
	mov	r0, #1
	ldr	r3, .L7
	ldr	r1, [r3]
	ldr	r3, .L7+4
	str	r2, [r3]
	ldr	r3, .L7+8
	cmp	r1, r2
	stmib	r3, {r4, lr}
	str	r5, [r3]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	ble	.L1
	mvn	lr, #0
	mov	ip, #8
	ldr	r3, .L7+12
	add	r1, r1, r1, lsl r0
	add	r1, r3, r1, lsl #3
.L3:
	str	lr, [r3]
	str	r2, [r3, #12]
	str	r0, [r3, #16]
	str	r2, [r3, #20]
	stmib	r3, {r2, ip}
	add	r3, r3, #24
	cmp	r3, r1
	bne	.L3
.L1:
	pop	{r4, r5, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LANCHOR0
	.word	gameover
	.word	player
	.word	balls
	.size	initGame, .-initGame
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
	push	{r4, r5, r6, lr}
	mov	r5, #1
	ldr	ip, .L11
	mov	r4, r0
	mov	r2, #83886080
	ldr	r1, .L11+4
	mov	r3, #512
	mov	r0, #3
	ldr	r6, .L11+8
	str	r5, [ip]
	mov	lr, pc
	bx	r6
	mov	r0, r5
	ldr	r3, .L11+12
	mov	lr, pc
	bx	r3
	mov	r1, #0
	ldr	r2, .L11+16
	mov	r0, r4
	ldr	r3, .L11+20
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	bl	initGame
	ldr	r3, .L11+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L11+28
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	state
	.word	pikachuPal
	.word	DMANow
	.word	fillScreen4
	.word	time
	.word	srand
	.word	waitForVBlank
	.word	flipPage
	.size	goGame, .-goGame
	.align	2
	.global	resumeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	resumeGame, %function
resumeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	push	{r4, lr}
	mov	lr, #1
	ldr	r1, .L15
	ldr	ip, .L15+4
	str	r0, [r1]
	ldr	r4, .L15+8
	mov	r3, #512
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L15+12
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	paused
	.word	state
	.word	DMANow
	.word	pikachuPal
	.size	resumeGame, .-resumeGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L22
	ldr	r1, [r0, #4]
	ldr	r3, [r0, #16]
	add	r1, r1, r3, lsl #1
	cmp	r1, #39
	movle	r1, #40
	push	{r4, lr}
	strle	r1, [r0, #4]
	sub	sp, sp, #8
	ble	.L19
	cmp	r1, #104
	movgt	r3, #104
	movgt	r1, r3
	strle	r1, [r0, #4]
	strgt	r3, [r0, #4]
.L19:
	ldr	r3, .L22+4
	str	r3, [sp]
	ldr	r4, .L22+8
	ldr	r3, [r0, #8]
	ldr	r2, [r0, #12]
	ldr	r0, [r0]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	player
	.word	pikachuBitmap
	.word	drawImage4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBalls, %function
drawBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L38
	ldr	r3, [r7]
	cmp	r3, #0
	sub	sp, sp, #20
	ble	.L24
	mov	r6, #0
	ldr	r4, .L38+4
	ldr	r5, .L38+8
	ldr	r8, .L38+12
	ldr	r9, .L38+16
	ldr	r10, .L38+20
	b	.L28
.L26:
	add	fp, r5, #8
	ldm	fp, {fp, lr}
	ldm	r5, {r3, ip}
	sub	lr, lr, #2
	add	ip, ip, #2
	add	r3, r3, #1
	sub	fp, fp, #4
	stm	sp, {r3, ip, lr}
	str	fp, [sp, #12]
	mov	r3, r2
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	movne	r2, #1
	ldr	r3, [r7]
	strne	r2, [r10]
	cmp	r3, r6
	add	r4, r4, #24
	ble	.L24
.L28:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	ldm	r4, {r0, r1, r2}
	add	r6, r6, #1
	beq	.L26
	mov	ip, #255
	add	r3, r2, r2, lsr #31
	str	ip, [sp]
	asr	r3, r3, #1
	mov	lr, pc
	bx	r9
	mov	r0, #254
	ldr	r2, [r4, #8]
	ldr	ip, [r4, #4]
	add	r1, r2, r2, lsr #31
	asr	r3, r1, #1
	str	r0, [sp]
	add	r1, ip, r1, asr #1
	ldr	r0, [r4]
	mov	lr, pc
	bx	r9
	mov	r2, #253
	mov	r3, #2
	ldr	r0, [r4, #8]
	ldr	r1, [r4, #4]
	ldr	ip, [r4]
	add	r0, r0, r0, lsr #31
	add	r1, r1, r0, asr #1
	add	r0, ip, r0, asr #1
	str	r2, [sp]
	sub	r1, r1, #1
	mov	r2, r3
	sub	r0, r0, #1
	mov	lr, pc
	bx	r9
	ldm	r4, {r0, r1, r2}
	b	.L26
.L24:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	.LANCHOR0
	.word	balls
	.word	player
	.word	collision
	.word	drawRect4
	.word	gameover
	.size	drawBalls, .-drawBalls
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"ball created at index: %d, with y value: %d\000"
	.text
	.align	2
	.global	createBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	createBall, %function
createBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L49
	ldr	r1, [r3]
	cmp	r1, #0
	bxle	lr
	ldr	r0, .L49+4
	push	{r4, r5, r6, lr}
	mov	r3, r0
	mov	r4, #0
	b	.L43
.L42:
	add	r4, r4, #1
	cmp	r4, r1
	add	r3, r3, #24
	beq	.L40
.L43:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L42
	mov	r2, #1
	mov	r1, #232
	add	r3, r4, r4, lsl r2
	add	r5, r0, r3, lsl #3
	str	r1, [r0, r3, lsl #3]
	str	r2, [r5, #20]
	ldr	r3, .L49+8
	mov	lr, pc
	bx	r3
	ldr	r2, .L49+12
	smull	r1, r3, r2, r0
	asr	r2, r0, #31
	rsb	r2, r2, r3, asr #4
	add	r2, r2, r2, lsl #3
	sub	r0, r0, r2, lsl #3
	add	r2, r0, #40
	mov	r1, r4
	ldr	r0, .L49+16
	ldr	r3, .L49+20
	str	r2, [r5, #4]
	mov	lr, pc
	bx	r3
.L40:
	pop	{r4, r5, r6, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	.LANCHOR0
	.word	balls
	.word	rand
	.word	954437177
	.word	.LC0
	.word	mgba_printf
	.size	createBall, .-createBall
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
	@ link register save eliminated.
	ldr	r3, .L62
	ldr	r1, [r3]
	cmp	r1, #0
	ble	.L55
	mov	r0, #0
	mov	ip, r0
	ldr	r3, .L62+4
	add	r1, r1, r1, lsl #1
	add	r1, r3, r1, lsl #3
.L54:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L53
	ldr	r2, [r3]
	sub	r2, r2, #1
	cmp	r2, #0
	movge	r0, #1
	str	r2, [r3]
	strlt	ip, [r3, #20]
.L53:
	add	r3, r3, #24
	cmp	r3, r1
	bne	.L54
	ldr	r3, .L62+8
	ldr	r3, [r3]
	add	r3, r3, r3, lsl #4
	ldr	r2, .L62+12
	add	r3, r3, r3, lsl #8
	ldr	r1, .L62+16
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r1, r2, ror #2
	eor	r0, r0, #1
	orrcs	r0, r0, #1
	cmp	r0, #0
	bxeq	lr
.L55:
	b	createBall
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.word	balls
	.word	time
	.word	143165576
	.word	71582788
	.size	updateBalls, .-updateBalls
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"use the arrow keys to move up/down!\000"
	.align	2
.LC2:
	.ascii	"woo! you reached\000"
	.align	2
.LC3:
	.ascii	"%d\000"
	.align	2
.LC4:
	.ascii	"score:\000"
	.text
	.align	2
	.global	drawHUD
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHUD, %function
drawHUD:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r4, #0
	sub	sp, sp, #28
	mov	r3, #40
	mov	r1, r4
	mov	r0, r4
	mov	r2, #240
	ldr	r6, .L75
	str	r4, [sp]
	ldr	r5, .L75+4
	mov	lr, pc
	bx	r6
	mov	r3, #40
	mov	r0, r4
	mov	r2, #240
	mov	r1, #120
	str	r4, [sp]
	mov	lr, pc
	bx	r6
	ldr	r3, [r5]
	cmp	r3, #600
	blt	.L70
	ldr	r4, .L75+8
.L65:
	cmp	r3, #1000
	ble	.L74
	ldr	r6, .L75+12
	smull	r2, r1, r6, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #6
	rsb	r1, r2, r2, lsl #5
	add	r2, r2, r1, lsl #2
	sub	r3, r3, r2, lsl #3
	cmp	r3, #99
	ble	.L72
.L74:
	ldr	r7, .L75+16
	add	r6, sp, #12
.L66:
	mov	r3, #1
	mov	r1, #122
	mov	r0, #2
	ldr	r2, .L75+20
	mov	lr, pc
	bx	r4
	ldr	r2, [r5]
	mov	r0, r6
	ldr	r1, .L75+24
	mov	lr, pc
	bx	r7
	mov	r2, r6
	mov	r3, #1
	mov	r1, #122
	mov	r0, #44
	mov	lr, pc
	bx	r4
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L70:
	mov	r1, #2
	mov	r3, #1
	mov	r0, r1
	ldr	r2, .L75+28
	ldr	r4, .L75+8
	mov	lr, pc
	bx	r4
	ldr	r3, [r5]
	b	.L65
.L72:
	mov	r1, #2
	mov	r3, #1
	mov	r0, r1
	ldr	r2, .L75+32
	mov	lr, pc
	bx	r4
	ldr	r3, [r5]
	smull	r1, r2, r6, r3
	asr	r3, r3, #31
	rsb	r2, r3, r2, asr #6
	rsb	r3, r2, r2, lsl #5
	add	r2, r2, r3, lsl #2
	add	r6, sp, #12
	mov	r0, r6
	ldr	r1, .L75+24
	ldr	r7, .L75+16
	lsl	r2, r2, #3
	mov	lr, pc
	bx	r7
	mov	r2, r6
	mov	r3, #4
	mov	r1, #2
	mov	r0, #108
	mov	lr, pc
	bx	r4
	b	.L66
.L76:
	.align	2
.L75:
	.word	drawRect4
	.word	time
	.word	drawString4
	.word	274877907
	.word	sprintf
	.word	.LC4
	.word	.LC3
	.word	.LC1
	.word	.LC2
	.size	drawHUD, .-drawHUD
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
	ldr	r2, .L89
	ldr	r3, [r2, #16]
	cmp	r3, #1
	str	lr, [sp, #-4]!
	beq	.L87
	cmn	r3, #1
	beq	.L88
.L77:
	ldr	lr, [sp], #4
	bx	lr
.L88:
	ldr	r3, .L89+4
.L82:
	ldrh	r3, [r3]
	tst	r3, #128
	beq	.L77
	ldr	r3, .L89+8
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L77
	mov	r3, #67108864
	mov	ip, #12416
	mov	r0, #1
	ldr	r1, .L89+12
	strh	ip, [r3, #104]	@ movhi
	str	r0, [r2, #16]
	strh	r1, [r3, #108]	@ movhi
	b	.L77
.L87:
	ldr	r3, .L89+4
	ldrh	r1, [r3]
	tst	r1, #64
	beq	.L77
	ldr	r1, .L89+8
	ldrh	r1, [r1]
	tst	r1, #64
	bne	.L77
	mov	r1, #67108864
	mov	lr, #12416
	mvn	ip, #0
	ldr	r0, .L89+16
	strh	lr, [r1, #104]	@ movhi
	str	ip, [r2, #16]
	strh	r0, [r1, #108]	@ movhi
	b	.L82
.L90:
	.align	2
.L89:
	.word	player
	.word	oldButtons
	.word	buttons
	.word	-15229
	.word	-14782
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L105
	bl	checkButtons
	bl	updateBalls
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L102
.L92:
	ldr	r4, .L105+4
	ldr	r3, [r4]
	ldr	r2, .L105+8
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L105+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L105+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L93
	ldr	r3, .L105+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L103
.L93:
	ldr	r3, .L105+24
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L104
	pop	{r4, r5, r6, lr}
	bx	lr
.L102:
	ldr	r3, .L105+28
	mov	r0, #1
	mov	lr, pc
	bx	r3
	bl	drawHUD
	bl	drawPlayer
	bl	drawBalls
	b	.L92
.L104:
	ldr	r0, [r4]
	ldr	r3, .L105+32
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L103:
	mov	r2, #1
	ldr	r0, [r4]
	ldr	r3, .L105+36
	str	r2, [r5]
	mov	lr, pc
	bx	r3
	b	.L93
.L106:
	.align	2
.L105:
	.word	paused
	.word	time
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	gameover
	.word	fillScreen4
	.word	goEnd
	.word	goPause
	.size	doGame, .-doGame
	.global	BALLCOUNT
	.comm	balls,240,4
	.comm	player,20,4
	.comm	gameover,4,4
	.comm	paused,4,4
	.comm	time,4,4
	.comm	state,4,4
	.comm	NOTES,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	BALLCOUNT, %object
	.size	BALLCOUNT, 4
BALLCOUNT:
	.word	10
	.ident	"GCC: (devkitARM release 53) 9.1.0"
