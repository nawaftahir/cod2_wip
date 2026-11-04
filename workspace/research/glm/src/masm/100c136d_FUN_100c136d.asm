.686
.MODEL FLAT, C
.CODE
FUN_100c136d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 28
    mov eax, dword ptr [ecx + 000000100h]
    mov edx, dword ptr [eax]
    and edx, 0000FFFFFh
    push ebx
    push esi
    push edi
    mov dword ptr [ebp - 24], ecx
    mov dword ptr [ebp - 4], 0
    jbe L2
    mov esi, dword ptr [eax + 8]
    mov edi, dword ptr [ecx + 20]
    lea eax, [esi + edx*4]
    mov dword ptr [ebp - 12], eax
    lea eax, [esi + edx*8]
    mov dword ptr [ebp - 8], eax
L0:
    mov eax, dword ptr [ebp - 4]
    shl eax, 2
    mov dword ptr [ebp - 28], eax
    mov eax, dword ptr [esi + eax]
    mov ebx, dword ptr [edi + eax*4]
    mov dword ptr [ebp - 20], ebx
    mov ebx, dword ptr [ebp - 8]
    mov ebx, dword ptr [ebx]
    mov ebx, dword ptr [edi + ebx*4]
    mov dword ptr [ebp - 16], ebx
    mov ebx, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebx]
    jne L4
    mov eax, dword ptr [ebp - 16]
    mov ecx, dword ptr [ecx + 000000100h]
    mov eax, dword ptr [eax + 56]
    mov ecx, dword ptr [ecx + 8]
    mov ebx, dword ptr [ebp - 28]
    cmp eax, dword ptr [ebx + ecx]
    je L1
    cmp eax, -1
    je L4
    mov ecx, dword ptr [ebp - 20]
    cmp eax, dword ptr [ecx + 56]
    jne L4
L1:
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + 60]
    mov ecx, dword ptr [ebp - 20]
    xor eax, 000080000h
    cmp eax, dword ptr [ecx + 60]
    jne L4
    inc dword ptr [ebp - 4]
    add dword ptr [ebp - 8], 4
    add dword ptr [ebp - 12], 4
    cmp dword ptr [ebp - 4], edx
    mov ecx, dword ptr [ebp - 24]
    jb L0
L2:
    mov esi, dword ptr [ecx + 000000100h]
    mov eax, edx
    and eax, 0000FFFFFh
    or eax, 070000000h
    mov dword ptr [esi], eax
    mov eax, dword ptr [ecx + 000000100h]
    mov dword ptr [eax + 4], edx
    xor eax, eax
L3:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L4:
    xor eax, eax
    inc eax
    jmp L3
FUN_100c136d ENDP
END
