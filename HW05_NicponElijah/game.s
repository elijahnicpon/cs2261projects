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
	.file	"game.c"
	.text
	.align	2
	.global	shootPump
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	shootPump, %function
shootPump:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #13
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L36
	ldr	r2, [r3, #16]
	ldr	r4, .L36+4
	cmp	r2, #0
	str	r1, [r4, #8]
	sub	sp, sp, #20
	bne	.L2
	mov	r1, #8
	mov	ip, #68
	mov	r0, #32
	ldm	r3, {r2, r3}
	add	r2, r2, #16
	add	r3, r3, r1
.L32:
	stm	r4, {r2, r3}
	str	ip, [r4, #16]
	str	r0, [r4, #24]
	str	r1, [r4, #20]
.L3:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	ble	.L6
	mov	r6, #0
	mov	r8, r6
	ldr	r5, .L36+8
	ldr	r7, .L36+12
	ldr	r9, .L36+16
.L11:
	mov	r3, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldr	lr, [r4, #20]
	ldr	ip, [r4, #24]
	str	r1, [sp]
	stmib	sp, {r0, ip, lr}
	mov	r2, r3
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L8
	ldr	r3, [r5, #24]
	cmp	r3, #3
	ble	.L9
	ldr	r3, [r5, #36]
	cmp	r3, #0
	ldrne	r3, [r9]
	addne	r3, r3, #100
	strne	r3, [r9]
	str	r8, [r5, #36]
.L8:
	ldr	r3, [r4, #28]
	add	r6, r6, #1
	cmp	r3, r6
	add	r5, r5, #40
	bgt	.L11
.L6:
	ldr	r3, [r4, #112]
	cmp	r3, #0
	ble	.L1
	mov	r6, #0
	mov	r8, r6
	ldr	r5, .L36+20
	ldr	r7, .L36+12
	ldr	r9, .L36+16
.L16:
	mov	r3, #16
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldr	lr, [r4, #20]
	ldr	ip, [r4, #24]
	str	r1, [sp]
	stmib	sp, {r0, ip, lr}
	mov	r2, r3
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L13
	ldr	r3, [r5, #24]
	cmp	r3, #3
	ble	.L14
	ldr	r3, [r5, #36]
	cmp	r3, #0
	ldrne	r3, [r9]
	addne	r3, r3, #200
	strne	r3, [r9]
	str	r8, [r5, #36]
.L13:
	ldr	r3, [r4, #112]
	add	r6, r6, #1
	cmp	r3, r6
	add	r5, r5, #72
	bgt	.L16
.L1:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L14:
	add	r3, r3, #1
	str	r3, [r5, #24]
	str	r8, [r5, #16]
	b	.L13
.L9:
	add	r3, r3, #1
	str	r3, [r5, #24]
	str	r8, [r5, #16]
	b	.L8
.L2:
	cmp	r2, #1
	beq	.L34
	cmp	r2, #2
	beq	.L35
	cmp	r2, #3
	bne	.L3
	mov	r0, #8
	ldm	r3, {r2, r3}
	mov	ip, #72
	mov	r1, #32
	add	r2, r2, r0
	add	r3, r3, #16
	b	.L32
.L34:
	ldm	r3, {r2, r3}
	mov	ip, #64
	mov	r0, #8
	mov	r1, #32
	add	r2, r2, #4
	sub	r3, r3, #32
	b	.L32
.L35:
	mov	r1, #8
	ldm	r3, {r2, r3}
	mov	ip, #76
	mov	r0, #32
	sub	r2, r2, #32
	add	r3, r3, r1
	b	.L32
.L37:
	.align	2
.L36:
	.word	player
	.word	.LANCHOR0
	.word	.LANCHOR0+32
	.word	collision
	.word	score
	.word	.LANCHOR0+116
	.size	shootPump, .-shootPump
	.align	2
	.global	doScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	doScore, %function
doScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L40
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r1, [r3]
	ldr	r8, .L40+4
	smull	r3, r6, r8, r1
	ldr	r2, .L40+8
	smull	r3, r2, r1, r2
	mov	r0, #152
	mov	r5, #232
	mov	r4, #224
	mov	lr, #216
	mov	ip, #208
	asr	r7, r1, #31
	rsb	r6, r7, r6, asr #2
	smull	r3, r10, r8, r6
	ldr	r9, .L40+12
	smull	r3, r9, r1, r9
	rsb	r2, r7, r2, asr #5
	smull	r3, r8, r2, r8
	asr	r3, r6, #31
	rsb	r3, r3, r10, asr #2
	add	r3, r3, r3, lsl #2
	add	r10, r6, r6, lsl #2
	sub	r6, r6, r3, lsl #1
	ldr	r3, .L40+16
	sub	r1, r1, r10, lsl #1
	rsb	r7, r7, r9, asr #6
	add	r6, r6, #672
	add	r9, r3, #732
	strh	r6, [r9]	@ movhi
	add	r1, r1, #672
	add	r6, r3, #724
	strh	r1, [r6]	@ movhi
	asr	r1, r2, #31
	rsb	r1, r1, r8, asr #2
	add	r1, r1, r1, lsl #2
	sub	r2, r2, r1, lsl #1
	add	r2, r2, #672
	add	r1, r3, #740
	strh	r2, [r1]	@ movhi
	add	r7, r7, #672
	add	r2, r3, #748
	add	r6, r3, #720
	strh	r7, [r2]	@ movhi
	add	r1, r3, #728
	add	r2, r3, #736
	add	r3, r3, #744
	strh	r5, [r6, #2]	@ movhi
	strh	r0, [r6]	@ movhi
	strh	r4, [r1, #2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	score
	.word	1717986919
	.word	1374389535
	.word	274877907
	.word	shadowOAM
	.size	doScore, .-doScore
	.align	2
	.global	checkForWinTILES
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkForWinTILES, %function
checkForWinTILES:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #96
	ldr	r1, .L51
.L43:
	sub	r3, r1, #60
	b	.L45
.L50:
	cmp	r3, r1
	beq	.L49
.L45:
	ldrh	r2, [r3], #2
	cmp	r2, #0
	beq	.L50
	mov	r0, #0
	bx	lr
.L49:
	add	r0, r0, #32
	cmp	r0, #608
	add	r1, r3, #64
	bne	.L43
	mov	r0, #1
	bx	lr
.L52:
	.align	2
.L51:
	.word	.LANCHOR0+512
	.size	checkForWinTILES, .-checkForWinTILES
	.align	2
	.global	checkForWinENEMIES
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkForWinENEMIES, %function
checkForWinENEMIES:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L65
	ldr	r2, [r3, #28]
	cmp	r2, #0
	ble	.L54
	ldr	r0, [r3, #68]
	cmp	r0, #0
	bne	.L58
	cmp	r2, #1
	beq	.L54
	ldr	r2, [r3, #108]
	cmp	r2, #0
	bxne	lr
.L54:
	ldr	r0, [r3, #112]
	cmp	r0, #0
	ble	.L57
	ldr	r2, [r3, #152]
	cmp	r2, #0
	bne	.L58
	cmp	r0, #1
	bxeq	lr
	ldr	r0, [r3, #224]
	rsbs	r0, r0, #1
	movcc	r0, #0
	bx	lr
.L58:
	mov	r0, #0
	bx	lr
.L57:
	mov	r0, #1
	bx	lr
.L66:
	.align	2
.L65:
	.word	.LANCHOR0
	.size	checkForWinENEMIES, .-checkForWinENEMIES
	.align	2
	.global	die
	.syntax unified
	.arm
	.fpu softvfp
	.type	die, %function
die:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L78
	ldr	r3, [r2]
	cmp	r3, #0
	ble	.L77
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	beq	.L70
	cmp	r3, #1
	beq	.L71
.L72:
	mov	r1, #112
	mov	r2, #80
	ldr	r3, .L78+4
	stm	r3, {r1, r2}
	bx	lr
.L71:
	mov	r2, #512
	ldr	r3, .L78+8
	strh	r2, [r3]	@ movhi
	b	.L72
.L70:
	mov	r2, #512
	ldr	r3, .L78+12
	strh	r2, [r3]	@ movhi
	b	.L72
.L77:
	mov	r1, #1
	push	{r4, lr}
	ldr	r2, .L78+16
	ldr	r3, .L78+20
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L79:
	.align	2
.L78:
	.word	xtraLives
	.word	player
	.word	shadowOAM+968
	.word	shadowOAM+960
	.word	paused
	.word	goLose
	.size	die, .-die
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, .L218
	ldr	r3, [r5, #28]
	cmp	r3, #0
	sub	sp, sp, #36
	ble	.L105
	mov	r6, #0
	ldr	r9, .L218+4
	ldr	r8, .L218+8
	add	r4, r5, #32
.L104:
	ldr	r2, [r4, #16]
	add	r2, r2, #1
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r9, r3
	cmp	r8, r3, ror #2
	str	r2, [r4, #16]
	bcc	.L84
	ldr	r3, [r4, #24]
	subs	r3, r3, #1
	strpl	r3, [r4, #24]
	bmi	.L212
.L84:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L87
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L86
.L87:
	ldr	r3, [r5, #28]
	add	r6, r6, #1
	cmp	r3, r6
	add	r4, r4, #40
	bgt	.L104
.L105:
	ldr	r3, [r5, #112]
	cmp	r3, #0
	ble	.L80
	ldr	r9, .L218+12
	mov	r6, #0
	mov	r4, r9
	add	r7, r9, #2192
	ldr	r8, .L218+4
	ldr	r10, .L218+8
	ldr	fp, .L218+16
	add	r7, r7, #4
.L133:
	ldr	r1, [r4, #16]
	add	r1, r1, #1
	add	r3, r1, r1, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r8, r3
	ldr	r2, [r4, #40]
	cmp	r10, r3, ror #2
	ldr	r3, [r4, #52]
	add	r2, r2, #1
	sub	r3, r3, #1
	str	r1, [r4, #16]
	str	r3, [r4, #52]
	smull	r1, r3, fp, r2
	asr	r1, r2, #31
	add	r3, r3, r2
	rsb	r3, r1, r3, asr #7
	str	r2, [r4, #40]
	add	r1, r3, r3, lsl #2
	bcc	.L106
	ldr	r0, [r4, #24]
	rsb	r3, r3, r1, lsl #4
	rsb	r3, r3, r3, lsl #2
	subs	r0, r0, #1
	strpl	r0, [r4, #24]
	sub	r3, r2, r3
	bmi	.L213
.L108:
	cmp	r3, #0
	bne	.L110
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L109
.L114:
	ldr	r3, [r5, #112]
	add	r6, r6, #1
	cmp	r3, r6
	add	r4, r4, #72
	add	r7, r7, #20
	bgt	.L133
.L80:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L213:
	mov	r2, #0
	cmp	r3, r2
	str	r2, [r4, #24]
	bne	.L110
.L109:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L114
	mov	r2, #15
	ldr	r3, [r4, #8]
	cmp	r3, #1
	str	r2, [r4, #52]
	bne	.L115
	mov	r1, #16
	mov	r2, #48
	ldr	r3, [r4]
	add	r3, r3, r1
	str	r3, [r4, #44]
	ldr	r3, [r4, #4]
	str	r1, [r4, #60]
	str	r1, [r4, #64]
	str	r2, [r4, #68]
	str	r3, [r4, #48]
.L116:
	mov	r3, #16
	ldr	r1, .L218+20
	ldr	r0, [r1, #4]
	ldr	r1, [r1]
	str	r0, [sp, #4]
	str	r1, [sp]
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	add	r0, r4, #44
	ldr	r3, [r4, #64]
	ldm	r0, {r0, r1}
	ldr	ip, .L218+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	blne	die
.L110:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L114
	ldr	r3, [r4, #24]
	cmp	r3, #0
	str	r3, [sp, #20]
	bne	.L114
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bge	.L114
	ldr	r2, [r4, #16]
	rsb	r3, r2, r2, lsl #5
	add	r3, r2, r3, lsl #5
	add	r3, r3, r3, lsl #3
	rsb	r3, r3, r3, lsl #15
	add	r3, r2, r3, lsl #2
	rsb	r3, r3, #195035136
	ldr	r2, .L218+28
	add	r3, r3, #190464
	add	r3, r3, #186
	cmp	r3, r2
	bhi	.L120
	ldr	r3, [r4, #28]
	adds	r3, r3, #1
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	str	r3, [r4, #28]
.L120:
	ldm	r4, {r0, r1}
	cmp	r0, #224
	bhi	.L121
	cmp	r1, #0
	add	r3, r1, #7
	movge	r3, r1
	asr	r2, r0, #3
	asr	r3, r3, #3
	add	lr, r2, r3, lsl #5
	ldr	ip, .L218+32
	lsl	lr, lr, #1
	ldrh	lr, [ip, lr]
	cmp	lr, #6
	lsl	r3, r3, #5
	beq	.L121
	add	lr, r3, #32
	str	lr, [sp, #24]
	add	lr, r2, lr
	lsl	lr, lr, #1
	ldrh	lr, [ip, lr]
	cmp	lr, #6
	beq	.L121
	add	r2, r2, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #6
	beq	.L121
	ldr	lr, [sp, #24]
	add	r2, lr, r2
	lsl	r3, r2, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #6
	bne	.L122
.L121:
	ldr	lr, [r4, #8]
	rsb	lr, lr, #0
	str	lr, [r4, #8]
.L122:
	sub	r3, r1, #8
	cmp	r3, #128
	bhi	.L123
	cmp	r0, #0
	add	r3, r0, #7
	movge	r3, r0
	asr	r2, r1, #3
	asr	r3, r3, #3
	add	lr, r3, r2, lsl #5
	ldr	ip, .L218+32
	lsl	lr, lr, #1
	ldrh	lr, [ip, lr]
	cmp	lr, #6
	lsl	r2, r2, #5
	beq	.L123
	add	lr, r3, #1
	str	lr, [sp, #24]
	add	lr, r2, lr
	lsl	lr, lr, #1
	ldrh	lr, [ip, lr]
	cmp	lr, #6
	beq	.L123
	add	r2, r2, #64
	add	r3, r3, r2
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #6
	beq	.L123
	ldr	lr, [sp, #24]
	add	r2, lr, r2
	lsl	r3, r2, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #6
	bne	.L124
.L123:
	ldr	r3, [r4, #12]
	rsb	r3, r3, #0
	str	r3, [r4, #12]
.L124:
	ldr	r3, [r5, #2308]
	cmp	r3, #0
	ble	.L129
	str	r6, [sp, #28]
	mov	r6, r9
	str	r7, [sp, #24]
	ldr	r7, [sp, #20]
.L125:
	mov	r3, #16
	mov	r2, r3
	ldr	r0, [r6, #4]
	ldr	r1, [r6]
	stmib	sp, {r0, r2}
	str	r3, [sp, #12]
	str	r1, [sp]
	ldr	r0, [sp, #24]
	ldr	ip, .L218+24
	ldr	r1, [r0, #4]
	ldr	r0, [r0]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	add	r7, r7, #1
	beq	.L128
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	rsb	r2, r2, #0
	rsb	r3, r3, #0
	str	r2, [r4, #8]
	str	r3, [r4, #12]
.L128:
	ldr	r3, [r5, #2308]
	cmp	r3, r7
	add	r6, r6, #72
	bgt	.L125
	ldr	r6, [sp, #28]
	ldr	r7, [sp, #24]
	ldm	r4, {r0, r1}
.L129:
	ldr	ip, [r4, #12]
	cmp	ip, #0
	bne	.L214
	ldr	lr, [r4, #8]
	cmp	lr, #0
	movle	r3, #1
	strgt	ip, [r4, #32]
	strle	r3, [r4, #32]
.L131:
	mov	r3, #16
	ldr	r2, .L218+20
	add	r1, r1, ip
	ldm	r2, {r2, ip}
	add	r0, r0, lr
	stm	sp, {r2, ip}
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	mov	r2, r3
	str	r0, [r4]
	str	r1, [r4, #4]
	ldr	ip, .L218+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L114
	bl	die
	b	.L114
.L106:
	rsb	r3, r3, r1, lsl #4
	rsb	r3, r3, r3, lsl #2
	sub	r3, r2, r3
	b	.L108
.L212:
	mov	r3, #0
	ldr	r1, [r4, #36]
	cmp	r1, r3
	str	r3, [r4, #24]
	beq	.L87
.L86:
	rsb	r3, r2, r2, lsl #5
	add	r3, r2, r3, lsl #5
	add	r3, r3, r3, lsl #3
	rsb	r3, r3, r3, lsl #15
	add	r2, r2, r3, lsl #2
	rsb	r2, r2, #195035136
	ldr	r3, .L218+28
	add	r2, r2, #190464
	add	r2, r2, #186
	cmp	r2, r3
	bhi	.L89
	ldr	r3, [r4, #28]
	adds	r3, r3, #1
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	str	r3, [r4, #28]
.L89:
	ldm	r4, {r0, r1}
	cmp	r0, #224
	bhi	.L91
	cmp	r1, #0
	add	r3, r1, #7
	movge	r3, r1
	asr	r2, r0, #3
	asr	r3, r3, #3
	add	ip, r2, r3, lsl #5
	ldr	lr, .L218+32
	lsl	ip, ip, #1
	ldrh	ip, [lr, ip]
	cmp	ip, #6
	lsl	r3, r3, #5
	beq	.L91
	add	ip, r3, #32
	add	r7, r2, ip
	lsl	r7, r7, #1
	ldrh	r7, [lr, r7]
	cmp	r7, #6
	beq	.L91
	add	r2, r2, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	ldrh	r3, [lr, r3]
	cmp	r3, #6
	beq	.L91
	add	r3, ip, r2
	lsl	r3, r3, #1
	ldrh	r3, [lr, r3]
	cmp	r3, #6
	bne	.L92
.L91:
	ldr	r2, [r4, #8]
	rsb	r2, r2, #0
	str	r2, [r4, #8]
.L92:
	sub	r3, r1, #8
	cmp	r3, #128
	bls	.L215
.L93:
	ldr	r3, [r4, #12]
	rsb	r3, r3, #0
	str	r3, [r4, #12]
.L94:
	ldr	r3, [r5, #2308]
	cmp	r3, #0
	ble	.L100
	mov	r10, #0
	mov	fp, #16
	ldr	r7, .L218+36
.L99:
	mov	r3, #16
	ldm	r7, {ip, lr}
	mov	r2, r3
	stm	sp, {ip, lr}
	str	fp, [sp, #12]
	str	fp, [sp, #8]
	ldr	ip, .L218+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	add	r10, r10, #1
	beq	.L98
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	rsb	r2, r2, #0
	rsb	r3, r3, #0
	str	r2, [r4, #8]
	str	r3, [r4, #12]
.L98:
	ldr	r3, [r5, #2308]
	cmp	r3, r10
	ldm	r4, {r0, r1}
	add	r7, r7, #20
	bgt	.L99
.L100:
	ldr	ip, [r4, #12]
	cmp	ip, #0
	beq	.L96
	movgt	r3, #3
	movle	r3, #2
	ldr	r2, [r4, #8]
	str	r3, [r4, #32]
.L102:
	mov	r3, #16
	ldr	lr, .L218+20
	add	r0, r0, r2
	add	r1, r1, ip
	ldm	lr, {r2, ip}
	str	r3, [sp, #12]
	stm	sp, {r2, ip}
	str	r3, [sp, #8]
	mov	r2, r3
	str	r0, [r4]
	str	r1, [r4, #4]
	ldr	ip, .L218+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L87
	bl	die
	b	.L87
.L115:
	cmn	r3, #1
	beq	.L216
	ldr	r3, [r4, #12]
	cmp	r3, #1
	beq	.L217
	cmn	r3, #1
	beq	.L119
	ldr	r2, [r4, #68]
	b	.L116
.L96:
	ldr	r2, [r4, #8]
	cmp	r2, #0
	movle	r3, #1
	strgt	ip, [r4, #32]
	strle	r3, [r4, #32]
	b	.L102
.L215:
	cmp	r0, #0
	add	r2, r0, #7
	movge	r2, r0
	asr	r3, r1, #3
	asr	r2, r2, #3
	add	lr, r2, r3, lsl #5
	ldr	ip, .L218+32
	lsl	lr, lr, #1
	ldrh	lr, [ip, lr]
	cmp	lr, #6
	lsl	r3, r3, #5
	beq	.L93
	add	lr, r2, #1
	add	r7, r3, lr
	lsl	r7, r7, #1
	ldrh	r7, [ip, r7]
	cmp	r7, #6
	beq	.L93
	add	r3, r3, #64
	add	r2, r2, r3
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #6
	beq	.L93
	add	r3, lr, r3
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #6
	bne	.L94
	b	.L93
.L216:
	mov	r0, #24
	mov	r1, #16
	mov	r2, #48
	ldr	r3, [r4]
	sub	r3, r3, #52
	str	r3, [r4, #44]
	ldr	r3, [r4, #4]
	str	r0, [r4, #60]
	str	r1, [r4, #64]
	str	r2, [r4, #68]
	str	r3, [r4, #48]
	b	.L116
.L214:
	movgt	r3, #3
	movle	r3, #2
	ldr	lr, [r4, #8]
	str	r3, [r4, #32]
	b	.L131
.L119:
	mov	r1, #16
	mov	ip, #272
	mov	r0, #48
	ldr	r3, [r4, #4]
	sub	r3, r3, #52
	str	r3, [r4, #48]
	ldr	r3, [r4]
	mov	r2, r1
	str	r1, [r4, #68]
	str	ip, [r4, #60]
	str	r0, [r4, #64]
	str	r3, [r4, #44]
	b	.L116
.L217:
	mov	r2, #16
	mov	r0, #280
	mov	r1, #48
	ldr	r3, [r4, #4]
	add	r3, r3, r2
	str	r3, [r4, #48]
	ldr	r3, [r4]
	str	r0, [r4, #60]
	str	r1, [r4, #64]
	str	r2, [r4, #68]
	str	r3, [r4, #44]
	b	.L116
.L219:
	.align	2
.L218:
	.word	.LANCHOR0
	.word	143165576
	.word	71582788
	.word	.LANCHOR0+116
	.word	-1975322511
	.word	player
	.word	collision
	.word	390451572
	.word	.LANCHOR0+260
	.word	.LANCHOR0+2312
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	doRocks
	.syntax unified
	.arm
	.fpu softvfp
	.type	doRocks, %function
doRocks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L248
	ldr	r3, [r6, #2308]
	cmp	r3, #0
	sub	sp, sp, #28
	ble	.L220
	mov	r5, #0
	mov	r8, #32
	add	r4, r6, #2304
	ldr	r10, .L248+4
	ldr	fp, .L248+8
	add	r4, r4, #8
	add	r7, r6, #260
.L232:
	ldm	r4, {r1, r2}
	cmp	r2, #0
	add	r0, r2, #7
	movge	r0, r2
	cmp	r1, #0
	add	r3, r1, #7
	movge	r3, r1
	asr	r0, r0, #3
	add	r0, r0, #2
	asr	r3, r3, #3
	add	r3, r3, r0, lsl #5
	lsl	r0, r3, #1
	ldrh	r0, [r7, r0]
	cmp	r0, #0
	bne	.L222
	add	r3, r7, r3, lsl #1
	ldrh	r3, [r3, #2]
	cmp	r3, #0
	bne	.L222
	ldr	r3, [r4, #12]
	add	r3, r3, #1
	smull	ip, r0, r10, r3
	ldr	ip, [r4, #16]
	sub	r0, r0, r3, asr #31
	add	r0, r0, r0, lsl #1
	cmp	r3, r0, lsl #1
	sub	r0, ip, #1
	movne	ip, #0
	moveq	ip, r0, lsr #31
	cmp	ip, #0
	str	r3, [r4, #12]
	str	r0, [r4, #16]
	bne	.L246
.L224:
	ldr	r3, [r6, #2308]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #20
	bgt	.L232
.L220:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L222:
	str	r8, [r4, #16]
	b	.L224
.L246:
	add	ip, r2, #8
	stm	sp, {r1, ip}
	mov	r3, #16
	ldr	r1, .L248+12
	mov	r0, r1
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	mov	r2, r3
	str	ip, [r4, #4]
	ldr	r1, [r1, #4]
	ldr	r0, [r0]
	ldr	ip, .L248+16
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L247
.L225:
	ldr	r3, [r6, #28]
	cmp	r3, #0
	ble	.L226
	mov	r3, #0
	str	r5, [sp, #20]
	mov	r5, r3
	ldr	r9, .L248+20
.L228:
	mov	r3, #16
	mov	r2, r3
	ldr	r0, [r9, #4]
	ldr	r1, [r9]
	stmib	sp, {r0, r2}
	str	r3, [sp, #12]
	str	r1, [sp]
	ldr	ip, .L248+16
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r2, #0
	ldrne	r3, [fp]
	addne	r3, r3, #100
	strne	r3, [fp]
	ldr	r3, [r6, #28]
	add	r5, r5, #1
	strne	r2, [r9, #36]
	cmp	r3, r5
	add	r9, r9, #40
	bgt	.L228
	ldr	r5, [sp, #20]
.L226:
	ldr	r3, [r6, #112]
	cmp	r3, #0
	ble	.L224
	mov	r3, #0
	str	r5, [sp, #20]
	mov	r5, r3
	ldr	r9, .L248+24
.L231:
	mov	r3, #16
	mov	r2, r3
	ldr	r0, [r9, #4]
	ldr	r1, [r9]
	stmib	sp, {r0, r2}
	str	r3, [sp, #12]
	str	r1, [sp]
	ldr	ip, .L248+16
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	movne	r2, #0
	ldrne	r3, [fp]
	addne	r3, r3, #200
	strne	r3, [fp]
	ldr	r3, [r6, #112]
	add	r5, r5, #1
	strne	r2, [r9, #36]
	cmp	r3, r5
	add	r9, r9, #72
	bgt	.L231
	ldr	r5, [sp, #20]
	b	.L224
.L247:
	bl	die
	b	.L225
.L249:
	.align	2
.L248:
	.word	.LANCHOR0
	.word	715827883
	.word	score
	.word	player
	.word	collision
	.word	.LANCHOR0+32
	.word	.LANCHOR0+116
	.size	doRocks, .-doRocks
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"fygar num %d: x=%d, y=%d, dx=%d, dy=%d, active=%d, "
	.ascii	"orientation=%d\000"
	.text
	.align	2
	.global	DMADraw
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMADraw, %function
DMADraw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L318
	ldm	r4, {r3, r7}
	adds	r1, r7, #4
	addmi	r1, r7, #11
	adds	ip, r3, #4
	addmi	ip, r3, #11
	asr	r2, r1, #3
	add	r1, r4, #16
	ldm	r1, {r1, lr}
	asr	ip, ip, #3
	ldr	r5, .L318+4
	ldr	r0, .L318+8
	add	r6, ip, r2, lsl #5
	add	lr, lr, r1, lsl #1
	lsl	r6, r6, #1
	and	r1, r7, #255
	strh	r1, [r5]	@ movhi
	lsl	r3, r3, #23
	ldrh	r1, [r0, r6]
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	lsl	lr, lr, #1
	cmp	r1, #6
	strh	r3, [r5, #2]	@ movhi
	strh	lr, [r5, #4]	@ movhi
	sub	sp, sp, #20
	lsl	r1, r2, #5
	bne	.L251
	mov	lr, #0
	ldr	r2, .L318+12
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	strh	lr, [r0, r6]	@ movhi
.L251:
	add	r2, ip, #1
	add	r3, r1, r2
	lsl	r3, r3, #1
	ldrh	lr, [r0, r3]
	cmp	lr, #6
	bne	.L252
	mov	r6, #0
	ldr	r4, .L318+12
	ldr	lr, [r4]
	add	lr, lr, #1
	str	lr, [r4]
	strh	r6, [r0, r3]	@ movhi
.L252:
	add	r1, r1, #32
	add	r3, ip, r1
	lsl	r3, r3, #1
	ldrh	ip, [r0, r3]
	cmp	ip, #6
	bne	.L253
	mov	r4, #0
	ldr	lr, .L318+12
	ldr	ip, [lr]
	add	ip, ip, #1
	str	ip, [lr]
	strh	r4, [r0, r3]	@ movhi
.L253:
	add	r2, r2, r1
	lsl	r2, r2, #1
	ldrh	r3, [r0, r2]
	cmp	r3, #6
	bne	.L254
	mov	ip, #0
	ldr	r1, .L318+12
	ldr	r3, [r1]
	add	r3, r3, #1
	str	r3, [r1]
	strh	ip, [r0, r2]	@ movhi
.L254:
	ldr	r6, .L318+16
	ldr	ip, [r6, #28]
	cmp	ip, #0
	ble	.L266
	mov	r0, #0
	mov	r4, #512
	ldr	lr, .L318+20
	ldr	r7, .L318+24
	add	r3, r6, #32
.L265:
	ldr	r2, [r3, #36]
	ldr	r1, [r3, #20]
	cmp	r2, #0
	lsleq	r1, r1, #3
	strheq	r4, [r5, r1]	@ movhi
	beq	.L262
	ldr	r9, [r3, #24]
	cmp	r9, #0
	ldrh	r8, [r3, #4]
	ldr	r2, [r3]
	ldr	r10, [r3, #32]
	bne	.L259
	ldr	r9, [r3, #8]
	cmp	r9, #0
	lsl	r1, r1, #3
	and	r8, r8, #255
	and	r2, r2, lr
	bne	.L314
	cmp	r10, #3
	orrne	r2, r2, #8192
	strh	r8, [r5, r1]	@ movhi
	ldr	r8, [r3, #28]
	lslne	r2, r2, #16
	asrne	r2, r2, #16
	add	r8, r8, #128
.L312:
	add	r1, r5, r1
	orr	r2, r2, #16384
	lsl	r8, r8, #1
	strh	r2, [r1, #2]	@ movhi
	strh	r8, [r1, #4]	@ movhi
.L262:
	add	r0, r0, #1
	cmp	r0, ip
	add	r3, r3, #40
	bne	.L265
.L266:
	ldr	ip, [r6, #112]
	cmp	ip, #0
	ble	.L315
	mov	r7, #0
	ldr	r4, .L318+28
	ldr	r8, .L318+32
	ldr	fp, .L318+36
	ldr	r9, .L318+20
	ldr	r10, .L318+24
.L274:
	ldr	r1, [r4, #36]
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #8]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r1, r7
	ldm	r4, {r2, r3}
	mov	r0, fp
	mov	lr, pc
	bx	r8
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L267
	ldr	r1, [r4, #24]
	cmp	r1, #0
	ldrh	r0, [r4, #4]
	ldr	r3, [r4]
	ldr	ip, [r4, #32]
	ldr	r2, [r4, #20]
	bne	.L268
	ldr	r1, [r4, #8]
	cmp	r1, #0
	lsl	r2, r2, #3
	and	r0, r0, #255
	and	r3, r3, r9
	bne	.L316
	cmp	ip, #3
	orrne	r3, r3, #8192
	ldr	r1, [r4, #28]
	lslne	r3, r3, #16
	strh	r0, [r5, r2]	@ movhi
	asrne	r3, r3, #16
	add	r1, r1, #130
.L313:
	add	r2, r5, r2
	orr	r3, r3, #16384
	lsl	r1, r1, #1
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	b	.L271
.L267:
	mov	r2, #512
	ldr	r3, [r4, #20]
	lsl	r3, r3, #3
	strh	r2, [r5, r3]	@ movhi
.L271:
	ldr	ip, [r6, #112]
	add	r7, r7, #1
	cmp	ip, r7
	add	r4, r4, #72
	bgt	.L274
	ldr	r4, [r6, #2308]
	cmp	r4, #0
	ble	.L279
.L275:
	mov	r0, #0
	mov	r8, #200
	ldr	r1, .L318+40
	ldr	r7, .L318+20
.L278:
	ldr	r3, [r1, #8]
	ldrb	lr, [r1, #4]	@ zero_extendqisi2
	ldr	r2, [r1], #20
	add	r0, r0, #1
	and	r2, r2, r7
	lsl	r9, r3, #3
	orr	r2, r2, #16384
	add	r3, r5, r3, lsl #3
	cmp	r4, r0
	strh	lr, [r5, r9]	@ movhi
	strh	r8, [r3, #4]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	bne	.L278
.L279:
	cmp	ip, #0
	ble	.L277
	mov	r1, #0
	mov	r7, #512
	ldr	r3, .L318+28
	ldr	r4, .L318+20
	ldr	lr, .L318+44
.L284:
	ldr	r2, [r3, #52]
	cmp	r2, #0
	ldr	r2, [r3, #56]
	add	r0, r5, r2, lsl #3
	lsl	r8, r2, #3
	ldrgt	r2, [r3, #44]
	andgt	r2, r2, r4
	orrgt	r2, r2, lr
	ldrbgt	r9, [r3, #48]	@ zero_extendqisi2
	strhgt	r2, [r0, #2]	@ movhi
	ldrgt	r2, [r3, #60]
	lslle	r2, r2, #3
	add	r1, r1, #1
	strhgt	r9, [r5, r8]	@ movhi
	strhgt	r2, [r0, #4]	@ movhi
	strhle	r7, [r5, r2]	@ movhi
	cmp	ip, r1
	add	r3, r3, #72
	bne	.L284
.L277:
	ldr	r3, [r6, #8]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #8]
	ldr	r2, [r6, #12]
	ble	.L317
	ldr	r3, [r6]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldrb	ip, [r6, #4]	@ zero_extendqisi2
	ldr	r0, [r6, #16]
	add	r1, r5, r2, lsl #3
	lsl	r2, r2, #3
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r5, r2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
.L285:
	ldr	r4, .L318+48
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L318+52
	ldr	r1, .L318+8
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L318+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L259:
	sub	r2, r2, #4
	cmp	r10, #0
	and	r2, r2, lr
	sub	r8, r8, #4
	lsl	r1, r1, #3
	orrne	r2, r2, #4096
	and	r8, r8, #255
	add	r9, r9, #79
	add	r0, r0, #1
	strh	r8, [r5, r1]	@ movhi
	lsl	r9, r9, #2
	add	r1, r5, r1
	orr	r2, r2, r7
	cmp	r0, ip
	strh	r9, [r1, #4]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	add	r3, r3, #40
	bne	.L265
	b	.L266
.L268:
	sub	r3, r3, #4
	and	r3, r3, r9
	sub	r0, r0, #4
	cmp	ip, #0
	lsl	r2, r2, #3
	and	r0, r0, #255
	orrne	r3, r3, #4096
	add	r1, r1, #111
	strh	r0, [r5, r2]	@ movhi
	lsl	r1, r1, #2
	add	r2, r5, r2
	orr	r3, r3, r10
	strh	r1, [r2, #4]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	b	.L271
.L316:
	ldr	r1, [r4, #28]
	cmp	ip, #0
	strh	r0, [r5, r2]	@ movhi
	orrne	r3, r3, #4096
	add	r1, r1, #98
	b	.L313
.L314:
	strh	r8, [r5, r1]	@ movhi
	ldr	r8, [r3, #28]
	cmp	r10, #0
	orrne	r2, r2, #4096
	add	r8, r8, #96
	b	.L312
.L317:
	mov	r3, #512
	lsl	r2, r2, #3
	strh	r3, [r5, r2]	@ movhi
	b	.L285
.L315:
	ldr	r4, [r6, #2308]
	cmp	r4, #0
	bgt	.L275
	b	.L277
.L319:
	.align	2
.L318:
	.word	player
	.word	shadowOAM
	.word	.LANCHOR0+260
	.word	score
	.word	.LANCHOR0
	.word	511
	.word	-32768
	.word	.LANCHOR0+116
	.word	mgba_printf
	.word	.LC0
	.word	.LANCHOR0+2312
	.word	-16384
	.word	DMANow
	.word	100726784
	.size	DMADraw, .-DMADraw
	.align	2
	.global	updateLasts
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLasts, %function
updateLasts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L321
	ldm	r3, {r1, r2}
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	bx	lr
.L322:
	.align	2
.L321:
	.word	player
	.size	updateLasts, .-updateLasts
	.align	2
	.global	checkDeath
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkDeath, %function
checkDeath:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.size	checkDeath, .-checkDeath
	.align	2
	.global	checkRockOrWallCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkRockOrWallCollision, %function
checkRockOrWallCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r8, .L333
	ldr	r3, [r8, #2308]
	ldr	r5, .L333+4
	cmp	r3, #0
	ldm	r5, {r0, r1}
	sub	sp, sp, #20
	ble	.L325
	mov	r6, #0
	mov	r7, #16
	add	r4, r8, #2304
	ldr	r9, .L333+8
	add	r4, r4, #8
.L328:
	mov	r3, #16
	ldm	r4, {ip, lr}
	mov	r2, r3
	stm	sp, {ip, lr}
	str	r7, [sp, #12]
	str	r7, [sp, #8]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	addne	r0, r5, #8
	ldmne	r0, {r0, r1}
	ldr	r3, [r8, #2308]
	add	r6, r6, #1
	stmne	r5, {r0, r1}
	ldmeq	r5, {r0, r1}
	cmp	r3, r6
	add	r4, r4, #20
	bgt	.L328
.L325:
	cmp	r0, #224
	ldrhi	r3, [r5, #8]
	sub	r1, r1, #8
	strhi	r3, [r5]
	cmp	r1, #128
	ldrhi	r3, [r5, #12]
	strhi	r3, [r5, #4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L334:
	.align	2
.L333:
	.word	.LANCHOR0
	.word	player
	.word	collision
	.size	checkRockOrWallCollision, .-checkRockOrWallCollision
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	checkRockOrWallCollision
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	checkButtons
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkButtons, %function
checkButtons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L365
	ldrh	r0, [r4]
	tst	r0, #8
	beq	.L337
	ldr	r3, .L365+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L361
.L337:
	ldr	r3, .L365+8
	ldrh	r2, [r3, #48]
	tst	r2, #64
	beq	.L338
	ldrh	r2, [r3, #48]
	tst	r2, #128
	bne	.L339
.L338:
	ldr	r1, .L365+12
	ldr	r2, [r1, #24]
	ldr	r3, .L365+16
	add	r2, r2, #1
	smull	ip, r3, r2, r3
	ldr	ip, .L365+8
	ldrh	ip, [ip, #48]
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	tst	ip, #64
	sub	r3, r2, r3, lsl #1
	ldr	ip, [r1, #4]
	bne	.L340
	mov	lr, #1
	sub	ip, ip, #1
	cmp	r3, #0
	str	ip, [r1, #4]
	str	r2, [r1, #24]
	str	lr, [r1, #16]
	beq	.L362
.L342:
	tst	r0, #1
	beq	.L336
	ldr	r3, .L365+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L363
.L336:
	pop	{r4, lr}
	bx	lr
.L340:
	mov	lr, #3
	add	ip, ip, #1
	cmp	r3, #0
	str	ip, [r1, #4]
	str	r2, [r1, #24]
	str	lr, [r1, #16]
	bne	.L342
.L360:
	ldr	r3, [r1, #20]
	adds	r3, r3, #1
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	str	r3, [r1, #20]
	b	.L342
.L339:
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L364
.L344:
	ldr	r1, .L365+12
	ldr	r2, [r1, #24]
	ldr	r3, .L365+16
	add	r2, r2, #1
	smull	ip, r3, r2, r3
	ldr	ip, .L365+8
	ldrh	ip, [ip, #48]
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	tst	ip, #32
	sub	r3, r2, r3, lsl #1
	ldr	ip, [r1]
	bne	.L345
	mov	lr, #2
	sub	ip, ip, #1
	cmp	r3, #0
	str	ip, [r1]
	str	r2, [r1, #24]
	str	lr, [r1, #16]
	bne	.L342
	b	.L360
.L362:
	ldr	r3, [r1, #20]
	adds	r3, r3, lr
	and	r3, r3, lr
	rsbmi	r3, r3, #0
	str	r3, [r1, #20]
	b	.L342
.L361:
	mov	r1, #1
	ldr	r2, .L365+20
	ldr	r3, .L365+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldrh	r0, [r4]
	b	.L337
.L364:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L342
	b	.L344
.L363:
	pop	{r4, lr}
	b	shootPump
.L345:
	mov	lr, #0
	add	ip, ip, #1
	cmp	r3, lr
	str	ip, [r1]
	str	r2, [r1, #24]
	str	lr, [r1, #16]
	bne	.L342
	b	.L360
.L366:
	.align	2
.L365:
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	player
	.word	715827883
	.word	paused
	.word	goPause
	.size	checkButtons, .-checkButtons
	.align	2
	.global	doGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	doGame, %function
doGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L389
	ldr	r3, .L389+4
	ldr	r2, [r1]
	ldr	ip, [r3]
	ldr	r0, [r3, #4]
	push	{r4, lr}
	add	r2, r2, #1
	str	ip, [r3, #8]
	str	r2, [r1]
	str	r0, [r3, #12]
	bl	checkButtons
	bl	doRocks
	bl	updateEnemies
	bl	checkRockOrWallCollision
	ldr	r3, .L389+8
	mov	lr, pc
	bx	r3
	bl	doScore
	ldr	r3, .L389+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L387
.L368:
	mov	r0, #96
	ldr	r1, .L389+16
.L369:
	sub	r3, r1, #60
	b	.L373
.L370:
	cmp	r3, r1
	beq	.L388
.L373:
	ldrh	r2, [r3], #2
	cmp	r2, #0
	beq	.L370
	ldr	r3, .L389+20
	ldr	r2, [r3, #28]
	cmp	r2, #0
	ble	.L372
	ldr	r1, [r3, #68]
	cmp	r1, #0
	bne	.L367
	cmp	r2, #1
	beq	.L372
	ldr	r2, [r3, #108]
	cmp	r2, #0
	bne	.L367
.L372:
	ldr	r2, [r3, #112]
	cmp	r2, #0
	ble	.L374
	ldr	r1, [r3, #152]
	cmp	r1, #0
	bne	.L367
	cmp	r2, #1
	beq	.L374
	ldr	r3, [r3, #224]
	cmp	r3, #0
	bne	.L367
.L374:
	ldr	r3, .L389+24
	mov	lr, pc
	bx	r3
.L367:
	pop	{r4, lr}
	bx	lr
.L388:
	add	r0, r0, #32
	cmp	r0, #608
	add	r1, r1, #64
	bne	.L369
	b	.L374
.L387:
	bl	DMADraw
	b	.L368
.L390:
	.align	2
.L389:
	.word	timeStep
	.word	player
	.word	waitForVBlank
	.word	paused
	.word	.LANCHOR0+512
	.word	.LANCHOR0
	.word	goWin
	.size	doGame, .-doGame
	.align	2
	.global	initOrDeathPositionResets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initOrDeathPositionResets, %function
initOrDeathPositionResets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #112
	mov	r2, #80
	ldr	r3, .L392
	stm	r3, {r1, r2}
	bx	lr
.L393:
	.align	2
.L392:
	.word	player
	.size	initOrDeathPositionResets, .-initOrDeathPositionResets
	.align	2
	.global	reset
	.syntax unified
	.arm
	.fpu softvfp
	.type	reset, %function
reset:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	reset, .-reset
	.align	2
	.global	goGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goGame, %function
goGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L397
	mov	lr, pc
	bx	r3
	mov	r7, #16384
	mov	ip, #152
	mov	r2, #832
	mov	r1, #80
	mov	r6, #112
	mov	r3, #0
	mov	lr, #2
	mov	r5, #1
	ldr	r4, .L397+4
	ldr	r0, .L397+8
	strh	r0, [r4, #2]	@ movhi
	add	r0, r4, #960
	strh	ip, [r0]	@ movhi
	strh	r7, [r0, #2]	@ movhi
	add	r0, r4, #968
	strh	ip, [r0]	@ movhi
	ldr	ip, .L397+12
	strh	ip, [r0, #2]	@ movhi
	add	r0, r4, #964
	strh	r2, [r0]	@ movhi
	add	r0, r4, #972
	strh	r2, [r0]	@ movhi
	ldr	r2, .L397+16
	strh	r1, [r4]	@ movhi
	str	r6, [r2]
	str	r1, [r2, #4]
	ldr	r1, .L397+20
	ldr	r2, .L397+24
	ldr	r0, .L397+28
	str	r3, [r1]
	str	r3, [r2]
	ldr	r1, .L397+32
	ldr	r2, .L397+36
	strh	r3, [r4, #4]	@ movhi
	str	r3, [r0]
	ldr	r3, .L397+40
	str	lr, [r2]
	str	r5, [r1]
	mov	lr, pc
	bx	r3
	ldr	r5, .L397+44
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L397+48
	ldr	r1, .L397+52
	mov	lr, pc
	bx	r5
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L398:
	.align	2
.L397:
	.word	hideSprites
	.word	shadowOAM
	.word	16496
	.word	16393
	.word	player
	.word	timeStep
	.word	paused
	.word	score
	.word	state
	.word	xtraLives
	.word	waitForVBlank
	.word	DMANow
	.word	100726784
	.word	.LANCHOR0+260
	.size	goGame, .-goGame
	.align	2
	.global	resumeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	resumeGame, %function
resumeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L406
	ldr	r3, [r3]
	cmp	r3, #1
	push	{r4, lr}
	beq	.L400
	cmp	r3, #2
	bne	.L401
	mov	r0, #152
	mov	r2, #832
	ldr	r3, .L406+4
	ldr	r1, .L406+8
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
.L400:
	mov	r0, #152
	mov	r1, #16384
	mov	r2, #832
	ldr	r3, .L406+12
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
.L401:
	mov	r2, #0
	mov	r0, #1
	mov	lr, #512
	ldr	r3, .L406+16
	ldr	r1, .L406+20
	ldr	ip, .L406+24
	str	r2, [r3]
	str	r0, [r1]
	ldr	r4, .L406+28
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L406+32
	ldr	r1, .L406+36
	strh	lr, [ip]	@ movhi
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L407:
	.align	2
.L406:
	.word	xtraLives
	.word	shadowOAM+968
	.word	16393
	.word	shadowOAM+960
	.word	paused
	.word	state
	.word	shadowOAM+800
	.word	DMANow
	.word	100726784
	.word	.LANCHOR0+260
	.size	resumeGame, .-resumeGame
	.global	NUMFYGARS
	.global	fygars
	.global	pookahs
	.global	playerFramesRIGHT
	.global	playerFramesLEFT
	.global	playerFramesDOWN
	.global	playerFramesUP
	.comm	player,28,4
	.global	NUMROCKS
	.global	rocks
	.global	pump
	.comm	score,4,4
	.comm	paused,4,4
	.comm	timeStep,4,4
	.comm	xtraLives,4,4
	.comm	shadowOAM,1024,4
	.global	gameTileMap
	.global	NUMPOOKAHS
	.comm	state,4,4
	.section	.rodata
	.align	2
	.type	playerFramesRIGHT, %object
	.size	playerFramesRIGHT, 4
playerFramesRIGHT:
	.word	12
	.type	playerFramesLEFT, %object
	.size	playerFramesLEFT, 4
playerFramesLEFT:
	.word	8
	.type	playerFramesDOWN, %object
	.size	playerFramesDOWN, 4
playerFramesDOWN:
	.word	4
	.type	playerFramesUP, %object
	.size	playerFramesUP, 4
playerFramesUP:
	.space	4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	pump, %object
	.size	pump, 28
pump:
	.word	0
	.word	0
	.word	0
	.word	67
	.word	0
	.word	0
	.word	0
	.type	NUMPOOKAHS, %object
	.size	NUMPOOKAHS, 4
NUMPOOKAHS:
	.word	2
	.type	pookahs, %object
	.size	pookahs, 80
pookahs:
	.word	192
	.word	48
	.word	0
	.word	1
	.word	0
	.word	69
	.word	0
	.word	0
	.word	0
	.word	1
	.word	176
	.word	128
	.word	-1
	.word	0
	.word	0
	.word	71
	.word	0
	.word	0
	.word	0
	.word	1
	.type	NUMFYGARS, %object
	.size	NUMFYGARS, 4
NUMFYGARS:
	.word	2
	.type	fygars, %object
	.size	fygars, 144
fygars:
	.word	32
	.word	104
	.word	1
	.word	0
	.word	0
	.word	51
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	47
	.word	0
	.word	0
	.word	0
	.word	48
	.word	64
	.word	0
	.word	1
	.word	0
	.word	52
	.word	0
	.word	0
	.word	0
	.word	1
	.word	60
	.word	0
	.word	0
	.word	0
	.word	49
	.word	0
	.word	0
	.word	0
	.type	gameTileMap, %object
	.size	gameTileMap, 2048
gameTileMap:
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	0
	.short	0
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	0
	.short	0
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	2
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.space	832
	.type	NUMROCKS, %object
	.size	NUMROCKS, 4
NUMROCKS:
	.word	3
	.type	rocks, %object
	.size	rocks, 60
rocks:
	.word	0
	.word	32
	.word	10
	.word	0
	.word	32
	.word	176
	.word	48
	.word	11
	.word	0
	.word	32
	.word	80
	.word	64
	.word	12
	.word	0
	.word	32
	.ident	"GCC: (devkitARM release 53) 9.1.0"
