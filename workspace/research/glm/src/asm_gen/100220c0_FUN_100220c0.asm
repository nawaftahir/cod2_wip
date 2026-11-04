; FUN_100220c0 @ 0x100220c0 — auto-synthesized
    EXTRN g_1042e778:DWORD
.CODE
FUN_100220c0 PROC
    mov eax, dword ptr [g_1042e778]
    mov edx, dword ptr [eax + 0x30000]
    push esi
    mov esi, dword ptr [eax + 0x30004]
    mov ecx, 0x30000
    sub ecx, edx
    lea ecx, [ecx + esi - 0x2000]
    cmp ecx, 4
    pop esi
    jge L0
    mov dword ptr [eax + 0x30008], 0
    ret
    lea ecx, [edx + eax]
    add edx, 4
    mov dword ptr [eax + 0x30000], edx
    mov dword ptr [eax + 0x30008], ecx
    mov word ptr [ecx], 0x19
    mov word ptr [ecx + 2], 4
    ret
FUN_100220c0 ENDP
END