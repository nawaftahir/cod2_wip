; FUN_10050600 @ 0x10050600 — auto-synthesized
    sub_100500df PROTO C
    sub_100500f8 PROTO C
.CODE
FUN_10050600 PROC
    mov eax, dword ptr [edi + 4]
    push esi
    push 0x30
    push 1
    push edi
    call dword ptr [eax]
    mov esi, eax
    mov dword ptr [edi + 0x1a8], esi
    xor eax, eax
    mov dword ptr [esi], 0x10050150
    mov byte ptr [esi + 8], al
    mov ecx, dword ptr [edi + 0x6c]
    imul ecx, dword ptr [edi + 0x64]
    mov dword ptr [esi + 0x28], ecx
    mov ecx, dword ptr [edi + 0x11c]
    add esp, 0xc
    cmp ecx, 2
    jne L0
    mov eax, dword ptr [esi + 0x28]
    push eax
    mov dword ptr [esi + 4], 0x10050170
    mov dword ptr [esi + 0xc], 0x100503d0
    mov edx, dword ptr [edi + 4]
    push 1
    push edi
    call dword ptr [edx + 4]
    add esp, 0xc
    mov dword ptr [esi + 0x20], eax
    mov eax, edi
    pop esi
    jmp sub_100500df
    mov dword ptr [esi + 0x20], eax
    mov dword ptr [esi + 4], 0x10050240
    mov dword ptr [esi + 0xc], 0x10050280
    mov eax, edi
    pop esi
    jmp sub_100500f8
FUN_10050600 ENDP
END