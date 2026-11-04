; FUN_10017640 @ 0x10017640 — auto-synthesized
    EXTRN g_101d0a74:DWORD
    EXTRN g_101d0a78:DWORD
    sub_1000fadf PROTO C
    sub_10013977 PROTO C
.CODE
FUN_10017640 PROC
    mov eax, dword ptr [esp + 4]
    push ebx
    push esi
    push edi
    movzx edi, word ptr [eax + 0x34]
    xor esi, esi
    lea ecx, [ecx]
    xor ebx, ebx
    test edi, edi
    je L0
    mov ecx, dword ptr [esp + 0x10]
    mov eax, dword ptr [ecx + 0x3c]
    add eax, 8
    mov edx, edi
    cmp byte ptr [eax - 3], 5
    je L1
    mov ecx, dword ptr [eax]
    cmp ecx, ebx
    jbe L1
    test esi, esi
    je L2
    cmp ecx, esi
    jae L1
    mov ebx, ecx
    add eax, 0xc
    dec edx
    jne L3
    test ebx, ebx
    mov esi, ebx
    je L4
    movzx eax, byte ptr [ebx + 0xc]
    test eax, eax
    jl L5
    cmp eax, 1
    jle L6
    cmp eax, 4
    je L6
    mov edx, dword ptr [ebx + 0x10]
    mov eax, dword ptr [g_101d0a74]
    mov ecx, dword ptr [g_101d0a78]
    sub eax, edx
    mov dword ptr [g_101d0a74], eax
    mov eax, dword ptr [ebx + 0x14]
    sub ecx, eax
    mov dword ptr [g_101d0a78], ecx
    mov eax, dword ptr [ebx + 4]
    test eax, eax
    je L7
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    lea eax, [ebx + 0x10]
    mov dword ptr [ebx + 4], 0
    xor edx, edx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], edx
    mov dword ptr [ebx], 0
    call sub_1000fadf
    test al, al
    jne L8
    mov ecx, dword ptr [ebx + 0x20]
    push ecx
    push 0x10193544
    push 1
    call sub_10013977
    add esp, 0xc
    jmp L8
    pop edi
    pop esi
    pop ebx
    ret
FUN_10017640 ENDP
END