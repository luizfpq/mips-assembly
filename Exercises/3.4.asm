# int a = 0;
# while (a < 10) {
# b = (a * a) + b;
# a = a + 1;
# }

.globl main
.text

main:

    li $t0, 0

    loop


    la $v0, 10
    syscall
    .data