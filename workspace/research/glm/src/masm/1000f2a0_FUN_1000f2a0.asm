.686
.MODEL FLAT, C
EXTRN sub_10061CA9:PROC
EXTRN sub_10061CBD:PROC
.CODE
FUN_1000f2a0 PROC
    cmp byte ptr [eax], 73
    jne L1
    cmp byte ptr [eax + 1], 87
    jne L1
    cmp byte ptr [eax + 2], 105
    jne L1
    mov al, byte ptr [eax + 3]
    cmp al, 5
    je L0
    movzx eax, al
    push 5
    push eax
    push ecx
    push 010193974h
    call sub_10061CA9
    add esp, 16
    xor al, al
    ret
L0:
    mov al, 1
    ret
L1:
    push ecx
    push 0101939B0h
    call sub_10061CBD
    add esp, 8
    xor al, al
    ret
FUN_1000f2a0 ENDP
END
