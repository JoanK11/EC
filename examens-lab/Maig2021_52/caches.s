	.data
A:	.space 96
max_parella:	.space 48

	.text
	.globl main
main:
	li $t0, 0	# i
	la $t1, A
	la $t2, max_parella
	li $t7, 24
for:
	lw $t3, 0($t1)	# A[i]
	lw $t4, 4($t1)	# A[i+1]
	sll $t5, $t0, 1
	addu $t5, $t2, $t5	# &max_parella[i/2]
	ble $t3, $t4, else
	sw $t3, 0($t5)
	b fi
else:
	sw $t4, 0($t5)
fi:
	addiu $t0, $t0, 2
	addiu $t1, $t1, 8
	blt $t0, $t7, for
	jr $ra