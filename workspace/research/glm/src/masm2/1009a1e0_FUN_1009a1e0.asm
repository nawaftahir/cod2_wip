.686
.MODEL FLAT, C
EXTRN sub_1009951B:PROC
EXTRN sub_1009A226:PROC
EXTRN sub_1009A24B:PROC
.CODE
FUN_1009a1e0 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ecx + 16]
    jmp L0
    mov mov edx, dword ptr [eax + 16]
    cmp cmp edx, 2
    je L2
    cmp cmp edx, 3
    je L3
    cmp cmp edx, 4
    je sub_1009A226
    mov mov eax, dword ptr [eax + 32]
    test test eax, eax
    jne L1
    mov mov eax, dword ptr [ebp + 8]
    pop pop ebp
    ret ret 4
    push push 010114968h
    push push 0BF8h
    lea lea eax, [ecx + 32]
    push push eax
    push push ecx
    call sub_1009951B
    add add esp, 16
L3:
    xor xor eax, eax
    jmp sub_1009A24B
FUN_1009a1e0 ENDP
END
