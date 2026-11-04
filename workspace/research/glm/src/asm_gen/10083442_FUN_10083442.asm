; FUN_10083442 @ 0x10083442 — auto-synthesized
    sub_100827cb PROTO C
.CODE
FUN_10083442 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 0xe
    mov edx, ecx
    call sub_100827cb
    mov eax, dword ptr [ebp + 8]
    mov esi, dword ptr [ebp + 0x14]
    mov dword ptr [edx + 0x10], eax
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [edx + 0x18], eax
    mov eax, dword ptr [ebp + 0x10]
    push 8
    pop ecx
    mov dword ptr [edx + 0x1c], eax
    lea edi, [edx + 0x20]
    mov dword ptr [edx], 0x10110068
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    mov eax, edx
    pop esi
    pop ebp
    ret 0x10
FUN_10083442 ENDP
END