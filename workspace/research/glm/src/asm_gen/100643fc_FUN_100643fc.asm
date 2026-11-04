; FUN_100643fc @ 0x100643fc — auto-synthesized
    sub_10063aca PROTO C
    sub_10067c6a PROTO C
.CODE
FUN_100643fc PROC
    mov edi, edi
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 0x268]
    mov ecx, dword ptr [eax + 0x38]
    test ecx, ecx
    jne L0
    push 0x1010c6dc
    push 0x5e6
    lea eax, [esi + 0x278]
    push eax
    lea eax, [esi + 0x18]
    push eax
    call sub_10067c6a
    add esp, 0x10
    mov dword ptr [esi + 0x44], 1
    mov eax, 0x80004005
    pop esi
    ret
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [esi + 0x54], edx
    mov edx, dword ptr [ecx + 0xc]
    mov dword ptr [eax + 0x38], edx
    and dword ptr [ecx + 0xc], 0
    push 1
    call sub_10063aca
    xor eax, eax
    pop esi
    ret
FUN_100643fc ENDP
END