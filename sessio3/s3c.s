	# Sessio 3

	.data 
mat:	.word 0,0,2,0,0,0
	.word 0,0,4,0,0,0
	.word 0,0,6,0,0,0
	.word 0,0,8,0,0,0

resultat: .space 4

	.text 
	.globl main
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, mat
	jal suma_col
	la $t0, resultat
	sw $v0, 0($t0)
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

suma_col:
	li $t0, 0		# i
	li $v0, 0		# suma
	li $t7, 4		# marca
	addiu $t2, $a0, 8	# &m[0][2]
bucle:
	lw $t3, 0($t2)		# $t3 = m[i][2]
	addu $v0, $v0, $t3
	addiu $t2, $t2, 24
	addiu $t0, $t0, 1
	bne $t0, $t7, bucle
	jr $ra
