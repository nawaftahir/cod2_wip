; FUN_1002c570 @ 0x1002c570 — auto-synthesized
    sub_1005eec1 PROTO C
    sub_1005eef3 PROTO C
.CODE
FUN_1002c570 PROC
    mov eax, dword ptr [esi + 0x10]
    push ebx
    push ebp
    xor ebp, ebp
    cmp eax, 1
    push edi
    je L0
    lea ecx, [ecx]
    inc ebp
    mov edx, 1
    mov ecx, ebp
    shl edx, cl
    cmp eax, edx
    jne L1
    mov edx, dword ptr [esi + 0xc]
    xor ebx, ebx
    cmp edx, 1
    je L2
    inc ebx
    mov edi, 1
    mov ecx, ebx
    shl edi, cl
    cmp edx, edi
    jne L3
    xor edi, edi
    test eax, eax
    jle L4
    lea esp, [esp]
    mov eax, dword ptr [esi + 0xc]
    mov ecx, dword ptr [esp + 0x10]
    imul eax, edi
    push 0x101d7210
    push 0x101d7a10
    lea edx, [ecx + eax*8]
    push 1
    push edx
    mov edx, ebx
    call sub_1005eec1
    mov eax, dword ptr [esi + 0x10]
    add esp, 0x10
    inc edi
    cmp edi, eax
    jl L5
    mov eax, dword ptr [esi + 0xc]
    xor edi, edi
    test eax, eax
    jle L6
    mov ebx, dword ptr [esp + 0x10]
    lea esp, [esp]
    push 0x101d7210
    push 0x101d7a10
    push eax
    push ebx
    mov edx, ebp
    call sub_1005eef3
    mov eax, dword ptr [esi + 0xc]
    add esp, 0x10
    inc edi
    add ebx, 8
    cmp edi, eax
    jl L7
    pop edi
    pop ebp
    pop ebx
    ret
FUN_1002c570 ENDP
END