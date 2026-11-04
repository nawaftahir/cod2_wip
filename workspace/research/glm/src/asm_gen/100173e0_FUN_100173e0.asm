; FUN_100173e0 @ 0x100173e0 — auto-synthesized
    EXTRN g_101ce79c:DWORD
    EXTRN g_101d1b2c:DWORD
    EXTRN g_101d1b30:DWORD
    EXTRN g_101d1be4:DWORD
    sub_100171d4 PROTO C
    sub_10017374 PROTO C
    sub_1001738f PROTO C
    sub_1001c945 PROTO C
.CODE
FUN_100173e0 PROC
    push ebx
    push edi
    xor eax, eax
    mov ecx, 0xa67
    mov edi, 0x101d7fc8
    rep stosd dword ptr es:[edi], eax
    call sub_1001c945
    mov ebx, 0x1c
    mov edi, 0x1018e988
    call sub_10017374
    mov eax, dword ptr [g_101ce79c]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L0
    mov ebx, 0xc
    mov edi, 0x1018ea68
    call sub_1001738f
    call sub_100171d4
    mov eax, dword ptr [g_101d1b30]
    mov ecx, dword ptr [g_101d1b2c]
    mov edx, dword ptr [eax + 0x3c]
    cmp edx, dword ptr [ecx + 0x3c]
    jne L1
    mov edx, dword ptr [eax + 0x40]
    cmp edx, dword ptr [ecx + 0x40]
    jne L1
    mov edx, dword ptr [eax + 0x38]
    cmp edx, dword ptr [ecx + 0x38]
    je L2
    mov ecx, dword ptr [eax + 0x3c]
    mov edx, dword ptr [ecx]
    mov dword ptr [g_101d1be4], edx
    mov dword ptr [eax + 0x3c], 0x101d1be4
    pop edi
    pop ebx
    ret
FUN_100173e0 ENDP
END