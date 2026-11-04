; FUN_100998ff @ 0x100998ff — auto-synthesized
.CODE
FUN_100998ff PROC
    mov eax, dword ptr [ecx + 0x14]
    test eax, eax
    je L0
    mov edx, dword ptr [eax + 0xc]
    mov dword ptr [ecx + 0x14], edx
    and dword ptr [eax + 0xc], 0
    xor eax, eax
    ret
FUN_100998ff ENDP
END