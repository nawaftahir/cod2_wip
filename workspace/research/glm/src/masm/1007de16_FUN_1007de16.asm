.686
.MODEL FLAT, C
.CODE
FUN_1007de16 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 24]
    mov edx, ebx
    shl edx, 2
    push esi
    push edi
    je L1
    mov eax, dword ptr [ebp + 20]
    mov ecx, dword ptr [ebp + 16]
    sub ecx, eax
    mov esi, edx
L0:
    xor edx, edx
    cmp dword ptr [ecx + eax], edx
    setne dl
    mov dword ptr [ebp + 24], edx
    fild dword ptr [ebp + 24]
    fstp dword ptr [eax]
    add eax, 4
    dec esi
    jne L0
L1:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax]
    mov esi, dword ptr [ebp + 16]
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
FUN_1007de16 ENDP
END
