; FUN_100cb84b @ 0x100cb84b — auto-synthesized
    sub_100c9ae7 PROTO C
    sub_100c9b0f PROTO C
    sub_100cb31f PROTO C
.CODE
FUN_100cb84b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 0x100]
    mov eax, dword ptr [eax]
    and eax, 0xfffff
    dec eax
    push edi
    je L0
    dec eax
    dec eax
    je L1
    dec eax
    je L2
    mov eax, dword ptr [esi]
    xor edi, edi
    push edi
    push edi
    push 2
    lea ecx, [ebp - 8]
    push ecx
    push dword ptr [esi + 0xfc]
    mov ecx, esi
    call dword ptr [eax + 0x80]
    cmp eax, edi
    jl L3
    mov eax, dword ptr [esi + 0x100]
    mov eax, dword ptr [eax + 8]
    push edi
    push edi
    push edi
    push edi
    push 2
    push edi
    lea ecx, [eax + 8]
    push ecx
    push eax
    push 2
    lea eax, [ebp - 8]
    push eax
    push 5
    mov ecx, esi
    call sub_100c9ae7
    cmp eax, edi
    jl L3
    mov eax, dword ptr [esi + 0x100]
    push edi
    push edi
    push edi
    push edi
    push 1
    push edi
    lea ecx, [ebp - 4]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    push dword ptr [eax + 0xc]
    mov ecx, esi
    push dword ptr [eax + 0x10]
    push 2
    call sub_100c9b0f
    cmp eax, edi
    jl L3
    xor eax, eax
    jmp L3
    push 0
    push 9
    jmp L4
    push 0
    push 8
    jmp L4
    push 0
    push 5
    mov ecx, esi
    call sub_100cb31f
    pop edi
    pop esi
    leave
    ret
FUN_100cb84b ENDP
END