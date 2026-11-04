; FUN_10025300 @ 0x10025300 — auto-synthesized
    EXTRN g_101ce6ac:DWORD
    EXTRN g_101ce6d0:DWORD
    EXTRN g_101ce708:DWORD
    sub_10024cb5 PROTO C
    sub_10024dab PROTO C
    sub_10024fb0 PROTO C
    sub_100250b7 PROTO C
.CODE
FUN_10025300 PROC
    push ebx
    mov ebx, dword ptr [esp + 0xc]
    push esi
    mov esi, dword ptr [g_101ce6d0]
    cmp byte ptr [esi + 8], 0
    je L0
    push ecx
    push ebx
    push eax
    push edx
    call sub_10024dab
    add esp, 0x10
    pop esi
    pop ebx
    ret
    mov esi, dword ptr [g_101ce708]
    push edi
    cmp dword ptr [esi + 8], 2
    jne L1
    push ecx
    push edx
    call sub_10024cb5
    add esp, 8
    pop edi
    pop esi
    pop ebx
    ret
    mov esi, dword ptr [g_101ce6ac]
    mov edi, dword ptr [esi + 8]
    test edi, edi
    je L2
    push ecx
    push ebx
    call sub_10024fb0
    add esp, 8
    pop edi
    pop esi
    pop ebx
    ret
    mov esi, dword ptr [esp + 0x24]
    push esi
    mov esi, dword ptr [esp + 0x24]
    push esi
    mov esi, dword ptr [esp + 0x24]
    push esi
    mov esi, dword ptr [esp + 0x1c]
    push ebx
    push esi
    push eax
    mov eax, dword ptr [esp + 0x30]
    push edx
    call sub_100250b7
    add esp, 0x1c
    pop edi
    pop esi
    pop ebx
    ret
FUN_10025300 ENDP
END