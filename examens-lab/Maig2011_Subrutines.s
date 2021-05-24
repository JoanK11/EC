	.data
	
V1: 	.word -32, 64, -10, 16, -20
V2:	.word 8, -70, 30, -17

suma1: 	.word 0
suma2: 	.word 0

	.text
	.globl main
	
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, V1
	li $a1, 5
	jal subr1
	la $t0, suma1
	sw $v0, 0($t0)
	la $a0, V2
	li $a1, 4
	jal subr1	
	la $t0, suma2
	sw $v0, 0($t0)
	lw $ra, 0($sp)
	addiu $sp, $sp, -4
	jr $ra
	
subr1:
	addiu $sp, $sp, -20
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $ra, 16($sp)
	li $s0, 0		# i
	li $s1, 0		# aux
	move $s2, $a0		# p
	move $s3, $a1		# x
	
for:
	lw $a0, 0($s2)		# *p 
	move $a1, $s0		# i
	jal subr2
	addu $s1, $s1, $v0
	addiu $s2, $s2, 4	# p++
	addiu $s0, $s0, 1
	blt $s0, $s3, for
	move $v0, $s1
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	lw $ra, 16($sp)
	addiu $sp, $sp, 20
	jr $ra

subr2:
	li $t0, 2
	li $t1, 3
	div $a0, $t1
	blt $a1, $t0, else
	mfhi $v0  
	jr $ra
else:
	mflo $v0 
	jr $ra
	