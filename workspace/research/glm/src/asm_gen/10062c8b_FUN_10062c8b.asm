; FUN_10062c8b @ 0x10062c8b — auto-synthesized
.CODE
FUN_10062c8b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x130
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L0
    mov ecx, dword ptr [eax]
    lea edx, [ebp - 0x130]
    push edx
    push eax
    call dword ptr [ecx + 0x1c]
    test eax, eax
    jge L1
    xor eax, eax
    jmp L2
    mov eax, dword ptr [ebp - 0x64]
    and eax, 0xffff
    cmp eax, 0x200
    jae L3
    cmp eax, 0x101
    jne L4
    mov eax, 0x1010c510
    jmp L2
    cmp eax, 0x102
    jne L5
    mov eax, 0x1010c508
    jmp L2
    cmp eax, 0x103
    jne L6
    mov eax, 0x1010c500
    jmp L2
    sub eax, 0x104
    neg eax
    sbb eax, eax
    not eax
    and eax, 0x1010c4f8
    jmp L2
    cmp eax, 0x300
    jae L7
    cmp dword ptr [ebp - 0x20], 0x16
    jl L8
    mov al, byte ptr [ebp - 0x28]
    test al, 1
    je L8
    test al, 2
    je L8
    test al, 4
    je L8
    test al, 8
    je L8
    test al, 0x10
    je L8
    mov eax, 0x1010c4e8
    jmp L2
    mov eax, 0x1010c4f0
    jmp L2
    mov eax, 0x1010c4c8
    leave
    ret 4
FUN_10062c8b ENDP
END