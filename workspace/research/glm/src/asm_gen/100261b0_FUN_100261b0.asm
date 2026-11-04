; FUN_100261b0 @ 0x100261b0 — auto-synthesized
    EXTRN fp_101d49dc:DWORD
    EXTRN fp_101d49e0:DWORD
    EXTRN fp_101d4b14:DWORD
    sub_10025ee6 PROTO C
.CODE
FUN_100261b0 PROC
    mov eax, dword ptr [esp + 0xc]
    imul eax, ebx
    push esi
    add eax, 6
    push edi
    lea edi, [eax + eax*2]
    push edi
    call dword ptr [fp_101d49dc]
    mov esi, eax
    xor eax, eax
    mov ecx, esi
    mov dword ptr [ecx], eax
    mov dword ptr [ecx + 4], eax
    mov dword ptr [ecx + 8], eax
    mov dword ptr [ecx + 0xc], eax
    mov word ptr [ecx + 0x10], ax
    mov eax, dword ptr [esp + 0x18]
    mov edx, eax
    sar edx, 8
    mov byte ptr [esi + 0xd], dl
    lea edx, [esi + 0x12]
    push edx
    push 3
    mov ecx, ebx
    sar ecx, 8
    push ebx
    mov byte ptr [esi + 0xc], al
    mov byte ptr [esi + 0xf], cl
    mov ecx, dword ptr [esp + 0x20]
    push eax
    mov eax, dword ptr [esp + 0x20]
    mov byte ptr [esi + 2], 2
    mov byte ptr [esi + 0xe], bl
    mov byte ptr [esi + 0x10], 0x18
    mov byte ptr [esi + 0x11], 0x20
    call sub_10025ee6
    add esp, 0x14
    test al, al
    je L0
    mov eax, dword ptr [esp + 0x18]
    push edi
    push esi
    push eax
    call dword ptr [fp_101d4b14]
    add esp, 0xc
    push esi
    call dword ptr [fp_101d49e0]
    add esp, 4
    pop edi
    pop esi
    ret
FUN_100261b0 ENDP
END