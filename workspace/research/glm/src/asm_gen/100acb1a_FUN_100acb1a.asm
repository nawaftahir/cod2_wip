; FUN_100acb1a @ 0x100acb1a — auto-synthesized
.CODE
FUN_100acb1a PROC
    mov edi, edi
    push esi
    xor esi, esi
    cmp dword ptr [ecx + 8], esi
    jbe L0
    push edi
    mov eax, dword ptr [ecx + 0x14]
    mov eax, dword ptr [eax + esi*4]
    mov edx, dword ptr [eax + 0x38]
    cmp edx, -1
    je L1
    mov edi, dword ptr [ecx + 0x14]
    shl edx, 2
    mov edi, dword ptr [edi + edx]
    mov edi, dword ptr [edi + 0xc]
    mov dword ptr [eax + 0xc], edi
    mov edi, dword ptr [ecx + 0x14]
    mov edx, dword ptr [edi + edx]
    mov edx, dword ptr [edx + 0x10]
    mov dword ptr [eax + 0x10], edx
    inc esi
    cmp esi, dword ptr [ecx + 8]
    jb L2
    pop edi
    xor eax, eax
    pop esi
    ret
FUN_100acb1a ENDP
END