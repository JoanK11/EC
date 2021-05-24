	.data
	
M: 	.word 1, 2, 3, 4
	.word 5, 6, 7, 8
	.word 9, 8, 7, 6
	.word 5, 4, 3, 2
	.word 1, 2, 3, 4

V: 	.word 0, 0, 0, 0, 0, 0, 0, 0

	.text
	.globl main
	
main:
	li $t0, 0	# i
	la $t6, V+12	# &V[3]
	la $t7, M	# &M[0][0]
	
inforj:
	li $t1, 0	# j
	li $t2, 4

forj:
	lw $t3, 0($t7)		# M[i][j]
	lw $t4, 0($t6)		# V[i-j+3]
	addu $t3, $t3, $t4
	sw $t3, 0($t6)
	addiu $t1, $t1, 1	# j++
	addiu $t6, $t6, -4	# &V--
	addiu $t7, $t7, 4	# &M++
	bltu $t1, $t2, forj
	
	addiu $t0, $t0, 1	# i++
	la $t6, V+12		# &V[3]
	sll $t3, $t0, 2
	addu $t6, $t6, $t3	# &V[i+3]
	la $t7, M		# &M[0][0]
	sll $t3, $t0, 4
	addu $t7, $t7, $t3	# &M[i]
	
	li $t3, 5
	bltu $t0, $t3, inforj
	jr $ra