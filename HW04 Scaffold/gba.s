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
	.file	"gba.c"
	.text
	.align	2
	.global	collision
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #8]
	ldr	ip, [sp, #16]
	add	ip, lr, ip
	cmp	ip, r1
	ble	.L5
	add	r1, r1, r3
	cmp	r1, lr
	bgt	.L8
.L5:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L8:
	ldr	r3, [sp, #4]
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	cmp	r3, r0
	ble	.L5
	ldr	r3, [sp, #4]
	add	r0, r0, r2
	cmp	r0, r3
	movle	r0, #0
	movgt	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L10:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bhi	.L10
	mov	r2, #67108864
.L11:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L11
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	setPixel3
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L16
	rsb	r1, r1, r1, lsl #4
	ldr	r3, [r3]
	add	r0, r0, r1, lsl #4
	lsl	r0, r0, #1
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	drawRect3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	subs	ip, r3, #0
	bxle	lr
	push	{r4, r5, lr}
	mov	lr, #0
	ldr	r5, .L27
	add	ip, r1, ip
	ldr	r3, [r5]
	rsb	r1, r1, r1, lsl #4
	rsb	ip, ip, ip, lsl #4
	add	r4, r0, r1, lsl #4
	add	ip, r0, ip, lsl #4
	ldr	r1, [r5, #4]
	orr	r0, r2, #-2130706432
	add	r2, r3, ip, lsl #1
	add	r3, r3, r4, lsl #1
.L20:
	add	ip, sp, #12
	str	lr, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r2
	str	r0, [r1, #44]
	bne	.L20
	pop	{r4, r5, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	fillScreen3
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	str	lr, [sp, #-4]!
	sub	sp, sp, #20
	strh	r0, [sp, #6]	@ movhi
	ldr	r2, .L31
	ldrh	lr, [sp, #6]
	ldm	r2, {r1, r3}
	ldr	r2, .L31+4
	add	r0, sp, #14
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L32:
	.align	2
.L31:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	drawImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	subs	lr, r3, #0
	ble	.L33
	mov	r4, #0
	ldr	r6, .L39
	add	lr, r1, lr
	ldr	r3, [r6]
	rsb	r1, r1, r1, lsl #4
	rsb	lr, lr, lr, lsl #4
	add	r5, r0, r1, lsl #4
	add	lr, r0, lr, lsl #4
	ldr	ip, [sp, #16]
	ldr	r1, [r6, #4]
	add	r0, r3, lr, lsl #1
	orr	lr, r2, #-2147483648
	add	r3, r3, r5, lsl #1
	lsl	r2, r2, #1
.L35:
	str	r4, [r1, #44]
	str	ip, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #480
	cmp	r3, r0
	str	lr, [r1, #44]
	add	ip, ip, r2
	bne	.L35
.L33:
	pop	{r4, r5, r6, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	drawFullscreenImage3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage3, %function
drawFullscreenImage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L42
	ldr	r1, .L42+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L43:
	.align	2
.L42:
	.word	.LANCHOR0
	.word	-2147445248
	.size	drawFullscreenImage3, .-drawFullscreenImage3
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, lr}
	mov	r4, #0
	ldr	r7, .L52
	add	r2, r2, r2, lsr #31
	add	r3, r1, r3
	asr	lr, r2, #1
	rsb	r5, r1, r1, lsl #4
	rsb	r3, r3, r3, lsl #4
	ldr	ip, [sp, #20]
	ldr	r6, [r7]
	ldr	r2, [r7, #4]
	add	r1, r0, r3, lsl #4
	add	r0, r0, r5, lsl #4
	orr	r5, lr, #-2147483648
	lsl	lr, lr, #1
.L46:
	add	r3, r0, r0, lsr #31
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r3, r6, r3
	cmp	r0, r1
	str	r4, [r2, #44]
	str	ip, [r2, #36]
	str	r3, [r2, #40]
	add	ip, ip, lr
	str	r5, [r2, #44]
	bne	.L46
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	setPixel4
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r1, r1, lsl #4
	ldr	ip, .L58
	add	r3, r0, r1, lsl #4
	ldr	ip, [ip]
	add	r3, r3, r3, lsr #31
	bic	r3, r3, #1
	ldrh	r1, [ip, r3]
	sub	sp, sp, #8
	strh	r1, [sp, #6]	@ movhi
	ldrh	r1, [sp, #6]
	tst	r0, #1
	andne	r1, r1, #255
	andeq	r1, r1, #65280
	strhne	r1, [sp, #6]	@ movhi
	strheq	r1, [sp, #6]	@ movhi
	ldrhne	r1, [sp, #6]
	ldrheq	r1, [sp, #6]
	orrne	r2, r1, r2, lsl #8
	orreq	r2, r1, r2
	strh	r2, [sp, #6]	@ movhi
	ldrh	r2, [sp, #6]
	strh	r2, [ip, r3]	@ movhi
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L59:
	.align	2
.L58:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, r2
	sub	sp, sp, #20
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	mov	r5, r3
	ldrb	r3, [sp, #56]	@ zero_extendqisi2
	cmp	r7, #1
	orr	r2, r2, r3, lsl #8
	mov	r6, r0
	mov	r4, r1
	strh	r2, [sp, #14]	@ movhi
	beq	.L88
	cmp	r7, #2
	beq	.L89
	ands	r10, r0, #1
	and	r8, r7, #1
	beq	.L67
	cmp	r8, #0
	beq	.L68
	cmp	r5, #0
	ble	.L60
	mov	r10, #0
	sub	r9, r7, #1
	asr	r9, r9, #1
	ldr	r8, .L91
	add	r5, r5, r1
	orr	r9, r9, #-2130706432
	add	fp, r0, #1
.L70:
	mov	r1, r4
	mov	r0, r6
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	bl	setPixel4
	cmp	r7, #1
	ble	.L69
	rsb	r3, r4, r4, lsl #4
	add	r3, fp, r3, lsl #4
	ldr	r1, [r8]
	add	r3, r3, r3, lsr #31
	ldr	r2, [r8, #4]
	bic	r3, r3, #1
	add	r3, r1, r3
	add	r1, sp, #14
	str	r10, [r2, #44]
	str	r1, [r2, #36]
	str	r3, [r2, #40]
	str	r9, [r2, #44]
.L69:
	add	r4, r4, #1
	cmp	r5, r4
	bne	.L70
.L60:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L89:
	cmp	r5, #0
	ble	.L60
	add	r7, r0, #1
	add	r5, r5, r1
.L66:
	mov	r1, r4
	mov	r0, r6
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	bl	setPixel4
	mov	r1, r4
	mov	r0, r7
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	add	r4, r4, #1
	bl	setPixel4
	cmp	r5, r4
	bne	.L66
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L88:
	cmp	r5, #0
	ble	.L60
	add	r5, r5, r1
.L63:
	mov	r1, r4
	mov	r0, r6
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	add	r4, r4, #1
	bl	setPixel4
	cmp	r5, r4
	bne	.L63
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L67:
	cmp	r8, #0
	beq	.L90
	cmp	r5, #0
	ble	.L60
	sub	r9, r7, #1
	asr	r9, r9, #1
	add	r8, r7, r6
	ldr	fp, .L91
	add	r5, r5, r4
	orr	r9, r9, #-2130706432
	sub	r8, r8, #1
.L72:
	cmp	r7, #1
	mov	r1, r4
	mov	r0, r8
	ble	.L71
	rsb	r2, r4, r4, lsl #4
	add	r2, r6, r2, lsl #4
	ldr	ip, [fp]
	add	r2, r2, r2, lsr #31
	ldr	lr, [fp, #4]
	bic	r2, r2, #1
	add	r2, ip, r2
	add	r3, sp, #14
	str	r10, [lr, #44]
	str	r3, [lr, #36]
	str	r2, [lr, #40]
	str	r9, [lr, #44]
.L71:
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	add	r4, r4, #1
	bl	setPixel4
	cmp	r4, r5
	bne	.L72
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L68:
	cmp	r5, #0
	ble	.L60
	sub	r10, r7, #2
	add	r3, r6, #1
	asr	r10, r10, #1
	add	r9, r7, r6
	ldr	fp, .L91
	str	r3, [sp, #4]
	add	r5, r5, r4
	orr	r10, r10, #-2130706432
	sub	r9, r9, #1
.L74:
	mov	r1, r4
	mov	r0, r6
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	bl	setPixel4
	cmp	r7, #2
	mov	r1, r4
	mov	r0, r9
	ble	.L73
	ldr	r3, [sp, #4]
	rsb	r2, r4, r4, lsl #4
	add	r2, r3, r2, lsl #4
	ldr	ip, [fp]
	add	r2, r2, r2, lsr #31
	ldr	lr, [fp, #4]
	bic	r2, r2, #1
	add	r2, ip, r2
	add	ip, sp, #14
	str	r8, [lr, #44]
	str	ip, [lr, #36]
	str	r2, [lr, #40]
	str	r10, [lr, #44]
.L73:
	ldrb	r2, [sp, #56]	@ zero_extendqisi2
	add	r4, r4, #1
	bl	setPixel4
	cmp	r5, r4
	bne	.L74
	b	.L60
.L90:
	cmp	r5, #0
	ble	.L60
	mov	r0, r8
	ldr	r3, .L91
	rsb	r4, r4, r4, lsl #4
	asr	r1, r7, #1
	ldr	ip, [r3]
	ldr	r2, [r3, #4]
	add	r6, r6, r4, lsl #4
	orr	r1, r1, #-2130706432
	add	lr, sp, #14
.L76:
	cmp	r7, #0
	add	r8, r8, #1
	ble	.L75
	add	r3, r6, r6, lsr #31
	bic	r3, r3, #1
	add	r3, ip, r3
	str	r0, [r2, #44]
	str	lr, [r2, #36]
	str	r3, [r2, #40]
	str	r1, [r2, #44]
.L75:
	cmp	r5, r8
	add	r6, r6, #240
	bne	.L76
	b	.L60
.L92:
	.align	2
.L91:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldr	r1, .L95
	lsl	r3, r3, #16
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	orr	r3, r3, r0, lsl #8
	orr	r3, r3, r2
	ldm	r1, {r0, r2}
	ldr	r1, .L95+4
	orr	r3, r3, ip, lsl #24
	add	ip, sp, #12
	str	r3, [sp, #12]
	str	lr, [r2, #44]
	str	ip, [r2, #36]
	str	r0, [r2, #40]
	str	r1, [r2, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L96:
	.align	2
.L95:
	.word	.LANCHOR0
	.word	-2063587968
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawFullScreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullScreenImage4, %function
drawFullScreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L98
	ldr	r1, .L98+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L99:
	.align	2
.L98:
	.word	.LANCHOR0
	.word	-2080365184
	.size	drawFullScreenImage4, .-drawFullScreenImage4
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L103
	moveq	r2, #100663296
	ldr	r1, .L103+4
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	bx	lr
.L104:
	.align	2
.L103:
	.word	100704256
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L107
	ldr	lr, [ip, #4]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L108:
	.align	2
.L107:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.global	dma
	.global	videoBuffer
	.comm	NOTES,2,2
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 53) 9.1.0"
