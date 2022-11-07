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
	.align	2
	.global	init
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #4352
	mov	r2, #7936
	push	{r4, lr}
	ldr	ip, .L4
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r4, .L4+4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	ldrh	ip, [ip, #48]
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+28
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	67109120
	.word	DMANow
	.word	83886592
	.word	ssPal
	.word	100728832
	.word	ssTiles
	.word	tilesPal
	.word	tilesTiles
	.word	hideSprites
	.word	goStart
	.size	init, .-init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Debugging Initialized\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
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
	ldr	r3, .L18
	mov	lr, pc
	bx	r3
	ldr	r3, .L18+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L18+8
	ldr	r3, .L18+12
	mov	lr, pc
	bx	r3
	ldr	r6, .L18+16
	ldr	r7, .L18+20
	ldr	r5, .L18+24
	ldr	fp, .L18+28
	ldr	r10, .L18+32
	ldr	r9, .L18+36
	ldr	r8, .L18+40
	ldr	r4, .L18+44
.L7:
	ldr	r1, [r6]
	ldrh	r3, [r7]
.L8:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r1, #4
	ldrls	pc, [pc, r1, asl #2]
	b	.L8
.L10:
	.word	.L14
	.word	.L13
	.word	.L12
	.word	.L11
	.word	.L9
.L9:
	ldr	r3, .L18+48
	mov	lr, pc
	bx	r3
	b	.L7
.L11:
	mov	lr, pc
	bx	r8
	b	.L7
.L12:
	mov	lr, pc
	bx	r9
	b	.L7
.L13:
	mov	lr, pc
	bx	r10
	b	.L7
.L14:
	mov	lr, pc
	bx	fp
	b	.L7
.L19:
	.align	2
.L18:
	.word	init
	.word	mgba_open
	.word	.LC0
	.word	mgba_printf
	.word	state
	.word	buttons
	.word	oldButtons
	.word	doStart
	.word	doGame
	.word	doPause
	.word	doWin
	.word	67109120
	.word	doLose
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
