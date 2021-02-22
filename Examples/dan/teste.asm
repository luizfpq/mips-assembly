.globl main
.text

main:

    li $t0, 100     # a
    li $t1, 1       # b
    li $t2, 31      # c
    li $t3, 2       # d

    Loop:
        # (a > b) = (b < a)
        # $t4 = 0
        slt $t4, $t1, $t0
        # se $t4 = 0 continua no loop
        beq $t4, $zero, Exit

            # (a > 32) = (32 < a)
            li $s0, 32
            # Se, $s0, for menor que $t0
            # $t5 recebe 1
            slt $t5, $s0, $t0
            # se $t5 for zero,
            # desvia para o else
            beq $t5, $zero, Else
            # c = (b + 2) + c - d;
                addi $t6, $t1, 2 
                add  $t6, $t6, $t2
                sub  $t2, $t6, $t3
                
                    # (c > 12) = (12 < c)
                    li $s1, 12
                    # se $s1 for menor que $t2
                    # $t6 recebe 1 
                    slt $t6, $s1, $t2 
                    # se $t6 for zero
                    # desvia o codigo para Else2
                    beq $t6, $zero, Else2
                        # d = (d + 2) + c - d
                        sub  $t6, $t2, $t3 
                        addi $t7, $t3, 2
                        add  $t3, $t6, $t7
                    Else2:
            Else:
            # c = c - a;
            sub $t2, $t2, $t0
            # a = a - 1;
            addi $t0, $t0, -1


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
