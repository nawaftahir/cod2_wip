; FUN_10082304 @ 0x10082304 — auto-synthesized
    EXTRN fp_1010c01c:DWORD
.CODE
FUN_10082304 PROC
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi]
    test eax, eax
    je L0
    push eax
    call dword ptr [fp_1010c01c]
    and dword ptr [esi], 0
    and dword ptr [esi + 4], 0
    and dword ptr [esi + 8], 0
    xor eax, eax
    pop esi
    ret
FUN_10082304 ENDP
END