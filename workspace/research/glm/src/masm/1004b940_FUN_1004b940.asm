.686
.MODEL FLAT, C
.CODE
FUN_1004b940 PROC
    sub esp, 16
    mov eax, dword ptr [edi + 4]
    push ebx
    push esi
    push 116
    push 1
    push edi
    call dword ptr [eax]
    mov esi, eax
    mov al, byte ptr [esp + 40]
    mov dword ptr [edi + 000000190h], esi
    xor ebx, ebx
    add esp, 12
    test al, al
    mov dword ptr [esp + 20], esi
    mov dword ptr [esi], 01004AA30h
    mov dword ptr [esi + 8], 01004AA90h
    mov dword ptr [esi + 112], ebx
    je L3
    cmp dword ptr [edi + 44], ebx
    mov eax, dword ptr [edi + 0000000CCh]
    mov dword ptr [esp + 28], ebx
    jle L2
    lea ebx, [eax + 12]
    add esi, 72
    mov dword ptr [esp + 12], ebx
    mov dword ptr [esp + 8], esi
    push ebp
    mov edi, edi
L0:
    mov al, byte ptr [edi + 0000000D0h]
    test al, al
    mov ebp, dword ptr [ebx]
    mov edx, ebp
    je L1
    lea edx, [edx + edx*2]
L1:
    mov eax, dword ptr [ebx - 4]
    mov esi, dword ptr [ebx + 16]
    mov ecx, dword ptr [ebx + 20]
    lea esi, [esi + eax - 1]
    mov eax, dword ptr [edi + 4]
    push edx
    mov dword ptr [esp + 24], eax
    lea ecx, [ecx + ebp - 1]
    mov eax, ecx
    cdq
    idiv ebp
    mov ebx, dword ptr [esp + 20]
    mov eax, esi
    sub ecx, edx
    cdq
    idiv dword ptr [ebx - 4]
    mov eax, dword ptr [esp + 24]
    push ecx
    sub esi, edx
    push esi
    push 1
    push 1
    push edi
    call dword ptr [eax + 0x14]
    mov ecx, dword ptr [esp + 36]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esp + 56]
    add ecx, 4
    add esp, 24
    inc eax
    mov dword ptr [esp + 12], ecx
    mov ecx, dword ptr [edi + 44]
    add ebx, 84
    cmp eax, ecx
    mov dword ptr [esp + 32], eax
    mov dword ptr [esp + 16], ebx
    jl L0
    mov esi, dword ptr [esp + 24]
    pop ebp
L2:
    lea edx, [esi + 72]
    mov dword ptr [esi + 4], 01004ADA0h
    mov dword ptr [esi + 12], 01004AFD0h
    mov dword ptr [esi + 16], edx
    pop esi
    pop ebx
    add esp, 16
    ret
L3:
    mov eax, dword ptr [edi + 4]
    push 000000500h
    push 1
    push edi
    call dword ptr [eax + 4]
    lea ecx, [eax + 000000080h]
    mov dword ptr [esi + 36], ecx
    lea edx, [eax + 000000100h]
    mov dword ptr [esi + 40], edx
    lea ecx, [eax + 000000180h]
    mov dword ptr [esi + 44], ecx
    lea edx, [eax + 000000200h]
    mov dword ptr [esi + 48], edx
    lea ecx, [eax + 000000280h]
    mov dword ptr [esi + 52], ecx
    lea edx, [eax + 000000300h]
    mov dword ptr [esi + 56], edx
    mov dword ptr [esi + 32], eax
    add esp, 12
    lea ecx, [eax + 000000380h]
    lea edx, [eax + 000000400h]
    mov dword ptr [esi + 60], ecx
    mov dword ptr [esi + 64], edx
    add eax, 000000480h
    mov dword ptr [esi + 68], eax
    mov dword ptr [esi + 16], ebx
    mov dword ptr [esi + 4], 01004AD90h
    mov dword ptr [esi + 12], 01004AAE0h
    pop esi
    pop ebx
    add esp, 16
    ret
FUN_1004b940 ENDP
END
