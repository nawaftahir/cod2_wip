; _isxdigit @ 0x100f862e — auto-synthesized
    EXTRN g_101a4684:DWORD
    sub_100f7ccd PROTO C
    sub_100fb119 PROTO C
    sub_100fd52f PROTO C
.CODE
_isxdigit PROC
    call sub_100fb119
    mov eax, dword ptr [eax + 0x64]
    cmp eax, dword ptr [g_101a4684]
    je L0
    call sub_100f7ccd
    cmp dword ptr [eax + 0x28], 1
    jle L1
    push 0x80
    push dword ptr [esp + 8]
    push eax
    call sub_100fd52f
    add esp, 0xc
    ret
    mov eax, dword ptr [eax + 0x48]
    mov ecx, dword ptr [esp + 4]
    movzx eax, byte ptr [eax + ecx*2]
    and eax, 0x80
    ret
_isxdigit ENDP
END