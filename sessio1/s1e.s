# PRACTICA 1 #######################

        .data
A: 	.word 3, 5, 7
punter: .word 0

	.text
	.globl main
main:
	la $t0, A		# t0 = &A
	la $t1, punter		# t1 = &punter

	addiu $t2, $t0, 8	# t2 = &A[2]
	sw $t2, 0($t1)		# punter = &A[2]

	lw $t3, 0($t2)		# t3 = *punter
 	addiu $s0, $t3, 2	# s0 = *punter + 2;
	
 	lw $t3, -8($t2)	# t3 = *(punter - 2)
 	addu $s0, $t3, $s0	# temp = *(punter - 2) + temp

 	sw $s0, 4($t0)		# A[1] = temp 

 	li $v0, 1
 	addu $a0, $s0, $zero
 	syscall		# Mostra s0 (= temp) en pantalla

 	jr $ra			# main retorna al codi de startup
