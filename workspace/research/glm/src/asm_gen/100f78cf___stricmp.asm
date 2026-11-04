; __stricmp @ 0x100f78cf — auto-synthesized
    EXTRN g_101a4684:DWORD
    sub_100f7526 PROTO C
    sub_100f7534 PROTO C
    sub_100f7cd2 PROTO C
    sub_100fb11e PROTO C
    sub_100fe3fd PROTO C
.CODE
__stricmp PROC
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
    cmp dword ptr [ebx + 0x14], 0
    jne L1
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100fe3fd
    pop ecx
    pop ecx
    jmp L2
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [ebp + 0xc]
    movzx eax, byte ptr [esi]
    push eax
    push ebx
    call sub_100f7526
    mov dword ptr [ebp - 4], eax
    movzx eax, byte ptr [edi]
    push eax
    push ebx
    inc esi
    call sub_100f7534
    add esp, 0x10
    mov ecx, eax
    mov eax, dword ptr [ebp - 4]
    inc edi
    test eax, eax
    je L3
    cmp eax, ecx
    je L4
    pop edi
    sub eax, ecx
    pop esi
    pop ebx
    leave
    ret
__stricmp ENDP
END