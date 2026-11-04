; __isatty @ 0x10106b03 — auto-synthesized
    EXTRN g_1076ac9c:DWORD
.CODE
__isatty PROC
    mov eax, dword ptr [esp + 4]
    cmp eax, dword ptr [g_1076ac9c]
    jb L0
    xor eax, eax
    ret
    mov ecx, eax
    and eax, 0x1f
    sar ecx, 5
    mov ecx, dword ptr [ecx*4 + 0x1076aca0]
    lea eax, [eax + eax*8]
    movsx eax, byte ptr [ecx + eax*4 + 4]
    and eax, 0x40
    ret
__isatty ENDP
END