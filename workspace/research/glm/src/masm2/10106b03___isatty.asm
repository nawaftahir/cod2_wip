.686
.MODEL FLAT, C
EXTRN EXTRN g_1076AC9C:DWORD:DWORD
.CODE
__isatty PROC
    mov mov eax, dword ptr [esp + 4]
    cmp cmp eax, dword ptr [g_1076AC9C]
    jb L0
    xor xor eax, eax
    ret ret
    mov mov ecx, eax
    and and eax, 31
    sar sar ecx, 5
    mov mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    lea lea eax, [eax + eax*8]
    movsx movsx eax, byte ptr [ecx + eax*4 + 4]
    and and eax, 64
    ret ret
__isatty ENDP
END
