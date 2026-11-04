.686
.MODEL FLAT, C
.CODE
FUN_1004b940 PROC
    sub sub esp, 16
    mov mov eax, dword ptr [edi + 4]
    push push ebx
    push push esi
    push push 116
    push push 1
    push push edi
    call call dword ptr [eax]
    mov mov esi, eax
    mov mov al, byte ptr [esp + 40]
    mov mov dword ptr [edi + 0190h], esi
    xor xor ebx, ebx
    add add esp, 12
    test test al, al
    mov mov dword ptr [esp + 20], esi
    mov mov dword ptr [esi], 01004AA30h
    mov mov dword ptr [esi + 8], 01004AA90h
    mov mov dword ptr [esi + 112], ebx
    je L2
    cmp cmp dword ptr [edi + 44], ebx
    mov mov eax, dword ptr [edi + 0CCh]
    mov mov dword ptr [esp + 28], ebx
    jle L1
    lea lea ebx, [eax + 12]
    add add esi, 72
    mov mov dword ptr [esp + 12], ebx
    mov mov dword ptr [esp + 8], esi
    push push ebp
    mov mov edi, edi
    mov mov al, byte ptr [edi + 0D0h]
    test test al, al
    mov mov ebp, dword ptr [ebx]
    mov mov edx, ebp
    je L0
    lea lea edx, [edx + edx*2]
    mov mov eax, dword ptr [ebx - 4]
    mov mov esi, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ebx + 20]
    lea lea esi, [esi + eax - 1]
    mov mov eax, dword ptr [edi + 4]
    push push edx
    mov mov dword ptr [esp + 24], eax
    lea lea ecx, [ecx + ebp - 1]
    mov mov eax, ecx
    cdq cdq
    idiv idiv ebp
    mov mov ebx, dword ptr [esp + 20]
    mov mov eax, esi
    sub sub ecx, edx
    cdq cdq
    idiv idiv dword ptr [ebx - 4]
    mov mov eax, dword ptr [esp + 24]
    push push ecx
    sub sub esi, edx
    push push esi
    push push 1
    push push 1
    push push edi
    call call dword ptr [eax + 20]
    mov mov ecx, dword ptr [esp + 36]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esp + 56]
    add add ecx, 4
    add add esp, 24
    inc inc eax
    mov mov dword ptr [esp + 12], ecx
    mov mov ecx, dword ptr [edi + 44]
    add add ebx, 84
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 32], eax
    mov mov dword ptr [esp + 16], ebx
    jl L3
    mov mov esi, dword ptr [esp + 24]
    pop pop ebp
    lea lea edx, [esi + 72]
    mov mov dword ptr [esi + 4], 01004ADA0h
    mov mov dword ptr [esi + 12], 01004AFD0h
    mov mov dword ptr [esi + 16], edx
    pop pop esi
    pop pop ebx
    add add esp, 16
    ret ret
    mov mov eax, dword ptr [edi + 4]
    push push 0500h
    push push 1
    push push edi
    call call dword ptr [eax + 4]
    lea lea ecx, [eax + 080h]
    mov mov dword ptr [esi + 36], ecx
    lea lea edx, [eax + 0100h]
    mov mov dword ptr [esi + 40], edx
    lea lea ecx, [eax + 0180h]
    mov mov dword ptr [esi + 44], ecx
    lea lea edx, [eax + 0200h]
    mov mov dword ptr [esi + 48], edx
    lea lea ecx, [eax + 0280h]
    mov mov dword ptr [esi + 52], ecx
    lea lea edx, [eax + 0300h]
L3:
    mov mov dword ptr [esi + 56], edx
    mov mov dword ptr [esi + 32], eax
    add add esp, 12
    lea lea ecx, [eax + 0380h]
    lea lea edx, [eax + 0400h]
    mov mov dword ptr [esi + 60], ecx
    mov mov dword ptr [esi + 64], edx
    add add eax, 0480h
    mov mov dword ptr [esi + 68], eax
    mov mov dword ptr [esi + 16], ebx
    mov mov dword ptr [esi + 4], 01004AD90h
    mov mov dword ptr [esi + 12], 01004AAE0h
    pop pop esi
    pop pop ebx
    add add esp, 16
    ret ret
FUN_1004b940 ENDP
END
