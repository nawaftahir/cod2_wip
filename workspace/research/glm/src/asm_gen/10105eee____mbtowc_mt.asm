; ___mbtowc_mt @ 0x10105eee — auto-synthesized
    EXTRN fp_1010c13c:DWORD
    sub_100fc2c8 PROTO C
.CODE
___mbtowc_mt PROC
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 0x10]
    xor ebx, ebx
    cmp edi, ebx
    je L0
    cmp dword ptr [ebp + 0x14], ebx
    je L0
    mov al, byte ptr [edi]
    cmp al, bl
    jne L1
    mov eax, dword ptr [ebp + 0xc]
    cmp eax, ebx
    je L0
    mov word ptr [eax], bx
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret
    mov esi, dword ptr [ebp + 8]
    cmp dword ptr [esi + 0x14], ebx
    jne L2
    mov ecx, dword ptr [ebp + 0xc]
    cmp ecx, ebx
    je L3
    movzx ax, al
    mov word ptr [ecx], ax
    xor eax, eax
    inc eax
    jmp L4
    mov ecx, dword ptr [esi + 0x48]
    movzx eax, al
    test byte ptr [ecx + eax*2 + 1], 0x80
    je L5
    mov eax, dword ptr [esi + 0x28]
    cmp eax, 1
    jle L6
    cmp dword ptr [ebp + 0x14], eax
    jl L6
    xor ecx, ecx
    cmp dword ptr [ebp + 0xc], ebx
    setne cl
    push ecx
    push dword ptr [ebp + 0xc]
    push eax
    push edi
    push 9
    push dword ptr [esi + 4]
    call dword ptr [fp_1010c13c]
    test eax, eax
    jne L7
    mov eax, dword ptr [ebp + 0x14]
    cmp eax, dword ptr [esi + 0x28]
    jb L8
    cmp byte ptr [edi + 1], bl
    je L8
    mov eax, dword ptr [esi + 0x28]
    jmp L4
    xor eax, eax
    cmp dword ptr [ebp + 0xc], ebx
    setne al
    push eax
    push dword ptr [ebp + 0xc]
    push 1
    push edi
    push 9
    push dword ptr [esi + 4]
    call dword ptr [fp_1010c13c]
    test eax, eax
    jne L3
    call sub_100fc2c8
    mov dword ptr [eax], 0x2a
    or eax, 0xffffffff
    jmp L4
___mbtowc_mt ENDP
END