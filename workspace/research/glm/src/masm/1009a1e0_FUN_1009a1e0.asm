.686
.MODEL FLAT, C
EXTRN sub_1009951B:PROC
.CODE
FUN_1009a1e0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 16]
    jmp L1
L0:
    mov edx, dword ptr [eax + 16]
    cmp edx, 2
    je L3
    cmp edx, 3
    je L3
    cmp edx, 4
    je L3
    mov eax, dword ptr [eax + 32]
L1:
    test eax, eax
    jne L0
    mov eax, dword ptr [ebp + 8]
L2:
    pop ebp
    ret 4
L3:
    push 010114968h
    push 000000BF8h
    lea eax, [ecx + 32]
    push eax
    push ecx
    call sub_1009951B
    add esp, 16
    xor eax, eax
    jmp L2
FUN_1009a1e0 ENDP
END
