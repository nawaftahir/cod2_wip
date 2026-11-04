; FUN_100650f1 @ 0x100650f1 — auto-synthesized
    sub_10067c68 PROTO C
.CODE
FUN_100650f1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    push esi
    mov esi, ecx
    jne L0
    cmp dword ptr [esi + 0x44], eax
    jne L1
    push 0x1010c734
    push eax
    lea eax, [esi + 0x278]
    push eax
    lea eax, [esi + 0x18]
    push eax
    call sub_10067c68
    add esp, 0x10
    mov dword ptr [esi + 0x44], 1
    xor eax, eax
    pop esi
    pop ebp
    ret 4
FUN_100650f1 ENDP
END