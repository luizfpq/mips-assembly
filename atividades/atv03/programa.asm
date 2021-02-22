.text
.globl main

main:
    
    lw $s0, x
    lw $s1, y
    
    move $a0, $s0
    
    jal funcao
    
    move $s1, $v0
    
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 1
    move $a0, $s1
    syscall
    
    li $v0,4
    la $a0, lf
    syscall
    
    li $v0,10
    syscall

funcao:
    li $s0, 3
    mul $s1,$s0,$a0
    addi $s1,$s1,5
    move $v0,$s1
    jr $ra

.data
x: .word 65
y: .word 10
msg1: .asciiz "y="
lf:     .asciiz "\n"