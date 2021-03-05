.globl main

main:

    li $t0, 2
    li $t1, 4


    move $a0, $t0
    move $a1, $t1

    jal soma

    move $t3, $v0

    li $v0, 10
    syscall

    soma:
        add $v0, $a0, $a1
        jr $ra