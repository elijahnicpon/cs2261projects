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
	ldr	r3, .L13
	ldr	ip, [r3]
	cmp	ip, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r7, .L13+4
	mov	r5, r0
	mov	r3, #0
	mov	r2, r7
	b	.L5
.L3:
	add	r3, r3, #1
	cmp	r3, ip
	add	r2, r2, #68
	beq	.L1
.L5:
	ldr	r1, [r2, #60]
	cmp	r1, #0
	bne	.L3
	mov	r8, #1
	add	r3, r3, r3, lsl #4
	add	r6, r7, r3, lsl #2
	cmp	r5, #0
	str	r8, [r6, #60]
	lsl	r4, r3, #2
	beq	.L12
.L1:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L12:
	ldr	r3, .L13+8
	str	r5, [r6, #36]
	mov	lr, pc
	bx	r3
	mvn	r9, #95
	mov	lr, #608
	mov	ip, #2
	mov	r1, #12
	mov	r2, #22
	ldr	r3, .L13+12
	smull	r10, r3, r0, r3
	add	r10, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r10, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	lsl	r0, r0, #3
	str	r5, [r6, #24]
	str	r5, [r6, #28]
	str	r5, [r6, #48]
	str	r5, [r6, #8]
	str	r8, [r6, #12]
	str	r0, [r7, r4]
	str	r9, [r6, #4]
	str	lr, [r6, #44]
	str	ip, [r6, #32]
	str	r1, [r6, #16]
	str	r2, [r6, #20]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.word	hazards
	.word	rand
	.word	-2004318071
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
	ldr	r3, .L31
	ldr	r2, .L31+4
	ldr	r3, [r3]
	mul	r3, r2, r3
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L31+8
	add	r3, r3, #47710208
	add	r3, r3, #11648
	cmp	r2, r3, ror #2
	sub	sp, sp, #20
	bcs	.L29
.L16:
	ldr	r8, .L31+12
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L15
	mov	r5, #0
	ldr	r4, .L31+16
	ldr	r6, .L31+20
	ldr	r7, .L31+24
	ldr	r9, .L31+28
	ldr	r10, .L31+32
	b	.L22
.L21:
	ldr	r3, [r8]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #68
	ble	.L15
.L22:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	moveq	r3, #512
	ldr	ip, [r4, #40]
	lsleq	ip, ip, #3
	strheq	r3, [r6, ip]	@ movhi
	beq	.L21
	ldm	r4, {r0, r1}
	ldr	lr, [r7]
	add	r3, r1, #7
	cmp	r1, #0
	movlt	r1, r3
	add	r3, r0, #7
	cmp	r0, #0
	movlt	r0, r3
	cmp	lr, #0
	add	r3, lr, #7
	movlt	lr, r3
	asr	r1, r1, #3
	lsl	r3, ip, #3
	and	fp, r1, #255
	strh	fp, [r6, r3]	@ movhi
	asr	lr, lr, #3
	ldr	r3, [r7, #20]
	ldr	r2, .L31+36
	str	lr, [sp]
	ldr	lr, [r4, #32]
	str	r3, [sp, #12]
	and	r2, r2, r0, asr #3
	ldr	r3, [r7, #24]
	orr	r2, r2, lr, lsl #14
	ldr	lr, [r4, #44]
	str	r3, [sp, #8]
	ldr	r3, [r7, #8]
	add	ip, r6, ip, lsl #3
	orr	lr, lr, #1024
	str	r3, [sp, #4]
	asr	r0, r0, #3
	strh	r2, [ip, #2]	@ movhi
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #16]
	strh	lr, [ip, #4]	@ movhi
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L30
.L19:
	ldr	r3, [r4, #4]
	cmp	r3, #1280
	add	r3, r3, #2
	movgt	r3, #0
	strle	r3, [r4, #4]
	strgt	r3, [r4, #60]
	b	.L21
.L15:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L30:
	mov	r3, #0
	str	r3, [r4, #60]
	mov	lr, pc
	bx	r10
	b	.L19
.L29:
	ldr	r3, .L31+40
	mov	lr, pc
	bx	r3
	mov	r0, #0
	bl	hazardFactory
	b	.L16
.L32:
	.align	2
.L31:
	.word	time
	.word	-1527099483
	.word	23860928
	.word	.LANCHOR0
	.word	hazards
	.word	shadowOAM
	.word	player
	.word	collision
	.word	goDeathPlastic
	.word	511
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
	ldr	r3, .L37
	ldr	r1, [r3]
	cmp	r1, #0
	bxle	lr
	mov	r2, #60
	mov	r0, #0
	ldr	r3, .L37+4
	add	r1, r1, r2
.L35:
	str	r2, [r3, #40]
	add	r2, r2, #1
	cmp	r2, r1
	str	r0, [r3, #60]
	add	r3, r3, #68
	bne	.L35
	bx	lr
.L38:
	.align	2
.L37:
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
	ldr	r7, .L48
	ldr	r3, [r7]
	cmp	r3, #0
	sub	sp, sp, #16
	ble	.L40
	mov	r5, #0
	ldr	r4, .L48+4
	ldr	r6, .L48+8
	ldr	r8, .L48+12
	b	.L42
.L44:
	ldr	r3, [r7]
	cmp	r3, r5
	add	r4, r4, #68
	ble	.L40
.L42:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L44
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
	beq	.L44
	mov	r0, #1
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L40:
	mov	r0, #0
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L49:
	.align	2
.L48:
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
	ldr	r3, .L52
	mov	lr, pc
	bx	r3
	mov	r0, #0
	pop	{r4, lr}
	b	hazardFactory
.L53:
	.align	2
.L52:
	.word	rand
	.size	newHazard, .-newHazard
	.global	NUM_HAZARDS
	.comm	hazards,1360,4
	.comm	shadowOAM,1024,4
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
