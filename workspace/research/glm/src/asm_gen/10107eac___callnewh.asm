; __callnewh @ 0x10107eac — auto-synthesized
    EXTRN g_101ae234:DWORD
.CODE
__callnewh PROC
    mov eax, dword ptr [g_101ae234]
    test eax, eax
    je L0
    push dword ptr [esp + 4]
    call eax
    test eax, eax
    pop ecx
    je L0
    xor eax, eax
    inc eax
    ret
    xor eax, eax
    ret
__callnewh ENDP
END