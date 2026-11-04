.686
.MODEL FLAT, C
.CODE
FUN_10057630 PROC
    mov ecx, dword ptr [eax + 4]
    push esi
    mov esi, dword ptr [eax + 0000001B0h]
    push edi
    push 0000007FCh
    push 1
    push eax
    call dword ptr [ecx]
    add eax, 0000003FCh
    add esp, 12
    mov dword ptr [esi + 40], eax
    xor edx, edx
    xor ecx, ecx
    xor edi, edi
    mov esi, eax
L0:
    mov dword ptr [eax + ecx*4], edx
    mov dword ptr [esi], edi
    inc ecx
    sub esi, 4
    inc edx
    dec edi
    cmp ecx, 16
    jl L0
    cmp ecx, 48
    jge L2
    lea esi, [ecx*4]
    mov edi, esi
    mov esi, eax
    sub esi, edi
    lea ebx, [ebx]
L1:
    mov edi, edx
    neg edi
    mov dword ptr [eax + ecx*4], edx
    mov dword ptr [esi], edi
    inc ecx
    mov edi, ecx
    not edi
    and edi, 1
    sub esi, 4
    add edx, edi
    cmp ecx, 48
    jl L1
L2:
    cmp ecx, 0000000FFh
    jg L4
    lea esi, [ecx*4]
    push ebx
    mov ebx, esi
    mov edi, edx
    mov esi, eax
    neg edi
    sub esi, ebx
    pop ebx
L3:
    mov dword ptr [eax + ecx*4], edx
    mov dword ptr [esi], edi
    inc ecx
    sub esi, 4
    cmp ecx, 0000000FFh
    jle L3
L4:
    pop edi
    pop esi
    ret
FUN_10057630 ENDP
END
