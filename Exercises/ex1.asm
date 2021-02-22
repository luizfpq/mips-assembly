.globl main
.text

main:

    li $t0, 12  # a
    li $t1, 10 # b
    li $t2, 36 # c

    # (a > b) = (b < a)
    # se t1 < t0, t3 = 1 
    slt $t3, $t1, $t0 
    # se t3 = 1, tem que entrar no if
    # se for igual a zero, vai pro else
    beq $t3, $zero, ELSE  # IF
        move $t0, $t1 # a = b
    ELSE: 
        move $t1, $t0 # b = a
    

    # imprimir
    li $v0, 1 # imprimir inteiro
    move $a0, $t0
    syscall

    li $v0, 4 # imprimir inteiro
    la $a0, msg
    syscall

    li $v0, 1 # imprimir inteiro
    move $a0, $t1
    syscall

    li $v0, 4 # imprimir inteiro
    la $a0, msg
    syscall

    li $v0, 1 # imprimir inteiro
    move $a0, $t2
    syscall

    li $v0, 10
    syscall

.data

msg: .asciiz " - "

