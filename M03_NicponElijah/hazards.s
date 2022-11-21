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
	.file	"hazards.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"checkHazardSpawnLocation(%d, %d, %d) called\000"
	.text
	.align	2
	.global	checkHazardSpawnLocation
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkHazardSpawnLocation, %function
checkHazardSpawnLocation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L11
	mov	r3, r2
	mov	r7, r0
	mov	r9, r1
	mov	r8, r2
	ldr	r4, .L11+4
	mov	r2, r1
	sub	sp, sp, #20
	mov	r1, r0
	ldr	r0, .L11+8
	mov	lr, pc
	bx	r4
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L2
	add	r1, r7, #7
	cmp	r7, #0
	movlt	r7, r1
	mov	r5, #0
	ldr	r4, .L11+12
	ldr	r10, .L11+16
	asr	r7, r7, #3
	rsb	fp, r8, #0
	b	.L4
.L5:
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #68
	ble	.L2
.L4:
	ldr	r0, [r4, #60]
	cmp	r0, #0
	add	r5, r5, #1
	beq	.L5
	ldr	r2, [r4, #4]
	cmp	r2, #9
	bgt	.L5
	ldr	r3, [r4]
	cmp	r3, #0
	add	r1, r3, #7
	movlt	r3, r1
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	asr	r3, r3, #3
	str	r2, [sp, #4]
	str	r3, [sp]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	mov	r3, r8
	mov	r2, r9
	mov	r1, fp
	mov	r0, r7
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L5
	mov	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L2:
	mov	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.word	mgba_printf
	.word	.LC0
	.word	hazards
	.word	collision
	.size	checkHazardSpawnLocation, .-checkHazardSpawnLocation
	.align	2
	.global	hazardFactory
	.syntax unified
	.arm
	.fpu softvfp
	.type	hazardFactory, %function
hazardFactory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L25
	ldr	ip, [r3]
	cmp	ip, #0
	ble	.L13
	ldr	r5, .L25+4
	mov	r10, r0
	mov	r3, #0
	mov	r2, r5
	b	.L22
.L15:
	add	r3, r3, #1
	cmp	r3, ip
	add	r2, r2, #68
	beq	.L13
.L22:
	ldr	r1, [r2, #60]
	cmp	r1, #0
	bne	.L15
	mov	fp, #1
	add	r4, r3, r3, lsl #4
	add	r7, r5, r4, lsl #2
	ldr	r6, .L25+8
	str	fp, [r7, #60]
	mov	lr, pc
	bx	r6
	ldr	r8, .L25+12
	smull	r2, r3, r8, r0
	asr	r9, r0, #31
	add	r3, r3, r0
	rsb	r9, r9, r3, asr #7
	rsb	r9, r9, r9, lsl #4
	sub	r0, r0, r9, lsl #4
	cmp	r10, #0
	lsl	r9, r0, #3
	beq	.L16
	cmp	r10, fp
	bne	.L13
	mov	r0, #12
	mov	r1, #22
	mov	r2, #608
	mov	r3, #2
	str	r10, [r7, #36]
	str	r10, [r7, #60]
	str	r0, [r7, #16]
	str	r1, [r7, #20]
	str	r2, [r7, #44]
	str	r3, [r7, #32]
	b	.L20
.L16:
	mov	r3, #12
	mov	r1, #22
	str	r10, [r7, #36]
	str	fp, [r7, #60]
	str	r3, [r7, #16]
	str	r1, [r7, #20]
	b	.L18
.L19:
	mov	lr, pc
	bx	r6
	smull	r2, r3, r8, r0
	asr	r9, r0, #31
	add	r3, r3, r0
	rsb	r9, r9, r3, asr #7
	rsb	r9, r9, r9, lsl #4
	sub	r0, r0, r9, lsl #4
	ldr	r1, [r7, #20]
	lsl	r9, r0, #3
.L18:
	mov	r0, r9
	ldr	r2, [r7, #16]
	bl	checkHazardSpawnLocation
	cmp	r0, #0
	bne	.L19
	mov	r1, #2
	mov	lr, #1
	mov	ip, #608
	ldr	r3, [r7, #16]
	rsb	r3, r3, r3, lsl #29
	lsl	r2, r3, #3
	add	r4, r5, r4, lsl r1
	str	r2, [r7, #4]
	str	r9, [r7]
	str	r0, [r7, #24]
	str	r0, [r7, #28]
	str	r0, [r7, #48]
	str	r0, [r7, #8]
	str	lr, [r4, #12]
	str	ip, [r7, #44]
	str	r1, [r7, #32]
.L13:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L21:
	mov	lr, pc
	bx	r6
	smull	r3, r2, r8, r0
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	lsl	r9, r0, #3
.L20:
	mov	r0, r9
	ldr	r2, [r7, #16]
	ldr	r1, [r7, #20]
	bl	checkHazardSpawnLocation
	cmp	r0, #0
	bne	.L21
	mov	r2, #1
	ldr	r3, [r7, #16]
	rsb	r3, r3, r3, lsl #29
	lsl	r3, r3, #3
	add	r4, r5, r4, lsl #2
	str	r3, [r7, #4]
	str	r9, [r7]
	str	r0, [r7, #24]
	str	r0, [r7, #28]
	str	r0, [r7, #48]
	str	r0, [r7, #8]
	str	r2, [r4, #12]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	.LANCHOR0
	.word	hazards
	.word	rand
	.word	-2004318071
	.size	hazardFactory, .-hazardFactory
	.align	2
	.global	newShield
	.syntax unified
	.arm
	.fpu softvfp
	.type	newShield, %function
newShield:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L28
	ldr	r3, [r3]
	ldr	r2, .L28+4
	add	r3, r3, #60
	str	r3, [r2]
	bx	lr
.L29:
	.align	2
.L28:
	.word	time
	.word	shieldTime
	.size	newShield, .-newShield
	.align	2
	.global	updateAndDrawShield
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAndDrawShield, %function
updateAndDrawShield:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L36
	ldr	r2, .L36+4
	ldr	r3, [r3]
	ldr	r2, [r2]
	cmp	r2, r3
	blt	.L31
	tst	r3, #1
	beq	.L31
	ldr	r2, .L36+8
	ldr	r3, [r2]
	add	r1, r3, #7
	cmp	r3, #0
	movlt	r3, r1
	asr	r3, r3, #3
	sub	r3, r3, #2
	lsl	r3, r3, #23
	ldrb	r0, [r2, #8]	@ zero_extendqisi2
	ldr	r1, .L36+12
	ldr	r2, .L36+16
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	strh	r0, [r2, #88]	@ movhi
	strh	r3, [r2, #90]	@ movhi
	strh	r1, [r2, #92]	@ movhi
	bx	lr
.L31:
	mov	r2, #512
	ldr	r3, .L36+16
	strh	r2, [r3, #88]	@ movhi
	bx	lr
.L37:
	.align	2
.L36:
	.word	time
	.word	shieldTime
	.word	player
	.word	277
	.word	shadowOAM
	.size	updateAndDrawShield, .-updateAndDrawShield
	.align	2
	.global	updateAndDrawHazards
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAndDrawHazards, %function
updateAndDrawHazards:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	fp, .L55
	ldr	r3, [fp]
	add	r3, r3, r3, lsl #4
	ldr	r2, .L55+4
	add	r3, r3, r3, lsl #8
	ldr	r1, .L55+8
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r1, r2, ror #2
	sub	sp, sp, #20
	bcs	.L54
.L39:
	ldr	r8, .L55+12
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L38
	mov	r5, #0
	mov	r9, #512
	ldr	r4, .L55+16
	ldr	r7, .L55+20
	ldr	r10, .L55+24
	ldr	r6, .L55+28
	b	.L47
.L46:
	ldr	r3, [r8]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #68
	ble	.L38
.L47:
	ldr	r3, [r4, #60]
	ldr	ip, [r4, #40]
	cmp	r3, #0
	lsleq	ip, ip, #3
	strheq	r9, [r7, ip]	@ movhi
	beq	.L46
	ldm	r4, {r0, r1}
	add	r3, r1, #7
	cmp	r1, #0
	movlt	r1, r3
	add	r3, r0, #7
	cmp	r0, #0
	ldr	lr, [r6]
	movlt	r0, r3
	cmp	lr, #0
	add	r3, lr, #7
	movlt	lr, r3
	asr	r1, r1, #3
	and	r2, r1, #255
	lsl	r3, ip, #3
	strh	r2, [r7, r3]	@ movhi
	ldr	r2, [r4, #32]
	and	r3, r10, r0, asr #3
	orr	r2, r3, r2, lsl #14
	ldr	r3, [r6, #20]
	asr	lr, lr, #3
	str	r3, [sp, #12]
	ldr	r3, [r6, #24]
	str	lr, [sp]
	ldr	lr, [r4, #44]
	str	r3, [sp, #8]
	ldr	r3, [r6, #8]
	add	ip, r7, ip, lsl #3
	orr	lr, lr, #1024
	str	r3, [sp, #4]
	asr	r0, r0, #3
	strh	r2, [ip, #2]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #16]
	ldr	ip, .L55+32
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L42
	ldr	r3, [r6, #32]
	cmp	r3, #0
	ble	.L43
	sub	r3, r3, #1
	ldr	r2, [fp]
	str	r3, [r6, #32]
	ldr	r3, .L55+36
	add	r2, r2, #60
	str	r2, [r3]
.L44:
	mov	r3, #0
	str	r3, [r4, #60]
.L42:
	ldr	r3, [r4, #4]
	cmp	r3, #1280
	movgt	r3, #0
	addle	r3, r3, #2
	strgt	r3, [r4, #60]
	strle	r3, [r4, #4]
	b	.L46
.L38:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L43:
	ldr	r3, .L55+40
	mov	lr, pc
	bx	r3
	b	.L44
.L54:
	ldr	r3, .L55+44
	mov	lr, pc
	bx	r3
	mov	r0, #0
	bl	hazardFactory
	b	.L39
.L56:
	.align	2
.L55:
	.word	time
	.word	143165576
	.word	71582788
	.word	.LANCHOR0
	.word	hazards
	.word	shadowOAM
	.word	511
	.word	player
	.word	collision
	.word	shieldTime
	.word	goDeathPlastic
	.word	rand
	.size	updateAndDrawHazards, .-updateAndDrawHazards
	.align	2
	.global	initHazards
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHazards, %function
initHazards:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L61
	ldr	r1, [r3]
	cmp	r1, #0
	bxle	lr
	mov	r2, #60
	mov	r0, #0
	ldr	r3, .L61+4
	add	r1, r1, r2
.L59:
	str	r2, [r3, #40]
	add	r2, r2, #1
	cmp	r2, r1
	str	r0, [r3, #60]
	add	r3, r3, #68
	bne	.L59
	bx	lr
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.word	hazards
	.size	initHazards, .-initHazards
	.align	2
	.global	checkHazardCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkHazardCollision, %function
checkHazardCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, .L72
	ldr	r3, [r7]
	cmp	r3, #0
	sub	sp, sp, #16
	ble	.L64
	mov	r5, #0
	ldr	r4, .L72+4
	ldr	r6, .L72+8
	ldr	r8, .L72+12
	b	.L66
.L68:
	ldr	r3, [r7]
	cmp	r3, r5
	add	r4, r4, #68
	ble	.L64
.L66:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L68
	add	r0, r6, #20
	ldm	r0, {r0, r1}
	ldr	r2, [r6, #8]
	ldr	r3, [r6]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L68
	mov	r0, #1
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L64:
	mov	r0, #0
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	.LANCHOR0
	.word	hazards
	.word	player
	.word	collision
	.size	checkHazardCollision, .-checkHazardCollision
	.align	2
	.global	newHazard
	.syntax unified
	.arm
	.fpu softvfp
	.type	newHazard, %function
newHazard:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L76
	mov	lr, pc
	bx	r3
	mov	r0, #0
	pop	{r4, lr}
	b	hazardFactory
.L77:
	.align	2
.L76:
	.word	rand
	.size	newHazard, .-newHazard
	.global	NUM_HAZARDS
	.comm	hazards,1360,4
	.comm	shadowOAM,1024,4
	.comm	player,72,4
	.comm	shieldTime,4,4
	.comm	time,4,4
	.comm	shells_owned,4,4
	.comm	state,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	NUM_HAZARDS, %object
	.size	NUM_HAZARDS, 4
NUM_HAZARDS:
	.word	20
	.ident	"GCC: (devkitARM release 53) 9.1.0"
