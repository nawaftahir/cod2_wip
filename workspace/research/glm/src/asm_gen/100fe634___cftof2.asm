; __cftof2 @ 0x100fe634 — auto-synthesized
    EXTRN g_101a50e4:DWORD
    sub_100fe547 PROTO C
    sub_100fe55c PROTO C
    sub_100fe585 PROTO C
    sub_101003d1 PROTO C
.CODE
__cftof2 PROC
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, eax
    mov eax, dword ptr [esi + 4]
    dec eax
    cmp byte ptr [ebp + 0x10], 0
    push edi
    je L0
    cmp eax, dword ptr [ebp + 0xc]
    jne L0
    xor ecx, ecx
    cmp dword ptr [esi], 0x2d
    sete cl
    add ecx, eax
    add ecx, dword ptr [ebp + 8]
    mov eax, ecx
    mov byte ptr [eax], 0x30
    mov byte ptr [eax + 1], 0
    cmp dword ptr [esi], 0x2d
    mov ebx, dword ptr [ebp + 8]
    jne L1
    mov byte ptr [ebx], 0x2d
    inc ebx
    mov eax, dword ptr [esi + 4]
    xor edi, edi
    inc edi
    test eax, eax
    jg L2
    mov eax, ebx
    call sub_100fe547
    mov byte ptr [ebx], 0x30
    inc ebx
    jmp L3
    add ebx, eax
    cmp dword ptr [ebp + 0xc], 0
    jle L4
    mov eax, ebx
    call sub_100fe55c
    mov al, byte ptr [g_101a50e4]
    mov byte ptr [ebx], al
    mov esi, dword ptr [esi + 4]
    inc ebx
    test esi, esi
    jge L4
    neg esi
    cmp byte ptr [ebp + 0x10], 0
    jne L5
    cmp dword ptr [ebp + 0xc], esi
    jl L6
    mov dword ptr [ebp + 0xc], esi
    mov edi, dword ptr [ebp + 0xc]
    mov eax, ebx
    call sub_100fe585
    push edi
    push 0x30
    push ebx
    call sub_101003d1
    add esp, 0xc
    mov eax, dword ptr [ebp + 8]
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret
__cftof2 ENDP
END