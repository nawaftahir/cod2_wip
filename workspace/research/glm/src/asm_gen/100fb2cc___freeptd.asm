; __freeptd @ 0x100fb2cc — auto-synthesized
    EXTRN fp_101addbc:DWORD
    EXTRN fp_101addc0:DWORD
    EXTRN g_101a4898:DWORD
    sub_100fb1a5 PROTO C
.CODE
__freeptd PROC
    mov ecx, dword ptr [g_101a4898]
    cmp ecx, -1
    je L0
    mov eax, dword ptr [esp + 4]
    test eax, eax
    jne L1
    push ecx
    call dword ptr [fp_101addbc]
    push eax
    call sub_100fb1a5
    push 0
    push dword ptr [g_101a4898]
    call dword ptr [fp_101addc0]
    ret
__freeptd ENDP
END