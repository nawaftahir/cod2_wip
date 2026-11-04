.686
.MODEL FLAT, C
EXTRN g_1076AC9C:DWORD
.CODE
__isatty PROC
    mov eax, dword ptr [esp + 4]
    cmp eax, dword ptr [g_1076AC9C]
    jb L0
    xor eax, eax
    ret
L0:
    mov ecx, eax
    and eax, 31
    sar ecx, 5
    mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    lea eax, [eax + eax*8]
    movsx eax, byte ptr [ecx + eax*4 + 4]
    and eax, 64
    ret
__isatty ENDP
END
