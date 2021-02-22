.globl main
.text

main:
    li $t0, 13               # a
    li $t1, 12              # b
    li $t2, 36              # c
    slt $t3,  $t1, $t0      # se b for menor que a
    beq $t3, $0, Else       
    move $t0, $t1        # 
    Else:
    move $t1, $t0

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

    li $v0, 10
    syscall

    .data

msg: .asciiz " - "