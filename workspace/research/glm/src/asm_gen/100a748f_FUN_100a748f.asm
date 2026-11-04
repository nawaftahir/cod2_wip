; FUN_100a748f @ 0x100a748f — auto-synthesized
    sub_100b9a0d PROTO C
.CODE
FUN_100a748f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0xf4
    and dword ptr [ebp - 4], 0
    and dword ptr [ebp - 0x14], 0
    push esi
    push edi
    mov esi, ecx
    mov edx, dword ptr [esi + 0x100]
    xor eax, eax
    push 3
    inc eax
    pop edi
    mov dword ptr [ebp - 0x10], eax
    mov dword ptr [ebp - 0xc], 2
    mov dword ptr [ebp - 8], edi
    mov ecx, dword ptr [edx]
    and ecx, 0xfffff
    cmp ecx, edi
    jne L0
    push eax
    push edi
    lea eax, [ebp - 0x14]
    push eax
    lea eax, [ebp - 0xf4]
    push eax
    lea eax, [ebp - 4]
    push eax
    lea eax, [ebp - 0x54]
    push eax
    push 0x10116a70
    push edx
    mov ecx, esi
    call sub_100b9a0d
    test eax, eax
    jne L0
    mov eax, dword ptr [esi + 0x100]
    mov edi, dword ptr [eax + 8]
    lea esi, [ebp - 0xf4]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    xor eax, eax
    pop edi
    pop esi
    leave
    ret
FUN_100a748f ENDP
END