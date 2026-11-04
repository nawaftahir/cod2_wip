; FUN_10099913 @ 0x10099913 — auto-synthesized
.CODE
FUN_10099913 PROC
    mov eax, dword ptr [ecx + 0x14]
    test eax, eax
    jne L0
    ret
    mov eax, dword ptr [eax + 8]
    ret
FUN_10099913 ENDP
END