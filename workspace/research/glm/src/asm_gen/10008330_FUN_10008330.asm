; FUN_10008330 @ 0x10008330 — auto-synthesized
    EXTRN g_101ce5ef:DWORD
    EXTRN g_10678510:DWORD
    sub_1001f72d PROTO C
    sub_1001faca PROTO C
    sub_1001ffea PROTO C
    sub_100246cd PROTO C
    sub_100246ea PROTO C
.CODE
FUN_10008330 PROC
    mov al, byte ptr [g_101ce5ef]
    test al, al
    je L0
    mov eax, dword ptr [g_10678510]
    push esi
    push edi
    mov edi, ebx
    mov esi, ebx
    imul edi, edi, 0x34
    imul esi, esi, 0x74
    add esi, eax
    add edi, 0x10678ac4
    push edi
    mov eax, esi
    call sub_1001ffea
    mov eax, dword ptr [esi]
    add esp, 4
    cmp eax, 1
    jne L1
    push -1
    push esi
    push edi
    call sub_1001f72d
    add esp, 0xc
    push ebx
    mov dword ptr [edi + 0xc], 5
    call sub_100246cd
    add esp, 4
    pop edi
    pop esi
    ret
    push esi
    push edi
    call sub_1001faca
    add esp, 8
    push ebx
    mov dword ptr [edi + 0xc], 5
    call sub_100246ea
    add esp, 4
    pop edi
    pop esi
    ret
FUN_10008330 ENDP
END