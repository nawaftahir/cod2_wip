; FUN_100114d0 @ 0x100114d0 — auto-synthesized
    EXTRN g_101ce7dc:DWORD
    EXTRN g_101d4814:DWORD
    EXTRN g_101d4818:DWORD
    sub_10011468 PROTO C
.CODE
FUN_100114d0 PROC
    push edi
    mov edi, ebx
    call sub_10011468
    xor eax, eax
    mov ecx, 0xe
    mov edi, esi
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebx + 0x14]
    mov dword ptr [esi], eax
    mov ecx, dword ptr [ebx + 0x18]
    mov dword ptr [esi + 4], ecx
    mov ecx, dword ptr [g_101ce7dc]
    mov dword ptr [esi + 8], 0x15
    mov edi, 1
    mov dword ptr [esi + 0xc], edi
    mov edx, dword ptr [g_101d4814]
    mov dword ptr [esi + 0x10], edx
    mov eax, dword ptr [g_101d4818]
    mov dword ptr [esi + 0x14], eax
    xor eax, eax
    mov dword ptr [esi + 0x18], edi
    mov dword ptr [esi + 0x24], eax
    mov dword ptr [esi + 0x28], 0x4b
    mov dl, byte ptr [ecx + 8]
    neg dl
    sbb edx, edx
    and edx, 0x80000001
    add edx, 0x80000000
    mov dword ptr [esi + 0x34], edx
    mov ecx, dword ptr [ebx]
    mov dword ptr [esi + 0x1c], ecx
    mov dword ptr [esi + 0x2c], eax
    cmp byte ptr [ebx + 8], al
    je L0
    mov dword ptr [esi + 0x20], eax
    mov edx, dword ptr [ebx + 4]
    mov dword ptr [esi + 0x30], edx
    pop edi
    ret
    mov dword ptr [esi + 0x20], edi
    mov dword ptr [esi + 0x30], eax
    pop edi
    ret
FUN_100114d0 ENDP
END