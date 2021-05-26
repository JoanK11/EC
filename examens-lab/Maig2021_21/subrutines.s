	.data
V:	.word 2, 3, 5, -1, 1, 8, 6, 7, 1, -2
	
	.text
	.globl main
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	li $s0, 0	# i
	li $s1, 9
	
for:
	la $a0, V
	move $a1, $s0
	li $a2, 10
	jal subr
	addiu $s0, $s0, 1
	bltu $s0, $s1, for
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
	
canvia:
	lw $t0, 0($a0)	# *a
	lw $t1, 0($a1)	# *b
	sw $t1, 0($a0)	# *a = *b
	sw $t0, 0($a1)
	jr $ra
	
subr:
	addiu $sp, $sp, -16
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $ra, 12($sp)
	move $s0, $a0		# &vect[0]
	sll $t0, $a1, 2
	sll $t1, $a2, 2
	addu $s1, $s0, $t0	# &vect[i]
	addu $s2, $s0, $t1	# &vect[n]
	addiu $s0, $s1, 4	# &vect[i+1]
	
for2:
	lw $t0, 0($s0)		# vec[j]
	lw $t1, 0($s1)		# vect[i]
	ble $t0, $t1, salta
	move $a0, $s0
	move $a1, $s1
	jal canvia
	
salta:
	addiu $s0, $s0, 4
	blt $s0, $s2, for2
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $ra, 12($sp)
	addiu $sp, $sp, 16
	jr $ra
