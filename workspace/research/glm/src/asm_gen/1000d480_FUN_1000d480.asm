; FUN_1000d480 @ 0x1000d480 — auto-synthesized
.CODE
FUN_1000d480 PROC
    push esi
    xor esi, esi
    mov eax, dword ptr [esi + 0x101cea68]
    test eax, eax
    je L0
    cmp eax, 0x101ce890
    jb L1
    cmp eax, 0x101cea64
    jb L0
    push edi
    push eax
    call ebx
    add esp, 8
    add esi, 4
    cmp esi, 0x2000
    jb L2
    pop esi
    ret
FUN_1000d480 ENDP
END