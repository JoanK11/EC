	.data
matrix:	.word 4, 1, 3, 5, 2, 2
	.word 0, 3, 0, 5, 0, 0
	.word 2, 2, 1, 9, 1, 0
	.word 0, 1, 1, 1, 1, 0

	.text
	.globl main
main:
	la $t0, matrix		# &matrix[0][0]
	li $a0, 0		# max_abs
	la $t7, matrix + 96	# &matrix[4][0]

for:
	lw $t1, 0($t0)		# matrix[i][j]
	ble $t1, $a0, salta
	move $a0, $t1
salta:
	addiu $t0, $t0, 4
	bne $t0, $t7, for
	
	li $v0, 1
	syscall
	jr $ra