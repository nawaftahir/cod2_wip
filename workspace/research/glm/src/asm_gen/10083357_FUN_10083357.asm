; FUN_10083357 @ 0x10083357 — auto-synthesized
    sub_100827cc PROTO C
    sub_10082856 PROTO C
.CODE
FUN_10083357 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    push 0xe
    mov ebx, ecx
    call sub_100827cc
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [ebx], 0x10110068
    lea eax, [ebx + 0x10]
    mov edi, eax
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    cmp dword ptr [eax], 4
    mov esi, dword ptr [ebp + 0xc]
    push 8
    lea edi, [ebx + 0x20]
    pop ecx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    jne L0
    mov eax, dword ptr [ebx + 0x18]
    test eax, eax
    je L0
    push eax
    call sub_10082856
    mov dword ptr [ebx + 0x18], eax
    pop edi
    pop esi
    mov eax, ebx
    pop ebx
    pop ebp
    ret 8
FUN_10083357 ENDP
END