.686
.MODEL FLAT, C
.CODE
FUN_10088f70 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    mov esi, ecx
    mov ecx, dword ptr [ebx]
    test ecx, 0FFF00000h
    je L6
    mov eax, dword ptr [ebx + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    mov dword ptr [ebp - 12], ecx
    test eax, eax
    jbe L6
    and dword ptr [ebp - 4], 0
    mov dword ptr [ebp - 16], eax
    push edi
L0:
    test ecx, ecx
    jbe L5
    mov edi, dword ptr [ebp - 4]
    mov dword ptr [ebp - 8], ecx
L1:
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [edi + eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 72]
    cmp ecx, -1
    je L2
    cmp dword ptr [eax + 8], -1
    jne L2
    mov edx, dword ptr [esi + 24]
    mov edx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [edx + 36]
    xor ebx, ebx
    inc ebx
    shl ebx, cl
    or dword ptr [eax + 64], ebx
    mov ebx, dword ptr [ebp + 8]
    mov dword ptr [edx + 40], 1
L2:
    add edi, 4
    dec dword ptr [ebp - 8]
    jne L1
    mov edx, dword ptr [ebp - 4]
    mov edi, dword ptr [ebp - 12]
L3:
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [edx + eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 72]
    cmp ecx, -1
    je L4
    cmp dword ptr [eax + 8], -1
    jne L4
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ecx*4]
    cmp dword ptr [eax + 40], 0
    je L4
    mov ecx, dword ptr [eax + 36]
    inc ecx
    and ecx, 31
    and dword ptr [eax + 40], 0
    mov dword ptr [eax + 36], ecx
L4:
    add edx, 4
    dec edi
    jne L3
    mov ecx, dword ptr [ebp - 12]
L5:
    mov eax, ecx
    shl eax, 2
    add dword ptr [ebp - 4], eax
    dec dword ptr [ebp - 16]
    jne L0
    pop edi
L6:
    pop esi
    xor eax, eax
    pop ebx
    leave
    ret 4
FUN_10088f70 ENDP
END
