; __fpmath @ 0x100f7981 — auto-synthesized
    EXTRN g_101add94:DWORD
    sub_100f793e PROTO C
    sub_100facfb PROTO C
    sub_100fe867 PROTO C
.CODE
__fpmath PROC
    call sub_100f793e
    call sub_100fe867
    cmp dword ptr [esp + 4], 0
    mov dword ptr [g_101add94], eax
    je L0
    call sub_100facfb
    fnclex
    ret
__fpmath ENDP
END