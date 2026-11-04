; _isspace @ 0x100f866d — auto-synthesized
    EXTRN g_101a4684:DWORD
    sub_100f7ccd PROTO C
    sub_100fb119 PROTO C
    sub_100fd52c PROTO C
.CODE
_isspace PROC
    call sub_100fb119
    mov eax, dword ptr [eax + 0x64]
    cmp eax, dword ptr [g_101a4684]
    je L0
    call sub_100f7ccd
    cmp dword ptr [eax + 0x28], 1
    jle L1
    push 8
    push dword ptr [esp + 8]
    push eax
    call sub_100fd52c
    add esp, 0xc
    ret
    mov eax, dword ptr [eax + 0x48]
    mov ecx, dword ptr [esp + 4]
    movzx eax, byte ptr [eax + ecx*2]
    and eax, 8
    ret
_isspace ENDP
END