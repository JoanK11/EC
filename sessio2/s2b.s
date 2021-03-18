# PRACTICA 2 #######################

.data
result: .word 0
num:	.byte '7'

	.text
	.globl main
  
main:

	la $t0, num
	lb $t0, 0($t0)		# $t0 = num
	li $t1, 'a' 
	bltu $t0, $t1, SINO
	li $t1, 'z'
	bleu $t0, $t1, LLAVORS
  
SINO:
	li $t1, 'A'
	bltu $t0, $t1, ELSE
	li $t1, 'Z'
	bgtu $t0, $t1, ELSE
	
LLAVORS:
	la $t1, result
	sw $t0, 0($t1)
	b FI

ELSE:
	li $t1, '0'
	bltu $t0, $t1, ELSE2
	li $t1, '9'
	bgtu $t0, $t1, ELSE2
	la $t1, result
	li $t2, '0'
	subu $t0, $t0, $t2
	sw $t0, 0($t1)
	b FI
  
ELSE2:
	la $t1, result
	li $t0, -1
	sw $t0, 0($t1)

FI:
	jr $ra
