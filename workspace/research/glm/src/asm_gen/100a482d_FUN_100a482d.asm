; FUN_100a482d @ 0x100a482d — auto-synthesized
    EXTRN g_101ad558:DWORD
    sub_10063e92 PROTO C
    sub_10067465 PROTO C
    sub_1009967a PROTO C
    sub_100a35a0 PROTO C
.CODE
FUN_100a482d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    push esi
    push edi
    xor edi, edi
    cmp eax, edi
    mov esi, ecx
    jne L0
    mov eax, 0x8876086c
    jmp L1
    mov dword ptr [eax], edi
    mov eax, dword ptr [ebp + 0xc]
    push ebx
    mov dword ptr [esi], eax
    mov eax, dword ptr [ebp + 8]
    xor ebx, ebx
    inc ebx
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi + 8], edi
    mov dword ptr [esi + 0x10], edi
    mov dword ptr [esi + 0x14], edi
    mov dword ptr [esi + 0x18], edi
    mov dword ptr [esi + 0x1c], edi
    mov dword ptr [esi + 0x40], edi
    mov dword ptr [esi + 0x44], edi
    mov dword ptr [esi + 0x48], ebx
    mov dword ptr [esi + 0x4c], edi
    mov dword ptr [esi + 0x50], edi
    mov dword ptr [esi + 0x54], edi
    mov dword ptr [esi + 0x58], edi
    mov dword ptr [g_101ad558], esi
    mov ecx, dword ptr [esi + 4]
    push ebx
    call sub_10063e92
    cmp eax, edi
    jl L2
    push edi
    push edi
    mov ecx, esi
    call sub_1009967a
    call sub_100a35a0
    test eax, eax
    je L3
    mov dword ptr [esi + 0x40], ebx
    mov ecx, dword ptr [esi + 4]
    call sub_10067465
    cmp eax, edi
    jl L2
    cmp dword ptr [esi + 0x40], edi
    jne L4
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp + 0x10]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esi + 8]
    mov dword ptr [eax + 8], edi
    mov eax, dword ptr [esi + 0x40]
    neg eax
    sbb eax, eax
    and eax, 0x80004005
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret 0xc
FUN_100a482d ENDP
END