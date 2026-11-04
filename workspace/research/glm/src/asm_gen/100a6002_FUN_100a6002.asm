; FUN_100a6002 @ 0x100a6002 — auto-synthesized
    sub_100a5692 PROTO C
.CODE
FUN_100a6002 PROC
    push ebx
    push esi
    push edi
    mov edi, dword ptr [eax + 4]
    xor ebx, ebx
    test edi, edi
    jbe L0
    mov esi, dword ptr [ecx + 0x14]
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [eax]
    mov edx, dword ptr [esi + edx*4]
    cmp dword ptr [edx + 8], -1
    jne L1
    inc ebx
    add eax, 4
    cmp ebx, edi
    jb L2
    jmp L0
    push dword ptr [edx + 8]
    call sub_100a5692
    test eax, eax
    jl L3
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    ret
FUN_100a6002 ENDP
END