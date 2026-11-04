; FUN_10017470 @ 0x10017470 — auto-synthesized
    EXTRN g_1076a830:DWORD
    sub_1003859b PROTO C
.CODE
FUN_10017470 PROC
    push ebx
    push ebp
    push esi
    push edi
    xor esi, esi
    call sub_1003859b
    mov ebx, 0x101d7fd4
    mov ebp, 0x20
    mov esi, ebx
    mov edi, 4
    lea esp, [esp]
    cmp dword ptr [esi], 0
    je L0
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    mov dword ptr [esi], 0
    jne L1
    add esi, 4
    dec edi
    jne L2
    add ebx, 0x18
    dec ebp
    jne L3
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10017470 ENDP
END