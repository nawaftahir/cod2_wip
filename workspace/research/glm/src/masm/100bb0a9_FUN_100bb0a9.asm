.686
.MODEL FLAT, C
.CODE
FUN_100bb0a9 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 4]
    push esi
    mov esi, dword ptr [ecx]
    and esi, 0000FFFFFh
    xor edx, edx
    div esi
    push edi
    mov edi, dword ptr [ebp + 12]
    test eax, eax
    jbe L1
    mov edx, esi
    shl edx, 2
    mov dword ptr [ebp + 12], edx
    mov edx, edi
    shl edx, 2
    mov dword ptr [ebp + 8], eax
    push ebx
L0:
    mov eax, dword ptr [ecx + 8]
    add eax, edx
    mov ebx, dword ptr [eax + 4]
    mov esi, dword ptr [eax]
    mov dword ptr [eax], ebx
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [eax + edx + 4], esi
    add edx, dword ptr [ebp + 12]
    dec dword ptr [ebp + 8]
    jne L0
    pop ebx
L1:
    mov eax, dword ptr [ecx + 16]
    mov edx, edi
    shl edx, 2
    add eax, edx
    mov edi, dword ptr [eax + 4]
    mov esi, dword ptr [eax]
    mov dword ptr [eax], edi
    mov eax, dword ptr [ecx + 16]
    pop edi
    mov dword ptr [eax + edx + 4], esi
    pop esi
    pop ebp
    ret 8
FUN_100bb0a9 ENDP
END
