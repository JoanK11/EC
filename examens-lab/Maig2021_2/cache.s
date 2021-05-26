	.data
MAT0:	.space 128
MAT1:	.space 128
MAT2:	.space 128

	.text
	.globl main
main:
	li $t0, 0	# i
	
infor:
	li $t1, 0	# j
for:
	la $t4, MAT0
	sll $t5, $t0, 4
	addu $t4, $t4, $t5	# &MAT0[i]
	sll $t5, $t1, 2
	addu $t4, $t4, $t5	# &MAT0[i][j*2]
	lh $t2, 0($t4)
	lh $t3, 128($t4)
	la $t5, MAT2		# &MAT2[0][0]
	sll $t6, $t0, 4
	addu $t5, $t5, $t6	# &MAT2[i][0]
	sll $t6, $t1, 2
	addu $t5, $t5, $t6	# &MAT2[i][j]
	lw $t6, 0($t5)
	addu $t6, $t6, $t2
	addu $t6, $t6, $t3
	sw $t6, 0($t5)
	sh $zero, 128($t4)	# MAT1[i][j*2] = 0
	
	addiu $t1, $t1, 1	# j++
	li $t7, 4
	blt $t1, $t7, for
	addiu $t0, $t0, 1
	li $t7, 8
	blt $t0, $t7, infor
	jr $ra