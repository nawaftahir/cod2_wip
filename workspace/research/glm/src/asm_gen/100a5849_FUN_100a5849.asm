; FUN_100a5849 @ 0x100a5849 — auto-synthesized
    sub_100c41c4 PROTO C
.CODE
FUN_100a5849 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, dword ptr [ebp + 0x14]
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push ebx
    push dword ptr [ebp + 0x10]
    mov esi, ecx
    push dword ptr [ebp + 0xc]
    push edi
    call sub_100c41c4
    test eax, eax
    jl L0
    push dword ptr [edi + 0x6c]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x54]
    cmp eax, 0x11
    jne L1
    mov dword ptr [ebx], 1
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0x10
FUN_100a5849 ENDP
END