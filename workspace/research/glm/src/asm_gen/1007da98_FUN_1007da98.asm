; FUN_1007da98 @ 0x1007da98 — auto-synthesized
.CODE
FUN_1007da98 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ecx + 0x14]
    test edx, edx
    je L0
    mov ax, word ptr [ecx + 8]
    neg ax
    push esi
    movzx esi, word ptr [ecx + 0xc]
    push esi
    mov esi, dword ptr [ecx]
    mov esi, dword ptr [esi + 8]
    push dword ptr [ecx + 0x20]
    sbb eax, eax
    and eax, 3
    inc eax
    imul eax, dword ptr [ebp + 0xc]
    shl eax, 2
    add esi, edx
    add esi, eax
    movzx eax, word ptr [ecx + 0xa]
    add eax, dword ptr [ebp + 0xc]
    push esi
    push eax
    push dword ptr [ebp + 8]
    call dword ptr [ecx + 0x1c]
    test eax, eax
    pop esi
    jl L1
    xor eax, eax
    pop ebp
    ret 8
FUN_1007da98 ENDP
END