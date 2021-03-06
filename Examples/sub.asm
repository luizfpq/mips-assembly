.globl main

main:

    li $t0, 10
    li $t1, 5


    move $a0, $t0
    move $a1, $t1

    jal soma

    move $t5, $v0


    move $a0, $t0
    move $a1, $t1

    jal subtrai

    move $t6, $v0


    move $a0, $t5
    move $a1, $t6

    jal divide

    move $t3, $v0



    li $v0, 10
    syscall

    soma:
        add $t4, $a0, $a1

        li	$v0,4
        la	$a0, msgsom
        syscall

        # imprime
        li $v0, 1
        move $a0, $t4
        syscall

        li	$v0,4
        la	$a0, linha
        syscall
        jr $ra
        
    subtrai:
        sub $t4, $a0, $a1

        li	$v0,4
        la	$a0, msgsub
        syscall

        # imprime
        li $v0, 1
        move $a0, $t4
        syscall

        li	$v0,4
        la	$a0, linha
        syscall

        jr $ra
    divide:
        divu $t4, $a0, $a1

        li	$v0,4
        la	$a0, msgdiv
        syscall

        # imprime
        li $v0, 1
        move $a0, $t4
        syscall

        li	$v0,4
        la	$a0, linha
        syscall

        jr $ra

.data

msgsom: .asciiz "soma eh "
msgsub: .asciiz "subtracao eh "
msgdiv: .asciiz "divisao eh "
linha:   .asciiz "\n"