# PRACTICA 2 #######################

	.data

	.text
	.globl main

main:
	li $s1, 23 # Y
	li $s0, 8  # X

	li $s2, 1
	sllv $s2, $s2, $s0	      # $s2 = 1 desplaçat $s0 posicions a l'esquerra
	addiu $s2, $s2, -1	      # $s2 = màscara amb 1 a les últimes $s0 posicions
	xor $s1, $s1, $s2

	jr $ra
