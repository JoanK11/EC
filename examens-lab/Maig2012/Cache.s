	.data
A:	.space 128
B:	.space 128
C:	.space 128

	.text
	.globl main
	
main:
	li $t0, 0	# i
	li $t7, 8	# marca de fi i
	la $s0, A
	la $s1, B
	la $s2, C
	li $t5, 4	# marca de fi j

infor:	
	li $t1, 0		# j
		
for:
	lw $t2, 0($s0)		# A[i][j]
	lw $t3, 0($s1)		# B[i][j]
	lw $t4, 0($s2)		# C[i][j]
	addu $t2, $t2, $t3
	addu $t2, $t2, $t4
	sw $t2, 0($s2)
	addiu $t1, $t1, 1	# j++
	addiu $s0, $s0, 4
	addiu $s1, $s1, 4
	addiu $s2, $s2, 4
	blt $t1, $t5, for
	
	addiu $t0, $t0, 1	# i++
	blt $t0, $t7, infor
	jr $ra
	
# a) Línies 0-7

# b) A = 0 encerts, B = 24 encerts (8 fallades en total --> una fallada cada nou bloc = cada 4 lectures)
# C = 0 encerts per lectura i 32 encerts per escriptura

# c) A = B = C lectura = 24 encerts cadascú (8 fallades en total cadascú --> una fallada cada nou bloc = cada 4 lectures)
# C escriptura = 32 encerts (tot encerts)
