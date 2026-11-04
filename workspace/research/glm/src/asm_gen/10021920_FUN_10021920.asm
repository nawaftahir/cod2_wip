; FUN_10021920 @ 0x10021920 — auto-synthesized
    EXTRN g_1042e778:DWORD
.CODE
FUN_10021920 PROC
    mov eax, dword ptr [g_1042e778]
    mov edx, dword ptr [eax + 0x30000]
    push edi
    mov edi, dword ptr [eax + 0x30004]
    mov ecx, 0x30000
    sub ecx, edx
    lea ecx, [ecx + edi - 0x2000]
    cmp ecx, 8
    pop edi
    jge L0
    mov dword ptr [eax + 0x30008], 0
    xor eax, eax
    mov dword ptr [eax + 4], esi
    ret
    lea ecx, [edx + eax]
    add edx, 8
    mov dword ptr [eax + 0x30000], edx
    mov dword ptr [eax + 0x30008], ecx
    mov word ptr [ecx], 0x18
    mov word ptr [ecx + 2], 8
    mov dword ptr [ecx + 4], esi
    ret
FUN_10021920 ENDP
END