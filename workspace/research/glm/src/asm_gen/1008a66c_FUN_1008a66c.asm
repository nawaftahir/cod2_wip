; FUN_1008a66c @ 0x1008a66c — auto-synthesized
    sub_100f7876 PROTO C
    sub_100f787e PROTO C
    sub_100f7886 PROTO C
    sub_100f788e PROTO C
    sub_100f7896 PROTO C
    sub_100f789e PROTO C
    sub_100f78a6 PROTO C
    sub_100f78ae PROTO C
    sub_100f78b6 PROTO C
    sub_100f78be PROTO C
    sub_100f78c6 PROTO C
    sub_100f78ce PROTO C
    sub_100f78d6 PROTO C
    sub_100f78de PROTO C
    sub_100f78e6 PROTO C
    sub_100f78ee PROTO C
    sub_100f78f9 PROTO C
.CODE
FUN_1008a66c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push edi
    mov edi, dword ptr [ebp + 8]
    push dword ptr [edi + 8]
    call sub_100f7876
    push dword ptr [edi + 0xc]
    call sub_100f787e
    push dword ptr [edi + 0x10]
    call sub_100f7886
    push dword ptr [edi + 0x14]
    call sub_100f788e
    push dword ptr [edi + 0x18]
    call sub_100f7896
    push dword ptr [edi + 0x1c]
    call sub_100f789e
    push dword ptr [edi + 0x20]
    call sub_100f78a6
    push dword ptr [edi + 0x30]
    call sub_100f78ae
    push dword ptr [edi + 0x34]
    call sub_100f78b6
    push dword ptr [edi + 0x38]
    call sub_100f78be
    push dword ptr [edi + 0x3c]
    call sub_100f78c6
    push dword ptr [edi + 0x40]
    call sub_100f78ce
    push dword ptr [edi + 0x44]
    call sub_100f78d6
    push dword ptr [edi + 0x4c]
    call sub_100f78de
    push dword ptr [edi + 0x50]
    call sub_100f78e6
    push dword ptr [edi + 0x54]
    call sub_100f78ee
    add esp, 0x40
    push dword ptr [edi + 0x58]
    call sub_100f78f9
    pop ecx
    push 0x19
    pop ecx
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    pop edi
    pop ebp
    ret 4
FUN_1008a66c ENDP
END