; FUN_10024050 @ 0x10024050 — auto-synthesized
    sub_1010a8cd PROTO C
.CODE
FUN_10024050 PROC
    sub esp, 8
    movzx eax, al
    movzx ecx, cl
    sub ecx, eax
    mov dword ptr [esp], ecx
    mov dword ptr [esp + 4], eax
    fild dword ptr [esp]
    fmul dword ptr [esp + 0xc]
    fiadd dword ptr [esp + 4]
    add esp, 8
    jmp sub_1010a8cd
FUN_10024050 ENDP
END