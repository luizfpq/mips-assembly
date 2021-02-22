#  int a = 0#
#  int b = 10#
#  int c = 2#
#  while (a < b) {
#     if ( a > 50) {
#        c = (a * 2) - c#
#     }
#     b = c + 1#
#     a = a + 1#
#  }

.globl main
.text

main:

    li $t0, 0                       # a
    li $t1, 10                      # b
    li $t2, 2                       # c    
    li $s0, 50                      # costante do if
    li $s1, 2                       # fator de multiplicação

    Loop:           # init while 
        
        slt $t3, $t0, $t1
        beq $t3, $zero, Exit        # while condition ( a < b)

            slt $t4, $s0, $t0   # if ( a > 50)
            beq $t4, $zero, Else
                mul $t5, $t0, $s1
                sub $t2, $t5, $t2
            Else:
                addi $t1, $t2, 1
                addi $t0, $t0, 1
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

        li	$v0, 4		# Code for syscall: print_string
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
        la	$a0, newline	# Pointer to string (load the address of msg)
        syscall
     
	# Return from function
	jr $ra			# Jump to addr stored in $ra


.data

msg: .asciiz " - "
newline: .asciiz "\n"