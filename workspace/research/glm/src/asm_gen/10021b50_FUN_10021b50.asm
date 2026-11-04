; FUN_10021b50 @ 0x10021b50 — auto-synthesized
    EXTRN g_1042e778:DWORD
.CODE
FUN_10021b50 PROC
    mov eax, dword ptr [g_1042e778]
    mov edx, dword ptr [eax + 0x30000]
    mov ecx, 0x30000
    sub ecx, edx
    cmp ecx, 0x30
    jge L0
    mov dword ptr [eax + 0x30008], 0
    xor eax, eax
    jmp L1
    lea ecx, [edx + eax]
    add edx, 0x30
    mov dword ptr [eax + 0x30000], edx
    add dword ptr [eax + 0x30004], 0x30
    mov dword ptr [eax + 0x30008], ecx
    mov word ptr [ecx], 0xc
    mov word ptr [ecx + 2], 0x30
    mov eax, ecx
    mov ecx, dword ptr [esp + 4]
    mov dword ptr [eax + 0x2c], ecx
    mov ecx, dword ptr [edi]
    lea edx, [eax + 4]
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [edi + 4]
    mov dword ptr [edx + 4], ecx
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [edx + 8], ecx
    mov ecx, dword ptr [edi + 0xc]
    mov dword ptr [edx + 0xc], ecx
    mov edx, dword ptr [esp + 8]
    mov dword ptr [eax + 0x14], edx
    mov ecx, dword ptr [esi]
    add eax, 0x18
    mov dword ptr [eax], ecx
    mov edx, dword ptr [esi + 4]
    mov dword ptr [eax + 4], edx
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [eax + 8], ecx
    mov edx, dword ptr [esi + 0xc]
    mov dword ptr [eax + 0xc], edx
    mov ecx, dword ptr [esi + 0x10]
    mov dword ptr [eax + 0x10], ecx
    ret
FUN_10021b50 ENDP
END