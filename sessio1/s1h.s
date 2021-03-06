# PRACTICA 1 #######################

	.data
cadena: .byte -1, -1, -1, -1, -1, -1
vec: 	.word 5, 6, 8, 9, 1

	.text
	.globl main
main:
	li $s0, 0
	la $t6, cadena
	la $t7, vec
	li $t5, 16

while: 
	li $t0, 5
	bge $s0, $t0, fi

	sll $t1, $s0, 2		# t1 = i*4
	sub $t2, $t5, $t1	# t2 = [4-i]
	addu $t2, $t7, $t2	# t2 = &vec[4-i]
	lw $t2, 0($t2)		# t2 = vec[4-i]
	addiu $t2, $t2, '0'	# t2 = vec[4-i] + '0'
	addu $t3, $t6, $s0	# t3 = &cadena + i
	sb $t2, 0($t3)		# &cadena[i] = t2

	addiu $s0, $s0, 1
	b while

fi:
	li $t1, 0		# t1 = 0
	sb $t1, 5($t6)		# $cadena[5] = sentinella

	li $v0, 4
	la $a0, cadena
	syscall

	jr $ra			# main retorna al codi de startup
