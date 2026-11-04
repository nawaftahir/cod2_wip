; FUN_1004a720 @ 0x1004a720 — auto-synthesized
    sub_1004a55d PROTO C
.CODE
FUN_1004a720 PROC
    push esi
    push edi
    mov esi, ecx
    mov edi, eax
    mov eax, dword ptr [esi + 0x14]
    cmp eax, 0xcf
    je L0
    cmp eax, 0xcc
    je L0
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 0x14], 0x14
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 0x14]
    mov dword ptr [ecx + 0x18], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
    test edi, edi
    jg L1
    mov edi, 1
    mov ecx, dword ptr [esi + 0x198]
    mov al, byte ptr [ecx + 0x11]
    test al, al
    je L2
    mov eax, dword ptr [esi + 0x84]
    cmp edi, eax
    jle L2
    mov edi, eax
    mov dword ptr [esi + 0x8c], edi
    call sub_1004a55d
    pop edi
    pop esi
    ret
FUN_1004a720 ENDP
END