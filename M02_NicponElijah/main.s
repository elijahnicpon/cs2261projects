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
	mov	r3, #67108864
	mov	r2, #4352
	push	{r7, lr}
	ldr	r4, .L10
	strh	r2, [r3]	@ movhi
	ldr	r3, .L10+4
	ldrh	r2, [r4, #48]
	mov	lr, pc
	bx	r3
	ldr	r3, .L10+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L10+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L10+16
	ldr	r3, .L10+20
	mov	lr, pc
	bx	r3
	ldr	r6, .L10+24
	ldr	r10, .L10+28
	ldr	r5, .L10+32
	ldr	r9, .L10+36
	ldr	r8, .L10+40
	ldr	r7, .L10+44
.L2:
	ldr	r2, [r6]
	ldrh	r3, [r10]
.L5:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	cmp	r2, #1
	strh	r3, [r10]	@ movhi
	beq	.L3
	cmp	r2, #4
	beq	.L4
	cmp	r2, #0
	bne	.L5
	mov	lr, pc
	bx	r9
	b	.L2
.L4:
	mov	lr, pc
	bx	r7
	b	.L2
.L3:
	mov	lr, pc
	bx	r8
	b	.L2
.L11:
	.align	2
.L10:
	.word	67109120
	.word	hideSprites
	.word	goStartMenu
	.word	mgba_open
	.word	.LC0
	.word	mgba_printf
	.word	state
	.word	buttons
	.word	oldButtons
	.word	doStartMenu
	.word	doInfoMenu
	.word	doGame
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
	mov	r1, #4352
	mov	r3, #67108864
	push	{r4, lr}
	ldr	r2, .L14
	strh	r1, [r3]	@ movhi
	ldr	r3, .L14+4
	ldrh	r2, [r2, #48]
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	67109120
	.word	hideSprites
	.word	goStartMenu
	.size	init, .-init
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	shells,4,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
