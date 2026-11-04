; FUN_100fbfb0 @ 0x100fbfb0 — auto-synthesized
    EXTRN fp_1010c03c:DWORD
.CODE
FUN_100fbfb0 PROC
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push dword ptr [eax*8 + 0x101a4b28]
    call dword ptr [fp_1010c03c]
    pop ebp
    ret
FUN_100fbfb0 ENDP
END