.686
.MODEL FLAT, C
.CODE
FUN_100425b0 PROC
    sub sub esp, 8
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 20]
    mov mov eax, dword ptr [ebp + 4]
    push push edi
    push push 104
    push push 1
    push push ebp
    call call dword ptr [eax]
    mov mov edi, eax
    mov mov al, byte ptr [esp + 40]
    xor xor ebx, ebx
    add add esp, 12
    cmp cmp al, bl
    mov mov dword ptr [ebp + 0150h], edi
    mov mov dword ptr [edi], 010041DB0h
    je L0
    cmp cmp dword ptr [ebp + 68], ebx
    push push esi
    mov mov esi, dword ptr [ebp + 76]
    mov mov dword ptr [esp + 32], ebx
    jle L1
    add add esi, 8
    add add edi, 64
    mov mov dword ptr [esp + 16], edi
    mov mov eax, dword ptr [esi]
    mov mov edx, dword ptr [esi + 20]
    mov mov ebx, dword ptr [esi + 4]
    mov mov ecx, dword ptr [esi + 24]
    lea lea edi, [edx + eax - 1]
    mov mov eax, dword ptr [ebp + 4]
    mov mov dword ptr [esp + 20], eax
    lea lea ecx, [ecx + ebx - 1]
    mov mov eax, ecx
    cdq cdq
    idiv idiv ebx
    mov mov eax, edi
    mov mov ebp, dword ptr [esp + 28]
    push push ebx
    sub sub ecx, edx
    cdq cdq
    idiv idiv dword ptr [esi]
    mov mov eax, dword ptr [esp + 24]
    push push ecx
    sub sub edi, edx
    push push edi
    push push 0
    push push 1
    push push ebp
    call call dword ptr [eax + 20]
    mov mov ecx, dword ptr [esp + 40]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esp + 56]
    add add ecx, 4
    add add esp, 24
    inc inc eax
    mov mov dword ptr [esp + 16], ecx
    mov mov ecx, dword ptr [ebp + 68]
    add add esi, 84
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 32], eax
    jl L2
    pop pop esi
    pop pop edi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
    mov mov eax, dword ptr [ebp + 4]
    push push 0500h
    push push 1
    push push ebp
    call call dword ptr [eax + 4]
    lea lea ecx, [eax + 080h]
    mov mov dword ptr [edi + 28], ecx
    lea lea edx, [eax + 0100h]
    mov mov dword ptr [edi + 32], edx
    lea lea ecx, [eax + 0180h]
    lea lea edx, [eax + 0200h]
    mov mov dword ptr [edi + 36], ecx
L0:
    mov mov dword ptr [edi + 40], edx
    lea lea ecx, [eax + 0280h]
    lea lea edx, [eax + 0300h]
L2:
    add add esp, 12
    mov mov dword ptr [edi + 44], ecx
    mov mov dword ptr [edi + 48], edx
    mov mov dword ptr [edi + 24], eax
    lea lea ecx, [eax + 0380h]
    lea lea edx, [eax + 0400h]
    add add eax, 0480h
    mov mov dword ptr [edi + 52], ecx
    mov mov dword ptr [edi + 56], edx
    mov mov dword ptr [edi + 60], eax
    mov mov dword ptr [edi + 64], ebx
    pop pop edi
    pop pop ebp
    pop pop ebx
    add add esp, 8
    ret ret
FUN_100425b0 ENDP
END
