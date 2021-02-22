# int a = 3;
# int b = 12;
# int c = a + b
# if (a < c) {
# a = b + 10;
# }
# b = a + 1;

.globl main
.text

main:


    li $t0, 13                       # a
    li $t1, 12                      # b

    add $t2, $t0, $t1               # c

    slt $t3, $t2, $t0
    beq $t3, $0,  Else
        addi $t0, $t1, 10
    Else:
        addi $t1, $t0, 1

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall
    

    li $v0, 10
    syscall
    .data


msg: .asciiz " - "