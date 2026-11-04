.686
.MODEL FLAT, C
EXTRN sub_10061CD9:PROC
EXTRN sub_10061D28:PROC
.CODE
FUN_1001c2f0 PROC
    mov eax, dword ptr [esp + 12]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 24]
    push esi
    xor esi, esi
    test eax, eax
    jle L7
L0:
    mov ax, word ptr [ebp + esi*8]
    cmp ax, 2
    jne L3
    movzx edx, word ptr [edi + 54]
    xor ecx, ecx
    test edx, edx
    jle L2
    mov ebx, dword ptr [ebp + esi*8 + 4]
    mov eax, dword ptr [edi + 64]
L1:
    cmp dword ptr [eax], ebx
    je L6
    inc ecx
    add eax, 20
    cmp ecx, edx
    jl L1
L2:
    mov eax, dword ptr [ebp + esi*8 + 4]
    mov ecx, dword ptr [esp + 16]
    mov edx, dword ptr [esp + 20]
    push eax
    mov eax, dword ptr [edi]
    push ecx
    push edx
    push eax
    push 010194A00h
    call sub_10061CD9
    add esp, 20
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
L3:
    cmp ax, 4
    jne L6
    movzx edx, word ptr [edi + 52]
    xor ecx, ecx
    test edx, edx
    jle L5
    mov ebx, dword ptr [ebp + esi*8 + 4]
    mov eax, dword ptr [edi + 60]
    lea esp, [esp]
L4:
    cmp dword ptr [eax], ebx
    je L6
    inc ecx
    add eax, 12
    cmp ecx, edx
    jl L4
L5:
    mov ecx, dword ptr [ebp + esi*8 + 4]
    mov edx, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 20]
    push ecx
    mov ecx, dword ptr [edi]
    push edx
    push eax
    push ecx
    push 0101949A0h
    call sub_10061D28
    add esp, 20
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
L6:
    mov eax, dword ptr [esp + 24]
    inc esi
    cmp esi, eax
    jl L0
L7:
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
FUN_1001c2f0 ENDP
END
