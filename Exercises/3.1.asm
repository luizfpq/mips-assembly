.globl main
.text

main:
    li $t0, 10
    li $t1, 20

    add $t3, $t0, $t1

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall