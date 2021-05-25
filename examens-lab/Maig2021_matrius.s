	.data
matrix:	.word 4, 1, 3, 5, 2, 2
	.word 0, 3, 0, 5, 0, 0
	.word 2, 2, 1, 9, 1, 0
	.word 0, 1, 1, 1, 1, 0

	.text
	.globl main
main:
	la $t0, matrix		# &matrix[0][0]
	li $t1, 0		# max_abs
	la $t7, matrix + 96	# &matrix[4][0]

for:
	lw $t2, 0($t0)		# matrix[i][j]
	ble $t2, $t1, salta
	move $t1, $t2
salta:
	addiu $t0, $t0, 4
	bne $t0, $t7, for
	
	# Part opcional per comprovar el resultat de max_abs
	li $v0, 1
	move $a0, $t1
	syscall
	jr $ra