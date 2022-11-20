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
	ldr	r0, [r3, #40]
	rsb	r0, r0, r0, lsl #3
	ldr	r1, [r3, #44]
	push	{r4, lr}
	ldr	r3, .L10+4
	lsl	r0, r0, #2
	mov	lr, pc
	bx	r3
	cmp	r0, #27
	bgt	.L5
	mov	r2, #512
	ldr	r3, .L10+8
	add	r0, r3, r0, lsl #3
	add	r3, r3, #224
.L7:
	strh	r2, [r0, #240]	@ movhi
	add	r0, r0, #8
	cmp	r0, r3
	bne	.L7
.L5:
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	player
	.word	__aeabi_idiv
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
	mov	lr, #11
	mov	ip, #59
	ldr	r2, .L30
	ldr	r0, [r2, #40]
	ldr	r3, [r2, #32]
	ldr	r4, .L30+4
	add	r3, r3, #96
	rsb	r0, r0, r0, lsl #3
	strh	r3, [r4, #236]	@ movhi
	ldr	r1, [r2, #44]
	ldr	r3, .L30+8
	strh	lr, [r4, #232]	@ movhi
	strh	ip, [r4, #234]	@ movhi
	lsl	r0, r0, #2
	mov	lr, pc
	bx	r3
	cmp	r0, #27
	bgt	.L25
	mov	r2, #512
	add	r0, r4, r0, lsl #3
	add	r3, r4, #224
.L27:
	strh	r2, [r0, #240]	@ movhi
	add	r0, r0, #8
	cmp	r0, r3
	bne	.L27
.L25:
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	player
	.word	shadowOAM
	.word	__aeabi_idiv
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
	ldr	r3, .L41
	ldr	r0, [r3]
	cmp	r0, #0
	bxle	lr
	mov	r2, #4
	str	lr, [sp, #-4]!
	mov	ip, #10
	mov	lr, #0
	mov	r1, #7
	ldr	r3, .L41+4
	add	r0, r0, r2
.L35:
	str	r2, [r3, #24]
	add	r2, r2, #1
	cmp	r2, r0
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #40
	bne	.L35
	ldr	lr, [sp], #4
	bx	lr
.L42:
	.align	2
.L41:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	initShells, .-initShells
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"powpow(%d, %d) -> %d\000"
	.text
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
	ldr	r3, .L63
	ldr	r1, [r3]
	cmp	r1, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L63+4
	mov	r4, #0
	mov	r3, r6
	b	.L54
.L45:
	add	r4, r4, #1
	cmp	r4, r1
	add	r3, r3, #40
	beq	.L43
.L54:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	bne	.L45
	ldr	r2, .L63+8
	ldr	r3, .L63+12
	ldr	r2, [r2]
	smull	r1, r3, r2, r3
	asr	r2, r2, #31
	rsbs	r2, r2, r3, asr #7
	beq	.L55
	mov	r1, r2
	mov	r5, #1
.L47:
	subs	r1, r1, #1
	lsl	r5, r5, #1
	bne	.L47
.L46:
	mov	r3, r5
	mov	r1, #2
	ldr	r7, .L63+16
	ldr	r8, .L63+20
	ldr	r0, .L63+24
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r8
	mvn	r3, r0
	and	r3, r3, #1
	muls	r2, r5, r3
	movne	r3, #2
	moveq	r3, #1
	add	r7, r4, r4, lsl #2
	add	r5, r6, r7, lsl #3
	str	r3, [r5, #4]
	mov	lr, pc
	bx	r8
	mov	ip, #0
	mov	r1, #1
	ldr	r2, .L63+28
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	ldr	r2, [r5, #4]
	sub	r0, r0, r3, lsl #4
	lsl	r7, r7, #3
	lsl	r0, r0, #3
	sub	r3, r2, #1
	str	r0, [r6, r7]
	str	ip, [r5, #8]
	str	r1, [r5, #28]
	lsl	r2, r4, #2
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L43
.L50:
	.word	.L53
	.word	.L52
	.word	.L43
	.word	.L51
	.word	.L43
	.word	.L43
	.word	.L43
	.word	.L49
.L49:
	mov	r3, #3
	add	r2, r2, r4
	add	r6, r6, r2, lsl r3
	str	r3, [r6, #36]
.L43:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L51:
	mov	r3, #2
	add	r2, r2, r4
	add	r6, r6, r2, lsl #3
	str	r3, [r6, #36]
	b	.L43
.L52:
	mov	r3, #1
	add	r2, r2, r4
	add	r6, r6, r2, lsl #3
	str	r3, [r6, #36]
	b	.L43
.L53:
	mov	r3, #0
	add	r2, r2, r4
	add	r6, r6, r2, lsl #3
	str	r3, [r6, #36]
	b	.L43
.L55:
	mov	r5, #1
	b	.L46
.L64:
	.align	2
.L63:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	time
	.word	458129845
	.word	mgba_printf
	.word	rand
	.word	.LC0
	.word	-2004318071
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
	ldr	r3, .L80
	ldr	r3, [r3]
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r3, r3, r3, lsl #4
	ldr	r2, .L80+4
	add	r3, r3, r3, lsl #8
	ldr	r1, .L80+8
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r1, r2, ror #3
	sub	sp, sp, #20
	bcs	.L79
.L66:
	ldr	r8, .L80+12
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L65
	mov	r5, #0
	ldr	r4, .L80+16
	ldr	r6, .L80+20
	ldr	r7, .L80+24
	ldr	r9, .L80+28
	ldr	r10, .L80+32
	b	.L72
.L71:
	ldr	r3, [r8]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #40
	ble	.L65
.L72:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	moveq	r3, #512
	ldr	ip, [r4, #24]
	lsleq	ip, ip, #3
	strheq	r3, [r6, ip]	@ movhi
	beq	.L71
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
	ldr	r2, .L80+36
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
	beq	.L69
	mov	r2, #0
	ldr	r1, [r10]
	ldr	r3, [r4, #4]
	add	r3, r3, r1
	str	r3, [r10]
	str	r2, [r4, #28]
.L69:
	ldr	r3, [r4, #8]
	cmp	r3, #1280
	add	r3, r3, #2
	movgt	r3, #0
	strle	r3, [r4, #8]
	strgt	r3, [r4, #28]
	b	.L71
.L65:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L79:
	bl	newShell
	b	.L66
.L81:
	.align	2
.L80:
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
	.align	2
	.global	powpow
	.syntax unified
	.arm
	.fpu softvfp
	.type	powpow, %function
powpow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	r2, r1, #0
	push	{r4, r5, r6, lr}
	mov	r1, r0
	beq	.L85
	mov	ip, r2
	mov	r4, #1
.L84:
	subs	ip, ip, #1
	mul	r4, r1, r4
	bne	.L84
.L83:
	mov	r3, r4
	ldr	r5, .L88
	ldr	r0, .L88+4
	mov	lr, pc
	bx	r5
	mov	r0, r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L85:
	mov	r4, #1
	b	.L83
.L89:
	.align	2
.L88:
	.word	mgba_printf
	.word	.LC0
	.size	powpow, .-powpow
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
	ldr	r4, .L93
	ldr	r2, .L93+4
	ldr	r3, [r4, #40]
	ldr	r1, [r2]
	ldr	r2, .L93+8
	sub	r3, r3, #1
	ldr	r0, [r2]
	ldr	r5, .L93+12
	str	r3, [r4, #40]
	rsb	r1, r1, #10
	mov	lr, pc
	bx	r5
	cmp	r1, #0
	ldr	r1, [r4, #12]
	bne	.L91
	add	r0, r1, #1
	ldr	r1, [r4, #16]
	mov	lr, pc
	bx	r5
	str	r1, [r4, #12]
.L91:
	ldrb	r3, [r4, #8]	@ zero_extendqisi2
	mvn	r3, r3, lsl #17
	ldr	r2, [r4]
	add	r0, r2, #7
	cmp	r2, #0
	movlt	r2, r0
	mvn	r3, r3, lsr #17
	ldr	r0, .L93+16
	add	r1, r0, r1, lsl #2
	ldr	ip, [r4, #28]
	ldr	lr, .L93+20
	ldr	r4, .L93+24
	ldr	r1, [r1, #4]
	add	r0, r4, ip, lsl #3
	and	r2, lr, r2, asr #3
	lsl	ip, ip, #3
	orr	r1, r1, #1024
	strh	r3, [r4, ip]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L94:
	.align	2
.L93:
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
	ldr	r3, .L104
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L96
	ldr	r3, .L104+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L103
.L96:
	ldr	r3, .L104+8
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L97
	ldr	r3, .L104+12
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
.L97:
	ldr	r3, .L104+8
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L95
	ldr	r2, .L104+12
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
.L95:
	pop	{r4, lr}
	bx	lr
.L103:
	ldr	r3, .L104+16
	mov	lr, pc
	bx	r3
	b	.L96
.L105:
	.align	2
.L104:
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
	ldr	r2, .L109
	ldr	r3, [r2]
	push	{r4, lr}
	add	r3, r3, #1
	ldr	r1, .L109+4
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	ldr	ip, .L109+8
	ldr	r3, [ip]
	sub	r0, r3, #1
	cmp	r0, #0
	addlt	r3, r3, #6
	movge	r3, r0
	mov	r1, #67108864
	asr	r3, r3, #3
	lsl	r3, r3, #16
	str	r0, [ip]
	lsr	r3, r3, #16
	ldr	r0, .L109+12
	sub	r2, r3, #10
	strh	r3, [r1, #18]	@ movhi
	lsl	r2, r2, #16
	ldr	r3, [r0]
	lsr	r2, r2, #16
	strh	r2, [r1, #26]	@ movhi
	sub	r2, r3, #2
	cmp	r2, #0
	addlt	r3, r3, #5
	movge	r3, r2
	mov	ip, #0
	asr	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r2, [r0]
	strh	r3, [r1, #22]	@ movhi
	strh	ip, [r1, #20]	@ movhi
	bl	updateAndDrawPlayer
	bl	updateAndDrawShells
	bl	updateAndDrawHUD
	ldr	r3, .L109+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L109+20
	ldr	r3, [r3, #40]
	cmp	r3, #0
	ldrle	r3, .L109+24
	movle	lr, pc
	bxle	r3
.L107:
	bl	checkButtons
	ldr	r4, .L109+28
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L109+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L110:
	.align	2
.L109:
	.word	time
	.word	waitForVBlank
	.word	cloudVOff
	.word	vOff
	.word	updateAndDrawHazards
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
	ldr	ip, .L112
	ldr	r3, [ip]
	sub	r0, r3, #1
	cmp	r0, #0
	addlt	r3, r3, #6
	movge	r3, r0
	mov	r1, #67108864
	asr	r3, r3, #3
	lsl	r3, r3, #16
	str	r0, [ip]
	lsr	r3, r3, #16
	ldr	r0, .L112+4
	sub	r2, r3, #10
	strh	r3, [r1, #18]	@ movhi
	lsl	r2, r2, #16
	ldr	r3, [r0]
	lsr	r2, r2, #16
	strh	r2, [r1, #26]	@ movhi
	sub	r2, r3, #2
	cmp	r2, #0
	addlt	r3, r3, #5
	movge	r3, r2
	mov	ip, #0
	asr	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r2, [r0]
	strh	r3, [r1, #22]	@ movhi
	strh	ip, [r1, #20]	@ movhi
	bx	lr
.L113:
	.align	2
.L112:
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
	ldr	r3, .L121
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	mov	r1, #4864
	mov	r0, #7936
	mov	r4, #4
	ldr	r2, .L121+4
	ldr	r5, .L121+8
	str	r4, [r2]
	mov	r3, #256
	strh	r1, [r6]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L121+12
	strh	r0, [r6, #10]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L121+16
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L121+20
	ldr	r1, .L121+24
	mov	lr, pc
	bx	r5
	ldr	r2, .L121+28
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r6, #8]	@ movhi
	ldr	r1, .L121+32
	ldr	r2, .L121+36
	mov	lr, pc
	bx	r5
	mov	r3, #816
	mov	r0, #3
	ldr	r2, .L121+40
	ldr	r1, .L121+44
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L121+48
	ldr	r1, .L121+52
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L121+56
	ldr	r1, .L121+60
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L121+64
	ldr	r1, .L121+68
	mov	lr, pc
	bx	r5
	mov	r2, #128
	mov	r1, #132
	ldr	r3, .L121+72
	ldr	r0, [r3]
	ldr	r3, .L121+76
	ldr	lr, .L121+80
	ldr	ip, .L121+84
	strh	r2, [r3, #4]	@ movhi
	ldr	r2, .L121+88
	cmp	r0, #0
	strh	lr, [r3, #2]	@ movhi
	strh	ip, [r3, #10]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ble	.L115
	mov	r2, r4
	mov	lr, #0
	mov	ip, #10
	mov	r1, #7
	ldr	r3, .L121+92
	add	r0, r0, r4
.L116:
	str	r2, [r3, #24]
	add	r2, r2, #1
	cmp	r2, r0
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #40
	bne	.L116
.L115:
	mov	r3, #9
	mov	ip, #2
	mov	r0, #136
	ldr	r2, .L121+76
	add	r1, r2, #224
.L117:
	strh	r3, [r2, #242]	@ movhi
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #244]	@ movhi
	add	r3, r3, #2
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r1
	lsr	r3, r3, #16
	bne	.L117
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L121+76
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L122:
	.align	2
.L121:
	.word	hideSprites
	.word	state
	.word	DMANow
	.word	game_bg_copyPal
	.word	game_bg_copyTiles
	.word	100726784
	.word	game_bg_copyMap
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
	ldr	r1, .L124
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
.L125:
	.align	2
.L124:
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
	ldr	r3, .L133
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	mov	r1, #4864
	mov	r0, #7936
	mov	r4, #4
	ldr	r2, .L133+4
	ldr	r5, .L133+8
	str	r4, [r2]
	mov	r3, #256
	strh	r1, [r6]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L133+12
	strh	r0, [r6, #10]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L133+16
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L133+20
	ldr	r1, .L133+24
	mov	lr, pc
	bx	r5
	ldr	r2, .L133+28
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r6, #8]	@ movhi
	ldr	r1, .L133+32
	ldr	r2, .L133+36
	mov	lr, pc
	bx	r5
	mov	r3, #816
	mov	r0, #3
	ldr	r2, .L133+40
	ldr	r1, .L133+44
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L133+48
	ldr	r1, .L133+52
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L133+56
	ldr	r1, .L133+60
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L133+64
	ldr	r1, .L133+68
	mov	lr, pc
	bx	r5
	mov	r2, #128
	mov	r1, #132
	ldr	r3, .L133+72
	ldr	r0, [r3]
	ldr	r3, .L133+76
	ldr	lr, .L133+80
	ldr	ip, .L133+84
	strh	r2, [r3, #4]	@ movhi
	ldr	r2, .L133+88
	cmp	r0, #0
	strh	lr, [r3, #2]	@ movhi
	strh	ip, [r3, #10]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ble	.L127
	mov	r2, r4
	mov	lr, #0
	mov	ip, #10
	mov	r1, #7
	ldr	r3, .L133+92
	add	r0, r0, r4
.L128:
	str	r2, [r3, #24]
	add	r2, r2, #1
	cmp	r2, r0
	str	lr, [r3, #28]
	str	ip, [r3, #32]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	add	r3, r3, #40
	bne	.L128
.L127:
	mov	r3, #9
	mov	ip, #2
	mov	r0, #136
	ldr	r2, .L133+76
	add	r1, r2, #224
.L129:
	strh	r3, [r2, #242]	@ movhi
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #244]	@ movhi
	add	r3, r3, #2
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r1
	lsr	r3, r3, #16
	bne	.L129
	bl	updatePlayerStatsAndReset
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L133+76
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L134:
	.align	2
.L133:
	.word	hideSprites
	.word	state
	.word	DMANow
	.word	game_bg_copyPal
	.word	game_bg_copyTiles
	.word	100726784
	.word	game_bg_copyMap
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
	ldr	r3, .L142
	mov	lr, pc
	bx	r3
	ldr	r3, .L142+4
	mov	lr, pc
	bx	r3
	mov	r6, #67108864
	mov	r2, #5888
	mov	r4, #4
	ldr	r3, .L142+8
	ldr	r1, .L142+12
	ldr	r5, .L142+16
	str	r4, [r3]
	mov	r0, #3
	strh	r2, [r6]	@ movhi
	mov	r3, #256
	strh	r1, [r6, #10]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L142+20
	mov	lr, pc
	bx	r5
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L142+24
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L142+28
	ldr	r1, .L142+32
	mov	lr, pc
	bx	r5
	ldr	r2, .L142+36
	mov	r3, #816
	strh	r2, [r6, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L142+40
	ldr	r1, .L142+44
	mov	lr, pc
	bx	r5
	mov	r10, #128
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L142+48
	ldr	r1, .L142+52
	mov	lr, pc
	bx	r5
	ldr	r2, .L142+56
	mov	r3, #1024
	strh	r2, [r6, #12]	@ movhi
	mov	r0, #3
	ldr	r2, .L142+60
	ldr	r1, .L142+64
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L142+68
	ldr	r1, .L142+72
	mov	lr, pc
	bx	r5
	mov	fp, #132
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L142+76
	ldr	r1, .L142+80
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L142+84
	ldr	r1, .L142+88
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L142+92
	strh	r10, [r1, #4]	@ movhi
	ldr	r10, .L142+96
	strh	r10, [r1, #2]	@ movhi
	add	r10, r10, #32
	strh	r10, [r1, #10]	@ movhi
	ldr	r10, .L142+100
	strh	fp, [r1, #12]	@ movhi
	strh	r10, [r1]	@ movhi
	strh	r10, [r1, #8]	@ movhi
	ldr	r1, .L142+104
	mov	r3, #0
	mov	ip, #8
	mov	r9, #9
	mov	r8, #928
	mov	r7, #960
	mov	r6, #138
	mov	lr, #16
	str	r0, [r1, #28]
	mov	r0, #2
	ldr	r2, .L142+108
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
	ble	.L136
	mov	ip, #10
	mov	r0, #7
	ldr	r1, .L142+112
	add	r2, r2, r4
.L137:
	str	r4, [r1, #24]
	add	r4, r4, #1
	cmp	r4, r2
	str	r3, [r1, #28]
	str	ip, [r1, #32]
	str	r0, [r1, #16]
	str	r0, [r1, #20]
	add	r1, r1, #40
	bne	.L137
.L136:
	mov	r3, #9
	mov	ip, #2
	mov	r0, #136
	ldr	r2, .L142+92
	add	r1, r2, #224
.L138:
	strh	r3, [r2, #242]	@ movhi
	strh	ip, [r2, #240]	@ movhi
	strh	r0, [r2, #244]	@ movhi
	add	r3, r3, #2
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r1
	lsr	r3, r3, #16
	bne	.L138
	ldr	r3, .L142+116
	mov	lr, pc
	bx	r3
	mov	ip, #0
	ldr	r0, .L142+120
	mov	r3, #512
	str	ip, [r0]
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L142+92
	mov	lr, pc
	bx	r5
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L143:
	.align	2
.L142:
	.word	srand
	.word	hideSprites
	.word	state
	.word	7938
	.word	DMANow
	.word	game_bg_copyPal
	.word	game_bg_copyTiles
	.word	100726784
	.word	game_bg_copyMap
	.word	7684
	.word	100679680
	.word	game_clouds_bgTiles
	.word	100724736
	.word	game_clouds_bgMap
	.word	7433
	.word	100696064
	.word	game_clouds_SHADOW_bgTiles
	.word	100722688
	.word	game_clouds_SHADOW_bgMap
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
	.word	initHazards
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
	ldr	r3, .L146
	str	r1, [r3, #20]
	ldr	r1, .L146+4
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
.L147:
	.align	2
.L146:
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
