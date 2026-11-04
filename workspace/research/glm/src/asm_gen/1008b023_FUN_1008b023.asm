; FUN_1008b023 @ 0x1008b023 — auto-synthesized
    sub_100f78c6 PROTO C
    sub_100f78e4 PROTO C
    sub_100f78fb PROTO C
.CODE
FUN_1008b023 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [eax + 4]
    push ebx
    push esi
    mov esi, dword ptr [ecx + 0x10]
    mov esi, dword ptr [esi + edx*4]
    mov edx, dword ptr [eax + 0x38]
    cmp edx, -1
    push edi
    jne L0
    mov ebx, eax
    jmp L1
    mov eax, dword ptr [ecx + 0x14]
    mov ebx, dword ptr [eax + edx*4]
    mov eax, dword ptr [esi]
    cmp byte ptr [eax], 0
    je L2
    cmp byte ptr [eax + 1], 0
    jne L2
    push eax
    push 0x10193358
    jmp L3
    push eax
    push 0x1011045c
    mov edi, dword ptr [ebp + 0x10]
    mov esi, dword ptr [ebp + 0xc]
    push edi
    push esi
    call sub_100f78c6
    mov ecx, dword ptr [ebx + 0xc]
    add esp, 0x10
    cmp ecx, -1
    je L4
    push ecx
    mov ecx, edi
    sub ecx, eax
    push 0x10110458
    push ecx
    add eax, esi
    push eax
    call sub_100f78e4
    add esp, 0x10
    jmp L5
    mov ecx, edi
    sub ecx, eax
    push 0x10110454
    push ecx
    add eax, esi
    push eax
    call sub_100f78fb
    add esp, 0xc
    mov byte ptr [esi + edi - 1], 0
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0xc
FUN_1008b023 ENDP
END