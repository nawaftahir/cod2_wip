; FUN_100825f5 @ 0x100825f5 — auto-synthesized
    EXTRN fp_1010c088:DWORD
    EXTRN g_1010c084:DWORD
.CODE
FUN_100825f5 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 8]
    test eax, eax
    push edi
    je L0
    push eax
    call dword ptr [fp_1010c088]
    and dword ptr [esi + 8], 0
    and dword ptr [esi + 0xc], 0
    mov eax, dword ptr [esi + 4]
    cmp eax, -1
    mov edi, dword ptr [g_1010c084]
    je L1
    push eax
    call edi
    or dword ptr [esi + 4], 0xffffffff
    mov eax, dword ptr [esi]
    cmp eax, -1
    je L2
    push eax
    call edi
    or dword ptr [esi], 0xffffffff
    pop edi
    xor eax, eax
    pop esi
    ret
FUN_100825f5 ENDP
END