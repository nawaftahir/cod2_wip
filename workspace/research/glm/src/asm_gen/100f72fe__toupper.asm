; _toupper @ 0x100f72fe — auto-synthesized
    EXTRN g_101a4684:DWORD
    sub_100f7254 PROTO C
    sub_100f7ccd PROTO C
    sub_100fb119 PROTO C
.CODE
_toupper PROC
    call sub_100fb119
    mov eax, dword ptr [eax + 0x64]
    cmp eax, dword ptr [g_101a4684]
    je L0
    call sub_100f7ccd
    push dword ptr [esp + 4]
    push eax
    call sub_100f7254
    pop ecx
    pop ecx
    ret
_toupper ENDP
END