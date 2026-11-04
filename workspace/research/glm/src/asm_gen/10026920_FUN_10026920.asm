; FUN_10026920 @ 0x10026920 — auto-synthesized
    EXTRN fp_101d49dc:DWORD
    EXTRN fp_101d49e0:DWORD
    EXTRN fp_101d4b14:DWORD
    EXTRN g_101d4928:DWORD
    sub_10026840 PROTO C
    sub_100268b1 PROTO C
.CODE
FUN_10026920 PROC
    movzx eax, word ptr [g_101d4928]
    mov ecx, eax
    imul ecx, eax
    push ebp
    push esi
    lea ebp, [ecx*4 + 0x12]
    push edi
    push ebp
    call dword ptr [fp_101d49dc]
    mov edi, eax
    movzx eax, word ptr [g_101d4928]
    xor edx, edx
    mov ecx, edi
    mov dword ptr [ecx], edx
    mov dword ptr [ecx + 4], edx
    mov dword ptr [ecx + 8], edx
    mov dword ptr [ecx + 0xc], edx
    mov word ptr [ecx + 0x10], dx
    mov ecx, eax
    sar ecx, 8
    mov byte ptr [edi + 0xd], cl
    mov byte ptr [edi + 0xf], cl
    mov byte ptr [edi + 2], 2
    mov byte ptr [edi + 0xc], al
    mov byte ptr [edi + 0xe], al
    mov byte ptr [edi + 0x10], 0x20
    mov esi, dword ptr [ebx*4 + 0x10696bb0]
    mov ecx, edi
    call sub_10026840
    mov edx, dword ptr [esp + 0x1c]
    mov eax, dword ptr [esp + 0x18]
    push edi
    push edx
    push eax
    push ebx
    call sub_100268b1
    mov ecx, dword ptr [esp + 0x24]
    push ebp
    push edi
    push ecx
    call dword ptr [fp_101d4b14]
    push edi
    call dword ptr [fp_101d49e0]
    mov edx, dword ptr [ebx*4 + 0x10696bb0]
    push edx
    call dword ptr [fp_101d49e0]
    add esp, 0x28
    pop edi
    pop esi
    pop ebp
    ret
FUN_10026920 ENDP
END