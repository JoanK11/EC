	.data
vector: .space 400

	.text
	.globl main
main:
        move    $t1, $zero          # $t1 = sum
        la      $t2, vector + 396   # $t2 = @vector[i]
        li    	$t0, 99             # $t0 = i
        li      $t3, 0
for:
        blt     $t0, $t3, fi
        lw      $t4, 0($t2)
        addu    $t1, $t1, $t4
        addiu   $t2, $t2, -4
        addiu   $t0, $t0, -1
        b       for
fi:
	jr	$ra



