; R_LocateDebugLines @ 0x10005a40 — auto-synthesized
    EXTRN fp_101d49dc:DWORD
    EXTRN g_101ae500:DWORD
    EXTRN g_101ae504:DWORD
    EXTRN g_101ae508:DWORD
    EXTRN g_10678504:DWORD
.CODE
R_LocateDebugLines PROC
    mov eax, dword ptr [g_101ae500]
    test eax, eax
    jne L0
    mov eax, dword ptr [g_101ae508]
    lea eax, [eax + eax*4]
    shl eax, 3
    push eax
    call dword ptr [fp_101d49dc]
    add esp, 4
    xor ecx, ecx
    mov dword ptr [g_101ae500], eax
    mov dword ptr [g_101ae504], ecx
    jmp L1
    mov ecx, dword ptr [g_101ae504]
    cmp ecx, dword ptr [g_101ae508]
    je L2
    lea ecx, [ecx + ecx*4]
    lea eax, [eax + ecx*8]
    mov ecx, dword ptr [esp + 4]
    mov edx, dword ptr [ecx]
    mov dword ptr [eax], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 4], edx
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [eax + 8], ecx
    mov eax, dword ptr [g_101ae504]
    mov ecx, dword ptr [esp + 0xc]
    lea edx, [eax + eax*4]
    mov eax, dword ptr [g_101ae500]
    lea eax, [eax + edx*8 + 0xc]
    mov edx, dword ptr [ecx]
    mov dword ptr [eax], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 4], edx
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [eax + 8], ecx
    mov eax, dword ptr [g_101ae504]
    mov ecx, dword ptr [esp + 8]
    lea edx, [eax + eax*4]
    mov eax, dword ptr [g_101ae500]
    mov dword ptr [eax + edx*8 + 0x1c], ecx
    mov eax, dword ptr [g_101ae504]
    mov ecx, dword ptr [g_10678504]
    lea edx, [eax + eax*4]
    mov eax, dword ptr [g_101ae500]
    mov dword ptr [eax + edx*8 + 0x20], ecx
    mov eax, dword ptr [g_101ae504]
    mov ecx, dword ptr [g_101ae500]
    lea edx, [eax + eax*4]
    mov eax, dword ptr [esp + 0x10]
    mov dword ptr [ecx + edx*8 + 0x24], eax
    inc dword ptr [g_101ae504]
    ret
R_LocateDebugLines ENDP
END