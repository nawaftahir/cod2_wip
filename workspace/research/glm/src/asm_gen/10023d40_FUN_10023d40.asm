; FUN_10023d40 @ 0x10023d40 — auto-synthesized
    EXTRN g_10678510:DWORD
    sub_1001ffed PROTO C
.CODE
FUN_10023d40 PROC
    mov edx, dword ptr [g_10678510]
    mov ecx, esi
    sub ecx, edx
    mov eax, 0x8d3dcb09
    imul ecx
    add edx, ecx
    sar edx, 6
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    imul eax, eax, 0x34
    add eax, 0x10678ac4
    push eax
    mov eax, esi
    call sub_1001ffed
    pop ecx
    ret
FUN_10023d40 ENDP
END