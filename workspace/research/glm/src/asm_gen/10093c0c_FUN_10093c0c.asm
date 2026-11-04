; FUN_10093c0c @ 0x10093c0c — auto-synthesized
    sub_1008baa3 PROTO C
.CODE
FUN_10093c0c PROC
    xor edx, edx
    cmp dword ptr [ecx + 0xe0], edx
    jne L0
    xor eax, eax
    inc eax
    ret
    cmp dword ptr [ecx + 8], edx
    jbe L1
    push esi
    push edi
    mov eax, dword ptr [ecx + 0x14]
    mov eax, dword ptr [eax + edx*4]
    cmp dword ptr [eax + 0x44], -1
    je L2
    mov esi, dword ptr [eax + 0x44]
    mov edi, dword ptr [ecx + 0xe0]
    mov edi, dword ptr [edi + 0x14]
    mov esi, dword ptr [edi + esi*4]
    mov edi, dword ptr [eax + 0xc]
    mov dword ptr [esi + 0xc], edi
    mov esi, dword ptr [ecx + 0xe0]
    mov eax, dword ptr [eax + 0x44]
    mov esi, dword ptr [esi + 0x14]
    mov eax, dword ptr [esi + eax*4]
    mov dword ptr [eax + 0x44], edx
    inc edx
    cmp edx, dword ptr [ecx + 8]
    jb L3
    pop edi
    pop esi
    mov ecx, dword ptr [ecx + 0xe0]
    jmp sub_1008baa3
FUN_10093c0c ENDP
END