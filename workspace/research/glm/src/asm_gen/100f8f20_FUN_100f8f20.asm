; FUN_100f8f20 @ 0x100f8f20 — auto-synthesized
    EXTRN g_1076adb0:DWORD
    sub_100f8fcd PROTO C
    sub_101030fb PROTO C
.CODE
FUN_100f8f20 PROC
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
    jmp sub_101030fb
    sub esp, 0x14
    fxch st(1)
    fstp qword ptr [esp]
    fst qword ptr [esp + 8]
    mov eax, dword ptr [esp + 0xc]
    call sub_100f8fcd
    add esp, 0x14
    ret
FUN_100f8f20 ENDP
END