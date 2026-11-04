; FUN_10020b50 @ 0x10020b50 — auto-synthesized
    EXTRN fp_101d49d4:DWORD
    EXTRN g_101da9c8:DWORD
    EXTRN g_106784a0:DWORD
    EXTRN g_106784ac:DWORD
    EXTRN g_106784b8:DWORD
    EXTRN g_106784d0:DWORD
    EXTRN g_106784e8:DWORD
    EXTRN g_1072d9b0:DWORD
    EXTRN g_1072d9b4:DWORD
    sub_100210ab PROTO C
.CODE
FUN_10020b50 PROC
    push edi
    xor eax, eax
    mov ecx, 0x15
    mov edi, 0x10678498
    rep stosd dword ptr es:[edi], eax
    mov eax, 0x1000
    push 0x200000
    mov dword ptr [g_106784a0], eax
    mov dword ptr [g_106784ac], 0x200
    mov dword ptr [g_106784b8], eax
    mov dword ptr [g_106784d0], 0x4000
    mov dword ptr [g_106784e8], eax
    call dword ptr [fp_101d49d4]
    push 0x200000
    mov dword ptr [g_1072d9b0], eax
    call dword ptr [fp_101d49d4]
    mov dword ptr [g_1072d9b4], eax
    mov eax, dword ptr [g_101da9c8]
    add esp, 8
    xor ecx, ecx
    cmp eax, ecx
    pop edi
    jne L0
    jmp sub_100210ab
    mov dword ptr [eax + 0x249d0c], ecx
    mov dword ptr [eax + 0x249d10], ecx
    mov dword ptr [eax + 0x249d14], ecx
    ret
FUN_10020b50 ENDP
END