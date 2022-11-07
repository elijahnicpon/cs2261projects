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
	ldr	r5, .L227
	ldr	r3, [r5, #28]
	cmp	r3, #0
	sub	sp, sp, #36
	ble	.L108
	mov	r6, #0
	ldr	r8, .L227+4
	ldr	fp, .L227+8
	add	r4, r5, #32
.L107:
	ldr	r2, [r4, #16]
	add	r2, r2, #1
	add	r3, r2, r2, lsl #4
	add	r3, r3, r3, lsl #8
	add	r3, r3, r3, lsl #16
	sub	r3, r8, r3
	cmp	fp, r3, ror #2
	str	r2, [r4, #16]
	bcc	.L84
	ldr	r3, [r4, #24]
	subs	r3, r3, #1
	strpl	r3, [r4, #24]
	bmi	.L217
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
	bgt	.L107
.L108:
	ldr	r3, [r5, #112]
	cmp	r3, #0
	ble	.L80
	ldr	r9, .L227+12
	mov	r6, #0
	mov	r4, r9
	add	r7, r9, #2192
	ldr	r8, .L227+4
	ldr	r10, .L227+8
	ldr	fp, .L227+16
	add	r7, r7, #4
.L136:
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
	bcc	.L109
	ldr	r0, [r4, #24]
	rsb	r3, r3, r1, lsl #4
	rsb	r3, r3, r3, lsl #2
	subs	r0, r0, #1
	strpl	r0, [r4, #24]
	sub	r3, r2, r3
	bmi	.L218
.L111:
	cmp	r3, #0
	bne	.L113
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L112
.L117:
	ldr	r3, [r5, #112]
	add	r6, r6, #1
	cmp	r3, r6
	add	r4, r4, #72
	add	r7, r7, #20
	bgt	.L136
.L80:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L218:
	mov	r2, #0
	cmp	r3, r2
	str	r2, [r4, #24]
	bne	.L113
.L112:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L117
	mov	r2, #15
	ldr	r3, [r4, #8]
	cmp	r3, #1
	str	r2, [r4, #52]
	bne	.L118
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
.L119:
	mov	r3, #16
	ldr	r1, .L227+20
	ldr	r0, [r1, #4]
	ldr	r1, [r1]
	str	r0, [sp, #4]
	str	r1, [sp]
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	add	r0, r4, #44
	ldr	r3, [r4, #64]
	ldm	r0, {r0, r1}
	ldr	ip, .L227+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	blne	die
.L113:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L117
	ldr	r3, [r4, #24]
	cmp	r3, #0
	str	r3, [sp, #20]
	bne	.L117
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bge	.L117
	ldr	r2, [r4, #16]
	rsb	r3, r2, r2, lsl #5
	add	r3, r2, r3, lsl #5
	add	r3, r3, r3, lsl #3
	rsb	r3, r3, r3, lsl #15
	add	r3, r2, r3, lsl #2
	rsb	r3, r3, #195035136
	ldr	r2, .L227+28
	add	r3, r3, #190464
	add	r3, r3, #186
	cmp	r3, r2
	bhi	.L123
	ldr	r3, [r4, #28]
	adds	r3, r3, #1
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	str	r3, [r4, #28]
.L123:
	ldm	r4, {r0, r1}
	cmp	r0, #224
	bhi	.L124
	cmp	r1, #0
	add	r3, r1, #7
	movge	r3, r1
	asr	r2, r0, #3
	asr	r3, r3, #3
	add	lr, r2, r3, lsl #5
	ldr	ip, .L227+32
	lsl	lr, lr, #1
	ldrh	lr, [ip, lr]
	cmp	lr, #6
	lsl	r3, r3, #5
	beq	.L124
	add	lr, r3, #32
	str	lr, [sp, #24]
	add	lr, r2, lr
	lsl	lr, lr, #1
	ldrh	lr, [ip, lr]
	cmp	lr, #6
	beq	.L124
	add	r2, r2, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #6
	beq	.L124
	ldr	lr, [sp, #24]
	add	r2, lr, r2
	lsl	r3, r2, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #6
	bne	.L125
.L124:
	ldr	lr, [r4, #8]
	rsb	lr, lr, #0
	str	lr, [r4, #8]
.L125:
	sub	r3, r1, #8
	cmp	r3, #128
	bhi	.L126
	cmp	r0, #0
	add	r3, r0, #7
	movge	r3, r0
	asr	r2, r1, #3
	asr	r3, r3, #3
	add	lr, r3, r2, lsl #5
	ldr	ip, .L227+32
	lsl	lr, lr, #1
	ldrh	lr, [ip, lr]
	cmp	lr, #6
	lsl	r2, r2, #5
	beq	.L126
	add	lr, r3, #1
	str	lr, [sp, #24]
	add	lr, r2, lr
	lsl	lr, lr, #1
	ldrh	lr, [ip, lr]
	cmp	lr, #6
	beq	.L126
	add	r2, r2, #64
	add	r3, r3, r2
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #6
	beq	.L126
	ldr	lr, [sp, #24]
	add	r2, lr, r2
	lsl	r3, r2, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #6
	bne	.L127
.L126:
	ldr	r3, [r4, #12]
	rsb	r3, r3, #0
	str	r3, [r4, #12]
.L127:
	ldr	r3, [r5, #2308]
	cmp	r3, #0
	ble	.L132
	str	r6, [sp, #28]
	mov	r6, r9
	str	r7, [sp, #24]
	ldr	r7, [sp, #20]
.L128:
	mov	r3, #16
	mov	r2, r3
	ldr	r0, [r6, #4]
	ldr	r1, [r6]
	stmib	sp, {r0, r2}
	str	r3, [sp, #12]
	str	r1, [sp]
	ldr	r0, [sp, #24]
	ldr	ip, .L227+24
	ldr	r1, [r0, #4]
	ldr	r0, [r0]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	add	r7, r7, #1
	beq	.L131
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	rsb	r2, r2, #0
	rsb	r3, r3, #0
	str	r2, [r4, #8]
	str	r3, [r4, #12]
.L131:
	ldr	r3, [r5, #2308]
	cmp	r3, r7
	add	r6, r6, #72
	bgt	.L128
	ldr	r7, [sp, #24]
	ldr	r6, [sp, #28]
	ldm	r4, {r0, r1}
.L132:
	ldr	ip, [r4, #12]
	cmp	ip, #0
	bne	.L219
	ldr	lr, [r4, #8]
	cmp	lr, #0
	movle	r3, #1
	strgt	ip, [r4, #32]
	strle	r3, [r4, #32]
.L134:
	mov	r3, #16
	ldr	r2, .L227+20
	add	r1, r1, ip
	ldm	r2, {r2, ip}
	add	r0, r0, lr
	stm	sp, {r2, ip}
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	mov	r2, r3
	str	r0, [r4]
	str	r1, [r4, #4]
	ldr	ip, .L227+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L117
	bl	die
	b	.L117
.L109:
	rsb	r3, r3, r1, lsl #4
	rsb	r3, r3, r3, lsl #2
	sub	r3, r2, r3
	b	.L111
.L217:
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
	ldr	r3, .L227+28
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
	bls	.L211
	ldr	r2, .L227+32
.L91:
	ldr	ip, [r4, #8]
	cmp	r1, #0
	sub	lr, r0, ip
	add	r3, r1, #7
	movge	r3, r1
	cmp	lr, #0
	add	r7, lr, #7
	movge	r7, lr
	asr	r3, r3, #3
	asr	r7, r7, #3
	sub	r3, r3, #1
	add	r3, r7, r3, lsl #5
	lsl	r7, r3, #1
	ldrh	r7, [r2, r7]
	cmp	r7, #0
	bne	.L93
	add	r7, r2, r3, lsl #1
	ldrh	r7, [r7, #2]
	cmp	r7, #0
	bne	.L93
	add	r3, r2, r3, lsl #1
	ldrh	r3, [r3, #4]
	cmp	r3, #0
	beq	.L220
.L93:
	rsb	ip, ip, #0
	str	ip, [r4, #8]
.L92:
	cmp	r0, #0
	add	r3, r0, #7
	movge	r3, r0
	sub	ip, r1, #8
	cmp	ip, #128
	ldr	lr, [r5, #2308]
	asr	r3, r3, #3
	bhi	.L94
	asr	r7, r1, #3
	add	ip, r3, r7, lsl #5
	lsl	ip, ip, #1
	ldrh	ip, [r2, ip]
	cmp	ip, #6
	lsl	r7, r7, #5
	beq	.L94
	add	ip, r3, #1
	add	r9, r7, ip
	lsl	r9, r9, #1
	ldrh	r9, [r2, r9]
	cmp	r9, #6
	beq	.L94
	add	r7, r7, #64
	add	r9, r7, r3
	lsl	r9, r9, #1
	ldrh	r9, [r2, r9]
	cmp	r9, #6
	beq	.L94
	add	ip, ip, r7
	lsl	ip, ip, #1
	ldrh	ip, [r2, ip]
	cmp	ip, #6
	bne	.L95
.L94:
	cmp	r1, #0
	add	ip, r1, #7
	movge	ip, r1
	sub	r3, r3, #1
	asr	ip, ip, #3
	add	r3, r3, ip, lsl #5
	lsl	ip, r3, #1
	ldrh	ip, [r2, ip]
	cmp	ip, #0
	bne	.L96
	add	ip, r2, r3, lsl #1
	ldrh	ip, [ip, #64]
	cmp	ip, #0
	bne	.L96
	add	r3, r2, r3, lsl #1
	ldrh	r3, [r3, #128]
	cmp	r3, #0
	beq	.L221
.L96:
	ldr	r3, [r4, #12]
	rsb	r3, r3, #0
	str	r3, [r4, #12]
.L95:
	cmp	lr, #0
	ble	.L222
.L97:
	ldr	r3, .L227+24
	str	r6, [sp, #24]
	mov	r9, #0
	mov	r10, #16
	mov	r6, r3
	ldr	r7, .L227+36
	str	r3, [sp, #20]
.L103:
	mov	r3, #16
	ldm	r7, {ip, lr}
	mov	r2, r3
	stm	sp, {ip, lr}
	str	r10, [sp, #12]
	str	r10, [sp, #8]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	add	r9, r9, #1
	beq	.L102
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	rsb	r2, r2, #0
	rsb	r3, r3, #0
	str	r2, [r4, #8]
	str	r3, [r4, #12]
.L102:
	ldr	r3, [r5, #2308]
	cmp	r3, r9
	add	r7, r7, #20
	ble	.L223
	ldm	r4, {r0, r1}
	b	.L103
.L118:
	cmn	r3, #1
	beq	.L224
	ldr	r3, [r4, #12]
	cmp	r3, #1
	beq	.L225
	cmn	r3, #1
	beq	.L122
	ldr	r2, [r4, #68]
	b	.L119
.L211:
	cmp	r1, #0
	add	r3, r1, #7
	movge	r3, r1
	asr	ip, r0, #3
	asr	r3, r3, #3
	add	lr, ip, r3, lsl #5
	ldr	r2, .L227+32
	lsl	lr, lr, #1
	ldrh	lr, [r2, lr]
	cmp	lr, #6
	lsl	r3, r3, #5
	beq	.L91
	add	lr, r3, #32
	add	r7, ip, lr
	lsl	r7, r7, #1
	ldrh	r7, [r2, r7]
	cmp	r7, #6
	beq	.L91
	add	ip, ip, #2
	add	r3, r3, ip
	lsl	r3, r3, #1
	ldrh	r3, [r2, r3]
	cmp	r3, #6
	beq	.L91
	add	r3, lr, ip
	lsl	r3, r3, #1
	ldrh	r3, [r2, r3]
	cmp	r3, #6
	bne	.L92
	b	.L91
.L223:
	ldr	r6, [sp, #24]
	ldm	r4, {r0, r1}
.L104:
	ldr	r2, [r4, #12]
	cmp	r2, #0
	bne	.L213
	ldr	lr, [r4, #8]
	cmp	lr, #0
	ble	.L226
.L98:
	mov	r3, #0
	str	r3, [r4, #32]
.L105:
	mov	r3, #16
	ldr	r7, .L227+20
	add	r0, r0, lr
	ldr	ip, [r7, #4]
	ldr	lr, [r7]
	add	r1, r1, r2
	str	ip, [sp, #4]
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	str	lr, [sp]
	mov	r2, r3
	stm	r4, {r0, r1}
	ldr	ip, [sp, #20]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L87
	bl	die
	b	.L87
.L213:
	movgt	r3, #3
	movle	r3, #2
	ldr	lr, [r4, #8]
	str	r3, [r4, #32]
	b	.L105
.L222:
	ldr	r3, .L227+24
	str	r3, [sp, #20]
	b	.L104
.L224:
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
	b	.L119
.L226:
	mov	r3, #1
	str	r3, [r4, #32]
	b	.L105
.L219:
	movgt	r3, #3
	movle	r3, #2
	ldr	lr, [r4, #8]
	str	r3, [r4, #32]
	b	.L134
.L221:
	ldr	r2, [r4, #12]
	sub	r1, r1, r2
	mov	r2, r3
	mov	r3, #1
	cmp	lr, #0
	str	r1, [r4, #4]
	str	r2, [r4, #12]
	str	r3, [r4, #8]
	bgt	.L97
	mov	lr, r3
	ldr	r3, .L227+24
	str	r3, [sp, #20]
	b	.L98
.L220:
	mov	ip, #1
	mov	r0, lr
	str	lr, [r4]
	str	r3, [r4, #8]
	str	ip, [r4, #12]
	b	.L92
.L122:
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
	b	.L119
.L225:
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
	b	.L119
.L228:
	.align	2
.L227:
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
	ldr	r6, .L257
	ldr	r3, [r6, #2308]
	cmp	r3, #0
	sub	sp, sp, #28
	ble	.L229
	mov	r5, #0
	mov	r8, #32
	add	r4, r6, #2304
	ldr	r10, .L257+4
	ldr	fp, .L257+8
	add	r4, r4, #8
	add	r7, r6, #260
.L241:
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
	bne	.L231
	add	r3, r7, r3, lsl #1
	ldrh	r3, [r3, #2]
	cmp	r3, #0
	bne	.L231
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
	bne	.L255
.L233:
	ldr	r3, [r6, #2308]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #20
	bgt	.L241
.L229:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L231:
	str	r8, [r4, #16]
	b	.L233
.L255:
	add	ip, r2, #8
	stm	sp, {r1, ip}
	mov	r3, #16
	ldr	r1, .L257+12
	mov	r0, r1
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	mov	r2, r3
	str	ip, [r4, #4]
	ldr	r1, [r1, #4]
	ldr	r0, [r0]
	ldr	ip, .L257+16
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L256
.L234:
	ldr	r3, [r6, #28]
	cmp	r3, #0
	ble	.L235
	mov	r3, #0
	str	r5, [sp, #20]
	mov	r5, r3
	ldr	r9, .L257+20
.L237:
	mov	r3, #16
	mov	r2, r3
	ldr	r0, [r9, #4]
	ldr	r1, [r9]
	stmib	sp, {r0, r2}
	str	r3, [sp, #12]
	str	r1, [sp]
	ldr	ip, .L257+16
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
	bgt	.L237
	ldr	r5, [sp, #20]
.L235:
	ldr	r3, [r6, #112]
	cmp	r3, #0
	ble	.L233
	mov	r3, #0
	str	r5, [sp, #20]
	mov	r5, r3
	ldr	r9, .L257+24
.L240:
	mov	r3, #16
	mov	r2, r3
	ldr	r0, [r9, #4]
	ldr	r1, [r9]
	stmib	sp, {r0, r2}
	str	r3, [sp, #12]
	str	r1, [sp]
	ldr	ip, .L257+16
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
	bgt	.L240
	ldr	r5, [sp, #20]
	b	.L233
.L256:
	bl	die
	b	.L234
.L258:
	.align	2
.L257:
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
	ldr	r4, .L327
	ldm	r4, {r3, r7}
	adds	r1, r7, #4
	addmi	r1, r7, #11
	adds	ip, r3, #4
	addmi	ip, r3, #11
	asr	r2, r1, #3
	add	r1, r4, #16
	ldm	r1, {r1, lr}
	asr	ip, ip, #3
	ldr	r5, .L327+4
	ldr	r0, .L327+8
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
	bne	.L260
	mov	lr, #0
	ldr	r2, .L327+12
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	strh	lr, [r0, r6]	@ movhi
.L260:
	add	r2, ip, #1
	add	r3, r1, r2
	lsl	r3, r3, #1
	ldrh	lr, [r0, r3]
	cmp	lr, #6
	bne	.L261
	mov	r6, #0
	ldr	r4, .L327+12
	ldr	lr, [r4]
	add	lr, lr, #1
	str	lr, [r4]
	strh	r6, [r0, r3]	@ movhi
.L261:
	add	r1, r1, #32
	add	r3, ip, r1
	lsl	r3, r3, #1
	ldrh	ip, [r0, r3]
	cmp	ip, #6
	bne	.L262
	mov	r4, #0
	ldr	lr, .L327+12
	ldr	ip, [lr]
	add	ip, ip, #1
	str	ip, [lr]
	strh	r4, [r0, r3]	@ movhi
.L262:
	add	r2, r2, r1
	lsl	r2, r2, #1
	ldrh	r3, [r0, r2]
	cmp	r3, #6
	bne	.L263
	mov	ip, #0
	ldr	r1, .L327+12
	ldr	r3, [r1]
	add	r3, r3, #1
	str	r3, [r1]
	strh	ip, [r0, r2]	@ movhi
.L263:
	ldr	r6, .L327+16
	ldr	ip, [r6, #28]
	cmp	ip, #0
	ble	.L275
	mov	r0, #0
	mov	r4, #512
	ldr	lr, .L327+20
	ldr	r7, .L327+24
	add	r3, r6, #32
.L274:
	ldr	r2, [r3, #36]
	ldr	r1, [r3, #20]
	cmp	r2, #0
	lsleq	r1, r1, #3
	strheq	r4, [r5, r1]	@ movhi
	beq	.L271
	ldr	r9, [r3, #24]
	cmp	r9, #0
	ldrh	r8, [r3, #4]
	ldr	r2, [r3]
	ldr	r10, [r3, #32]
	bne	.L268
	ldr	r9, [r3, #8]
	cmp	r9, #0
	lsl	r1, r1, #3
	and	r8, r8, #255
	and	r2, r2, lr
	bne	.L323
	cmp	r10, #3
	orrne	r2, r2, #8192
	strh	r8, [r5, r1]	@ movhi
	ldr	r8, [r3, #28]
	lslne	r2, r2, #16
	asrne	r2, r2, #16
	add	r8, r8, #128
.L321:
	add	r1, r5, r1
	orr	r2, r2, #16384
	lsl	r8, r8, #1
	strh	r2, [r1, #2]	@ movhi
	strh	r8, [r1, #4]	@ movhi
.L271:
	add	r0, r0, #1
	cmp	r0, ip
	add	r3, r3, #40
	bne	.L274
.L275:
	ldr	ip, [r6, #112]
	cmp	ip, #0
	ble	.L324
	mov	r7, #0
	ldr	r4, .L327+28
	ldr	r8, .L327+32
	ldr	fp, .L327+36
	ldr	r9, .L327+20
	ldr	r10, .L327+24
.L283:
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
	beq	.L276
	ldr	r1, [r4, #24]
	cmp	r1, #0
	ldrh	r0, [r4, #4]
	ldr	r3, [r4]
	ldr	ip, [r4, #32]
	ldr	r2, [r4, #20]
	bne	.L277
	ldr	r1, [r4, #8]
	cmp	r1, #0
	lsl	r2, r2, #3
	and	r0, r0, #255
	and	r3, r3, r9
	bne	.L325
	cmp	ip, #3
	orrne	r3, r3, #8192
	ldr	r1, [r4, #28]
	lslne	r3, r3, #16
	strh	r0, [r5, r2]	@ movhi
	asrne	r3, r3, #16
	add	r1, r1, #130
.L322:
	add	r2, r5, r2
	orr	r3, r3, #16384
	lsl	r1, r1, #1
	strh	r3, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	b	.L280
.L276:
	mov	r2, #512
	ldr	r3, [r4, #20]
	lsl	r3, r3, #3
	strh	r2, [r5, r3]	@ movhi
.L280:
	ldr	ip, [r6, #112]
	add	r7, r7, #1
	cmp	ip, r7
	add	r4, r4, #72
	bgt	.L283
	ldr	r4, [r6, #2308]
	cmp	r4, #0
	ble	.L288
.L284:
	mov	r0, #0
	mov	r8, #200
	ldr	r1, .L327+40
	ldr	r7, .L327+20
.L287:
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
	bne	.L287
.L288:
	cmp	ip, #0
	ble	.L286
	mov	r1, #0
	mov	r7, #512
	ldr	r3, .L327+28
	ldr	r4, .L327+20
	ldr	lr, .L327+44
.L293:
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
	bne	.L293
.L286:
	ldr	r3, [r6, #8]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r6, #8]
	ldr	r2, [r6, #12]
	ble	.L326
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
.L294:
	ldr	r4, .L327+48
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L327+52
	ldr	r1, .L327+8
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L327+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L268:
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
	bne	.L274
	b	.L275
.L277:
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
	b	.L280
.L325:
	ldr	r1, [r4, #28]
	cmp	ip, #0
	strh	r0, [r5, r2]	@ movhi
	orrne	r3, r3, #4096
	add	r1, r1, #98
	b	.L322
.L323:
	strh	r8, [r5, r1]	@ movhi
	ldr	r8, [r3, #28]
	cmp	r10, #0
	orrne	r2, r2, #4096
	add	r8, r8, #96
	b	.L321
.L326:
	mov	r3, #512
	lsl	r2, r2, #3
	strh	r3, [r5, r2]	@ movhi
	b	.L294
.L324:
	ldr	r4, [r6, #2308]
	cmp	r4, #0
	bgt	.L284
	b	.L286
.L328:
	.align	2
.L327:
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
	ldr	r3, .L330
	ldm	r3, {r1, r2}
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	bx	lr
.L331:
	.align	2
.L330:
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
	ldr	r8, .L342
	ldr	r3, [r8, #2308]
	ldr	r5, .L342+4
	cmp	r3, #0
	ldm	r5, {r0, r1}
	sub	sp, sp, #20
	ble	.L334
	mov	r6, #0
	mov	r7, #16
	add	r4, r8, #2304
	ldr	r9, .L342+8
	add	r4, r4, #8
.L337:
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
	bgt	.L337
.L334:
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
.L343:
	.align	2
.L342:
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
	ldr	r4, .L374
	ldrh	r0, [r4]
	tst	r0, #8
	beq	.L346
	ldr	r3, .L374+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L370
.L346:
	ldr	r3, .L374+8
	ldrh	r2, [r3, #48]
	tst	r2, #64
	beq	.L347
	ldrh	r2, [r3, #48]
	tst	r2, #128
	bne	.L348
.L347:
	ldr	r1, .L374+12
	ldr	r2, [r1, #24]
	ldr	r3, .L374+16
	add	r2, r2, #1
	smull	ip, r3, r2, r3
	ldr	ip, .L374+8
	ldrh	ip, [ip, #48]
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	tst	ip, #64
	sub	r3, r2, r3, lsl #1
	ldr	ip, [r1, #4]
	bne	.L349
	mov	lr, #1
	sub	ip, ip, #1
	cmp	r3, #0
	str	ip, [r1, #4]
	str	r2, [r1, #24]
	str	lr, [r1, #16]
	beq	.L371
.L351:
	tst	r0, #1
	beq	.L345
	ldr	r3, .L374+4
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L372
.L345:
	pop	{r4, lr}
	bx	lr
.L349:
	mov	lr, #3
	add	ip, ip, #1
	cmp	r3, #0
	str	ip, [r1, #4]
	str	r2, [r1, #24]
	str	lr, [r1, #16]
	bne	.L351
.L369:
	ldr	r3, [r1, #20]
	adds	r3, r3, #1
	and	r3, r3, #1
	rsbmi	r3, r3, #0
	str	r3, [r1, #20]
	b	.L351
.L348:
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L373
.L353:
	ldr	r1, .L374+12
	ldr	r2, [r1, #24]
	ldr	r3, .L374+16
	add	r2, r2, #1
	smull	ip, r3, r2, r3
	ldr	ip, .L374+8
	ldrh	ip, [ip, #48]
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	tst	ip, #32
	sub	r3, r2, r3, lsl #1
	ldr	ip, [r1]
	bne	.L354
	mov	lr, #2
	sub	ip, ip, #1
	cmp	r3, #0
	str	ip, [r1]
	str	r2, [r1, #24]
	str	lr, [r1, #16]
	bne	.L351
	b	.L369
.L371:
	ldr	r3, [r1, #20]
	adds	r3, r3, lr
	and	r3, r3, lr
	rsbmi	r3, r3, #0
	str	r3, [r1, #20]
	b	.L351
.L370:
	mov	r1, #1
	ldr	r2, .L374+20
	ldr	r3, .L374+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldrh	r0, [r4]
	b	.L346
.L373:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L351
	b	.L353
.L372:
	pop	{r4, lr}
	b	shootPump
.L354:
	mov	lr, #0
	add	ip, ip, #1
	cmp	r3, lr
	str	ip, [r1]
	str	r2, [r1, #24]
	str	lr, [r1, #16]
	bne	.L351
	b	.L369
.L375:
	.align	2
.L374:
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
	ldr	r1, .L398
	ldr	r3, .L398+4
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
	ldr	r3, .L398+8
	mov	lr, pc
	bx	r3
	bl	doScore
	ldr	r3, .L398+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L396
.L377:
	mov	r0, #96
	ldr	r1, .L398+16
.L378:
	sub	r3, r1, #60
	b	.L382
.L379:
	cmp	r3, r1
	beq	.L397
.L382:
	ldrh	r2, [r3], #2
	cmp	r2, #0
	beq	.L379
	ldr	r3, .L398+20
	ldr	r2, [r3, #28]
	cmp	r2, #0
	ble	.L381
	ldr	r1, [r3, #68]
	cmp	r1, #0
	bne	.L376
	cmp	r2, #1
	beq	.L381
	ldr	r2, [r3, #108]
	cmp	r2, #0
	bne	.L376
.L381:
	ldr	r2, [r3, #112]
	cmp	r2, #0
	ble	.L383
	ldr	r1, [r3, #152]
	cmp	r1, #0
	bne	.L376
	cmp	r2, #1
	beq	.L383
	ldr	r3, [r3, #224]
	cmp	r3, #0
	bne	.L376
.L383:
	ldr	r3, .L398+24
	mov	lr, pc
	bx	r3
.L376:
	pop	{r4, lr}
	bx	lr
.L397:
	add	r0, r0, #32
	cmp	r0, #608
	add	r1, r1, #64
	bne	.L378
	b	.L383
.L396:
	bl	DMADraw
	b	.L377
.L399:
	.align	2
.L398:
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
	ldr	r3, .L401
	stm	r3, {r1, r2}
	bx	lr
.L402:
	.align	2
.L401:
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
	ldr	r3, .L406
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
	ldr	r4, .L406+4
	ldr	r0, .L406+8
	strh	r0, [r4, #2]	@ movhi
	add	r0, r4, #960
	strh	ip, [r0]	@ movhi
	strh	r7, [r0, #2]	@ movhi
	add	r0, r4, #968
	strh	ip, [r0]	@ movhi
	ldr	ip, .L406+12
	strh	ip, [r0, #2]	@ movhi
	add	r0, r4, #964
	strh	r2, [r0]	@ movhi
	add	r0, r4, #972
	strh	r2, [r0]	@ movhi
	ldr	r2, .L406+16
	strh	r1, [r4]	@ movhi
	str	r6, [r2]
	str	r1, [r2, #4]
	ldr	r1, .L406+20
	ldr	r2, .L406+24
	ldr	r0, .L406+28
	str	r3, [r1]
	str	r3, [r2]
	ldr	r1, .L406+32
	ldr	r2, .L406+36
	strh	r3, [r4, #4]	@ movhi
	str	r3, [r0]
	ldr	r3, .L406+40
	str	lr, [r2]
	str	r5, [r1]
	mov	lr, pc
	bx	r3
	ldr	r5, .L406+44
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L406+48
	ldr	r1, .L406+52
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
.L407:
	.align	2
.L406:
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
	ldr	r3, .L415
	ldr	r3, [r3]
	cmp	r3, #1
	push	{r4, lr}
	beq	.L409
	cmp	r3, #2
	bne	.L410
	mov	r0, #152
	mov	r2, #832
	ldr	r3, .L415+4
	ldr	r1, .L415+8
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
.L409:
	mov	r0, #152
	mov	r1, #16384
	mov	r2, #832
	ldr	r3, .L415+12
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
.L410:
	mov	r2, #0
	mov	r0, #1
	mov	lr, #512
	ldr	r3, .L415+16
	ldr	r1, .L415+20
	ldr	ip, .L415+24
	str	r2, [r3]
	str	r0, [r1]
	ldr	r4, .L415+28
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L415+32
	ldr	r1, .L415+36
	strh	lr, [ip]	@ movhi
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L416:
	.align	2
.L415:
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
