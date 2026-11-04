; _mbtowc @ 0x10105fae — auto-synthesized
    EXTRN g_101a4684:DWORD
    sub_100f7ccd PROTO C
    sub_100fb119 PROTO C
    sub_10105f15 PROTO C
.CODE
_mbtowc PROC
    call sub_100fb119
    mov eax, dword ptr [eax + 0x64]
    cmp eax, dword ptr [g_101a4684]
    je L0
    call sub_100f7ccd
    push dword ptr [esp + 0xc]
    push dword ptr [esp + 0xc]
    push dword ptr [esp + 0xc]
    push eax
    call sub_10105f15
    add esp, 0x10
    ret
_mbtowc ENDP
END