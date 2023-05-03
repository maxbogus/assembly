ASSUME CS:CODE, DS:CODE
CODE SEGMENT
    ORG 100h
START:
    MOV ax, cs
    MOV ds, ax
    MOV ah, 0
    MOV al, 3
    INT 21h
    MOV ah, 9
    LEA dx, STR
    INT 21h
LOOP1: 
    MOV ah, 7
    INT 21h
    CMP al, ' '
    jnz LOOP1
    INT 20h
STR
    db 25 dup(0ah), 0dh
    db 38 dup(20h), 'text'
    db 12 dup(0ah), 0dh, '$'
CODE ENDS
END START
