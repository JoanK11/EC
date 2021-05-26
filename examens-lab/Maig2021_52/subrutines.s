	.data
valor_entrada:	.word 3
seeds:		.word 8, 6, 4
filtre_bloom:	.space 32

	.text
	.globl main
main:
	addiu $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)
	li $s0, 0	# i
for:
	la $t0, valor_entrada
	sw $a0, 0($t0)		# valor_entrada
	la $t0, seeds
	sll $t1, $s0, 2
	addu $t0, $t0, $t1
	sw $a1, 0($t0)		# seeds[i]
	li $a2, 1
	jal funcio_hash
	move $a0, $v0
	jal actualitza_filtre_bloom
	
	addiu $s0, $s0, 1	# i++
	li $t7, 3
	bltu $s0, $t7, for
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addiu $sp, $sp, 8
	jr $ra

funcio_hash:
	subu $t0, $a1, $a2
	xor $v0, $a0, $t0
	jr $ra