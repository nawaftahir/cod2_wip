; FUN_10083255 @ 0x10083255 — auto-synthesized
    sub_100827cb PROTO C
.CODE
FUN_10083255 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 0xd
    mov edx, ecx
    call sub_100827cb
    mov eax, dword ptr [ebp + 8]
    and dword ptr [edx + 0x14], 0
    mov esi, dword ptr [ebp + 0x1c]
    and dword ptr [edx + 0x18], 0
    mov dword ptr [edx + 0x10], eax
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [edx + 0x1c], eax
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [edx + 0x20], eax
    mov eax, dword ptr [ebp + 0x14]
    mov dword ptr [edx + 0x24], eax
    mov eax, dword ptr [ebp + 0x18]
    push 8
    pop ecx
    mov dword ptr [edx + 0x28], eax
    lea edi, [edx + 0x30]
    mov dword ptr [edx], 0x1011005c
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    mov eax, edx
    pop esi
    pop ebp
    ret 0x18
FUN_10083255 ENDP
END