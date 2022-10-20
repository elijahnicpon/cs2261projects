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
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Debugging Initialized\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L14
	mov	lr, pc
	bx	r3
	ldr	r0, .L14+4
	ldr	r3, .L14+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r2, #128
	mov	r0, #2
	mov	r1, #0
	ldr	lr, .L14+12
	ldr	ip, .L14+16
	strh	lr, [r3]	@ movhi
	ldr	r4, .L14+20
	strh	r2, [r3, #132]	@ movhi
	strh	ip, [r3, #128]	@ movhi
	ldr	r2, .L14+24
	strh	r0, [r3, #130]	@ movhi
	ldr	r3, .L14+28
	ldrh	r0, [r4, #48]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r6, .L14+32
	ldr	r7, .L14+36
	ldr	r5, .L14+40
	ldr	fp, .L14+44
	ldr	r10, .L14+48
	ldr	r9, .L14+52
	ldr	r8, .L14+56
.L2:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L3:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L3
.L5:
	.word	.L9
	.word	.L8
	.word	.L7
	.word	.L6
	.word	.L4
.L4:
	ldr	r3, .L14+60
	mov	lr, pc
	bx	r3
	b	.L2
.L6:
	mov	lr, pc
	bx	r8
	b	.L2
.L7:
	mov	lr, pc
	bx	r9
	b	.L2
.L8:
	mov	lr, pc
	bx	r10
	b	.L2
.L9:
	mov	lr, pc
	bx	fp
	b	.L2
.L15:
	.align	2
.L14:
	.word	mgba_open
	.word	.LC0
	.word	mgba_printf
	.word	1044
	.word	8789
	.word	67109120
	.word	highScore
	.word	goStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	doStart
	.word	doGame
	.word	doPause
	.word	doEnd
	.word	doHighScore
	.size	main, .-main
	.text
	.align	2
	.global	init
	.syntax unified
	.arm
	.fpu softvfp
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #128
	mov	ip, #2
	mov	r1, #0
	push	{r4, lr}
	ldr	r2, .L18
	ldr	lr, .L18+4
	strh	lr, [r3]	@ movhi
	strh	r0, [r3, #132]	@ movhi
	strh	r2, [r3, #128]	@ movhi
	ldr	r0, .L18+8
	strh	ip, [r3, #130]	@ movhi
	ldr	r2, .L18+12
	ldr	r3, .L18+16
	ldrh	r0, [r0, #48]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	8789
	.word	1044
	.word	67109120
	.word	highScore
	.word	goStart
	.size	init, .-init
	.comm	highscore,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
