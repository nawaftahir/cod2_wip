; FUN_10048f70 @ 0x10048f70 — auto-synthesized
    sub_10048d01 PROTO C
.CODE
FUN_10048f70 PROC
    sub esp, 8
    push ebx
    mov ebx, dword ptr [esp + 0x14]
    push ebp
    mov ebp, dword ptr [esp + 0x1c]
    push edi
    mov edi, dword ptr [ebx + 0x1c]
    shl edi, 3
    lea eax, [edi + edi]
    push eax
    mov eax, dword ptr [esp + 0x1c]
    mov ecx, dword ptr [eax + 0x24]
    mov edx, dword ptr [eax + 0xe4]
    push ecx
    push edx
    push ebp
    mov dword ptr [esp + 0x1c], edi
    call sub_10048d01
    mov eax, dword ptr [ebx + 0xc]
    add esp, 0x10
    test eax, eax
    mov dword ptr [esp + 0x18], 0
    jle L0
    mov edx, dword ptr [esp + 0x24]
    sub edx, ebp
    mov dword ptr [esp + 0x10], edx
    push esi
    mov edi, edi
    mov ecx, dword ptr [edx + ebp]
    mov eax, dword ptr [ebp]
    xor esi, esi
    test edi, edi
    jbe L1
    lea esp, [esp]
    movzx edx, byte ptr [eax + 1]
    movzx ebx, byte ptr [eax]
    add edx, esi
    add ebx, edx
    sar ebx, 1
    mov byte ptr [ecx], bl
    inc ecx
    xor esi, 1
    add eax, 2
    dec edi
    jne L2
    mov edi, dword ptr [esp + 0x10]
    mov ebx, dword ptr [esp + 0x20]
    mov edx, dword ptr [esp + 0x14]
    mov eax, dword ptr [esp + 0x1c]
    mov ecx, dword ptr [ebx + 0xc]
    inc eax
    add ebp, 4
    cmp eax, ecx
    mov dword ptr [esp + 0x1c], eax
    jl L3
    pop esi
    pop edi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_10048f70 ENDP
END