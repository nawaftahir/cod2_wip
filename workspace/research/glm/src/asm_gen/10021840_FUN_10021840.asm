; FUN_10021840 @ 0x10021840 — auto-synthesized
    EXTRN g_1042e778:DWORD
.CODE
FUN_10021840 PROC
    mov eax, dword ptr [g_1042e778]
    mov edx, dword ptr [eax + 0x30000]
    mov ecx, 0x30000
    sub ecx, edx
    cmp ecx, 8
    jge L0
    mov dword ptr [eax + 0x30008], 0
    xor eax, eax
    mov dword ptr [eax + 4], esi
    ret
    lea ecx, [edx + eax]
    add edx, 8
    mov dword ptr [eax + 0x30000], edx
    add dword ptr [eax + 0x30004], 8
    mov dword ptr [eax + 0x30008], ecx
    mov word ptr [ecx], 0xe
    mov word ptr [ecx + 2], 8
    mov dword ptr [ecx + 4], esi
    ret
FUN_10021840 ENDP
END