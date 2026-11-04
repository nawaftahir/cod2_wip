; FUN_10022110 @ 0x10022110 — auto-synthesized
    EXTRN g_1042e778:DWORD
.CODE
FUN_10022110 PROC
    mov eax, dword ptr [g_1042e778]
    mov edx, dword ptr [eax + 0x30000]
    push esi
    mov esi, dword ptr [eax + 0x30004]
    mov ecx, 0x30000
    sub ecx, edx
    lea ecx, [ecx + esi - 0x2000]
    cmp ecx, 8
    pop esi
    jge L0
    mov dword ptr [eax + 0x30008], 0
    ret
    lea ecx, [edx + eax]
    mov dword ptr [eax + 0x30008], ecx
    add edx, 8
    mov dword ptr [eax + 0x30000], edx
    mov eax, dword ptr [esp + 4]
    mov word ptr [ecx], 0x1a
    mov word ptr [ecx + 2], 8
    mov dword ptr [ecx + 4], eax
    ret
FUN_10022110 ENDP
END