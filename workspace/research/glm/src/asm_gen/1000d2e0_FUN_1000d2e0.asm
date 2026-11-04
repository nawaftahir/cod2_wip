; FUN_1000d2e0 @ 0x1000d2e0 — auto-synthesized
    sub_1000d11d PROTO C
.CODE
FUN_1000d2e0 PROC
    push esi
    xor esi, esi
    mov eax, dword ptr [esi + 0x101cea68]
    test eax, eax
    je L0
    cmp byte ptr [eax + 0x1e], 5
    jb L0
    mov ecx, dword ptr [eax + 4]
    test ecx, ecx
    jne L0
    cmp eax, 0x101ce890
    jb L1
    cmp eax, 0x101cea64
    jb L0
    call sub_1000d11d
    add esi, 4
    cmp esi, 0x2000
    jb L2
    pop esi
    ret
FUN_1000d2e0 ENDP
END