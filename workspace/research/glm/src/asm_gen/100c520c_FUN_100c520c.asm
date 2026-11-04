; FUN_100c520c @ 0x100c520c — auto-synthesized
    sub_1006a743 PROTO C
    sub_1006a74e PROTO C
    sub_10086b35 PROTO C
    sub_100f787c PROTO C
    sub_100f7887 PROTO C
.CODE
FUN_100c520c PROC
    mov edi, edi
    push esi
    mov esi, ecx
    push edi
    push dword ptr [esi + 0x10c]
    mov dword ptr [esi], 0x1011a3b8
    call sub_100f787c
    push dword ptr [esi + 0x124]
    call sub_100f7887
    lea edi, [esi + 0x1b0]
    mov eax, dword ptr [edi]
    test eax, eax
    pop ecx
    pop ecx
    je L0
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    and dword ptr [edi], 0
    lea ecx, [esi + 0x1d4]
    call sub_1006a743
    lea ecx, [esi + 0x1b4]
    call sub_1006a74e
    pop edi
    mov ecx, esi
    pop esi
    jmp sub_10086b35
FUN_100c520c ENDP
END