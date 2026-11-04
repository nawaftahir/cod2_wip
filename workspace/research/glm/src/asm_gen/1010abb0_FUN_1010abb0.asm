; FUN_1010abb0 @ 0x1010abb0 — auto-synthesized
    EXTRN g_1076adb0:DWORD
    sub_10102ffe PROTO C
    sub_1010ac53 PROTO C
    sub_1010ae5b PROTO C
.CODE
FUN_1010abb0 PROC
    cmp dword ptr [g_1076adb0], 0
    je L0
    sub esp, 8
    stmxcsr dword ptr [esp + 4]
    mov eax, dword ptr [esp + 4]
    and eax, 0x1f80
    cmp eax, 0x1f80
    jne L1
    fnstcw word ptr [esp]
    mov ax, word ptr [esp]
    and ax, 0x7f
    cmp ax, 0x7f
    lea esp, [esp + 8]
    jne L0
    jmp sub_1010ae5b
    sub esp, 0xc
    fst qword ptr [esp]
    call sub_10102ffe
    call sub_1010ac53
    add esp, 0xc
    ret
FUN_1010abb0 ENDP
END