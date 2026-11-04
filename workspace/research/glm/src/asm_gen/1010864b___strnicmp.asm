; __strnicmp @ 0x1010864b — auto-synthesized
    EXTRN g_101a4684:DWORD
    sub_100f7530 PROTO C
    sub_100f753e PROTO C
    sub_100f7cd2 PROTO C
    sub_100fb11e PROTO C
    sub_10109d26 PROTO C
.CODE
__strnicmp PROC
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    call sub_100fb11e
    mov ebx, dword ptr [eax + 0x64]
    cmp ebx, dword ptr [g_101a4684]
    je L0
    call sub_100f7cd2
    mov ebx, eax
    cmp dword ptr [ebp + 0x10], 0
    je L1
    cmp dword ptr [ebx + 0x14], 0
    jne L2
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_10109d26
    add esp, 0xc
    jmp L3
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [ebp + 0xc]
    movzx eax, byte ptr [esi]
    push eax
    push ebx
    call sub_100f7530
    mov dword ptr [ebp - 4], eax
    movzx eax, byte ptr [edi]
    push eax
    push ebx
    inc esi
    call sub_100f753e
    add esp, 0x10
    inc edi
    dec dword ptr [ebp + 0x10]
    mov ecx, eax
    je L4
    cmp dword ptr [ebp - 4], 0
    je L4
    cmp dword ptr [ebp - 4], ecx
    je L5
    mov eax, dword ptr [ebp - 4]
    pop edi
    sub eax, ecx
    pop esi
    jmp L3
    xor eax, eax
    pop ebx
    leave
    ret
__strnicmp ENDP
END