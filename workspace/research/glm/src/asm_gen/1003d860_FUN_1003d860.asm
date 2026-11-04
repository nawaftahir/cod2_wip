; FUN_1003d860 @ 0x1003d860 — auto-synthesized
    EXTRN g_101ce6f0:DWORD
    EXTRN g_101ce7ec:DWORD
    EXTRN g_101d1bf8:DWORD
    EXTRN g_101d495c:DWORD
    EXTRN g_101d4960:DWORD
    EXTRN g_101d4c88:DWORD
    EXTRN g_10764584:DWORD
    EXTRN g_1076a830:DWORD
    sub_1003d955 PROTO C
    sub_100f6cc3 PROTO C
    sub_100f6d80 PROTO C
.CODE
FUN_1003d860 PROC
    mov eax, dword ptr [g_101ce6f0]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [g_101d4960]
    cmp eax, ecx
    mov dword ptr [g_101d495c], eax
    jle L0
    mov eax, ecx
    mov dword ptr [g_101d495c], eax
    cmp eax, 1
    jg L1
    xor eax, eax
    mov dword ptr [g_101d495c], eax
    push esi
    mov ecx, 1
    sub ecx, eax
    push edi
    mov edi, 1
    jns L2
    mov edi, eax
    mov eax, dword ptr [g_101d4c88]
    xor esi, esi
    test eax, eax
    jle sub_1003d955
    jmp L3
    lea esp, [esp]
    mov edx, dword ptr [g_101ce7ec]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L4
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L4
    push 0x10199718
    push 0x10193358
    push eax
    call sub_100f6d80
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100f6cc3
    add esp, 0x10
    mov eax, dword ptr [g_101d1bf8]
    mov ecx, dword ptr [eax]
    push edi
    push 0xa
    push esi
    push eax
    call dword ptr [ecx + 0x114]
    mov eax, dword ptr [g_1076a830]
    test eax, eax
    jne L3
    mov eax, dword ptr [g_101d4c88]
    inc esi
FUN_1003d860 ENDP
END