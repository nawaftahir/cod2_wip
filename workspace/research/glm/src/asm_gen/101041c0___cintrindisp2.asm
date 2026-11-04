; __cintrindisp2 @ 0x101041c0 — auto-synthesized
    EXTRN g_101a55b8:DWORD
    sub_10102d87 PROTO C
    sub_101042b6 PROTO C
.CODE
__cintrindisp2 PROC
    push ebp
    mov ebp, esp
    add esp, 0xfffffd30
    push ebx
    wait
    fnstcw word ptr [ebp - 0xa4]
    wait
    cmp dword ptr [g_101a55b8], 0
    je L0
    call sub_10102d87
    or byte ptr [ebp - 0x2c8], 3
    call sub_101042b6
    pop ebx
    leave
    ret
    fxch st(1)
    fst qword ptr [ebp - 0x86]
    fxch st(1)
    fst qword ptr [ebp - 0x7e]
    jmp L1
__cintrindisp2 ENDP
END