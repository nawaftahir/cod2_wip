; FUN_1003c050 @ 0x1003c050 — auto-synthesized
    EXTRN g_101ce684:DWORD
    EXTRN g_101d1b9c:DWORD
    EXTRN g_1072ddb8:DWORD
    sub_1003bd32 PROTO C
    sub_1003bfbc PROTO C
.CODE
FUN_1003c050 PROC
    push ecx
    mov ecx, dword ptr [g_1072ddb8]
    push esi
    lea esi, [eax + eax*2]
    shl esi, 4
    add esi, 0x10764590
    mov eax, dword ptr [esi + 0xc]
    test eax, eax
    push edi
    je L0
    cmp eax, ecx
    jg L0
    mov edi, ecx
    sub edi, eax
    jmp L1
    mov edi, 0xa
    mov eax, dword ptr [g_101ce684]
    mov dword ptr [esi + 0xc], ecx
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L2
    mov ecx, dword ptr [g_101d1b9c]
    mov al, byte ptr [ecx + 0x160]
    test al, al
    je L2
    push edi
    mov edx, esi
    call sub_1003bd32
    add esp, 4
    mov edx, esi
    call sub_1003bfbc
    pop edi
    pop esi
    pop ecx
    ret
FUN_1003c050 ENDP
END