; __cintrindisp1 @ 0x101041fe — auto-synthesized
    EXTRN g_101a55b8:DWORD
    sub_10102d1f PROTO C
    sub_101042bc PROTO C
.CODE
__cintrindisp1 PROC
    push ebp
    mov ebp, esp
    add esp, 0xfffffd30
    push ebx
    wait
    fnstcw word ptr [ebp - 0xa4]
    cmp dword ptr [g_101a55b8], 0
    je L0
    call sub_10102d1f
    or byte ptr [ebp - 0x2c8], 1
    and byte ptr [ebp - 0x2c8], 0xfd
    call sub_101042bc
    pop ebx
    leave
    ret
    fst qword ptr [ebp - 0x86]
    jmp L1
__cintrindisp1 ENDP
END