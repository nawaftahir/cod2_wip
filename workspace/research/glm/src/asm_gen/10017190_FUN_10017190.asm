; FUN_10017190 @ 0x10017190 — auto-synthesized
    EXTRN fp_101d49c8:DWORD
    EXTRN g_101d1b2c:DWORD
    EXTRN g_101d1b30:DWORD
    sub_1001710d PROTO C
.CODE
FUN_10017190 PROC
    push esi
    push 0
    mov eax, 0x10193674
    call sub_1001710d
    mov ecx, dword ptr [g_101d1b2c]
    mov dword ptr [g_101d1b30], eax
    mov edx, dword ptr [eax + 0x3c]
    mov esi, dword ptr [ecx + 0x3c]
    add esp, 4
    cmp edx, esi
    jne L0
    mov edx, dword ptr [eax + 0x40]
    cmp edx, dword ptr [ecx + 0x40]
    jne L0
    mov edx, dword ptr [eax + 0x38]
    cmp edx, dword ptr [ecx + 0x38]
    je L1
    cmp word ptr [eax + 0x34], 1
    je L1
    push 0x10194360
    push 3
    call dword ptr [fp_101d49c8]
    mov eax, dword ptr [g_101d1b2c]
    add esp, 8
    mov dword ptr [g_101d1b30], eax
    pop esi
    ret
FUN_10017190 ENDP
END