; FUN_10026110 @ 0x10026110 — auto-synthesized
    EXTRN fp_101d49dc:DWORD
    EXTRN fp_101d49e0:DWORD
    EXTRN g_101d4c6c:DWORD
    EXTRN g_101d4c70:DWORD
    sub_10025d9b PROTO C
    sub_10025ed7 PROTO C
.CODE
FUN_10026110 PROC
    push ecx
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x14]
    push esi
    mov esi, eax
    mov eax, dword ptr [g_101d4c6c]
    push edi
    mov edi, ecx
    sub ecx, eax
    mov ecx, edi
    jns L0
    mov ecx, eax
    mov edx, dword ptr [esp + 0x18]
    mov eax, dword ptr [g_101d4c70]
    mov ebx, edx
    sub ebx, eax
    js L1
    mov eax, edx
    imul eax, ecx
    imul eax, esi
    add eax, ebp
    push eax
    call dword ptr [fp_101d49dc]
    mov edx, dword ptr [g_101d4c70]
    add esp, 4
    mov ebx, eax
    mov eax, dword ptr [g_101d4c6c]
    push ebx
    push esi
    push edx
    push eax
    xor ecx, ecx
    xor eax, eax
    call sub_10025ed7
    add esp, 0x10
    test al, al
    jne L2
    push ebx
    call dword ptr [fp_101d49e0]
    add esp, 4
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
    mov edx, dword ptr [esp + 0x18]
    mov eax, dword ptr [g_101d4c70]
    lea ecx, [ebx + ebp]
    push ecx
    mov ecx, dword ptr [g_101d4c6c]
    push edx
    push eax
    push ecx
    call sub_10025d9b
    add esp, 0x10
    pop edi
    pop esi
    pop ebp
    mov eax, ebx
    pop ebx
    pop ecx
    ret
FUN_10026110 ENDP
END