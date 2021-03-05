.globl main
.text

main:

    li $t0, 1                      # a
    li $t1, 20                       # b
    li $t2, 0                      # c
    
    

    Loop:
        # (a < b) = (b > a)
        slt $t4, $t0, $t1
        # se a < b → $t4 = 1
        # se $t4 = 1 entra no loop
        # beq → t4 = 0, então Exit
        beq $t4, $zero, Exit

            # (a > 10) = (10 < a)
            li $s1, 10
            # Se, $s1 for menor que $t1
            # $t5 recebe 1, por que eh verdade
            slt $t5, $s1, $t0
            # se t5 for verdade, entra no if
            # se t5 for zero(mentira) desvia para o else
            beq $t5, $zero, Else
                # c = a + 1;
                addi $t2, $t0, 1
            Else:
                # c = b + 1
                addi  $t2, $t1, 1 
            
        addi $t0, $t0, 1
    j Loop
    
    Exit:


    jal Print

    li $v0, 10
    syscall

    Print:	# imprime os valores dos itens
	
        li $v0, 1
        move $a0, $t0
        syscall

        li	$v0,4		# imprime string
        la	$a0, msg	# carrega mensagem
        syscall

        li $v0, 1
        move $a0, $t1
        syscall

        li	$v0,4		# imprime string
        la	$a0, msg	# carrega mensagem
        syscall

        li $v0, 1
        move $a0, $t2
        syscall

        li	$v0,4		# imprime string
        la	$a0, newline	# carrega mensagem
        syscall
     
        # Return from function
        jr $ra			# Jump to addr stored in $ra

    .data

msg: .asciiz " "
newline: .asciiz "\n"
