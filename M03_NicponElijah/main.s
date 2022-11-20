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
	.ascii	"Debugging Initialized :)\000"
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
	push	{r4, r7, fp, lr}
	strh	r2, [r3]	@ movhi
	ldr	r4, .L17
	ldr	r3, .L17+4
	ldrh	r2, [r4, #48]
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+12
	mov	lr, pc
	bx	r3
	ldr	r0, .L17+16
	ldr	r3, .L17+20
	mov	lr, pc
	bx	r3
	ldr	r6, .L17+24
	ldr	r7, .L17+28
	ldr	r5, .L17+32
	ldr	fp, .L17+36
	ldr	r10, .L17+40
	ldr	r9, .L17+44
	ldr	r8, .L17+48
.L2:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L3:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #10
	ldrls	pc, [pc, r2, asl #2]
	b	.L3
.L5:
	.word	.L12
	.word	.L11
	.word	.L3
	.word	.L10
	.word	.L9
	.word	.L8
	.word	.L7
	.word	.L3
	.word	.L3
	.word	.L6
	.word	.L4
.L4:
	ldr	r3, .L17+52
	mov	lr, pc
	bx	r3
	b	.L2
.L6:
	ldr	r3, .L17+56
	mov	lr, pc
	bx	r3
	b	.L2
.L7:
	ldr	r3, .L17+60
	mov	lr, pc
	bx	r3
	b	.L2
.L8:
	ldr	r3, .L17+64
	mov	lr, pc
	bx	r3
	b	.L2
.L9:
	mov	lr, pc
	bx	r8
	b	.L2
.L10:
	mov	lr, pc
	bx	r9
	b	.L2
.L11:
	mov	lr, pc
	bx	r10
	b	.L2
.L12:
	mov	lr, pc
	bx	fp
	b	.L2
.L18:
	.align	2
.L17:
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
	.word	doAboutMenu
	.word	doGame
	.word	doDeathPlastic
	.word	doDeathEnergy
	.word	doUpgradeMenu
	.word	doPause
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
	ldr	r2, .L21
	strh	r1, [r3]	@ movhi
	ldr	r3, .L21+4
	ldrh	r2, [r2, #48]
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	67109120
	.word	hideSprites
	.word	goStartMenu
	.size	init, .-init
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	time,4,4
	.comm	shells_owned,4,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
