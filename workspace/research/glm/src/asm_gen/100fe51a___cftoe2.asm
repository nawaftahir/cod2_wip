; __cftoe2 @ 0x100fe51a — auto-synthesized
    EXTRN g_101a50e4:DWORD
    sub_100fe525 PROTO C
    sub_100fe8f5 PROTO C
.CODE
__cftoe2 PROC
    push ebp
    mov ebp, esp
    cmp byte ptr [ebp + 0x10], 0
    push esi
    mov esi, eax
    je L0
    xor eax, eax
    cmp dword ptr [ebp + 8], eax
    push edi
    setg al
    xor ecx, ecx
    cmp dword ptr [esi], 0x2d
    sete cl
    mov edi, eax
    add ecx, ebx
    mov eax, ecx
    call sub_100fe525
    pop edi
    cmp dword ptr [esi], 0x2d
    mov eax, ebx
    jne L1
    mov byte ptr [ebx], 0x2d
    lea eax, [ebx + 1]
    cmp dword ptr [ebp + 8], 0
    jle L2
    lea ecx, [eax + 1]
    mov dl, byte ptr [ecx]
    mov byte ptr [eax], dl
    mov eax, ecx
    mov cl, byte ptr [g_101a50e4]
    mov byte ptr [eax], cl
    xor ecx, ecx
    cmp byte ptr [ebp + 0x10], cl
    push 0x1017cdf4
    sete cl
    add ecx, eax
    add ecx, dword ptr [ebp + 8]
    push ecx
    call sub_100fe8f5
    cmp dword ptr [ebp + 0xc], 0
    pop ecx
    pop ecx
    mov ecx, eax
    je L3
    mov byte ptr [ecx], 0x45
    mov eax, dword ptr [esi + 0xc]
    inc ecx
    cmp byte ptr [eax], 0x30
    je L4
    mov eax, dword ptr [esi + 4]
    dec eax
    jns L5
    neg eax
    mov byte ptr [ecx], 0x2d
    inc ecx
    cmp eax, 0x64
    jl L6
    cdq
    push 0x64
    pop esi
    idiv esi
    add byte ptr [ecx], al
    mov eax, edx
    inc ecx
    cmp eax, 0xa
    jl L7
    cdq
    push 0xa
    pop esi
    idiv esi
    add byte ptr [ecx], al
    mov eax, edx
    add byte ptr [ecx + 1], al
    mov eax, ebx
    pop esi
    pop ebp
    ret
__cftoe2 ENDP
END