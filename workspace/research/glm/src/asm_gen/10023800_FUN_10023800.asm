; FUN_10023800 @ 0x10023800 — auto-synthesized
    EXTRN fp_101d4bb4:DWORD
    EXTRN g_101da9c8:DWORD
.CODE
FUN_10023800 PROC
    mov eax, dword ptr [esp + 4]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [g_101da9c8]
    mov edx, dword ptr [esp + 8]
    mov edx, dword ptr [edx]
    push ebx
    push ebp
    push esi
    mov esi, ecx
    imul esi, esi, 0x74
    push edi
    lea edi, [esi + eax + 0xa0010]
    mov esi, edx
    imul esi, esi, 0x74
    mov ebp, dword ptr [esi + eax + 0xa0010]
    lea ebx, [esi + eax + 0xa0010]
    mov esi, dword ptr [edi]
    mov eax, esi
    sub eax, ebp
    jne L0
    imul ecx, ecx, 0x34
    imul edx, edx, 0x34
    add ecx, 0x10678ac4
    add edx, 0x10678ac4
    cmp esi, 3
    ja L1
    jmp dword ptr [esi*4 + 0x100238b8]
    mov edx, dword ptr [edx + 4]
    mov esi, dword ptr [ecx + 4]
    push 0
    push edx
    call dword ptr [fp_101d4bb4]
    push 0
    push esi
    mov edi, eax
    call dword ptr [fp_101d4bb4]
    add esp, 0x10
    sub eax, edi
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
    mov eax, dword ptr [ecx + 4]
    mov ecx, dword ptr [edx + 4]
    pop edi
    pop esi
    pop ebp
    sub eax, ecx
    pop ebx
    ret
    mov esi, dword ptr [edx + 4]
    mov eax, dword ptr [ecx + 4]
    pop edi
    sub eax, esi
    pop esi
    pop ebp
    sar eax, 5
    pop ebx
    ret
    mov ecx, dword ptr [edi + 0x54]
    sub ecx, dword ptr [ebx + 0x54]
    mov eax, 0x78787879
    imul ecx
    sar edx, 5
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10023800 ENDP
END