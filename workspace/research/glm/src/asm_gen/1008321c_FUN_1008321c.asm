; FUN_1008321c @ 0x1008321c — auto-synthesized
    sub_100827c7 PROTO C
.CODE
FUN_1008321c PROC
    mov edi, edi
    push edi
    push 0xd
    mov edx, ecx
    call sub_100827c7
    xor eax, eax
    push 8
    pop ecx
    mov dword ptr [edx + 0x10], eax
    mov dword ptr [edx + 0x14], eax
    mov dword ptr [edx + 0x18], eax
    mov dword ptr [edx + 0x1c], eax
    mov dword ptr [edx + 0x20], eax
    mov dword ptr [edx + 0x24], eax
    lea edi, [edx + 0x30]
    mov dword ptr [edx], 0x1011005c
    mov dword ptr [edx + 0x28], 1
    rep stosd dword ptr es:[edi], eax
    mov eax, edx
    pop edi
    ret
FUN_1008321c ENDP
END