.data
    prompt: .asciiz "Entre com um numero inteiro:\n"
    result: .asciiz "? = "
.text
main:
    # imprime a mensagem
    li        $v0, 4
    la        $a0, prompt
    syscall
    # lê um inteiro
    li        $v0, 5
    syscall
    # copia o inteiro lido pra a0
    move      $a0, $v0
    # entra na função
    jal      oquefaz      
    # retorna o resultado da função pra t0
    move      $t0, $v0        
    # imprime  a string do resultado
    li        $v0, 4
    la        $a0, result
    syscall
    # imprime o inteiro do resultado
    li        $v0, 1        
    move      $a0, $t0        
    syscall                
    # finaliza o programa
    li        $v0, 10      
    syscall

.text
# enquanto o valor armazenado em $a0 for diferente de 0
# vai decrementando em $a0 e multiplicando o valor de $a0 pelo anterior
oquefaz:
    # altera posições ao ponteiro sp
    addi    $sp, $sp, -8
    sw      $s0, 4($sp)
    # guarda o enderenço de retorno
    sw      $ra, 0($sp)
    # se $a0 for igual a zero soma 1 a $v0
    # equivale ao criterio de parada da recursão
    bne $a0, 0, else
        addi  $v0, $zero, 1  
        # chama a função de retorno
        j fact_return

else:
    # copia o valor de $a0 para $s0
    move    $s0, $a0
    # decrementa $a0
    addi    $a0, $a0, -1
    # chama a função o que faz recursivamente
    jal     oquefaz
    # pega o valor retornado por oquefaz e multiplica pelo valor armazenado em s0
    multu   $s0, $v0
    # retorna $v0
    mflo    $v0
fact_return:
    # carrega o valor para $s0
    lw      $s0, 4($sp)
    # carrega o valor de retorno que estava armazenado em $sp
    lw      $ra, 0($sp)
    # adiciona as posições de memória referentes ao valor -8 
    # que foi setado no começo da execução pra retornar a execução
    addi    $sp, $sp, 8
    # retorna a execução do programa
    jr      $ra