.686
.MODEL FLAT, C
.CODE
FUN_100bb955 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ecx + 000000100h]
    mov edx, dword ptr [ecx + 20]
    push esi
    mov esi, dword ptr [eax]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 48]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov edx, dword ptr [ecx + 16]
    mov eax, dword ptr [edx + eax*4]
    and esi, 0000FFFFFh
    test byte ptr [eax + 4], 000000080h
    jne L0
    xor eax, eax
    inc eax
    jmp L3
L0:
    and dword ptr [ebp - 4], 0
    test esi, esi
    jbe L2
    push ebx
    push edi
L1:
    mov eax, dword ptr [ecx + 000000100h]
    mov ebx, dword ptr [eax + 8]
    mov edi, dword ptr [ebp - 4]
    mov edx, dword ptr [ecx + 20]
    mov eax, dword ptr [eax + 16]
    shl edi, 2
    mov ebx, dword ptr [edi + ebx]
    mov eax, dword ptr [edi + eax]
    mov ebx, dword ptr [edx + ebx*4]
    mov eax, dword ptr [edx + eax*4]
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], esi
    mov edx, dword ptr [ebx + 48]
    mov dword ptr [eax + 48], edx
    jb L1
    pop edi
    pop ebx
L2:
    mov eax, dword ptr [ecx + 000000100h]
    and dword ptr [eax], 0
    xor eax, eax
L3:
    pop esi
    leave
    ret
FUN_100bb955 ENDP
END
