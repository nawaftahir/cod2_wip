; FUN_10104e4c @ 0x10104e4c — auto-synthesized
    EXTRN g_101a5364:DWORD
    sub_10104c63 PROTO C
    sub_10104cec PROTO C
.CODE
FUN_10104e4c PROC
    push edx
    sub esp, 0x30
    fstp xword ptr [esp + 0x18]
    fstp xword ptr [esp]
    xor edx, edx
    mov eax, dword ptr [esp + 6]
    test eax, 0x7fff0000
    je L0
    call sub_10104c63
    add esp, 0x30
    pop edx
    ret
    fld xword ptr [esp]
    fld xword ptr [esp + 0x18]
    mov eax, dword ptr [esp]
    or eax, dword ptr [esp + 4]
    je L1
    fxch st(1)
    fstp xword ptr [esp + 0xc]
    fld xword ptr [esp]
    fxch st(1)
    or edx, 2
    fnstcw word ptr [esp + 0x24]
    mov eax, dword ptr [esp + 0x24]
    or eax, 0x33f
    mov dword ptr [esp + 0x28], eax
    fldcw word ptr [esp + 0x28]
    mov eax, dword ptr [esp + 0x20]
    and eax, 0x7fff
    cmp eax, 0x7fbe
    ja L2
    or edx, 1
    fmul qword ptr [g_101a5364]
    fstp xword ptr [esp + 0x18]
    fmul qword ptr [g_101a5364]
    fstp xword ptr [esp]
    jmp L3
    fnstcw word ptr [esp + 0x24]
    mov eax, dword ptr [esp + 0x24]
    or eax, 0x300
    mov dword ptr [esp + 0x28], eax
    fldcw word ptr [esp + 0x28]
    fstp st(0)
    fmul qword ptr [g_101a5364]
    fstp xword ptr [esp]
    fldcw word ptr [esp + 0x24]
    call sub_10104cec
    add esp, 0x30
    pop edx
    ret
    fprem
    add esp, 0x30
    pop edx
    ret
FUN_10104e4c ENDP
END