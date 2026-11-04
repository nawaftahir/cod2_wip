; FUN_1001d170 @ 0x1001d170 — auto-synthesized
    sub_1001d378 PROTO C
.CODE
FUN_1001d170 PROC
    push ebx
    mov ebx, ecx
    sub eax, ebx
    mov ecx, eax
    mov eax, 0x2aaaaaab
    imul ecx
    push ebp
    push esi
    sar edx, 1
    push edi
    mov edi, edx
    shr edi, 0x1f
    add edi, edx
    mov eax, edi
    cdq
    sub eax, edx
    mov esi, eax
    sar esi, 1
    test esi, esi
    jle L0
    lea eax, [esi + esi*2]
    lea ebp, [ebx + eax*4]
    lea ecx, [ecx]
    mov ecx, dword ptr [esp + 0x14]
    push ecx
    sub ebp, 0xc
    sub esp, 0xc
    mov edx, ebp
    mov ecx, dword ptr [edx]
    mov eax, esp
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [edx + 4]
    mov edx, dword ptr [edx + 8]
    mov dword ptr [eax + 4], ecx
    dec esi
    mov dword ptr [eax + 8], edx
    push edi
    mov eax, esi
    call sub_1001d378
    add esp, 0x14
    test esi, esi
    jg L1
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_1001d170 ENDP
END