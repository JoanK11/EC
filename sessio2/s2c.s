# PRACTICA 2 #######################
  .data
w:        .asciiz "8754830094826456674949263746929"
resultat: .byte 0

	.text
	.globl main
main:
	addiu	$sp, $sp, -4
	sw	$ra, 0($sp)
	la	$a0, w
	li	$a1, 31
	jal	moda
	la	$s0, resultat
	sb	$v0, 0($s0)
	move	$a0, $v0
	li	$v0, 11
	syscall
	lw	$ra, 0($sp)
	addiu	$sp, $sp, 4
	jr 	$ra

nofares:
	li	$t0, 0x12345678
	move	$t1, $t0
	move	$t2, $t0
	move	$t3, $t0
	move	$t4, $t0
	move 	$t5, $t0
	move	$t6, $t0
	move 	$t7, $t0
	move 	$t8, $t0
	move 	$t9, $t0
	move	$a0, $t0
	move	$a1, $t0
	move	$a2, $t0
	move	$a3, $t0
	jr	$ra


moda:
	addiu $sp, $sp, -60
	sw $s0, 40($sp)
	sw $s1, 44($sp)
	sw $s2, 48($sp)
	sw $s3, 52($sp)
	sw $ra, 56($sp)
	
	li $t0, 0		# k = 0
	li $t1, 10
	move $t2, $sp		# $t2 = histo[0]
for1:
	bgeu $t0, $t1, fifor1
	sw $zero, 0($t2)
	addiu $t2, $t2, 4
	addiu $t0, $t0, 1
	b for1 

fifor1:
	li $v0, '0'		# max = '0'
	li $s2, 0		# k = 0
	move $s0, $a0
	move $s1, $a1
	move $s3, $ra
	
for2:
	bgeu $s2, $s1, fifor2
	addu $t0, $s0, $s2 	# $t0 = &vec[k]
	lb $t0, 0($t0)
	li $t2, '0'
	move $a0, $sp
	subu $a1, $t0, $t2 	# $a1 = vec[k] - '0'
	subu $a2, $v0, $t2	# $a2 = max - '0'
	jal update
	addiu $v0, $v0, '0'
	addiu $s2, $s2, 1	# k++
	b for2
	
fifor2:
	lw $s0, 40($sp)
	lw $s1, 44($sp)
	lw $s2, 48($sp)
	lw $s3, 52($sp)
	lw $ra, 56($sp)
	addiu $sp, $sp, 60
	jr $ra

update:
	#guardar a0, a1, a2 a registres segurs
	addiu $sp, $sp, -16
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $ra, 12($sp)
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	jal nofares
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $ra, 12($sp)
	addiu $sp, $sp, 16
	
	sll $t0, $a1, 2
	addu $t0, $a0, $t0	# $t0 = &h[i]
	lw $t1, 0($t0)
	addiu $t1, $t1, 1	# $t1 = h[i]++
	sw $t1, 0($t0)
	sll $t0, $a2, 2
	addu $t0, $a0, $t0	# $t0 = &h[imax]
	lw $t0, 0($t0)
	ble $t1, $t0, else
	move $v0, $a1
	b fiupdate
else:	
	move $v0, $a2
fiupdate:
	jr $ra
