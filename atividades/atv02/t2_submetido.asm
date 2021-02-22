# int a = 0;
# int b = 10;
# int c = 2;
# while (a < b) {
#    if ( a > 50) {
#       c = (a * 2) - c;
#    }
#    b = c + 1
#    a = a + 1;
# }

.globl main
.text

main:

    li $t0, 0               # a
    li $t1, 10              # b
    li $t2, 2               # c

    loop: addi $t0, $t0, 1
        slt $t3, $t1, $t2
        beq $t3, $0, Else
            addi $t3, $t0, 2 # soma no lugar de multiplicar
            sub $t2, $t3, $t2 
        Else:
            addi $t1, $t2, 1
            addi $t0, $t0, 1

    j loop

    li $v0, 1
    move $a0, $t0

    li $v0, 10
    syscall
    .data

