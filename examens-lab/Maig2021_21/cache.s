	.data
vect:	.word 28, 28, 28, 28, 28, 28, 28, 28
matx:	.word 1, 1, 1, 1, 1, 1, 1, 1
	.word 2, 2, 2, 2, 2, 2, 2, 2
	.word 3, 3, 3, 3, 3, 3, 3, 3
	.word 4, 4, 4, 4, 4, 4, 4, 4
	.word 5, 5, 5, 5, 5, 5, 5, 5
	.word 6, 6, 6, 6, 6, 6, 6, 6
	.word 7, 7, 7, 7, 7, 7, 7, 7
	.word 8, 8, 8, 8, 8, 8, 8, 8
	
	.text
	.globl main
main:
	la $t0, matx		# &matx[0][0]
	addiu $t7, $t0, 224	# &matx[7][0]
	la $t6, vect + 32	# &vect[8]
	
infor:
	la $t1, vect		# &vect[0]
	
for:
	lw $t2, 0($t0)		# matx[i][j]
	lw $t3, 0($t1)		# vect[j]
	subu $t3, $t3, $t2
	sw $t3, 0($t1)
	addiu $t0, $t0, 4
	addiu $t1, $t1, 4
	bltu $t1, $t6, for
	bltu $t0, $t7, infor
	jr $ra
