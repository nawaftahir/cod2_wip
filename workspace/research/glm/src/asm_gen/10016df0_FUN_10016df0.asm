; FUN_10016df0 @ 0x10016df0 — auto-synthesized
    EXTRN fp_101d49cc:DWORD
    EXTRN g_101d1bf8:DWORD
    sub_100efe7a PROTO C
.CODE
FUN_10016df0 PROC
    push esi
    push edi
    xor edi, edi
    mov esi, dword ptr [edi + 0x101da564]
    test esi, esi
    je L0
    mov al, byte ptr [esi + 0xa]
    lea edx, [esi + 0xc]
    push edx
    mov edx, dword ptr [esi + 4]
    test al, al
    mov eax, dword ptr [g_101d1bf8]
    mov ecx, dword ptr [eax]
    push edx
    push eax
    jne L1
    call dword ptr [ecx + 0x16c]
    jmp L2
    call dword ptr [ecx + 0x1a8]
    test eax, eax
    jge L0
    push eax
    push eax
    call sub_100efe7a
    push eax
    mov eax, dword ptr [esi]
    push eax
    push 0x10194408
    push 0
    call dword ptr [fp_101d49cc]
    add esp, 0x14
    add edi, 4
    cmp edi, 0x400
    jb L3
    pop edi
    pop esi
    ret
FUN_10016df0 ENDP
END