; FUN_100a97cd @ 0x100a97cd — auto-synthesized
    sub_10085810 PROTO C
.CODE
FUN_100a97cd PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebx + 0x1c]
    test al, 7
    jne L0
    add eax, 8
    push eax
    call sub_10085810
    test eax, eax
    jne L1
    mov eax, 0x8007000e
    jmp L2
    mov ecx, dword ptr [ebx + 0x1c]
    shl ecx, 2
    push esi
    mov esi, dword ptr [ebx + 0x20]
    mov edx, ecx
    push edi
    shr ecx, 2
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    pop edi
    mov dword ptr [ebx + 0x20], eax
    pop esi
    mov eax, dword ptr [ebx + 0x1c]
    mov ecx, dword ptr [ebx + 0x20]
    mov edx, dword ptr [ebp + 0xc]
    mov dword ptr [ecx + eax*4], edx
    inc dword ptr [ebx + 0x1c]
    xor eax, eax
    pop ebx
    pop ebp
    ret 8
FUN_100a97cd ENDP
END