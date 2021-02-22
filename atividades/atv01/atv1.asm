.globl main
.text
main:
    li $t0, 2
    li $t1, 3

    # adição
    add  $t2, $t0, $t1
    # subtração
    sub  $t2, $t0, $t1
    # adição imediata
    addi $t2, $t0, 3
    # subtração imediata
    addi $t2, $t0, -1
    # multiplicação
    mul $t2, $t0, $t1
    # divisao
    div $t1, $t2
    