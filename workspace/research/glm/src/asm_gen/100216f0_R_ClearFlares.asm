; R_ClearFlares @ 0x100216f0 — auto-synthesized
    EXTRN g_1042e778:DWORD
.CODE
R_ClearFlares PROC
    mov eax, dword ptr [g_1042e778]
    mov edx, dword ptr [eax + 0x30000]
    mov ecx, 0x30000
    push edi
    sub ecx, edx
    xor edi, edi
    cmp ecx, 0x14
    jge L0
    mov dword ptr [eax + 0x30008], edi
    xor ecx, ecx
    jmp L1
    lea ecx, [edx + eax]
    add edx, 0x14
    mov dword ptr [eax + 0x30000], edx
    add dword ptr [eax + 0x30004], 0x14
    mov dword ptr [eax + 0x30008], ecx
    mov word ptr [ecx], 4
    mov word ptr [ecx + 2], 0x14
    mov eax, dword ptr [esp + 8]
    cmp eax, edi
    je L2
    mov edx, dword ptr [eax]
    mov dword ptr [ecx + 4], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [ecx + 8], edx
    mov edx, dword ptr [eax + 8]
    mov dword ptr [ecx + 0xc], edx
    mov eax, dword ptr [eax + 0xc]
    mov dword ptr [ecx + 0x10], eax
    pop edi
    ret
    mov dword ptr [ecx + 4], edi
    mov dword ptr [ecx + 8], edi
    mov dword ptr [ecx + 0xc], edi
    mov dword ptr [ecx + 0x10], edi
    pop edi
    ret
R_ClearFlares ENDP
END