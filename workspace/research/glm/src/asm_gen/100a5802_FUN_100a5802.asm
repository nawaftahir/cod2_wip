; FUN_100a5802 @ 0x100a5802 — auto-synthesized
    sub_100c4940 PROTO C
.CODE
FUN_100a5802 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    mov edx, dword ptr [esi + 0x14]
    mov eax, dword ptr [esi]
    push edi
    mov edi, dword ptr [ebp + 8]
    mov ecx, dword ptr [edi]
    mov ecx, dword ptr [edx + ecx*4]
    push dword ptr [ecx + 0x6c]
    mov ecx, esi
    call dword ptr [eax + 0x54]
    cmp eax, 0x11
    jne L0
    mov eax, dword ptr [ebp + 0x14]
    mov dword ptr [eax], 0xe40000
    xor eax, eax
    jmp L1
    push dword ptr [ebp + 0x14]
    mov ecx, esi
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push edi
    call sub_100c4940
    pop edi
    pop esi
    pop ebp
    ret 0x10
FUN_100a5802 ENDP
END