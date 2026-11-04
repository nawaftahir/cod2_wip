; FUN_10047b00 @ 0x10047b00 — auto-synthesized
    sub_100479ce PROTO C
.CODE
FUN_10047b00 PROC
    push esi
    mov esi, ecx
    mov cl, byte ptr [esi + 0xc]
    test cl, cl
    je L0
    mov eax, dword ptr [esi + eax*4 + 0x5c]
    mov ecx, dword ptr [eax + edx*4]
    lea eax, [eax + edx*4]
    inc ecx
    mov dword ptr [eax], ecx
    pop esi
    ret
    mov ecx, dword ptr [esi + eax*4 + 0x4c]
    movsx eax, byte ptr [ecx + edx + 0x400]
    mov ecx, dword ptr [ecx + edx*4]
    push ecx
    call sub_100479ce
    add esp, 4
    pop esi
    ret
FUN_10047b00 ENDP
END