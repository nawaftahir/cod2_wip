; __getenv_lk @ 0x10107ec7 — auto-synthesized
    EXTRN g_101ae02c:DWORD
    EXTRN g_101ae034:DWORD
    EXTRN g_1076ada0:DWORD
    sub_100fa243 PROTO C
    sub_100fa24e PROTO C
    sub_10109552 PROTO C
    sub_10109564 PROTO C
.CODE
__getenv_lk PROC
    cmp dword ptr [g_1076ada0], 0
    push esi
    mov esi, dword ptr [g_101ae02c]
    jne L0
    xor eax, eax
    pop esi
    ret
    test esi, esi
    push ebx
    push edi
    jne L1
    cmp dword ptr [g_101ae034], esi
    je L2
    call sub_10109564
    test eax, eax
    jne L2
    mov esi, dword ptr [g_101ae02c]
    test esi, esi
    je L2
    mov ebx, dword ptr [esp + 0x10]
    test ebx, ebx
    je L2
    push ebx
    call sub_100fa243
    pop ecx
    mov edi, eax
    jmp L3
    push eax
    call sub_100fa24e
    cmp eax, edi
    pop ecx
    jbe L4
    mov eax, dword ptr [esi]
    cmp byte ptr [eax + edi], 0x3d
    jne L4
    push edi
    push ebx
    push eax
    call sub_10109552
    add esp, 0xc
    test eax, eax
    je L5
    add esi, 4
    mov eax, dword ptr [esi]
    test eax, eax
    jne L6
    xor eax, eax
    pop edi
    pop ebx
    pop esi
    ret
    mov eax, dword ptr [esi]
    lea eax, [eax + edi + 1]
    jmp L7
__getenv_lk ENDP
END