; FUN_100caeda @ 0x100caeda — auto-synthesized
    sub_100c9af3 PROTO C
    sub_100c9b1a PROTO C
.CODE
FUN_100caeda PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x14
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 0x100]
    mov ecx, dword ptr [eax + 0x10]
    mov edx, dword ptr [esi + 0x14]
    push edi
    mov edi, dword ptr [eax]
    mov eax, dword ptr [ecx]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [esi + 0x88]
    and edi, 0xfffff
    xor ebx, ebx
    cmp edx, dword ptr [eax + 4]
    mov dword ptr [ebp - 4], ecx
    je L0
    mov eax, dword ptr [esi]
    push ebx
    push ebx
    push edi
    lea ecx, [ebp - 0x14]
    push ecx
    push dword ptr [esi + 0xfc]
    mov ecx, esi
    call dword ptr [eax + 0x80]
    cmp eax, ebx
    jl L1
    lea eax, [ebp - 0x14]
    mov dword ptr [ebp - 4], eax
    mov ecx, eax
    mov eax, dword ptr [esi + 0x100]
    push ebx
    push ebx
    push ebx
    push ebx
    push edi
    push ebx
    push ebx
    push dword ptr [eax + 8]
    push edi
    push ecx
    push 0x24
    mov ecx, esi
    call sub_100c9af3
    cmp eax, ebx
    jl L1
    lea eax, [ebp - 0x14]
    cmp dword ptr [ebp - 4], eax
    jne L2
    push ebx
    push ebx
    push ebx
    push ebx
    push edi
    push ebx
    push ebx
    push eax
    mov eax, dword ptr [esi + 0x100]
    push edi
    push dword ptr [eax + 0x10]
    mov ecx, esi
    push 1
    call sub_100c9b1a
    cmp eax, ebx
    jl L1
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100caeda ENDP
END