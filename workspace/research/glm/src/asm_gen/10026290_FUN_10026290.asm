; FUN_10026290 @ 0x10026290 — auto-synthesized
    EXTRN fp_101d49c8:DWORD
    EXTRN fp_101d49e0:DWORD
    EXTRN fp_101d4b14:DWORD
    EXTRN g_101d1b9c:DWORD
    sub_10026148 PROTO C
    sub_100f5f33 PROTO C
.CODE
FUN_10026290 PROC
    mov eax, dword ptr [g_101d1b9c]
    mov ecx, dword ptr [eax + 4]
    sub esp, 0x108
    push esi
    push ecx
    lea edx, [esp + 0xc]
    push 0x10196f20
    push edx
    call sub_100f5f33
    add esp, 0xc
    push 0x12
    push 0x80
    mov eax, 3
    mov ecx, 0x80
    call sub_10026148
    mov esi, eax
    add esp, 8
    test esi, esi
    je L0
    xor eax, eax
    mov ecx, esi
    mov dword ptr [ecx], eax
    mov dword ptr [ecx + 4], eax
    mov dword ptr [ecx + 8], eax
    mov dword ptr [ecx + 0xc], eax
    push 0xc012
    mov word ptr [ecx + 0x10], ax
    lea edx, [esp + 0xc]
    push esi
    push edx
    mov byte ptr [esi + 2], 2
    mov byte ptr [esi + 0xc], 0x80
    mov byte ptr [esi + 0xe], 0x80
    mov byte ptr [esi + 0x10], 0x18
    call dword ptr [fp_101d4b14]
    add esp, 0xc
    push esi
    call dword ptr [fp_101d49e0]
    add esp, 4
    lea eax, [esp + 8]
    push eax
    push 0x10196f14
    push 0
    call dword ptr [fp_101d49c8]
    add esp, 0xc
    pop esi
    add esp, 0x108
    ret
FUN_10026290 ENDP
END