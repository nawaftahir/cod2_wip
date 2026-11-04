; FUN_100428d0 @ 0x100428d0 — auto-synthesized
.CODE
FUN_100428d0 PROC
    sub esp, 8
    mov eax, dword ptr [esp + 0xc]
    mov ecx, dword ptr [eax + 0x158]
    mov edx, dword ptr [eax + 0x24]
    mov eax, dword ptr [esp + 0x1c]
    dec eax
    push esi
    mov esi, dword ptr [ecx + 8]
    mov dword ptr [esp + 4], edx
    js L0
    push ebx
    push ebp
    push edi
    mov edi, dword ptr [esp + 0x28]
    shl edi, 2
    inc eax
    mov dword ptr [esp + 0x1c], eax
    mov ecx, dword ptr [esp + 0x20]
    mov eax, dword ptr [ecx]
    add ecx, 4
    mov dword ptr [esp + 0x20], ecx
    mov ecx, dword ptr [esp + 0x24]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [edi + ecx]
    mov dword ptr [esp + 0x2c], ecx
    add edi, 4
    xor ecx, ecx
    test edx, edx
    mov dword ptr [esp + 0x14], edi
    jbe L1
    lea esp, [esp]
    movzx ebp, byte ptr [eax + 1]
    movzx edx, byte ptr [eax]
    movzx edi, byte ptr [eax + 2]
    mov edx, dword ptr [esi + edx*4 + 0x800]
    mov ebx, dword ptr [esi + ebp*4 + 0x400]
    mov ebp, dword ptr [esi + edi*4]
    mov edi, dword ptr [esp + 0x2c]
    add edx, ebx
    add edx, ebp
    sar edx, 0x10
    add eax, 3
    mov byte ptr [ecx + edi], dl
    mov edx, dword ptr [esp + 0x10]
    inc ecx
    cmp ecx, edx
    jb L2
    mov edi, dword ptr [esp + 0x14]
    dec dword ptr [esp + 0x1c]
    jne L3
    pop edi
    pop ebp
    pop ebx
    pop esi
    add esp, 8
    ret
FUN_100428d0 ENDP
END