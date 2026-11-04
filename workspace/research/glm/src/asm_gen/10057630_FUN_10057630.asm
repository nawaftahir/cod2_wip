; FUN_10057630 @ 0x10057630 — auto-synthesized
.CODE
FUN_10057630 PROC
    mov ecx, dword ptr [eax + 4]
    push esi
    mov esi, dword ptr [eax + 0x1b0]
    push edi
    push 0x7fc
    push 1
    push eax
    call dword ptr [ecx]
    add eax, 0x3fc
    add esp, 0xc
    mov dword ptr [esi + 0x28], eax
    xor edx, edx
    xor ecx, ecx
    xor edi, edi
    mov esi, eax
    mov dword ptr [eax + ecx*4], edx
    mov dword ptr [esi], edi
    inc ecx
    sub esi, 4
    inc edx
    dec edi
    cmp ecx, 0x10
    jl L0
    cmp ecx, 0x30
    jge L1
    lea esi, [ecx*4]
    mov edi, esi
    mov esi, eax
    sub esi, edi
    lea ebx, [ebx]
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
    cmp ecx, 0x30
    jl L2
    cmp ecx, 0xff
    jg L3
    lea esi, [ecx*4]
    push ebx
    mov ebx, esi
    mov edi, edx
    mov esi, eax
    neg edi
    sub esi, ebx
    pop ebx
    mov dword ptr [eax + ecx*4], edx
    mov dword ptr [esi], edi
    inc ecx
    sub esi, 4
    cmp ecx, 0xff
    jle L4
    pop edi
    pop esi
    ret
FUN_10057630 ENDP
END