; FUN_10041850 @ 0x10041850 — auto-synthesized
.CODE
FUN_10041850 PROC
    mov ecx, dword ptr [eax + 0x50]
    test ecx, ecx
    je L0
    mov byte ptr [ecx + 0x80], dl
    mov ecx, dword ptr [eax + 0x54]
    test ecx, ecx
    je L1
    mov byte ptr [ecx + 0x80], dl
    mov ecx, dword ptr [eax + 0x58]
    test ecx, ecx
    je L2
    mov byte ptr [ecx + 0x80], dl
    mov ecx, dword ptr [eax + 0x5c]
    test ecx, ecx
    je L3
    mov byte ptr [ecx + 0x80], dl
    push esi
    add eax, 0x70
    mov esi, 4
    lea ecx, [ecx]
    mov ecx, dword ptr [eax - 0x10]
    test ecx, ecx
    je L4
    mov byte ptr [ecx + 0x111], dl
    mov ecx, dword ptr [eax]
    test ecx, ecx
    je L5
    mov byte ptr [ecx + 0x111], dl
    add eax, 4
    dec esi
    jne L6
    pop esi
    ret
FUN_10041850 ENDP
END