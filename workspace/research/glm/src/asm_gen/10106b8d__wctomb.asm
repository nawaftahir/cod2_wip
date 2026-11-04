; _wctomb @ 0x10106b8d — auto-synthesized
    EXTRN g_101a4684:DWORD
    sub_100f7ccd PROTO C
    sub_100fb119 PROTO C
    sub_10106b50 PROTO C
.CODE
_wctomb PROC
    call sub_100fb119
    mov eax, dword ptr [eax + 0x64]
    cmp eax, dword ptr [g_101a4684]
    je L0
    call sub_100f7ccd
    push dword ptr [esp + 8]
    push dword ptr [esp + 8]
    push eax
    call sub_10106b50
    add esp, 0xc
    ret
_wctomb ENDP
END