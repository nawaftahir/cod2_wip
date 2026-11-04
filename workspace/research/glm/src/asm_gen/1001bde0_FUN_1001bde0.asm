; FUN_1001bde0 @ 0x1001bde0 — auto-synthesized
    EXTRN g_101ce708:DWORD
    sub_100168ee PROTO C
    sub_100169bb PROTO C
    sub_1001b857 PROTO C
    sub_1001baa4 PROTO C
.CODE
FUN_1001bde0 PROC
    push ecx
    push ebx
    push edi
    mov edi, eax
    lea ebx, [esp + 8]
    call sub_100168ee
    test al, al
    je L0
    mov eax, dword ptr [esp + 8]
    mov eax, dword ptr [eax*4 + 0x101d92d4]
    test eax, eax
    jne L1
    mov ecx, dword ptr [g_101ce708]
    cmp dword ptr [ecx + 8], 2
    push esi
    push edi
    jne L2
    call sub_1001baa4
    mov esi, eax
    add esp, 4
    test esi, esi
    jne L3
    pop esi
    pop edi
    pop ebx
    pop ecx
    ret
    call sub_1001b857
    mov esi, eax
    add esp, 4
    test esi, esi
    jne L3
    pop esi
    pop edi
    pop ebx
    pop ecx
    ret
    push esi
    call sub_100169bb
    add esp, 4
    mov eax, esi
    pop esi
    pop edi
    pop ebx
    pop ecx
    ret
FUN_1001bde0 ENDP
END