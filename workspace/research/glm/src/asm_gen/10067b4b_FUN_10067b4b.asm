; FUN_10067b4b @ 0x10067b4b — auto-synthesized
    sub_100f75d7 PROTO C
    sub_100f75f5 PROTO C
.CODE
FUN_10067b4b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    and dword ptr [ebp - 4], 0
    push ebx
    mov ebx, dword ptr [ebp + 8]
    and dword ptr [ebp + 8], 0
    push esi
    mov esi, ecx
    cmp ebx, dword ptr [esi + 4]
    push edi
    mov edi, ebx
    jae L0
    cmp dword ptr [ebp + 8], 0
    jne L1
    movsx eax, byte ptr [edi]
    push eax
    call sub_100f75d7
    cmp eax, 0x75
    pop ecx
    jne L1
    mov dword ptr [ebp + 8], 1
    jmp L2
    cmp dword ptr [ebp - 4], 0
    jne L0
    movsx eax, byte ptr [edi]
    push eax
    call sub_100f75f5
    cmp eax, 0x6c
    pop ecx
    jne L0
    mov dword ptr [ebp - 4], 1
    inc edi
    cmp edi, dword ptr [esi + 4]
    jb L3
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L4
    cmp dword ptr [ebp + 8], 0
    je L5
    mov dword ptr [eax], 4
    jmp L4
    cmp dword ptr [ebp - 4], 0
    je L4
    mov dword ptr [eax], 3
    mov eax, edi
    pop edi
    pop esi
    sub eax, ebx
    pop ebx
    leave
    ret 8
FUN_10067b4b ENDP
END