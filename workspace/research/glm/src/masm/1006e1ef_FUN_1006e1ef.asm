.686
.MODEL FLAT, C
EXTRN sub_1006DD03:PROC
.CODE
FUN_1006e1ef PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov ebx, ecx
L1:
    test esi, esi
    je L6
    mov eax, dword ptr [esi + 4]
    cmp eax, 1
    jne L2
    push dword ptr [esi + 8]
    mov ecx, ebx
    call L0
    test eax, eax
    je L9
    mov esi, dword ptr [esi + 12]
    jmp L1
L2:
    sub eax, 6
    je L5
    dec eax
    dec eax
    je L3
    dec eax
    je L8
    dec eax
    dec eax
    je L4
    dec eax
    dec eax
    jne L7
L3:
    mov esi, dword ptr [esi + 16]
    jmp L1
L4:
    mov esi, dword ptr [esi + 32]
    jmp L1
L5:
    mov esi, dword ptr [esi + 24]
    jmp L1
L6:
    xor eax, eax
    inc eax
    jmp L10
L7:
    push 01010F7B0h
    push 0
    push 0
    push ebx
    call sub_1006DD03
    add esp, 16
    jmp L9
L8:
    mov esi, dword ptr [esi + 16]
    test esi, esi
    jl L9
    cmp esi, 2
    jle L6
L9:
    xor eax, eax
L10:
    pop esi
    pop ebx
    pop ebp
    ret 4
FUN_1006e1ef ENDP
END
