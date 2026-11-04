; ___updatetlocinfo_lk @ 0x100f7aa6 — auto-synthesized
    EXTRN g_101a4684:DWORD
    sub_100f7a91 PROTO C
    sub_100fb11a PROTO C
.CODE
___updatetlocinfo_lk PROC
    push esi
    call sub_100fb11a
    mov esi, eax
    mov ecx, dword ptr [esi + 0x64]
    cmp ecx, dword ptr [g_101a4684]
    je L0
    xor edx, edx
    cmp ecx, edx
    je L1
    mov eax, dword ptr [ecx + 0x2c]
    dec dword ptr [ecx]
    cmp eax, edx
    je L2
    dec dword ptr [eax]
    mov eax, dword ptr [ecx + 0x34]
    cmp eax, edx
    je L3
    dec dword ptr [eax]
    mov eax, dword ptr [ecx + 0x30]
    cmp eax, edx
    je L4
    dec dword ptr [eax]
    mov eax, dword ptr [ecx + 0x40]
    cmp eax, edx
    je L5
    dec dword ptr [eax]
    mov eax, dword ptr [ecx + 0x4c]
    dec dword ptr [eax + 0xb4]
    mov eax, dword ptr [g_101a4684]
    mov dword ptr [esi + 0x64], eax
    mov eax, dword ptr [g_101a4684]
    inc dword ptr [eax]
    mov eax, dword ptr [g_101a4684]
    cmp dword ptr [eax + 0x2c], edx
    je L6
    mov eax, dword ptr [eax + 0x2c]
    inc dword ptr [eax]
    mov eax, dword ptr [g_101a4684]
    cmp dword ptr [eax + 0x34], edx
    je L7
    mov eax, dword ptr [eax + 0x34]
    inc dword ptr [eax]
    mov eax, dword ptr [g_101a4684]
    cmp dword ptr [eax + 0x30], edx
    je L8
    mov eax, dword ptr [eax + 0x30]
    inc dword ptr [eax]
    mov eax, dword ptr [g_101a4684]
    cmp dword ptr [eax + 0x40], edx
    je L9
    mov eax, dword ptr [eax + 0x40]
    inc dword ptr [eax]
    mov eax, dword ptr [g_101a4684]
    mov eax, dword ptr [eax + 0x4c]
    inc dword ptr [eax + 0xb4]
    cmp ecx, edx
    je L0
    cmp dword ptr [ecx], edx
    jne L0
    cmp ecx, 0x101a4630
    je L0
    push ecx
    call sub_100f7a91
    pop ecx
    mov eax, dword ptr [esi + 0x64]
    pop esi
    ret
___updatetlocinfo_lk ENDP
END