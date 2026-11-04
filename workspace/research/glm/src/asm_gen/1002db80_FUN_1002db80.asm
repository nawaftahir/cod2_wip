; FUN_1002db80 @ 0x1002db80 — auto-synthesized
    EXTRN g_101d1bf8:DWORD
    sub_1000517a PROTO C
    sub_1002db3c PROTO C
    sub_1005eb65 PROTO C
.CODE
FUN_1002db80 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x10]
    mov eax, dword ptr [ebp + 0x14]
    test eax, eax
    lea ebx, [ebp + 0x14]
    push esi
    push edi
    jne L0
    movsx eax, word ptr [ebp + 4]
    push 0
    push ebx
    lea esi, [eax + eax*2]
    mov eax, dword ptr [g_101d1bf8]
    mov ecx, dword ptr [eax]
    push 0
    push 0x65
    shl esi, 1
    lea edi, [esi + 0x1f]
    push 8
    and edi, 0xffffffe0
    push edi
    push eax
    call dword ptr [ecx + 0x6c]
    test eax, eax
    jl L1
    mov eax, dword ptr [ebx]
    mov edx, dword ptr [eax]
    push 0
    lea ecx, [esp + 0x1c]
    push ecx
    push 0
    push 0
    push eax
    call dword ptr [edx + 0x2c]
    test eax, eax
    jge L2
    mov ebx, dword ptr [ebx]
    mov edx, dword ptr [ebx]
    push ebx
    call dword ptr [edx + 8]
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
    mov eax, dword ptr [esp + 0x18]
    test eax, eax
    je L1
    mov ecx, dword ptr [ebp + 8]
    push esi
    push ecx
    push eax
    call sub_1005eb65
    mov edx, dword ptr [esp + 0x24]
    mov ecx, edi
    sub ecx, esi
    lea edi, [edx + esi]
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov esi, dword ptr [ebx]
    add esp, 0xc
    call sub_1000517a
    cmp word ptr [ebp + 6], -1
    je L1
    mov eax, dword ptr [ebp + 0xc]
    push eax
    mov edi, ebp
    call sub_1002db3c
    add esp, 4
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_1002db80 ENDP
END