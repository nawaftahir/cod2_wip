.686
.MODEL FLAT, C
.CODE
FUN_10062c8b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000130h
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L0
    mov ecx, dword ptr [eax]
    lea edx, [ebp - 000000130h]
    push edx
    push eax
    call dword ptr [ecx + 0x1c]
    test eax, eax
    jge L1
L0:
    xor eax, eax
    jmp L8
L1:
    mov eax, dword ptr [ebp - 100]
    and eax, 00000FFFFh
    cmp eax, 000000200h
    jae L5
    cmp eax, 000000101h
    jne L2
    mov eax, 01010C510h
    jmp L8
L2:
    cmp eax, 000000102h
    jne L3
    mov eax, 01010C508h
    jmp L8
L3:
    cmp eax, 000000103h
    jne L4
    mov eax, 01010C500h
    jmp L8
L4:
    sub eax, 000000104h
    neg eax
    sbb eax, eax
    not eax
    and eax, 01010C4F8h
    jmp L8
L5:
    cmp eax, 000000300h
    jae L7
    cmp dword ptr [ebp - 32], 22
    jl L6
    mov al, byte ptr [ebp - 40]
    test al, 1
    je L6
    test al, 2
    je L6
    test al, 4
    je L6
    test al, 8
    je L6
    test al, 16
    je L6
    mov eax, 01010C4E8h
    jmp L8
L6:
    mov eax, 01010C4F0h
    jmp L8
L7:
    mov eax, 01010C4C8h
L8:
    leave
    ret 4
FUN_10062c8b ENDP
END
