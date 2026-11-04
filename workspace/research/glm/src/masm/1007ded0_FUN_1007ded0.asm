.686
.MODEL FLAT, C
.CODE
FUN_1007ded0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    push ebx
    mov ebx, dword ptr [ebp + 24]
    push esi
    mov esi, dword ptr [ebp + 16]
    push edi
    push eax
    shl ebx, 4
    call dword ptr [ecx + 0xc]
    mov edi, eax
    mov eax, dword ptr [ebp + 12]
    shl eax, 4
    add edi, eax
    mov ecx, ebx
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    pop ebp
    ret 20
FUN_1007ded0 ENDP
END
