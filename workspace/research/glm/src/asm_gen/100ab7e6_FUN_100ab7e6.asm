; FUN_100ab7e6 @ 0x100ab7e6 — auto-synthesized
    sub_100a6e77 PROTO C
    sub_100a983c PROTO C
    sub_100ba075 PROTO C
.CODE
FUN_100ab7e6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push esi
    mov esi, ecx
    push dword ptr [esi + 0xc]
    push dword ptr [esi + 0x18]
    call sub_100a983c
    xor ecx, ecx
    cmp eax, ecx
    mov dword ptr [ebp - 8], eax
    jl L0
    xor eax, eax
    cmp dword ptr [esi + 0xc], ecx
    jbe L1
    mov edx, dword ptr [esi + 0x18]
    mov edx, dword ptr [edx + eax*4]
    mov dword ptr [edx + 0x28], ecx
    mov edx, dword ptr [esi + 0x18]
    mov edx, dword ptr [edx + eax*4]
    inc eax
    mov dword ptr [edx + 0x24], ecx
    cmp eax, dword ptr [esi + 0xc]
    jb L2
    cmp dword ptr [esi + 0xc], ecx
    mov dword ptr [ebp - 4], ecx
    jbe L0
    push ebx
    push edi
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + 0x18]
    mov edi, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edi]
    and edx, 0xfff00000
    push edx
    call sub_100a6e77
    test eax, eax
    jne L3
    cmp edx, 0x11000000
    jne L4
    mov ebx, dword ptr [edi + 0x24]
    push 1
    push edi
    push ecx
    mov ecx, esi
    call sub_100ba075
    mov dword ptr [edi + 0x24], ebx
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 0xc]
    jb L5
    pop edi
    pop ebx
    mov eax, dword ptr [ebp - 8]
    pop esi
    leave
    ret
FUN_100ab7e6 ENDP
END