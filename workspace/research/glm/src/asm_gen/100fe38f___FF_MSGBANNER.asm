; __FF_MSGBANNER @ 0x100fe38f — auto-synthesized
    EXTRN g_101add88:DWORD
    EXTRN g_101add8c:DWORD
    EXTRN g_101ae15c:DWORD
    sub_100fe20f PROTO C
    sub_100fe225 PROTO C
.CODE
__FF_MSGBANNER PROC
    mov eax, dword ptr [g_101add88]
    cmp eax, 1
    je L0
    test eax, eax
    jne L1
    cmp dword ptr [g_101add8c], 1
    jne L1
    push 0xfc
    call sub_100fe20f
    mov eax, dword ptr [g_101ae15c]
    test eax, eax
    pop ecx
    je L2
    call eax
    push 0xff
    call sub_100fe225
    pop ecx
    ret
__FF_MSGBANNER ENDP
END