; FUN_10009770 @ 0x10009770 — auto-synthesized
    EXTRN g_101ce5e0:DWORD
    EXTRN g_101ce5e4:DWORD
    sub_1000669d PROTO C
    sub_100138e4 PROTO C
.CODE
FUN_10009770 PROC
    cmp dword ptr [g_101ce5e0], 0x100
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    jl L0
    push 0x100
    push 0x1019258c
    push 1
    call sub_100138e4
    add esp, 0xc
    movzx edx, byte ptr [ebp + 0x24]
    push ebx
    mov ebx, dword ptr [ebp + 0x20]
    mov ecx, 0x101ce588
    mov byte ptr [ebp], 1
    call sub_1000669d
    mov edx, dword ptr [g_101ce5e0]
    lea ecx, [edx - 1]
    sar ecx, 1
    test ecx, ecx
    pop ebx
    jl L1
    lea ecx, [ecx]
    mov edi, dword ptr [g_101ce5e4]
    fcom dword ptr [edi + ecx*8 + 4]
    lea esi, [edi + ecx*8]
    fnstsw ax
    test ah, 1
    je L2
    mov eax, dword ptr [esi]
    mov dword ptr [edi + edx*8], eax
    mov eax, dword ptr [esi + 4]
    mov esi, dword ptr [g_101ce5e4]
    mov dword ptr [esi + edx*8 + 4], eax
    mov edx, ecx
    dec ecx
    sar ecx, 1
    test ecx, ecx
    jge L3
    mov edi, dword ptr [g_101ce5e4]
    mov dword ptr [edi + edx*8], ebp
    mov ecx, dword ptr [g_101ce5e4]
    fstp dword ptr [ecx + edx*8 + 4]
    mov eax, dword ptr [g_101ce5e0]
    pop edi
    inc eax
    pop esi
    mov dword ptr [g_101ce5e0], eax
    pop ebp
    ret
FUN_10009770 ENDP
END