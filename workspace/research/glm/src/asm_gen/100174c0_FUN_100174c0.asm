; FUN_100174c0 @ 0x100174c0 — auto-synthesized
    sub_100165f0 PROTO C
.CODE
FUN_100174c0 PROC
    push ecx
    push ebx
    push ebp
    push esi
    push edi
    mov ebp, 0x101d7fcc
    mov dword ptr [esp + 0x10], 0x20
    cmp dword ptr [ebp], 0
    je L0
    lea ebx, [ebp + 8]
    mov esi, 0x1018eac8
    mov edi, ebx
    mov eax, dword ptr [ebx - 4]
    mov ecx, dword ptr [ebp]
    push esi
    push eax
    push ecx
    call sub_100165f0
    mov dword ptr [edi], eax
    add esi, 0x15
    add esp, 0xc
    add edi, 4
    cmp esi, 0x1018eb1c
    jl L1
    mov eax, dword ptr [esp + 0x10]
    add ebp, 0x18
    dec eax
    mov dword ptr [esp + 0x10], eax
    jne L2
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_100174c0 ENDP
END