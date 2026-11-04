; FUN_10063acc @ 0x10063acc — auto-synthesized
    sub_10063a89 PROTO C
    sub_10067777 PROTO C
    sub_1008233f PROTO C
    sub_10082689 PROTO C
    sub_100f788d PROTO C
.CODE
FUN_10063acc PROC
    mov edi, edi
    push esi
    mov esi, ecx
    mov ecx, dword ptr [esi + 0x38]
    test ecx, ecx
    je L0
    push 1
    call sub_10063a89
    push edi
    mov edi, dword ptr [esi + 0x6c]
    test edi, edi
    je L1
    mov ecx, edi
    call L2
    push edi
    call sub_100f788d
    pop ecx
    cmp dword ptr [esi + 0x58], 0
    pop edi
    je L3
    mov ecx, dword ptr [esi + 0x64]
    test ecx, ecx
    je L3
    mov eax, dword ptr [esi + 0x58]
    mov edx, dword ptr [eax]
    push ecx
    push eax
    call dword ptr [edx + 4]
    lea ecx, [esi + 0x4c]
    call sub_1008233f
    lea ecx, [esi + 0x3c]
    call sub_10082689
    mov ecx, esi
    pop esi
    jmp sub_10067777
FUN_10063acc ENDP
END