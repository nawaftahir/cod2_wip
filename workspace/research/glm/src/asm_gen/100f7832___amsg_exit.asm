; __amsg_exit @ 0x100f7832 — auto-synthesized
    EXTRN fp_101a4610:DWORD
    EXTRN g_101add88:DWORD
    EXTRN g_101add8c:DWORD
    sub_100fe213 PROTO C
    sub_100fe3ab PROTO C
.CODE
__amsg_exit PROC
    mov eax, dword ptr [g_101add88]
    cmp eax, 1
    je L0
    test eax, eax
    jne L1
    cmp dword ptr [g_101add8c], 1
    jne L1
    call sub_100fe3ab
    push dword ptr [esp + 4]
    call sub_100fe213
    push 0xff
    call dword ptr [fp_101a4610]
__amsg_exit ENDP
END