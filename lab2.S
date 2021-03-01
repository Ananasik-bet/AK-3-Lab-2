.global lab2
.syntax unified
#define A #0
#define B #10
#define C #5

lab2:
    push { lr }
    // calculate 
    mov r1, A
    mov r2, B
    mov r3, C
    bl test
    pop { pc }
test:
    push { r0, r1, r2, r3, lr }
    // (a-b)
    sub r4, r1, r2
    // if (a-b) >= 0
    cmp r4, #0
    ite ge
    // res = a + b
    addGE r0, r1, r2
    // res = a - b
    subLT r0, r1, r2
    // res = res / c
    sdiv r0, r0, r3
    pop { r0, r1, r2, r3, pc }