; FUN_1001f030 @ 0x1001f030 — auto-synthesized
    EXTRN g_101ce708:DWORD
    EXTRN g_101ce770:DWORD
    EXTRN g_101ce7e0:DWORD
    EXTRN g_101d49b0:DWORD
    sub_1001e77f PROTO C
    sub_1001e9cb PROTO C
    sub_1001ead5 PROTO C
    sub_1001ec81 PROTO C
    sub_1001ee2c PROTO C
    sub_1001ee70 PROTO C
.CODE
FUN_1001f030 PROC
    mov ecx, dword ptr [edx + 8]
    test ecx, ecx
    push ebx
    push esi
    mov esi, eax
    mov eax, dword ptr [edx + 4]
    push edi
    jl L0
    mov edx, dword ptr [g_101d49b0]
    lea edi, [ecx + edx]
    jmp L1
    mov edi, dword ptr [edx + 0xc]
    mov edx, dword ptr [g_101ce708]
    cmp dword ptr [edx + 8], 2
    movsx ecx, word ptr [eax + 6]
    jne L2
    cmp ecx, -1
    jne L3
    mov ecx, dword ptr [g_101ce770]
    mov dl, byte ptr [ecx + 8]
    test dl, dl
    je L4
    mov edx, dword ptr [g_101ce7e0]
    mov cl, byte ptr [edx + 8]
    test cl, cl
    je L4
    mov ebx, esi
    mov ecx, edi
    call sub_1001ead5
    pop edi
    pop esi
    pop ebx
    ret
    push esi
    mov ecx, edi
    call sub_1001ec81
    add esp, 4
    pop edi
    pop esi
    pop ebx
    ret
    push edi
    mov edx, esi
    call sub_1001ee70
    add esp, 4
    pop edi
    pop esi
    pop ebx
    ret
    cmp ecx, -1
    jne L5
    mov ecx, dword ptr [g_101ce770]
    mov dl, byte ptr [ecx + 8]
    test dl, dl
    je L6
    mov edx, dword ptr [g_101ce7e0]
    mov cl, byte ptr [edx + 8]
    test cl, cl
    je L6
    mov ecx, eax
    mov edx, edi
    call sub_1001e77f
    pop edi
    pop esi
    pop ebx
    ret
    push esi
    mov ecx, edi
    call sub_1001e9cb
    add esp, 4
    pop edi
    pop esi
    pop ebx
    ret
    mov edx, ecx
    push esi
    mov ecx, edi
    call sub_1001ee2c
    add esp, 4
    pop edi
    pop esi
    pop ebx
    ret
FUN_1001f030 ENDP
END