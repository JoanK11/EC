# PRACTICA 1 #######################

	.data
fib: 	.space 40

	.text
	.globl main
main:
	addiu $s0, $zero, 2
	la $t7, fib		# t7 = &fib[0]
	sw $zero, 0($t7)	# fib[0] = 0
	addiu $t1, $zero, 1
	sw $t1, 4($t7)		# fib[1] = 1

while:
	slti $t0, $s0, 10
	beq $t0, $zero, fi

	sll $t1, $s0, 2		# t1 = i*4
	addu $t4, $t7, $t1	# t4 = &vec[0] + i*4
	lw $t2, -4($t4)		# t2 = fib[i-1]
	lw $t3, -8($t4)		# t3 = fib[i-2]
	addu $t2, $t2, $t3
	addu $t1, $t7, $t1	# t1 = &fib[i]
	sw $t2, 0($t1)	

	addiu $s0, $s0, 1	# ++i;
	b while

fi: 
	jr $ra			# main retorna al codi de startup
