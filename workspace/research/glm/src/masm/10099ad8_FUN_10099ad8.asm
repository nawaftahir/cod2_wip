.686
.MODEL FLAT, C
EXTRN sub_100995DE:PROC
.CODE
FUN_10099ad8 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, ecx
L1:
    test esi, esi
    je L5
    mov eax, dword ptr [esi + 4]
    cmp eax, 1
    jne L2
    push dword ptr [esi + 8]
    mov ecx, edi
    call L0
    test eax, eax
    je L8
    mov esi, dword ptr [esi + 12]
    jmp L1
L2:
    sub eax, 6
    je L4
    dec eax
    dec eax
    je L3
    dec eax
    je L7
    dec eax
    dec eax
    jne L6
    mov esi, dword ptr [esi + 32]
    jmp L1
L3:
    mov esi, dword ptr [esi + 16]
    jmp L1
L4:
    mov esi, dword ptr [esi + 24]
    jmp L1
L5:
    xor eax, eax
    inc eax
    jmp L9
L6:
    push 01010F7B0h
    push 0
    push 0
    push edi
    call sub_100995DE
    add esp, 16
    jmp L8
L7:
    mov esi, dword ptr [esi + 16]
    test esi, esi
    jl L8
    cmp esi, 2
    jle L5
L8:
    xor eax, eax
L9:
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_10099ad8 ENDP
END
