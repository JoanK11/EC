	.data
A:	.word 20, 18, 16, 14
	.word 16, 10, 4, 2
	.word 12, 6, 2, 0
	.word 8, 2, 0, 0
	
	.text
	.globl main
main:
	la $t0, A	# &A[0][0]
	li $t1, 0	# i
	li $t7, 4
infor:	
	li $t2, 0	# j
for:
	beq $t1, $zero, salta
	beq $t2, $zero, salta
	lw $t3, 0($t0)		# A[i][j]
	lw $t4, -4($t0)		# A[i][j-1]
	addu $t3, $t3, $t4
	lw $t4, -16($t0)	# A[i-1][j]
	addu $t3, $t3, $t4
	lw $t4, -20($t0)	# A[i-1][j-1]
	addu $t3, $t3, $t4
	srl $t3, $t3, 2
	sw $t3, 0($t0)
	
salta:
	addiu $t0, $t0, 4
	addiu $t2, $t2, 1	# j++
	blt $t2, $t7, for
	addiu $t1, $t1, 1	# i++
	blt $t1, $t7, infor
	jr $ra
