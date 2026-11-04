; R_ClearScreen @ 0x10021bf0 — auto-synthesized
    EXTRN g_1042e778:DWORD
.CODE
R_ClearScreen PROC
    mov eax, dword ptr [g_1042e778]
    mov edx, dword ptr [eax + 0x30000]
    mov ecx, 0x30000
    sub ecx, edx
    cmp ecx, 0x14
    jge L0
    xor ecx, ecx
    mov dword ptr [eax + 0x30008], ecx
    jmp L1
    lea ecx, [edx + eax]
    add edx, 0x14
    mov dword ptr [eax + 0x30000], edx
    add dword ptr [eax + 0x30004], 0x14
    mov dword ptr [eax + 0x30008], ecx
    mov word ptr [ecx], 0xd
    mov word ptr [ecx + 2], 0x14
    mov eax, dword ptr [esp + 4]
    mov edx, dword ptr [esp + 8]
    mov dword ptr [ecx + 4], eax
    mov eax, dword ptr [esp + 0xc]
    mov dword ptr [ecx + 8], edx
    mov edx, dword ptr [esp + 0x10]
    mov dword ptr [ecx + 0xc], eax
    mov dword ptr [ecx + 0x10], edx
    ret
R_ClearScreen ENDP
END