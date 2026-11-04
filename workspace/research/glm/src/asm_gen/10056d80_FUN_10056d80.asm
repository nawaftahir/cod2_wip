; FUN_10056d80 @ 0x10056d80 — auto-synthesized
    sub_100566db PROTO C
    sub_10056ad5 PROTO C
    sub_10056c59 PROTO C
.CODE
FUN_10056d80 PROC
    mov eax, dword ptr [edi + 4]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    mov ecx, ebp
    shl ecx, 5
    push ecx
    push 1
    push edi
    call dword ptr [eax]
    mov esi, eax
    xor ebx, ebx
    mov eax, 0x1f
    push esi
    mov ecx, edi
    mov dword ptr [esi], ebx
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi + 8], ebx
    mov dword ptr [esi + 0xc], 0x3f
    mov dword ptr [esi + 0x10], ebx
    mov dword ptr [esi + 0x14], eax
    call sub_100566db
    push ebp
    push 1
    push esi
    push edi
    call sub_10056ad5
    mov ebp, eax
    add esp, 0x20
    cmp ebp, ebx
    jle L0
    mov edi, edi
    push ebx
    push edi
    mov eax, esi
    call sub_10056c59
    add esp, 8
    inc ebx
    add esi, 0x20
    cmp ebx, ebp
    jl L1
    mov edx, dword ptr [edi]
    mov dword ptr [edi + 0x78], ebp
    mov dword ptr [edx + 0x14], 0x60
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 0x18], ebp
    mov ecx, dword ptr [edi]
    push 1
    push edi
    call dword ptr [ecx + 4]
    add esp, 8
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10056d80 ENDP
END