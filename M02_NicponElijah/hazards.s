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
	.align	2
	.global	hazardFactory
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	hazardFactory, %function
hazardFactory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L6
	ldr	r3, [r3]
.L2:
	cmp	r3, #0
	bxle	lr
	cmp	r3, #0
	bgt	.L2
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.size	hazardFactory, .-hazardFactory
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
	ldr	r3, .L26
	ldr	ip, [r3]
	cmp	ip, #0
	bxle	lr
	push	{r4, r5, r6, lr}
	mov	r5, #512
	ldr	r3, .L26+4
	ldr	r0, .L26+8
	ldr	r4, .L26+12
	add	ip, r3, ip, lsl #6
.L14:
	ldr	r2, [r3, #60]
	cmp	r2, #0
	ldr	r2, [r3, #40]
	lsleq	r2, r2, #3
	strheq	r5, [r0, r2]	@ movhi
	beq	.L13
	ldrb	lr, [r3, #4]	@ zero_extendqisi2
	ldr	r1, [r3, #24]
	orrs	r1, lr, r1
	movne	r6, #32768
	bne	.L11
	ldr	r1, [r3, #28]
	cmp	r1, #0
	movne	r6, #16384
	moveq	r6, #0
.L11:
	ldr	r1, [r3]
	ldr	lr, [r3, #32]
	and	r1, r1, r4
	cmp	lr, #1
	orreq	r1, r1, #1
	lsl	r2, r2, #3
	cmp	r1, #0
	movne	lr, #16384
	strh	r6, [r0, r2]	@ movhi
	bne	.L12
	cmp	lr, #2
	moveq	lr, #32768
	beq	.L12
	cmp	lr, #3
	moveq	lr, #49152
	movne	lr, #0
.L12:
	ldr	r1, [r3, #44]
	add	r2, r0, r2
	strh	lr, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
.L13:
	add	r3, r3, #64
	cmp	r3, ip
	bne	.L14
	pop	{r4, r5, r6, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.word	hazards
	.word	shadowOAM
	.word	511
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
	ldr	r3, .L32
	ldr	r1, [r3]
	cmp	r1, #0
	bxle	lr
	mov	r2, #60
	mov	r0, #0
	ldr	r3, .L32+4
	add	r1, r1, r2
.L30:
	str	r2, [r3, #40]
	add	r2, r2, #1
	cmp	r2, r1
	str	r0, [r3, #60]
	add	r3, r3, #64
	bne	.L30
	bx	lr
.L33:
	.align	2
.L32:
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
	ldr	r7, .L43
	ldr	r3, [r7]
	cmp	r3, #0
	sub	sp, sp, #16
	ble	.L35
	mov	r5, #0
	ldr	r4, .L43+4
	ldr	r6, .L43+8
	ldr	r8, .L43+12
	b	.L37
.L39:
	ldr	r3, [r7]
	cmp	r3, r5
	add	r4, r4, #64
	ble	.L35
.L37:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L39
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
	beq	.L39
	mov	r0, #1
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L35:
	mov	r0, #0
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L44:
	.align	2
.L43:
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
	ldr	r2, .L94
	ldr	r3, .L94+4
	ldr	r1, [r2]
	smull	r2, r3, r1, r3
	asr	r2, r1, #31
	add	r3, r3, r1
	rsb	r3, r2, r3, asr #5
	sub	r2, r3, #1
	cmp	r2, #13
	push	{r4, r5, r6, lr}
	bhi	.L46
	ldr	r3, .L94+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+12
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	sub	r0, r0, #1
	cmp	r0, #48
	bls	.L47
	ldr	r3, .L94+16
	mov	lr, pc
	bx	r3
.L45:
	pop	{r4, r5, r6, lr}
	bx	lr
.L46:
	sub	r2, r3, #16
	cmp	r2, #13
	bls	.L49
	sub	r2, r3, #31
	cmp	r2, #13
	bls	.L50
	sub	r2, r3, #46
	cmp	r2, #13
	bls	.L51
	sub	r2, r3, #61
	cmp	r2, #13
	bls	.L52
	sub	r2, r3, #76
	cmp	r2, #13
	bls	.L53
	sub	r3, r3, #91
	cmp	r3, #13
	ldr	r3, .L94+8
	bls	.L54
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+12
	smull	r2, r3, r0, r3
	asr	r4, r0, #31
	rsb	r4, r4, r3, asr #5
	add	r4, r4, r4, lsl #2
	add	r4, r4, r4, lsl #2
	sub	r4, r0, r4, lsl #2
	sub	r5, r4, #1
	b	.L55
.L49:
	ldr	r3, .L94+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L94+12
	smull	r2, r3, r4, r0
	asr	r4, r0, #31
	rsb	r4, r4, r3, asr #5
	add	r4, r4, r4, lsl #2
	add	r4, r4, r4, lsl #2
	sub	r4, r0, r4, lsl #2
	sub	r5, r4, #1
	cmp	r5, #23
	bls	.L91
	sub	r3, r4, #26
	cmp	r3, #23
	bls	.L92
	sub	r3, r4, #51
	cmp	r3, #23
	ldrls	r3, .L94+20
	ldrhi	r3, .L94+24
	mov	lr, pc
	bx	r3
.L62:
	cmp	r5, #31
	bls	.L66
	sub	r3, r4, #34
	cmp	r3, #31
	ldrls	r3, .L94+24
	ldrhi	r3, .L94+28
	mov	lr, pc
	bx	r3
.L72:
	sub	r3, r4, #26
	cmp	r3, #23
	bls	.L93
	sub	r6, r4, #51
	cmp	r6, #23
	ldrls	r3, .L94+32
	ldrhi	r3, .L94+36
	mov	lr, pc
	bx	r3
.L78:
	cmp	r6, #23
	ldrls	r3, .L94+32
	ldrhi	r3, .L94+36
	mov	lr, pc
	bx	r3
.L58:
	cmp	r5, #48
	bls	.L77
	ldr	r3, .L94+36
	mov	lr, pc
	bx	r3
.L57:
	ldr	r3, .L94+40
	mov	lr, pc
	bx	r3
.L81:
	sub	r4, r4, #34
	cmp	r4, #31
	ldrls	r3, .L94+40
	ldrhi	r3, .L94+44
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L47:
	ldr	r3, .L94+48
	mov	lr, pc
	bx	r3
	b	.L45
.L50:
	ldr	r3, .L94+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L94+12
	smull	r2, r3, r4, r0
	asr	r4, r0, #31
	rsb	r4, r4, r3, asr #5
	add	r4, r4, r4, lsl #2
	add	r4, r4, r4, lsl #2
	sub	r4, r0, r4, lsl #2
	sub	r5, r4, #1
	b	.L62
.L52:
	ldr	r3, .L94+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L94+12
	smull	r2, r3, r4, r0
	asr	r4, r0, #31
	rsb	r4, r4, r3, asr #5
	add	r4, r4, r4, lsl #2
	add	r4, r4, r4, lsl #2
	sub	r4, r0, r4, lsl #2
	sub	r5, r4, #1
	cmp	r5, #23
	ldrls	r6, .L94+24
	bls	.L59
	sub	r3, r4, #26
	cmp	r3, #23
	subhi	r6, r4, #51
	bhi	.L78
	ldr	r6, .L94+28
	b	.L74
.L91:
	ldr	r3, .L94+48
	mov	lr, pc
	bx	r3
.L66:
	ldr	r3, .L94+20
	mov	lr, pc
	bx	r3
.L61:
	cmp	r5, #23
	bhi	.L72
	ldr	r6, .L94+24
	mov	lr, pc
	bx	r6
.L59:
	mov	lr, pc
	bx	r6
.L77:
	ldr	r6, .L94+32
	mov	lr, pc
	bx	r6
.L56:
	mov	lr, pc
	bx	r6
.L55:
	cmp	r5, #31
	bhi	.L81
	ldr	r3, .L94+32
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L93:
	ldr	r6, .L94+28
	mov	lr, pc
	bx	r6
.L74:
	mov	lr, pc
	bx	r6
	b	.L58
.L51:
	ldr	r3, .L94+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L94+12
	smull	r2, r3, r4, r0
	asr	r4, r0, #31
	rsb	r4, r4, r3, asr #5
	add	r4, r4, r4, lsl #2
	add	r4, r4, r4, lsl #2
	sub	r4, r0, r4, lsl #2
	sub	r5, r4, #1
	b	.L61
.L54:
	mov	lr, pc
	bx	r3
	ldr	r4, .L94+12
	smull	r2, r3, r4, r0
	asr	r4, r0, #31
	rsb	r4, r4, r3, asr #5
	add	r4, r4, r4, lsl #2
	add	r4, r4, r4, lsl #2
	sub	r4, r0, r4, lsl #2
	sub	r5, r4, #1
	cmp	r5, #48
	bhi	.L57
	ldr	r6, .L94+32
	b	.L56
.L92:
	ldr	r3, .L94+16
	mov	lr, pc
	bx	r3
	b	.L62
.L53:
	ldr	r3, .L94+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+12
	smull	r2, r3, r0, r3
	asr	r4, r0, #31
	rsb	r4, r4, r3, asr #5
	add	r4, r4, r4, lsl #2
	add	r4, r4, r4, lsl #2
	sub	r4, r0, r4, lsl #2
	sub	r5, r4, #1
	b	.L58
.L95:
	.align	2
.L94:
	.word	time
	.word	-2004318071
	.word	rand
	.word	1374389535
	.word	newPlasticStraw
	.word	newSixPack
	.word	newNet
	.word	newOilSpill
	.word	newShark
	.word	newCyanide
	.word	newBoat
	.word	newDynamite
	.word	newPlasticBag
	.size	newHazard, .-newHazard
	.global	NUM_HAZARDS
	.comm	hazards,1280,4
	.comm	player,72,4
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
