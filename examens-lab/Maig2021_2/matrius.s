	.data
MAT:	.word 1, 5, 9, 13
	.word 2, 6, 10, 14
	.word 3, 7, 11, 15
	.word 4, 8, 12, 16
VEC:	.space 16

	.text
	.globl main
main:
	li $t0, 0		# i
	la $t1, VEC		# &VEC[0]
	la $t2, MAT+48		# &MAT[3][0]
	la $t3, MAT+32		# &MAT[2][0]
	li $t7, 4
for:
	lw $t4, 0($t2)		# MAT[3-i][i]
	lw $t5, 0($t3)		# MAT[2][i]
	mult $t4, $t5
	mflo $t4
	sw $t4, 0($t1)
	addiu $t0, $t0, 1	# i++
	addiu $t1, $t1, 4
	addiu $t2, $t2, -12
	addiu $t3, $t3, 4
	bltu $t0, $t7, for
	jr $ra
