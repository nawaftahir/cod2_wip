; FUN_100353c0 @ 0x100353c0 — auto-synthesized
.CODE
FUN_100353c0 PROC
    mov eax, dword ptr [ecx + 0x14]
    sub esp, 8
    xor edx, edx
    test eax, eax
    jle L0
    push ebx
    push ebp
    push esi
    mov ebx, 0x1072dc1c
    sub ebx, ecx
    push edi
    mov dword ptr [esp + 0x14], ebx
    mov esi, 0x1072dc14
    mov edi, 0x1072dc18
    mov ebx, 0x1072dc10
    sub esi, ecx
    sub edi, ecx
    sub ebx, ecx
    lea eax, [ecx + 0x20]
    mov dword ptr [esp + 0x10], ebx
    jmp L1
    mov ebx, dword ptr [esp + 0x10]
    lea ecx, [ecx]
    mov ebp, dword ptr [eax - 8]
    mov dword ptr [ebx + eax], ebp
    mov ebx, dword ptr [eax - 4]
    mov ebp, dword ptr [esp + 0x14]
    mov dword ptr [esi + eax], ebx
    mov ebx, dword ptr [eax]
    mov dword ptr [edi + eax], ebx
    mov ebx, dword ptr [eax + 4]
    mov dword ptr [eax + ebp], ebx
    mov ebx, dword ptr [ecx + 0x14]
    inc edx
    add eax, 0x10
    cmp edx, ebx
    jl L2
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_100353c0 ENDP
END