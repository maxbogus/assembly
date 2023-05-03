SSEG SEGMENT STACK
    DW 64 DUP(0)
SSEG ENDS
DSEG SEGMENT
    NMAX DW 6
    N DW 6
    X   DB '123456'
        DB '123456'
        DB '123456'
        DB '123456'
        DB '123456'
        DB '123456'
DSEG ENDS
CSEG SEGMENT
    ASSUME cs:CSEG, ds: DSEG, ss:SSEG
START:
    MOV ax, DSEG
    MOV ds, ax
    MOV bx, 1
    MOV dx, NMAX
    MOV cx, N
    DEC cx
M1: PUSH cx
    MOV si, bx
    MOV di, dx
M2: MOV ah, x[si]
    XCHG ah, x[di]
    ADD di, NMAX
    INC si
    LOOP M2
    ADD dx, NMAX
    INC dx
    ADD bx, NMAX
    INC bx
    POP cx
    LOOP M1
    MOV ah, 4ch
    INT 21h
CSEG ENDS
END START
