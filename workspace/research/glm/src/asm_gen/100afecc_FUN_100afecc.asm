; FUN_100afecc @ 0x100afecc — auto-synthesized
.CODE
FUN_100afecc PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [edx + 0x6c]
    movzx edx, byte ptr [edx + 0x6d]
    push esi
    mov esi, dword ptr [ebp + 0xc]
    mov dword ptr [esi], edx
    xor esi, esi
    and eax, 0xff
    inc esi
    cmp eax, esi
    jne L0
    cmp edx, dword ptr [ecx + 0x28]
    jmp L1
    push 3
    pop esi
    cmp eax, esi
    jne L2
    cmp edx, dword ptr [ecx + 0x3c]
    jae L2
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [eax], esi
    xor eax, eax
    jmp L3
    mov eax, 0x80004005
    pop esi
    pop ebp
    ret 0xc
FUN_100afecc ENDP
END