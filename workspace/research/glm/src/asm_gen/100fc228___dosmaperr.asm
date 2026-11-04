; __dosmaperr @ 0x100fc228 — auto-synthesized
    sub_100fb11a PROTO C
    sub_100fb141 PROTO C
    sub_100fb14f PROTO C
    sub_100fb170 PROTO C
    sub_100fb17e PROTO C
.CODE
__dosmaperr PROC
    push esi
    call sub_100fb11a
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [eax + 0xc], ecx
    xor esi, esi
    cmp ecx, dword ptr [esi*8 + 0x101a4c48]
    je L0
    inc esi
    cmp esi, 0x2d
    jb L1
    cmp ecx, 0x13
    jb L2
    cmp ecx, 0x24
    ja L2
    call sub_100fb141
    mov dword ptr [eax + 8], 0xd
    pop esi
    ret
    call sub_100fb14f
    mov ecx, dword ptr [esi*8 + 0x101a4c4c]
    mov dword ptr [eax + 8], ecx
    pop esi
    ret
    cmp ecx, 0xbc
    jb L3
    cmp ecx, 0xca
    ja L3
    call sub_100fb170
    mov dword ptr [eax + 8], 8
    pop esi
    ret
    call sub_100fb17e
    mov dword ptr [eax + 8], 0x16
    pop esi
    ret
__dosmaperr ENDP
END