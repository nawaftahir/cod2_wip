; __ms_p5_mp_test_fdiv @ 0x100fe85d — auto-synthesized
    EXTRN fp_1010c04c:DWORD
    EXTRN fp_1010c07c:DWORD
    sub_100fe846 PROTO C
.CODE
__ms_p5_mp_test_fdiv PROC
    push 0x1017ce2c
    call dword ptr [fp_1010c07c]
    test eax, eax
    je L0
    push 0x1017ce10
    push eax
    call dword ptr [fp_1010c04c]
    test eax, eax
    je L0
    push 0
    call eax
    ret
    jmp sub_100fe846
__ms_p5_mp_test_fdiv ENDP
END