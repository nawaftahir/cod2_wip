; FUN_10001780 @ 0x10001780 — auto-synthesized
    EXTRN g_101d1b9c:DWORD
    EXTRN g_1076a830:DWORD
.CODE
FUN_10001780 PROC
    mov eax, dword ptr [g_101d1b9c]
    mov eax, dword ptr [eax + 0x30]
    test eax, eax
    je L0
    lea esp, [esp]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [g_1076a830]
    xor eax, eax
    test ecx, ecx
    jne L1
    mov edx, dword ptr [g_101d1b9c]
    mov dword ptr [edx + 0x30], eax
    ret
FUN_10001780 ENDP
END