.686
.MODEL FLAT, C
EXTRN sub_1000F2E3:PROC
EXTRN sub_1000F2E7:PROC
EXTRN sub_10061CA9:PROC
EXTRN sub_10061CBD:PROC
.CODE
FUN_1000f2a0 PROC
    cmp cmp byte ptr [eax], 73
    jne L0
    cmp cmp byte ptr [eax + 1], 87
    jne L1
    cmp cmp byte ptr [eax + 2], 105
    jne sub_1000F2E3
    mov mov al, byte ptr [eax + 3]
    cmp cmp al, 5
    je sub_1000F2E7
    movzx movzx eax, al
    push push 5
    push push eax
    push push ecx
    push push 010193974h
    call sub_10061CA9
    add add esp, 16
    xor xor al, al
    ret ret
    mov mov al, 1
    ret ret
    push push ecx
    push push 0101939B0h
    call sub_10061CBD
L1:
    add add esp, 8
    xor xor al, al
    ret ret
FUN_1000f2a0 ENDP
END
