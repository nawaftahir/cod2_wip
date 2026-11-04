; FUN_10001940 @ 0x10001940 — auto-synthesized
    EXTRN g_101ae288:DWORD
    sub_100138e7 PROTO C
    sub_10013902 PROTO C
    sub_1001392e PROTO C
.CODE
FUN_10001940 PROC
    mov ecx, dword ptr [eax]
    push esi
    lea esi, [ecx + edx*8 + 8]
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [eax + 8]
    push edi
    add ecx, dword ptr [esi + 4]
    cmp ecx, edx
    jle L0
    mov edx, dword ptr [g_101ae288]
    push edx
    push 0x10191ac4
    push 1
    call sub_100138e7
    add esp, 0xc
    cmp dword ptr [esi + 4], 4
    jge L1
    mov eax, dword ptr [g_101ae288]
    push eax
    push 0x10191aa0
    push 1
    call sub_10013902
    add esp, 0xc
    mov esi, dword ptr [esi]
    mov eax, esi
    cdq
    idiv ebx
    test esi, esi
    mov edi, eax
    jl L2
    mov ecx, edi
    imul ecx, ebx
    cmp ecx, esi
    je L3
    mov edx, dword ptr [g_101ae288]
    push edx
    push 0x10191a80
    push 1
    call sub_1001392e
    add esp, 0xc
    mov eax, edi
    pop edi
    pop esi
    ret
FUN_10001940 ENDP
END