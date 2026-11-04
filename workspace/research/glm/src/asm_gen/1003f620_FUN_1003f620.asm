; FUN_1003f620 @ 0x1003f620 — auto-synthesized
    EXTRN g_1019bc78:DWORD
.CODE
FUN_1003f620 PROC
    sub esp, 8
    push esi
    mov esi, dword ptr [edi + 0x54]
    movzx eax, byte ptr [esi + 0xe]
    movzx edx, byte ptr [esi + 0xf]
    imul edx, eax
    cmp edx, 1
    mov dword ptr [esp + 8], eax
    jne L0
    mov eax, 0x3f800000
    mov dword ptr [ecx], 0
    mov dword ptr [ecx + 4], 0
    mov dword ptr [ecx + 8], eax
    mov dword ptr [ecx + 0xc], eax
    pop esi
    add esp, 8
    ret
    mov eax, dword ptr [edi + 0x60]
    push ebx
    movzx ebx, byte ptr [esi + 0xf]
    cdq
    idiv ebx
    mov dword ptr [esp + 8], ebx
    pop ebx
    fild dword ptr [esp + 4]
    fdivr dword ptr [g_1019bc78]
    fild dword ptr [esp + 8]
    mov dword ptr [esp + 8], edx
    fdivr dword ptr [g_1019bc78]
    fild dword ptr [esp + 8]
    fmul st(2)
    fstp dword ptr [ecx]
    movzx esi, byte ptr [esi + 0xf]
    mov eax, dword ptr [edi + 0x60]
    cdq
    idiv esi
    pop esi
    mov dword ptr [esp + 4], eax
    fild dword ptr [esp + 4]
    fmul st(1)
    fstp dword ptr [ecx + 4]
    fxch st(1)
    fadd dword ptr [ecx]
    fstp dword ptr [ecx + 8]
    fadd dword ptr [ecx + 4]
    fstp dword ptr [ecx + 0xc]
    add esp, 8
    ret
FUN_1003f620 ENDP
END