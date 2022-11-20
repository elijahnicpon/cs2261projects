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
	.global	checkNoEnergy
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkNoEnergy, %function
checkNoEnergy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	ldr	r0, [r3, #40]
	cmp	r0, #0
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.size	checkNoEnergy, .-checkNoEnergy
	.global	__aeabi_idiv
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d, %d, %d\000"
	.text
	.align	2
	.global	doEnergyBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	doEnergyBar, %function
doEnergyBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L10
	push	{r4, r5, r6, lr}
	add	r5, r3, #40
	ldm	r5, {r5, r6}
	rsb	r0, r5, r5, lsl #3
	mov	r1, r6
	ldr	r3, .L10+4
	lsl	r0, r0, #2
	mov	lr, pc
	bx	r3
	mov	r4, r0
	mov	r2, r5
	mov	r1, r0
	mov	r3, r6
	ldr	r0, .L10+8
	ldr	r5, .L10+12
	mov	lr, pc
	bx	r5
	cmp	r4, #27
	bgt	.L5
	mov	r2, #512
	ldr	r3, .L10+16
	add	r0, r3, r4, lsl #3
	add	r3, r3, #224
.L7:
	strh	r2, [r0, #240]	@ movhi
	add	r0, r0, #8
	cmp	r0, r3
	bne	.L7
.L5:
	pop	{r4, r5, r6, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	player
	.word	__aeabi_idiv
	.word	.LC0
	.word	mgba_printf
	.word	shadowOAM
	.size	doEnergyBar, .-doEnergyBar
	.align	2
	.global	initEnergyBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnergyBar, %function
initEnergyBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #9
	mov	ip, #2
	mov	r0, #136
	ldr	r2, .L16
	add	r1, r2, #224
.L13:
	strh	r3, [r2, #242]	@ movhi
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #244]	@ movhi
	add	r3, r3, #2
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r1
	lsr	r3, r3, #16
	bne	.L13
	bx	lr
.L17:
	.align	2
.L16:
	.word	shadowOAM
	.size	initEnergyBar, .-initEnergyBar
	.align	2
	.global	doShieldDisplay
	.syntax unified
	.arm
	.fpu softvfp
	.type	doShieldDisplay, %function
doShieldDisplay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #11
	mov	r1, #59
	ldr	r3, .L19
	ldr	r2, [r3, #32]
	ldr	r3, .L19+4
	add	r2, r2, #96
	strh	r2, [r3, #236]	@ movhi
	strh	r0, [r3, #232]	@ movhi
	strh	r1, [r3, #234]	@ movhi
	bx	lr
.L20:
	.align	2
.L19:
	.word	player
	.word	shadowOAM
	.size	doShieldDisplay, .-doShieldDisplay
	.align	2
	.global	doShellDisplay
	.syntax unified
	.arm
	.fpu softvfp
	.type	doShellDisplay, %function
doShellDisplay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L23
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, [r3]
	ldr	r8, .L23+4
	smull	r1, r0, r8, r3
	ldr	r2, .L23+8
	smull	r1, r2, r3, r2
	mov	lr, #11
	mov	r7, #37
	mov	r6, #30
	mov	r5, #23
	mov	r4, #16
	asr	ip, r3, #31
	rsb	r0, ip, r0, asr #2
	smull	r1, r10, r8, r0
	rsb	r2, ip, r2, asr #5
	smull	r1, r8, r2, r8
	ldr	r9, .L23+12
	smull	r1, r9, r3, r9
	asr	r1, r0, #31
	rsb	r1, r1, r10, asr #2
	add	r1, r1, r1, lsl #2
	sub	r1, r0, r1, lsl #1
	add	r0, r0, r0, lsl #2
	sub	r0, r3, r0, lsl #1
	ldr	r3, .L23+16
	add	r1, r1, #96
	strh	r1, [r3, #212]	@ movhi
	asr	r1, r2, #31
	rsb	r8, r1, r8, asr #2
	add	r8, r8, r8, lsl #2
	rsb	ip, ip, r9, asr #6
	sub	r2, r2, r8, lsl #1
	add	r0, r0, #96
	add	ip, ip, #96
	add	r2, r2, #96
	strh	r7, [r3, #202]	@ movhi
	strh	r6, [r3, #210]	@ movhi
	strh	r5, [r3, #218]	@ movhi
	strh	r4, [r3, #226]	@ movhi
	strh	lr, [r3, #200]	@ movhi
	strh	lr, [r3, #208]	@ movhi
	strh	lr, [r3, #216]	@ movhi
	strh	lr, [r3, #224]	@ movhi
	strh	r0, [r3, #204]	@ movhi
	strh	r2, [r3, #220]	@ movhi
	strh	ip, [r3, #228]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	shells_owned
	.word	1717986919
	.word	1374389535
	.word	274877907
	.word	shadowOAM
	.size	doShellDisplay, .-doShellDisplay
	.align	2
	.global	updateAndDrawHUD
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAndDrawHUD, %function
updateAndDrawHUD:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	doShellDisplay
	mov	r0, #11
	mov	r1, #59
	ldr	r3, .L27
	ldr	r2, [r3, #32]
	ldr	r3, .L27+4
	add	r2, r2, #96
	strh	r2, [r3, #236]	@ movhi
	strh	r0, [r3, #232]	@ movhi
	strh	r1, [r3, #234]	@ movhi
	pop	{r4, lr}
	b	doEnergyBar
.L28:
	.align	2
.L27:
	.word	player
	.word	shadowOAM
	.size	updateAndDrawHUD, .-updateAndDrawHUD
	.align	2
	.global	min
	.syntax unified
	.arm
	.fpu softvfp
	.type	min, %function
min:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, r0
	movlt	r0, r1
	bx	lr
	.size	min, .-min
	.align	2
	.global	initShells
	.syntax unified
	.arm
	.fpu softvfp
	.type	initShells, %function
initShells:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L38
	ldr	r0, [r3]
	cmp	r0, #0
	bxle	lr
	mov	r2, #4
	str	lr, [sp, #-4]!
	mov	ip, #10
	mov	lr, #0
	mov	r1, #7
	ldr	r3, .L38+4
	add	r0, r0, r2
.L32:
	str	r2, [r3, #24]
	add	r2, r2, #1
	cmp	r2, r0
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #40
	bne	.L32
	ldr	lr, [sp], #4
	bx	lr
.L39:
	.align	2
.L38:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	initShells, .-initShells
	.align	2
	.global	newShell
	.syntax unified
	.arm
	.fpu softvfp
	.type	newShell, %function
newShell:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L54
	ldr	r2, [r3]
	cmp	r2, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L54+4
	mov	r4, #0
	mov	r3, r7
	b	.L48
.L42:
	add	r4, r4, #1
	cmp	r4, r2
	add	r3, r3, #40
	beq	.L40
.L48:
	ldr	r5, [r3, #28]
	cmp	r5, #0
	bne	.L42
	ldr	r3, .L54+8
	ldr	r9, .L54+12
	ldr	r6, [r3]
	smull	r2, r3, r9, r6
	ldr	r10, .L54+16
	asr	r2, r6, #31
	add	r3, r3, r6
	rsb	r6, r2, r3, asr #7
	mov	lr, pc
	bx	r10
	mov	r1, r0
	ldr	r3, .L54+20
	smull	r0, r2, r3, r1
	asr	r3, r1, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	sub	r1, r1, r3, lsl #2
	mov	r0, r6
	ldr	r3, .L54+24
	mov	lr, pc
	bx	r3
	eor	r0, r0, #2
	cmp	r0, #8
	movge	r0, #8
	add	r6, r4, r4, lsl #2
	lsl	r8, r6, #3
	add	r6, r7, r6, lsl #3
	str	r0, [r6, #4]
	mov	lr, pc
	bx	r10
	mov	r2, #1
	smull	r3, r9, r0, r9
	asr	r3, r0, #31
	add	r9, r9, r0
	rsb	r3, r3, r9, asr #7
	rsb	r3, r3, r3, lsl #4
	ldr	r1, [r6, #4]
	sub	r0, r0, r3, lsl #4
	lsl	r0, r0, #3
	sub	r3, r1, #1
	str	r2, [r6, #28]
	str	r5, [r6, #8]
	str	r0, [r7, r8]
	lsl	r2, r4, #2
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L40
.L44:
	.word	.L45
	.word	.L45
	.word	.L40
	.word	.L45
	.word	.L40
	.word	.L40
	.word	.L40
	.word	.L43
.L43:
	mov	r3, #4
	add	r2, r2, r4
	add	r7, r7, r2, lsl #3
	str	r3, [r7, #36]
.L40:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L45:
	mov	r3, #0
	add	r2, r2, r4
	add	r7, r7, r2, lsl #3
	str	r3, [r7, #36]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	time
	.word	-2004318071
	.word	rand
	.word	1717986919
	.word	__aeabi_idiv
	.size	newShell, .-newShell
	.align	2
	.global	updateAndDrawShells
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAndDrawShells, %function
updateAndDrawShells:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L71
	ldr	r3, [r3]
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r3, r3, r3, lsl #4
	ldr	r2, .L71+4
	add	r3, r3, r3, lsl #8
	ldr	r1, .L71+8
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r1, r2, ror #3
	sub	sp, sp, #20
	bcs	.L70
.L57:
	ldr	r8, .L71+12
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L56
	mov	r5, #0
	ldr	r4, .L71+16
	ldr	r6, .L71+20
	ldr	r7, .L71+24
	ldr	r9, .L71+28
	ldr	r10, .L71+32
	b	.L63
.L62:
	ldr	r3, [r8]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #40
	ble	.L56
.L63:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	moveq	r3, #512
	ldr	ip, [r4, #24]
	lsleq	ip, ip, #3
	strheq	r3, [r6, ip]	@ movhi
	beq	.L62
	ldr	r1, [r4, #8]
	ldr	r3, [r7]
	add	r2, r1, #7
	cmp	r1, #0
	movlt	r1, r2
	add	r2, r3, #7
	cmp	r3, #0
	movlt	r3, r2
	ldr	r0, [r4]
	cmp	r0, #0
	add	r2, r0, #7
	movlt	r0, r2
	asr	r1, r1, #3
	lsl	lr, ip, #3
	asr	r3, r3, #3
	and	fp, r1, #255
	str	r3, [sp]
	strh	fp, [r6, lr]	@ movhi
	ldr	r3, [r4, #36]
	ldr	lr, [r4, #32]
	orr	lr, lr, r3, lsl #12
	ldr	r3, [r7, #20]
	str	r3, [sp, #12]
	ldr	r3, [r7, #24]
	ldr	r2, .L71+36
	str	r3, [sp, #8]
	ldr	r3, [r7, #8]
	add	ip, r6, ip, lsl #3
	and	r2, r2, r0, asr #3
	str	r3, [sp, #4]
	asr	r0, r0, #3
	strh	r2, [ip, #2]	@ movhi
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #16]
	strh	lr, [ip, #4]	@ movhi
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L60
	mov	r2, #0
	ldr	r1, [r10]
	ldr	r3, [r4, #4]
	add	r3, r3, r1
	str	r3, [r10]
	str	r2, [r4, #28]
.L60:
	ldr	r3, [r4, #8]
	cmp	r3, #1280
	add	r3, r3, #2
	movgt	r3, #0
	strle	r3, [r4, #8]
	strgt	r3, [r4, #28]
	b	.L62
.L56:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L70:
	bl	newShell
	b	.L57
.L72:
	.align	2
.L71:
	.word	time
	.word	143165576
	.word	35791394
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	shadowOAM
	.word	player
	.word	collision
	.word	shells_owned
	.word	511
	.size	updateAndDrawShells, .-updateAndDrawShells
	.global	__aeabi_idivmod
	.align	2
	.global	updateAndDrawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAndDrawPlayer, %function
updateAndDrawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L76
	ldr	r2, .L76+4
	ldr	r3, [r4, #40]
	ldr	r1, [r2]
	ldr	r2, .L76+8
	sub	r3, r3, #1
	ldr	r0, [r2]
	ldr	r5, .L76+12
	str	r3, [r4, #40]
	rsb	r1, r1, #10
	mov	lr, pc
	bx	r5
	cmp	r1, #0
	ldr	r1, [r4, #12]
	bne	.L74
	add	r0, r1, #1
	ldr	r1, [r4, #16]
	mov	lr, pc
	bx	r5
	str	r1, [r4, #12]
.L74:
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	mvn	r3, r3, lsl #17
	ldr	r2, [r4]
	add	r0, r2, #7
	cmp	r2, #0
	movlt	r2, r0
	mvn	r3, r3, lsr #17
	ldr	r0, .L76+16
	ldr	ip, [r4, #28]
	ldr	lr, .L76+20
	ldr	r4, .L76+24
	add	r1, r0, r1, lsl #2
	ldr	r0, [r1, #4]
	and	r2, lr, r2, asr #3
	add	r1, r4, ip, lsl #3
	lsl	ip, ip, #3
	strh	r3, [r4, ip]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	player
	.word	gameSpeed
	.word	time
	.word	__aeabi_idivmod
	.word	.LANCHOR0
	.word	511
	.word	shadowOAM
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
	ldr	r3, .L87
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L79
	ldr	r3, .L87+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L86
.L79:
	ldr	r3, .L87+8
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L80
	ldr	r3, .L87+12
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
.L80:
	ldr	r3, .L87+8
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L78
	ldr	r2, .L87+12
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
.L78:
	pop	{r4, lr}
	bx	lr
.L86:
	ldr	r3, .L87+16
	mov	lr, pc
	bx	r3
	b	.L79
.L88:
	.align	2
.L87:
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	player
	.word	goPause
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
	ldr	r2, .L92
	ldr	r3, [r2]
	push	{r4, lr}
	add	r3, r3, #1
	ldr	r1, .L92+4
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldr	r0, .L92+8
	ldr	r3, [r0]
	sub	r1, r3, #1
	cmp	r1, #0
	addlt	r3, r3, #6
	movge	r3, r1
	mov	r2, #67108864
	asr	r3, r3, #3
	str	r1, [r0]
	lsl	r3, r3, #16
	ldr	r0, .L92+12
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
	bl	updateAndDrawShells
	bl	updateAndDrawHUD
	ldr	r3, .L92+16
	ldr	r3, [r3, #40]
	cmp	r3, #0
	ldrle	r3, .L92+20
	movle	lr, pc
	bxle	r3
.L90:
	bl	checkButtons
	ldr	r4, .L92+24
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L92+28
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L93:
	.align	2
.L92:
	.word	time
	.word	waitForVBlank
	.word	cloudVOff
	.word	vOff
	.word	player
	.word	goDeathEnergy
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
	ldr	r0, .L95
	ldr	r3, [r0]
	sub	r1, r3, #1
	cmp	r1, #0
	addlt	r3, r3, #6
	movge	r3, r1
	mov	r2, #67108864
	asr	r3, r3, #3
	str	r1, [r0]
	lsl	r3, r3, #16
	ldr	r0, .L95+4
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
.L96:
	.align	2
.L95:
	.word	cloudVOff
	.word	vOff
	.size	updateBackgrounds, .-updateBackgrounds
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L104
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	mov	r1, #4864
	mov	r0, #7936
	mov	r4, #4
	ldr	r2, .L104+4
	ldr	r5, .L104+8
	str	r4, [r2]
	mov	r3, #256
	strh	r1, [r6]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L104+12
	strh	r0, [r6, #10]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L104+16
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L104+20
	ldr	r1, .L104+24
	mov	lr, pc
	bx	r5
	ldr	r2, .L104+28
	mov	r3, #240
	mov	r0, #3
	strh	r2, [r6, #8]	@ movhi
	ldr	r1, .L104+32
	ldr	r2, .L104+36
	mov	lr, pc
	bx	r5
	mov	r3, #1776
	mov	r0, #3
	ldr	r2, .L104+40
	ldr	r1, .L104+44
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L104+48
	ldr	r1, .L104+52
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L104+56
	ldr	r1, .L104+60
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L104+64
	ldr	r1, .L104+68
	mov	lr, pc
	bx	r5
	mov	r2, #128
	mov	r1, #132
	ldr	r3, .L104+72
	ldr	r0, [r3]
	ldr	r3, .L104+76
	ldr	lr, .L104+80
	ldr	ip, .L104+84
	strh	r2, [r3, #4]	@ movhi
	ldr	r2, .L104+88
	cmp	r0, #0
	strh	lr, [r3, #2]	@ movhi
	strh	ip, [r3, #10]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ble	.L98
	mov	r2, r4
	mov	lr, #0
	mov	ip, #10
	mov	r1, #7
	ldr	r3, .L104+92
	add	r0, r0, r4
.L99:
	str	r2, [r3, #24]
	add	r2, r2, #1
	cmp	r2, r0
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #40
	bne	.L99
.L98:
	mov	r3, #9
	mov	ip, #2
	mov	r0, #136
	ldr	r2, .L104+76
	add	r1, r2, #224
.L100:
	strh	r3, [r2, #242]	@ movhi
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #244]	@ movhi
	add	r3, r3, #2
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r1
	lsr	r3, r3, #16
	bne	.L100
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L104+76
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L105:
	.align	2
.L104:
	.word	hideSprites
	.word	state
	.word	DMANow
	.word	game_bgPal
	.word	game_bgTiles
	.word	100726784
	.word	game_bgMap
	.word	7684
	.word	game_clouds_bgPal
	.word	83886144
	.word	100679680
	.word	game_clouds_bgTiles
	.word	100724736
	.word	game_clouds_bgMap
	.word	83886592
	.word	game_ssPal
	.word	100728832
	.word	game_ssTiles
	.word	.LANCHOR0
	.word	shadowOAM
	.word	-32766
	.word	-32734
	.word	16386
	.word	.LANCHOR1
	.size	resumeGame, .-resumeGame
	.align	2
	.global	updatePlayerStatsAndReset
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayerStatsAndReset, %function
updatePlayerStatsAndReset:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L107
	add	r0, r1, #52
	ldm	r0, {r0, r3}
	ldr	r2, [r1, #24]
	add	r3, r3, #1
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	rsb	r3, r3, r3, lsl #4
	ldr	ip, [r1, #48]
	add	r0, r0, #1
	rsb	r2, r2, #120
	rsb	r3, r3, r3, lsl #4
	lsl	r3, r3, #3
	lsl	r0, r0, #1
	lsl	r2, r2, #3
	str	ip, [r1, #32]
	str	r0, [r1, #36]
	str	r2, [r1]
	str	r3, [r1, #40]
	str	r3, [r1, #44]
	bx	lr
.L108:
	.align	2
.L107:
	.word	player
	.size	updatePlayerStatsAndReset, .-updatePlayerStatsAndReset
	.align	2
	.global	newGameRun
	.syntax unified
	.arm
	.fpu softvfp
	.type	newGameRun, %function
newGameRun:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L116
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	mov	r1, #4864
	mov	r0, #7936
	mov	r4, #4
	ldr	r2, .L116+4
	ldr	r5, .L116+8
	str	r4, [r2]
	mov	r3, #256
	strh	r1, [r6]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L116+12
	strh	r0, [r6, #10]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L116+16
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L116+20
	ldr	r1, .L116+24
	mov	lr, pc
	bx	r5
	ldr	r2, .L116+28
	mov	r3, #240
	mov	r0, #3
	strh	r2, [r6, #8]	@ movhi
	ldr	r1, .L116+32
	ldr	r2, .L116+36
	mov	lr, pc
	bx	r5
	mov	r3, #1776
	mov	r0, #3
	ldr	r2, .L116+40
	ldr	r1, .L116+44
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L116+48
	ldr	r1, .L116+52
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L116+56
	ldr	r1, .L116+60
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L116+64
	ldr	r1, .L116+68
	mov	lr, pc
	bx	r5
	mov	r2, #128
	mov	r1, #132
	ldr	r3, .L116+72
	ldr	r0, [r3]
	ldr	r3, .L116+76
	ldr	lr, .L116+80
	ldr	ip, .L116+84
	strh	r2, [r3, #4]	@ movhi
	ldr	r2, .L116+88
	cmp	r0, #0
	strh	lr, [r3, #2]	@ movhi
	strh	ip, [r3, #10]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ble	.L110
	mov	r2, r4
	mov	lr, #0
	mov	ip, #10
	mov	r1, #7
	ldr	r3, .L116+92
	add	r0, r0, r4
.L111:
	str	r2, [r3, #24]
	add	r2, r2, #1
	cmp	r2, r0
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #40
	bne	.L111
.L110:
	mov	r3, #9
	mov	ip, #2
	mov	r0, #136
	ldr	r2, .L116+76
	add	r1, r2, #224
.L112:
	strh	r3, [r2, #242]	@ movhi
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #244]	@ movhi
	add	r3, r3, #2
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r1
	lsr	r3, r3, #16
	bne	.L112
	bl	updatePlayerStatsAndReset
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L116+76
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L117:
	.align	2
.L116:
	.word	hideSprites
	.word	state
	.word	DMANow
	.word	game_bgPal
	.word	game_bgTiles
	.word	100726784
	.word	game_bgMap
	.word	7684
	.word	game_clouds_bgPal
	.word	83886144
	.word	100679680
	.word	game_clouds_bgTiles
	.word	100724736
	.word	game_clouds_bgMap
	.word	83886592
	.word	game_ssPal
	.word	100728832
	.word	game_ssTiles
	.word	.LANCHOR0
	.word	shadowOAM
	.word	-32766
	.word	-32734
	.word	16386
	.word	.LANCHOR1
	.size	newGameRun, .-newGameRun
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L125
	mov	lr, pc
	bx	r3
	ldr	r3, .L125+4
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	mov	r2, #4864
	mov	r4, #4
	ldr	r3, .L125+8
	ldr	r1, .L125+12
	ldr	r5, .L125+16
	str	r4, [r3]
	mov	r0, #3
	strh	r2, [r6]	@ movhi
	mov	r3, #256
	strh	r1, [r6, #10]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L125+20
	mov	lr, pc
	bx	r5
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L125+24
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L125+28
	ldr	r1, .L125+32
	mov	lr, pc
	bx	r5
	mov	r10, #128
	ldr	r2, .L125+36
	mov	r3, #240
	strh	r2, [r6, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L125+40
	ldr	r1, .L125+44
	mov	lr, pc
	bx	r5
	mov	r3, #1776
	mov	r0, #3
	ldr	r2, .L125+48
	ldr	r1, .L125+52
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L125+56
	ldr	r1, .L125+60
	mov	lr, pc
	bx	r5
	mov	fp, #132
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L125+64
	ldr	r1, .L125+68
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L125+72
	ldr	r1, .L125+76
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L125+80
	strh	r10, [r1, #4]	@ movhi
	ldr	r10, .L125+84
	strh	r10, [r1, #2]	@ movhi
	add	r10, r10, #32
	strh	r10, [r1, #10]	@ movhi
	ldr	r10, .L125+88
	strh	fp, [r1, #12]	@ movhi
	strh	r10, [r1]	@ movhi
	strh	r10, [r1, #8]	@ movhi
	ldr	r1, .L125+92
	mov	r3, #0
	mov	ip, #8
	mov	r9, #9
	mov	r8, #928
	mov	r7, #960
	mov	r6, #138
	mov	lr, #16
	str	r0, [r1, #28]
	mov	r0, #2
	ldr	r2, .L125+96
	ldr	r2, [r2]
	str	ip, [r1, #16]
	cmp	r2, r3
	add	ip, ip, #1792
	str	r9, [r1, #24]
	str	r8, [r1]
	str	r7, [r1, #4]
	str	r6, [r1, #8]
	str	lr, [r1, #20]
	str	r0, [r1, #36]
	str	r3, [r1, #12]
	str	r3, [r1, #56]
	str	r3, [r1, #48]
	str	r3, [r1, #52]
	str	r3, [r1, #32]
	str	ip, [r1, #40]
	str	ip, [r1, #44]
	ble	.L119
	mov	ip, #10
	mov	r0, #7
	ldr	r1, .L125+100
	add	r2, r2, r4
.L120:
	str	r4, [r1, #24]
	add	r4, r4, #1
	cmp	r4, r2
	str	r3, [r1, #28]
	str	ip, [r1, #32]
	str	r0, [r1, #16]
	str	r0, [r1, #20]
	add	r1, r1, #40
	bne	.L120
.L119:
	mov	r3, #9
	mov	ip, #2
	mov	r0, #136
	ldr	r2, .L125+80
	add	r1, r2, #224
.L121:
	strh	r3, [r2, #242]	@ movhi
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #244]	@ movhi
	add	r3, r3, #2
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r1
	lsr	r3, r3, #16
	bne	.L121
	mov	ip, #0
	ldr	r0, .L125+104
	mov	r3, #512
	str	ip, [r0]
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L125+80
	mov	lr, pc
	bx	r5
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L126:
	.align	2
.L125:
	.word	srand
	.word	hideSprites
	.word	state
	.word	7937
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
	.word	shadowOAM
	.word	-32766
	.word	16386
	.word	player
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	vOff
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
	mov	r1, #16
	push	{r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	r7, #9
	mov	r6, #928
	mov	r5, #960
	mov	r4, #138
	mov	lr, #8
	mov	ip, #3
	mov	r0, #2
	ldr	r3, .L129
	str	r1, [r3, #20]
	ldr	r1, .L129+4
	str	r7, [r3, #24]
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #8]
	str	lr, [r3, #16]
	str	ip, [r3, #28]
	str	r0, [r3, #36]
	str	r2, [r3, #12]
	str	r2, [r3, #56]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #32]
	str	r1, [r3, #40]
	str	r1, [r3, #44]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L130:
	.align	2
.L129:
	.word	player
	.word	1800
	.size	initPlayer, .-initPlayer
	.global	NUM_SHELLS
	.global	shells
	.global	playerFrames
	.comm	player,72,4
	.comm	shadowOAM,1024,4
	.comm	gameSpeed,4,4
	.comm	cloudVOff,4,4
	.comm	vOff,4,4
	.comm	time,4,4
	.comm	shells_owned,4,4
	.comm	state,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	NUM_SHELLS, %object
	.size	NUM_SHELLS, 4
NUM_SHELLS:
	.word	20
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
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	shells, %object
	.size	shells, 800
shells:
	.space	800
	.ident	"GCC: (devkitARM release 53) 9.1.0"
