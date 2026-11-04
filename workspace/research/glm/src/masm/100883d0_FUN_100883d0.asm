.686
.MODEL FLAT, C
.CODE
FUN_100883d0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 12]
    mov eax, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [ecx + 20]
    shl edx, 2
    shl eax, 2
    push edi
    mov edi, dword ptr [edx + esi]
    mov esi, dword ptr [esi + eax]
    mov esi, dword ptr [esi + 4]
    cmp esi, dword ptr [edi + 4]
    jne L0
    mov esi, dword ptr [ecx + 20]
    mov edi, dword ptr [esi + edx]
    mov esi, dword ptr [esi + eax]
    mov esi, dword ptr [esi + 8]
    cmp esi, dword ptr [edi + 8]
    jne L0
    mov esi, dword ptr [ecx + 20]
    mov edi, dword ptr [esi + edx]
    mov esi, dword ptr [esi + eax]
    mov esi, dword ptr [esi + 12]
    cmp esi, dword ptr [edi + 12]
    jne L0
    mov esi, dword ptr [ecx + 20]
    mov edi, dword ptr [esi + edx]
    mov esi, dword ptr [esi + eax]
    mov esi, dword ptr [esi + 20]
    cmp esi, dword ptr [edi + 20]
    jne L0
    mov ecx, dword ptr [ecx + 20]
    mov eax, dword ptr [ecx + eax]
    mov edx, dword ptr [ecx + edx]
    mov eax, dword ptr [eax + 24]
    cmp eax, dword ptr [edx + 24]
    jne L0
    xor eax, eax
    inc eax
    jmp L1
L0:
    xor eax, eax
L1:
    pop edi
    pop esi
    pop ebp
    ret 8
FUN_100883d0 ENDP
END
