; R_ClearScene @ 0x10025510 — auto-synthesized
    EXTRN g_101da9c8:DWORD
    EXTRN g_10678500:DWORD
    EXTRN g_1067850c:DWORD
    EXTRN g_10678510:DWORD
    EXTRN g_10678514:DWORD
    EXTRN g_10678ab8:DWORD
    EXTRN g_10678abc:DWORD
    EXTRN g_10678ac0:DWORD
    EXTRN g_10692a5c:DWORD
    sub_1000a847 PROTO C
.CODE
R_ClearScene PROC
    mov eax, dword ptr [g_10678500]
    inc eax
    xor ecx, ecx
    mov dword ptr [g_10678500], eax
    mov eax, dword ptr [g_101da9c8]
    mov dword ptr [g_10678514], ecx
    mov dword ptr [g_10678ab8], ecx
    mov edx, dword ptr [eax + 4]
    lea edx, [eax + edx*8 + 8]
    mov dword ptr [g_10678abc], edx
    mov dword ptr [g_10678ac0], ecx
    mov dword ptr [g_1067850c], ecx
    mov edx, dword ptr [eax + 0xa000c]
    imul edx, edx, 0x74
    lea eax, [edx + eax + 0xa0010]
    mov dword ptr [g_10678510], eax
    mov dword ptr [g_10692a5c], ecx
    jmp sub_1000a847
R_ClearScene ENDP
END