; FUN_100833a3 @ 0x100833a3 — auto-synthesized
    sub_100827cb PROTO C
.CODE
FUN_100833a3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 0xe
    mov edx, ecx
    call sub_100827cb
    mov eax, dword ptr [ebp + 8]
    mov esi, dword ptr [ebp + 0x10]
    mov dword ptr [edx + 0x10], eax
    mov eax, dword ptr [ebp + 0xc]
    push 8
    pop ecx
    mov dword ptr [edx + 0x18], eax
    lea edi, [edx + 0x20]
    mov dword ptr [edx], 0x10110068
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    mov eax, edx
    pop esi
    pop ebp
    ret 0xc
FUN_100833a3 ENDP
END