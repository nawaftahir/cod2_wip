; FUN_10068174 @ 0x10068174 — auto-synthesized
    sub_10067caa PROTO C
.CODE
FUN_10068174 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [ecx + 4]
    cmp ebx, edi
    mov dword ptr [ebp - 4], ecx
    jae L0
    cmp byte ptr [ebx], 0x30
    jne L0
    push esi
    xor eax, eax
    xor ecx, ecx
    lea esi, [ebx + 1]
    jmp L1
    mov dl, byte ptr [esi]
    cmp dl, 0x30
    jl L2
    cmp dl, 0x37
    jg L2
    test eax, 0xe0000000
    je L3
    xor ecx, ecx
    inc ecx
    movsx edx, dl
    lea eax, [edx + eax*8 - 0x30]
    inc esi
    cmp esi, edi
    jb L4
    mov edx, dword ptr [ebp + 0xc]
    test edx, edx
    je L5
    mov dword ptr [edx], eax
    test ecx, ecx
    je L6
    mov eax, dword ptr [ebp - 4]
    push 0x1010cb38
    push 0x3eb
    lea ecx, [eax + 8]
    push ecx
    push dword ptr [eax + 0x30]
    call sub_10067caa
    add esp, 0x10
    mov eax, esi
    sub eax, ebx
    pop esi
    jmp L7
    xor eax, eax
    pop edi
    pop ebx
    leave
    ret 8
FUN_10068174 ENDP
END