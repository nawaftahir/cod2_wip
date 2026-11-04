.686
.MODEL FLAT, C
.CODE
FUN_10099846 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 12]
    cmp ecx, eax
    je L5
    dec ecx
    cmp ecx, 11
    ja L1
    jmp dword ptr [ecx*4 + 0x100998cf]
    test eax, eax
    jle L1
    cmp eax, 8
L0:
    jle L5
L1:
    xor eax, eax
    inc eax
L2:
    pop ebp
    ret 8
    test eax, eax
    jle L1
    cmp eax, 2
    jle L5
    cmp eax, 4
    jle L1
    cmp eax, 6
    jmp L0
    dec eax
    je L5
    dec eax
    dec eax
    je L5
    dec eax
    dec eax
L3:
    je L5
    dec eax
    dec eax
    jmp L4
    cmp eax, 1
    je L5
    cmp eax, 3
    jle L1
    cmp eax, 5
    jle L5
    cmp eax, 8
    jmp L4
    cmp eax, 9
    jl L1
    cmp eax, 12
    jmp L0
    cmp eax, 9
    jl L1
    cmp eax, 10
    jmp L0
    sub eax, 9
    jmp L3
    cmp eax, 9
    je L5
    cmp eax, 12
L4:
    jne L1
L5:
    xor eax, eax
    jmp L2
FUN_10099846 ENDP
END
