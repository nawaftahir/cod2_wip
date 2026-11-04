; FUN_10021ae0 @ 0x10021ae0 — auto-synthesized
    EXTRN g_1042e778:DWORD
.CODE
FUN_10021ae0 PROC
    mov eax, dword ptr [g_1042e778]
    mov edx, dword ptr [eax + 0x30000]
    push esi
    mov ecx, 0x30000
    sub ecx, edx
    mov esi, 0x48
    cmp ecx, esi
    push edi
    jge L0
    mov dword ptr [eax + 0x30008], 0
    xor eax, eax
    jmp L1
    lea ecx, [edx + eax]
    add edx, 0x48
    mov dword ptr [eax + 0x30000], edx
    add dword ptr [eax + 0x30004], esi
    mov dword ptr [eax + 0x30008], ecx
    mov word ptr [ecx], 9
    mov word ptr [ecx + 2], si
    mov eax, ecx
    mov esi, dword ptr [esp + 0xc]
    lea edi, [eax + 4]
    mov ecx, 0x10
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [esp + 0x10]
    pop edi
    mov dword ptr [eax + 0x44], ecx
    pop esi
    ret
FUN_10021ae0 ENDP
END