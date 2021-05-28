	.data
	
	.text
	.globl main
main:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	
	li $a0, 5
	li $a1, 5
	jal subr
	
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
	
subr:
	addiu $sp, $sp, -60
	# $sp = &aux, $sp+4 = &v[0]
	sw $s0, 44($sp)
	sw $s1, 48($sp)
	sw $s2, 52($sp)
	sw $ra, 56($sp)
	li $s0, 0	# i
	move $s1, $a0	# seed
	move $s2, $a1	# last_elem
	
for:
	move $a0, $s1	# seed
	move $a1, $s0	# i
	move $a2, $sp	# &aux
	jal init
	sll $t0, $s0, 2
	addu $t0, $sp, $t0
	sw $v0, 4($t0)
	addiu $s0, $s0, 1	# i++
	ble $s0, $s2, for
	
	addiu $a0, $t0, 4	# &v[0]
	move $a1, $s2		# last_elem
	lh $a2, 0($sp)		# aux
	jal calc
	
	lw $s0, 44($sp)
	lw $s1, 48($sp)
	lw $s2, 52($sp)
	lw $ra, 56($sp)
	addiu $sp, $sp, 60
	jr $ra
