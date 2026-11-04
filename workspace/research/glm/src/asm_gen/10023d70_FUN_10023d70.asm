; FUN_10023d70 @ 0x10023d70 — auto-synthesized
    EXTRN g_10678510:DWORD
    sub_1001faa8 PROTO C
    sub_1001fff1 PROTO C
.CODE
FUN_10023d70 PROC
    mov edx, dword ptr [g_10678510]
    mov ecx, edi
    sub ecx, edx
    mov eax, 0x8d3dcb09
    imul ecx
    add edx, ecx
    sar edx, 6
    mov eax, edx
    shr eax, 0x1f
    push esi
    add eax, edx
    mov esi, eax
    imul esi, esi, 0x34
    add esi, 0x10678ac4
    push esi
    mov eax, edi
    call sub_1001fff1
    push edi
    push esi
    call sub_1001faa8
    add esp, 0xc
    pop esi
    ret
FUN_10023d70 ENDP
END