; FUN_100171f0 @ 0x100171f0 — auto-synthesized
    EXTRN g_101d1b2c:DWORD
    EXTRN g_101d1b30:DWORD
    EXTRN g_101d1b98:DWORD
    sub_1000c93f PROTO C
    sub_1000fc6e PROTO C
.CODE
FUN_100171f0 PROC
    mov eax, dword ptr [g_101d1b30]
    mov ecx, dword ptr [g_101d1b2c]
    mov edx, dword ptr [eax + 0x3c]
    push esi
    cmp edx, dword ptr [ecx + 0x3c]
    jne L0
    mov edx, dword ptr [eax + 0x40]
    cmp edx, dword ptr [ecx + 0x40]
    jne L0
    mov edx, dword ptr [eax + 0x38]
    cmp edx, dword ptr [ecx + 0x38]
    je L1
    mov esi, dword ptr [g_101d1b98]
    call sub_1000c93f
    mov eax, dword ptr [esp + 8]
    push eax
    mov eax, dword ptr [g_101d1b98]
    call sub_1000fc6e
    add esp, 4
    test al, al
    mov eax, dword ptr [g_101d1b2c]
    je L1
    mov eax, dword ptr [g_101d1b30]
    pop esi
    ret
FUN_100171f0 ENDP
END