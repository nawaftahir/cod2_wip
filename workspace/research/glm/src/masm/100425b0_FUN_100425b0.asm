.686
.MODEL FLAT, C
.CODE
FUN_100425b0 PROC
    sub esp, 8
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 20]
    mov eax, dword ptr [ebp + 4]
    push edi
    push 104
    push 1
    push ebp
    call dword ptr [eax]
    mov edi, eax
    mov al, byte ptr [esp + 40]
    xor ebx, ebx
    add esp, 12
    cmp al, bl
    mov dword ptr [ebp + 000000150h], edi
    mov dword ptr [edi], 010041DB0h
    je L2
    cmp dword ptr [ebp + 68], ebx
    push esi
    mov esi, dword ptr [ebp + 76]
    mov dword ptr [esp + 32], ebx
    jle L1
    add esi, 8
    add edi, 64
    mov dword ptr [esp + 16], edi
L0:
    mov eax, dword ptr [esi]
    mov edx, dword ptr [esi + 20]
    mov ebx, dword ptr [esi + 4]
    mov ecx, dword ptr [esi + 24]
    lea edi, [edx + eax - 1]
    mov eax, dword ptr [ebp + 4]
    mov dword ptr [esp + 20], eax
    lea ecx, [ecx + ebx - 1]
    mov eax, ecx
    cdq
    idiv ebx
    mov eax, edi
    mov ebp, dword ptr [esp + 28]
    push ebx
    sub ecx, edx
    cdq
    idiv dword ptr [esi]
    mov eax, dword ptr [esp + 24]
    push ecx
    sub edi, edx
    push edi
    push 0
    push 1
    push ebp
    call dword ptr [eax + 0x14]
    mov ecx, dword ptr [esp + 40]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esp + 56]
    add ecx, 4
    add esp, 24
    inc eax
    mov dword ptr [esp + 16], ecx
    mov ecx, dword ptr [ebp + 68]
    add esi, 84
    cmp eax, ecx
    mov dword ptr [esp + 32], eax
    jl L0
L1:
    pop esi
    pop edi
    pop ebp
    pop ebx
    add esp, 8
    ret
L2:
    mov eax, dword ptr [ebp + 4]
    push 000000500h
    push 1
    push ebp
    call dword ptr [eax + 4]
    lea ecx, [eax + 000000080h]
    mov dword ptr [edi + 28], ecx
    lea edx, [eax + 000000100h]
    mov dword ptr [edi + 32], edx
    lea ecx, [eax + 000000180h]
    lea edx, [eax + 000000200h]
    mov dword ptr [edi + 36], ecx
    mov dword ptr [edi + 40], edx
    lea ecx, [eax + 000000280h]
    lea edx, [eax + 000000300h]
    add esp, 12
    mov dword ptr [edi + 44], ecx
    mov dword ptr [edi + 48], edx
    mov dword ptr [edi + 24], eax
    lea ecx, [eax + 000000380h]
    lea edx, [eax + 000000400h]
    add eax, 000000480h
    mov dword ptr [edi + 52], ecx
    mov dword ptr [edi + 56], edx
    mov dword ptr [edi + 60], eax
    mov dword ptr [edi + 64], ebx
    pop edi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_100425b0 ENDP
END
