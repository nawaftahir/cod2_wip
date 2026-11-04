; FUN_10048c10 @ 0x10048c10 — auto-synthesized
    sub_10048b18 PROTO C
    sub_10048d16 PROTO C
.CODE
FUN_10048c10 PROC
    test al, al
    je L0
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 0x14], 4
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
    mov edx, dword ptr [esi + 4]
    push 0x40
    push 1
    push esi
    call dword ptr [edx]
    mov dword ptr [esi + 0x14c], eax
    mov dword ptr [eax], 0x100485a0
    mov ecx, dword ptr [esi + 0x15c]
    mov dl, byte ptr [ecx + 8]
    add esp, 0xc
    test dl, dl
    je L1
    push esi
    mov dword ptr [eax + 4], 0x10048860
    call sub_10048b18
    add esp, 4
    ret
    mov dword ptr [eax + 4], 0x10048630
    mov edx, dword ptr [esi + 0x44]
    mov ecx, dword ptr [esi + 0x4c]
    push ebp
    xor ebp, ebp
    test edx, edx
    jle sub_10048d16
    push ebx
    push edi
    lea edi, [ecx + 8]
    lea ebx, [eax + 8]
    jmp L2
    lea ebx, [ebx]
    mov eax, dword ptr [edi + 0x14]
    imul eax, dword ptr [esi + 0xe0]
    mov edx, dword ptr [esi + 0xe4]
    push edx
    shl eax, 3
    cdq
    idiv dword ptr [edi]
    mov ecx, dword ptr [esi + 4]
    push eax
    push 1
    push esi
    call dword ptr [ecx + 8]
    add esp, 0x10
    mov dword ptr [ebx], eax
    mov eax, dword ptr [esi + 0x44]
    inc ebp
    add ebx, 4
    add edi, 0x54
    cmp ebp, eax
FUN_10048c10 ENDP
END