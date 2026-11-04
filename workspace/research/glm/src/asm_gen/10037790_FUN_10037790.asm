; FUN_10037790 @ 0x10037790 — auto-synthesized
    EXTRN fp_101d49e0:DWORD
    EXTRN fp_101d4b14:DWORD
    EXTRN g_101d1b9c:DWORD
    EXTRN g_10764578:DWORD
    EXTRN g_1076457c:DWORD
    sub_10037690 PROTO C
.CODE
FUN_10037790 PROC
    mov eax, dword ptr [g_10764578]
    sub esp, 0x40
    test eax, eax
    je L0
    mov ecx, dword ptr [g_101d1b9c]
    test ecx, ecx
    je L0
    mov ecx, dword ptr [ecx]
    lea eax, [esp]
    call sub_10037690
    mov eax, dword ptr [g_1076457c]
    mov ecx, dword ptr [g_10764578]
    lea eax, [eax + eax*2]
    shl eax, 1
    push eax
    push ecx
    lea edx, [esp + 8]
    push edx
    call dword ptr [fp_101d4b14]
    mov eax, dword ptr [g_10764578]
    push eax
    call dword ptr [fp_101d49e0]
    add esp, 0x10
    xor ecx, ecx
    mov dword ptr [g_10764578], ecx
    mov dword ptr [g_1076457c], ecx
    add esp, 0x40
    ret
FUN_10037790 ENDP
END