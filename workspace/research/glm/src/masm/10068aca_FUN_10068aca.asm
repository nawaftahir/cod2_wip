.686
.MODEL FLAT, C
.CODE
FUN_10068aca PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    movzx eax, byte ptr [ebp + 8]
    cmp eax, 13
    ja L0
    jmp dword ptr [eax*4 + 0x10068b4a]
    mov eax, 01010EBE8h
    jmp L1
    mov eax, 01010EBDCh
    jmp L1
    mov eax, 01010EBCCh
    jmp L1
    mov eax, 01010EBC4h
    jmp L1
    mov eax, 01010EBBCh
    jmp L1
    mov eax, 01010EBB0h
    jmp L1
    mov eax, 01010EBA8h
    jmp L1
    mov eax, 01010EB9Ch
    jmp L1
    mov eax, 01010EB90h
    jmp L1
    mov eax, 01010EB84h
    jmp L1
    mov eax, 01010EB7Ch
    jmp L1
    mov eax, 01010EB70h
    jmp L1
    mov eax, 01010EB78h
    jmp L1
    mov eax, 01010EB68h
    jmp L1
L0:
    mov eax, 01010EBF4h
L1:
    pop ebp
    ret 4
FUN_10068aca ENDP
END
