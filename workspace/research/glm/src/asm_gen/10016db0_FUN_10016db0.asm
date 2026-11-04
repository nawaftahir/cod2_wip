; FUN_10016db0 @ 0x10016db0 — auto-synthesized
.CODE
FUN_10016db0 PROC
    push esi
    xor esi, esi
    mov eax, dword ptr [esi + 0x101da564]
    test eax, eax
    je L0
    mov cl, byte ptr [eax + 0xa]
    test cl, cl
    mov eax, dword ptr [eax + 0xc]
    push eax
    jne L1
    mov ecx, dword ptr [eax]
    call dword ptr [ecx + 8]
    jmp L0
    mov edx, dword ptr [eax]
    call dword ptr [edx + 8]
    add esi, 4
    cmp esi, 0x400
    jb L2
    pop esi
    ret
FUN_10016db0 ENDP
END