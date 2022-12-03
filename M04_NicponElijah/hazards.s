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
	add	r4, r4, #72
	ble	.L2
.L4:
	ldr	r0, [r4, #64]
	cmp	r0, #0
	add	r5, r5, #1
	beq	.L5
	ldr	r2, [r4, #4]
	cmp	r2, #39
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
	ldr	r7, .L33
	ldr	r1, [r7]
	cmp	r1, #0
	ble	.L13
	ldr	r6, .L33+4
	mov	r9, r0
	mov	r5, #0
	mov	r3, r6
	b	.L29
.L15:
	add	r5, r5, #1
	cmp	r1, r5
	add	r3, r3, #72
	beq	.L13
.L29:
	ldr	r2, [r3, #64]
	cmp	r2, #0
	bne	.L15
	mov	r2, #1
	add	r3, r5, r5, lsl #3
	add	r3, r6, r3, lsl #3
	str	r2, [r3, #64]
	ldr	r8, .L33+8
	mov	lr, pc
	bx	r8
	ldr	r2, .L33+12
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r4, r0, r3, lsl #4
	lsl	r4, r4, #3
	lsl	r3, r5, #3
	cmp	r9, #6
	ldrls	pc, [pc, r9, asl #2]
	b	.L13
.L17:
	.word	.L20
	.word	.L19
	.word	.L18
	.word	.L13
	.word	.L13
	.word	.L13
	.word	.L16
.L18:
	mov	r1, #19
	mov	r0, #2
	mov	r2, #1
	add	r5, r3, r5
	add	r9, r6, r5, lsl #3
	str	r0, [r9, #36]
	str	r2, [r9, #64]
	str	r1, [r9, #16]
	str	r1, [r9, #20]
	ldr	r7, .L33+12
	b	.L25
.L26:
	mov	lr, pc
	bx	r8
	smull	r2, r3, r7, r0
	asr	r4, r0, #31
	add	r3, r3, r0
	rsb	r4, r4, r3, asr #7
	rsb	r4, r4, r4, lsl #4
	sub	r0, r0, r4, lsl #4
	ldr	r1, [r9, #20]
	lsl	r4, r0, #3
.L25:
	mov	r0, r4
	ldr	r2, [r9, #16]
	bl	checkHazardSpawnLocation
	cmp	r0, #0
	bne	.L26
	mov	ip, #1
	mov	r1, #480
.L32:
	mov	r2, #2
	ldr	r3, [r9, #16]
	rsb	r3, r3, r3, lsl #29
	lsl	r3, r3, #3
	str	r3, [r9, #4]
	ldr	r3, .L33+16
	add	r5, r6, r5, lsl #3
	str	r4, [r9]
	str	r0, [r9, #24]
	str	r0, [r9, #28]
	str	r0, [r9, #48]
	str	r0, [r9, #8]
	str	ip, [r5, #12]
	str	r1, [r9, #44]
	str	r2, [r9, #32]
	str	r3, [r9, #68]
.L13:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L16:
	mov	ip, #6
	mov	r0, #1
	mov	r2, #43
	mov	r1, #20
	add	r5, r3, r5
	add	r10, r6, r5, lsl #3
	str	ip, [r10, #36]
	str	r0, [r10, #64]
	str	r2, [r10, #16]
	str	r1, [r10, #20]
	ldr	r9, .L33+12
	b	.L27
.L28:
	mov	lr, pc
	bx	r8
	smull	r2, r3, r9, r0
	asr	r4, r0, #31
	add	r3, r3, r0
	rsb	r4, r4, r3, asr #7
	rsb	r4, r4, r4, lsl #4
	sub	r0, r0, r4, lsl #4
	ldr	r1, [r10, #20]
	lsl	r4, r0, #3
.L27:
	mov	r0, r4
	ldr	r2, [r10, #16]
	bl	checkHazardSpawnLocation
	subs	fp, r0, #0
	bne	.L28
	mov	r1, #3
	mov	r9, #1
	mov	r2, #6
	ldr	r3, [r10, #16]
	rsb	r3, r3, r3, lsl #29
	lsl	r3, r3, r1
	ldr	r0, [r7, #4]
	str	r3, [r10, #4]
	ldr	r3, .L33+16
	str	r2, [r10, #52]
	str	r3, [r10, #68]
	str	r0, [r10, #44]
	str	r4, [r10]
	str	fp, [r10, #60]
	str	r1, [r10, #32]
	str	r9, [r10, #48]
	mov	lr, pc
	bx	r8
	ldr	r3, .L33+20
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl r9
	sub	r3, r0, r3
	add	r5, r6, r5, lsl #3
	add	r3, r3, #15
	str	r9, [r5, #12]
	str	r9, [r10, #24]
	str	fp, [r10, #28]
	str	fp, [r10, #8]
	str	r3, [r10, #56]
	b	.L13
.L19:
	mov	r2, #1
	mov	lr, #5
	mov	ip, #15
	mov	r0, #736
	mov	r1, #0
	add	r5, r3, r5
	ldr	r3, .L33+16
	add	r7, r6, r5, lsl #3
	str	lr, [r7, #16]
	str	ip, [r7, #20]
	str	r0, [r7, #44]
	str	r1, [r7, #32]
	str	r2, [r7, #36]
	str	r3, [r7, #68]
	str	r2, [r7, #64]
	ldr	r9, .L33+12
	b	.L23
.L24:
	mov	lr, pc
	bx	r8
	smull	r2, r3, r9, r0
	asr	r4, r0, #31
	add	r3, r3, r0
	rsb	r4, r4, r3, asr #7
	rsb	r4, r4, r4, lsl #4
	sub	r0, r0, r4, lsl #4
	lsl	r4, r0, #3
.L23:
	mov	r0, r4
	ldr	r2, [r7, #16]
	ldr	r1, [r7, #20]
	bl	checkHazardSpawnLocation
	cmp	r0, #0
	bne	.L24
	mov	r2, #1
	ldr	r3, [r7, #16]
	rsb	r3, r3, r3, lsl #29
	lsl	r3, r3, #3
	add	r5, r6, r5, lsl #3
	str	r3, [r7, #4]
	str	r4, [r7]
	str	r0, [r7, #24]
	str	r0, [r7, #48]
	str	r0, [r7, #8]
	str	r2, [r5, #12]
	str	r2, [r7, #28]
	b	.L13
.L20:
	mov	ip, #0
	mov	r0, #1
	mov	r2, #12
	mov	r1, #22
	add	r5, r3, r5
	add	r9, r6, r5, lsl #3
	str	ip, [r9, #36]
	str	r0, [r9, #64]
	str	r2, [r9, #16]
	str	r1, [r9, #20]
	ldr	r7, .L33+12
	b	.L21
.L22:
	mov	lr, pc
	bx	r8
	smull	r2, r3, r7, r0
	asr	r4, r0, #31
	add	r3, r3, r0
	rsb	r4, r4, r3, asr #7
	rsb	r4, r4, r4, lsl #4
	sub	r0, r0, r4, lsl #4
	ldr	r1, [r9, #20]
	lsl	r4, r0, #3
.L21:
	mov	r0, r4
	ldr	r2, [r9, #16]
	bl	checkHazardSpawnLocation
	cmp	r0, #0
	bne	.L22
	mov	ip, #1
	mov	r1, #608
	b	.L32
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.word	hazards
	.word	rand
	.word	-2004318071
	.word	goDeathPlastic
	.word	1431655766
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
	ldr	r3, .L37
	ldr	r1, [r3]
	mov	r2, #0
	push	{r4, lr}
	ldr	r3, .L37+4
	ldr	r0, .L37+8
	sub	r1, r1, #500
	mov	lr, pc
	bx	r3
	ldr	r3, .L37+12
	ldr	r3, [r3]
	ldr	r2, .L37+16
	add	r3, r3, #60
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	shield_length
	.word	playSoundB
	.word	shield_data
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
	ldr	r3, .L45
	ldr	r2, .L45+4
	ldr	r3, [r3]
	ldr	r2, [r2]
	cmp	r2, r3
	blt	.L40
	tst	r3, #1
	beq	.L40
	ldr	r2, .L45+8
	ldr	r3, [r2]
	add	r1, r3, #7
	cmp	r3, #0
	movlt	r3, r1
	asr	r3, r3, #3
	sub	r3, r3, #2
	lsl	r3, r3, #23
	ldrb	r0, [r2, #8]	@ zero_extendqisi2
	ldr	r1, .L45+12
	ldr	r2, .L45+16
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	strh	r0, [r2, #88]	@ movhi
	strh	r3, [r2, #90]	@ movhi
	strh	r1, [r2, #92]	@ movhi
	bx	lr
.L40:
	mov	r2, #512
	ldr	r3, .L45+16
	strh	r2, [r3, #88]	@ movhi
	bx	lr
.L46:
	.align	2
.L45:
	.word	time
	.word	shieldTime
	.word	player
	.word	523
	.word	shadowOAM
	.size	updateAndDrawShield, .-updateAndDrawShield
	.global	__aeabi_idivmod
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
	ldr	r10, .L74
	ldr	r3, [r10]
	add	r3, r3, r3, lsl #4
	ldr	r2, .L74+4
	add	r3, r3, r3, lsl #8
	ldr	r1, .L74+8
	add	r3, r3, r3, lsl #16
	sub	r2, r2, r3
	cmp	r1, r2, ror #2
	sub	sp, sp, #20
	bcs	.L71
.L48:
	ldr	r9, .L74+12
	ldr	r3, [r9]
	cmp	r3, #0
	ble	.L47
	mov	r6, #0
	ldr	r4, .L74+16
	ldr	r8, .L74+20
	ldr	r7, .L74+24
	b	.L63
.L73:
	ldr	r5, [r4, #4]
	cmp	r5, #0
	add	r3, r5, #7
	movge	r3, r5
	ldr	r2, [r4, #24]
	cmp	r2, #0
	asr	r3, r3, #3
	beq	.L51
	and	r3, r3, #255
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	lsl	r2, fp, #3
	strh	r3, [r8, r2]	@ movhi
.L52:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L70
	ldr	r1, [r4, #56]
	ldr	r0, [r10]
	ldr	r3, .L74+28
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	bne	.L70
	ldr	r0, [r4, #60]
	ldr	r3, .L74+28
	ldr	r1, [r4, #52]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #36]
	cmp	r3, #6
	str	r1, [r4, #60]
	beq	.L57
.L70:
	ldr	r2, [r4, #44]
.L55:
	ldr	r0, [r4]
	ldr	r3, [r7]
	add	r1, r0, #7
	cmp	r0, #0
	movlt	r0, r1
	add	r1, r3, #7
	cmp	r3, #0
	movlt	r3, r1
	cmp	r5, #0
	add	r1, r5, #7
	movlt	r5, r1
	asr	r3, r3, #3
	ldr	ip, .L74+32
	str	r3, [sp]
	ldr	r3, [r4, #32]
	and	ip, ip, r0, asr #3
	orr	ip, ip, r3, lsl #14
	ldr	r3, [r7, #20]
	str	r3, [sp, #12]
	ldr	r3, [r7, #24]
	str	r3, [sp, #8]
	ldr	r3, [r7, #8]
	add	fp, r8, fp, lsl #3
	orr	r2, r2, #1024
	str	r3, [sp, #4]
	asr	r0, r0, #3
	strh	r2, [fp, #4]	@ movhi
	strh	ip, [fp, #2]	@ movhi
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #16]
	ldr	ip, .L74+36
	asr	r1, r5, #3
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L58
	ldr	r3, [r7, #32]
	cmp	r3, #0
	bgt	.L72
	ldr	r3, [r4, #68]
	mov	lr, pc
	bx	r3
.L60:
	mov	r3, #0
	str	r3, [r4, #64]
.L58:
	ldr	r3, [r4, #4]
	cmp	r3, #1280
	movgt	r3, #0
	strgt	r3, [r4, #64]
	bgt	.L62
	ldr	r2, [r4, #36]
	cmp	r2, #6
	add	r2, r3, #2
	addeq	r3, r3, #4
	str	r2, [r4, #4]
	streq	r3, [r4, #4]
.L62:
	ldr	r3, [r9]
	add	r6, r6, #1
	cmp	r3, r6
	add	r4, r4, #72
	ble	.L47
.L63:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	ldr	fp, [r4, #40]
	bne	.L73
	mov	r3, #512
	lsl	fp, fp, #3
	strh	r3, [r8, fp]	@ movhi
	b	.L62
.L51:
	ldr	r2, [r4, #28]
	and	r3, r3, #255
	cmp	r2, #0
	orrne	r3, r3, #16384
	lsl	r2, fp, #3
	strh	r3, [r8, r2]	@ movhi
	b	.L52
.L47:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L72:
	sub	r3, r3, #1
	str	r3, [r7, #32]
	bl	newShield
	b	.L60
.L57:
	add	r1, r9, r1, lsl #2
	ldr	r2, [r1, #4]
	str	r2, [r4, #44]
	b	.L55
.L71:
	ldr	r3, .L74+40
	mov	lr, pc
	bx	r3
	mov	r0, #6
	bl	hazardFactory
	b	.L48
.L75:
	.align	2
.L74:
	.word	time
	.word	143165576
	.word	71582788
	.word	.LANCHOR0
	.word	hazards
	.word	shadowOAM
	.word	player
	.word	__aeabi_idivmod
	.word	511
	.word	collision
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
	ldr	r3, .L80
	ldr	r1, [r3]
	cmp	r1, #0
	bxle	lr
	mov	r2, #60
	mov	r0, #0
	ldr	r3, .L80+4
	add	r1, r1, r2
.L78:
	str	r2, [r3, #40]
	add	r2, r2, #1
	cmp	r2, r1
	str	r0, [r3, #64]
	add	r3, r3, #72
	bne	.L78
	bx	lr
.L81:
	.align	2
.L80:
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
	ldr	r7, .L91
	ldr	r3, [r7]
	cmp	r3, #0
	sub	sp, sp, #16
	ble	.L83
	mov	r5, #0
	ldr	r4, .L91+4
	ldr	r6, .L91+8
	ldr	r8, .L91+12
	b	.L85
.L87:
	ldr	r3, [r7]
	cmp	r3, r5
	add	r4, r4, #72
	ble	.L83
.L85:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	add	r5, r5, #1
	beq	.L87
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
	beq	.L87
	mov	r0, #1
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L83:
	mov	r0, #0
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L92:
	.align	2
.L91:
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
	ldr	r3, .L95
	mov	lr, pc
	bx	r3
	mov	r0, #6
	pop	{r4, lr}
	b	hazardFactory
.L96:
	.align	2
.L95:
	.word	rand
	.size	newHazard, .-newHazard
	.global	NUM_HAZARDS
	.comm	hazards,1440,4
	.global	sharkFrames
	.comm	shadowOAM,1024,4
	.comm	player,72,4
	.comm	shieldTime,4,4
	.comm	time,4,4
	.comm	shells_owned,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	NUM_HAZARDS, %object
	.size	NUM_HAZARDS, 4
NUM_HAZARDS:
	.word	20
	.type	sharkFrames, %object
	.size	sharkFrames, 24
sharkFrames:
	.word	11
	.word	15
	.word	19
	.word	23
	.word	19
	.word	15
	.ident	"GCC: (devkitARM release 53) 9.1.0"
