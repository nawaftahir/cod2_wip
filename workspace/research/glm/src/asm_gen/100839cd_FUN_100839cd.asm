; FUN_100839cd @ 0x100839cd — auto-synthesized
    sub_1006507a PROTO C
    sub_10082e26 PROTO C
.CODE
FUN_100839cd PROC
    mov edi, edi
    push esi
    push 0x24
    mov esi, ecx
    call sub_1006507a
    test eax, eax
    je L0
    mov ecx, eax
    call sub_10082e26
    jmp L1
    xor eax, eax
    test eax, eax
    jne L2
    pop esi
    ret
    mov ecx, dword ptr [esi + 0x10]
    mov dword ptr [eax + 0x10], ecx
    mov ecx, dword ptr [esi + 0x14]
    mov dword ptr [eax + 0x14], ecx
    mov ecx, dword ptr [esi + 0x18]
    mov dword ptr [eax + 0x18], ecx
    mov ecx, dword ptr [esi + 0x1c]
    mov dword ptr [eax + 0x1c], ecx
    mov ecx, dword ptr [esi + 0x20]
    mov dword ptr [eax + 0x20], ecx
    pop esi
    ret
FUN_100839cd ENDP
END