; FUN_1005c8c0 @ 0x1005c8c0 — auto-synthesized
.CODE
FUN_1005c8c0 PROC
    push ebx
    push ebp
    push edi
    mov edi, edx
    add ecx, 0x18
    sub edi, eax
    mov ebp, 3
    nop
    mov edx, dword ptr [edi + eax]
    mov dword ptr [eax], edx
    mov edx, dword ptr [edi + eax]
    mov dword ptr [eax + 0xc], edx
    mov ebx, dword ptr [ecx - 0x18]
    xor edx, edx
    test ebx, ebx
    setge dl
    mov ebx, esi
    dec edx
    and edx, 0xc
    fld dword ptr [edx + esi]
    sub ebx, edx
    fmul dword ptr [ecx - 0x18]
    xor edx, edx
    fadd dword ptr [eax]
    fstp dword ptr [eax]
    fld dword ptr [ebx + 0xc]
    fmul dword ptr [ecx - 0x18]
    fadd dword ptr [eax + 0xc]
    fstp dword ptr [eax + 0xc]
    mov ebx, dword ptr [ecx - 0xc]
    test ebx, ebx
    setge dl
    mov ebx, esi
    dec edx
    and edx, 0xc
    fld dword ptr [esi + edx + 4]
    sub ebx, edx
    fmul dword ptr [ecx - 0xc]
    xor edx, edx
    fadd dword ptr [eax]
    fstp dword ptr [eax]
    fld dword ptr [ebx + 0x10]
    fmul dword ptr [ecx - 0xc]
    fadd dword ptr [eax + 0xc]
    fstp dword ptr [eax + 0xc]
    mov ebx, dword ptr [ecx]
    test ebx, ebx
    setge dl
    mov ebx, esi
    add eax, 4
    add ecx, 4
    dec edx
    and edx, 0xc
    fld dword ptr [esi + edx + 8]
    sub ebx, edx
    dec ebp
    fmul dword ptr [ecx - 4]
    fadd dword ptr [eax - 4]
    fstp dword ptr [eax - 4]
    fld dword ptr [ebx + 0x14]
    fmul dword ptr [ecx - 4]
    fadd dword ptr [eax + 8]
    fstp dword ptr [eax + 8]
    jne L0
    pop edi
    pop ebp
    pop ebx
    ret
FUN_1005c8c0 ENDP
END