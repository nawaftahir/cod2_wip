; FUN_10005680 @ 0x10005680 — auto-synthesized
    EXTRN fp_101d49dc:DWORD
    sub_100f5e62 PROTO C
.CODE
FUN_10005680 PROC
    mov ecx, dword ptr [edi + 0x1c]
    mov eax, dword ptr [edi + 0x20]
    inc ecx
    cmp ecx, eax
    push ebp
    mov ebp, dword ptr [esp + 8]
    jg L0
    mov ecx, dword ptr [edi + 0x18]
    test ecx, ecx
    jne L1
    shl eax, 7
    push eax
    call dword ptr [fp_101d49dc]
    add esp, 4
    mov dword ptr [edi + 0x18], eax
    mov ecx, dword ptr [edi + 0x18]
    mov edx, dword ptr [ebp]
    push esi
    mov esi, dword ptr [edi + 0x1c]
    shl esi, 7
    add esi, ecx
    mov dword ptr [esi], edx
    mov eax, dword ptr [ebp + 4]
    mov dword ptr [esi + 4], eax
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [esi + 8], ecx
    mov edx, dword ptr [ebx]
    mov dword ptr [esi + 0xc], edx
    mov eax, dword ptr [ebx + 4]
    mov dword ptr [esi + 0x10], eax
    mov ecx, dword ptr [ebx + 8]
    mov eax, dword ptr [esp + 0x10]
    mov dword ptr [esi + 0x14], ecx
    mov edx, dword ptr [ebx + 0xc]
    mov ecx, dword ptr [esp + 0x14]
    mov dword ptr [esi + 0x18], edx
    push 0x5f
    push ecx
    lea edx, [esi + 0x20]
    push edx
    mov dword ptr [esi + 0x1c], eax
    call sub_100f5e62
    mov byte ptr [esi + 0x7f], 0
    mov eax, dword ptr [edi + 0x1c]
    add esp, 0xc
    inc eax
    mov dword ptr [edi + 0x1c], eax
    pop esi
    pop ebp
    ret
FUN_10005680 ENDP
END