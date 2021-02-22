.globl main
.text

main:

    li $t0, 1                      # a
    li $t1, 2                       # b
    li $t2, 30                      # c
    li $t3, 4                      # d
    
    # 30, 87, 30, 4
    

    Loop:
        # (a < c) = (c > a)
        slt $t4, $t0, $t2
        # se a < c → $t4 = 1
        # se $t4 = 1 entra no loop
        # beq → t4 = 0, então Exit
        beq $t4, $zero, Exit

            # (b > 5) = (5 < b)
            li $s1, 5
            # Se, $s1 for menor que $t1
            # $t5 recebe 1, por que eh verdade
            slt $t5, $s1, $t1
            # se t5 for verdade, entra no if
            # se t5 for zero(mentira) desvia para o else
            beq $t5, $zero, Else
                # b = a + 2 + c - d;
                add $t6, $t0, $t2
                addi $t6, $t6, 2
                sub $t1, $t6, $t3 
            Else:
         
            # (10 > b) = (b < 10) = ( $t1 < $s0) = 1
            li $s0, 10
            # se $t1 for menor que $s0
            # $t6 recebe 1
            slt $t6, $t1, $s0 
            # se $t6 for verdade(1), entra no if
            # se $t6 for falso(0), desvia o codigo para Else2
            beq $t6, $zero, Else2
                # b = b + 2
                addi  $t1, $t1, 2 
            Else2:
            # a = a + 1;
            addi $t0, $t0, 1
            # b = b + a
            add $t1, $t1, $t0
        
        jal Print
    j Loop

    Exit:


    jal Print

    li $v0, 10
    syscall

    Print:	# imprime os valores dos itens
	
        li $v0, 1
        move $a0, $t0
        syscall

        li	$v0,4		# Code for syscall: print_string
        la	$a0, msg	# Pointer to string (load the address of msg)
        syscall

        li $v0, 1
        move $a0, $t1
        syscall

        li	$v0,4		# Code for syscall: print_string
        la	$a0, msg	# Pointer to string (load the address of msg)
        syscall

        li $v0, 1
        move $a0, $t2
        syscall
        
        li	$v0,4		# Code for syscall: print_string
        la	$a0, msg	# Pointer to string (load the address of msg)
        syscall

        li $v0, 1
        move $a0, $t3
        syscall

        li	$v0,4		# Code for syscall: print_string
        la	$a0, newline	# Pointer to string (load the address of msg)
        syscall
     
        # Return from function
        jr $ra			# Jump to addr stored in $ra

    .data

msg: .asciiz " "
newline: .asciiz "\n"
