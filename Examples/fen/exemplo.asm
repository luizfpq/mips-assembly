.globl main

main:
    li $s0, 3
    li $s1, 12
    li $s2, 36
    # verificando se a condição é verdade
    # (a > b)
    slt $t0, $s0, $s1 
    # se for verdade é 1 se for mentira é 0
    beq $t0,1,ELSE 
        # usando $zero pra armazenar b na variavel a 
        add $s0, $zero, $s1 
    # caso nao for armazena a na variavel b
    ELSE: add $s1, $zero, $s0 

    li $v0, 10
    syscall

    
