; FUN_101061c8 @ 0x101061c8 — auto-synthesized
.CODE
FUN_101061c8 PROC
    push edi
    mov edi, dword ptr [esp + 8]
    xor eax, eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    pop edi
    ret
FUN_101061c8 ENDP
END