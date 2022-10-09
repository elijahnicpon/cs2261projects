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
	push	{r7, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	ldr	r0, .L13+4
	ldr	r3, .L13+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L13+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L13+20
	ldr	r4, .L13+24
	ldr	r9, .L13+28
	ldr	r8, .L13+32
	ldr	r7, .L13+36
	ldr	r6, .L13+40
.L3:
	mov	lr, pc
	bx	r5
	ldr	r3, [r4]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L3
.L5:
	.word	.L8
	.word	.L7
	.word	.L6
	.word	.L4
.L4:
	mov	lr, pc
	bx	r6
	b	.L3
.L6:
	mov	lr, pc
	bx	r7
	b	.L3
.L7:
	mov	lr, pc
	bx	r8
	b	.L3
.L8:
	mov	lr, pc
	bx	r9
	b	.L3
.L14:
	.align	2
.L13:
	.word	mgba_open
	.word	.LC0
	.word	mgba_printf
	.word	init3
	.word	goStart
	.word	update3
	.word	state
	.word	doStart
	.word	doPlaying
	.word	doPause
	.word	doWin
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
	push	{r4, lr}
	ldr	r3, .L17
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	init3
	.word	goStart
	.size	init, .-init
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
