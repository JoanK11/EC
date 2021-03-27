	# Sessio 3

	.data 
# Declara aqui les variables mat1, mat4 i col
mat1:	.space 120
mat4:	.word 2, 3, 1, 2, 4, 3
col:	.word 2

	.text 
	.globl main
main:
# Escriu aqui el programa principal
	addiu $sp, $sp, -8
	la $t0, mat1
	sw $t0, 0($sp)
	sw $ra, 4($sp)
	
	la $a0, mat4		# $a0 = &mat4[0][0]
	addiu $a1, $a0, 8
	lw $a1, 0($a1)		# $a1 = mat4[0][2]
	la $a2, col
	lw $a2, 0($a2)		# $a2 = col
	jal subr
	la $t0, mat1 + 108
	sw $v0, 0($t0)		# mat1[4][3] = $v0
	
	la $a0, mat4
	li $a1, 1
	li $a2, 1
	jal subr
	la $t0, mat1
	sw $v0, 0($t0)
	
	lw $ra, 4($sp)
	addiu $sp, $sp, 8
	jr $ra

subr:
# Escriu aqui el codi de la subrutina
	sll $t0, $a1, 2		# $t0 = i * 4
	addu $t1, $t0, $t0	# $t0 + $t0 = $t0 * 2
	addu $t0, $t0, $t1	# ($t0 + $t0) + $t0 = $t0 * 3
	addu $t0, $t0, $a0	# &x[i][0]
	sll $t1, $a2, 2		# j * 4
	addu $t0, $t0, $t1	# &x[i][j]
	lw $t0, 0($t0)		# x[i][j]
	
	lw $t1, 0($sp)		# $t1 = &mat1[0][0]
	addiu $t1, $t1, 20	# $t1 = &mat1[0][5]
	li $t2, 6
	multu $t2, $a2
	mflo $t2		# $t2 = j * 6
	sll $t2, $t2, 2		# $t2 = j*6*4
	addu $t1, $t1, $t2	# &x[j][5]
	sw $t0, 0($t1)
	move $v0, $a1
	jr $ra
