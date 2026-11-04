; FUN_10055e00 @ 0x10055e00 — auto-synthesized
    sub_10055dbe PROTO C
.CODE
FUN_10055e00 PROC
    mov eax, dword ptr [ebx + 0x6c]
    push ebp
    mov ebp, dword ptr [ebx + 0x1b0]
    push esi
    xor esi, esi
    test eax, eax
    jle L0
    push edi
    lea edi, [ebp + 0x34]
    mov ecx, dword ptr [edi - 0x14]
    xor eax, eax
    test esi, esi
    jle L1
    lea edx, [ebp + 0x20]
    cmp ecx, dword ptr [edx]
    je L2
    inc eax
    add edx, 4
    cmp eax, esi
    jl L3
    jmp L1
    mov eax, dword ptr [ebp + eax*4 + 0x34]
    test eax, eax
    jne L4
    mov eax, ebx
    call sub_10055dbe
    mov dword ptr [edi], eax
    mov eax, dword ptr [ebx + 0x6c]
    inc esi
    add edi, 4
    cmp esi, eax
    jl L5
    pop edi
    pop esi
    pop ebp
    ret
FUN_10055e00 ENDP
END