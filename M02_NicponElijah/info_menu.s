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
	.file	"info_menu.c"
	.text
	.align	2
	.global	doInfoMenu
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	doInfoMenu, %function
doInfoMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L9
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, lr}
	beq	.L2
	ldr	r3, .L9+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L8
.L2:
	ldr	r3, .L9+8
	mov	lr, pc
	bx	r3
	ldr	r1, .L9+12
	ldr	r3, [r1]
	add	r2, r3, #1
	cmp	r2, #0
	addlt	r3, r3, #8
	movge	r3, r2
	mov	r0, #67108864
	asr	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r2, [r1]
	pop	{r4, lr}
	strh	r3, [r0, #16]	@ movhi
	bx	lr
.L8:
	ldr	r3, .L9+16
	mov	lr, pc
	bx	r3
	b	.L2
.L10:
	.align	2
.L9:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	hOff
	.word	goStartMenu
	.size	doInfoMenu, .-doInfoMenu
	.align	2
	.global	goInfoMenu
	.syntax unified
	.arm
	.fpu softvfp
	.type	goInfoMenu, %function
goInfoMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L13
	mov	lr, pc
	bx	r3
	mov	ip, #1
	mov	r1, #67108864
	mov	r0, #7936
	ldr	r2, .L13+4
	ldr	r4, .L13+8
	str	ip, [r2]
	mov	r3, #256
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L13+12
	mov	lr, pc
	bx	r4
	mov	r3, #3920
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L13+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L13+20
	ldr	r1, .L13+24
	mov	lr, pc
	bx	r4
	mov	r5, #0
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L13+28
	ldr	r1, .L13+32
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L13+36
	ldr	r1, .L13+40
	mov	lr, pc
	bx	r4
	mov	ip, #40
	mov	r3, #656
	mov	lr, #24
	mov	r0, #30
	mov	r2, #664
	ldr	r1, .L13+44
	str	r5, [r1]
	ldr	r1, .L13+48
	strh	ip, [r1]	@ movhi
	ldr	ip, .L13+52
	strh	r3, [r1, #20]	@ movhi
	ldr	r3, .L13+56
	strh	ip, [r1, #2]	@ movhi
	add	ip, ip, #78
	strh	lr, [r1, #4]	@ movhi
	strh	r3, [r1, #26]	@ movhi
	strh	r2, [r1, #28]	@ movhi
	strh	r0, [r1, #16]	@ movhi
	strh	r0, [r1, #24]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	strh	ip, [r1, #18]	@ movhi
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	hideSprites
	.word	state
	.word	DMANow
	.word	coral_bgPal
	.word	coral_bgTiles
	.word	100726784
	.word	coral_bgMap
	.word	83886592
	.word	start_menus_ssPal
	.word	100728832
	.word	start_menus_ssTiles
	.word	hOff
	.word	shadowOAM
	.word	-16352
	.word	-16210
	.size	goInfoMenu, .-goInfoMenu
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	shells,4,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
