; R_FreeImageAllocations @ 0x10026a50 — auto-synthesized
    EXTRN g_101d4928:DWORD
    EXTRN g_101d492a:DWORD
    sub_100268da PROTO C
    sub_10026979 PROTO C
    sub_100269dc PROTO C
    sub_1003ea64 PROTO C
.CODE
R_FreeImageAllocations PROC
    mov ax, word ptr [esp + 4]
    mov cx, word ptr [esp + 8]
    mov word ptr [g_101d4928], ax
    mov word ptr [g_101d492a], cx
    jmp sub_100269dc
    int3
    int3
    int3
    int3
    mov eax, dword ptr [esp + 4]
    push eax
    call sub_100268da
    add esp, 4
    xor eax, eax
    jmp sub_1003ea64
    int3
    int3
    int3
    int3
    int3
    int3
    int3
    int3
    int3
    int3
    int3
    int3
    mov eax, dword ptr [esp + 0x10]
    mov ecx, dword ptr [esp + 0xc]
    mov edx, dword ptr [esp + 4]
    push ebx
    mov ebx, dword ptr [esp + 0xc]
    push eax
    push ecx
    push edx
    call sub_10026979
    add esp, 0xc
    pop ebx
    ret
    int3
    int3
    fld dword ptr [esp + 4]
    lea eax, [eax + eax*8 + 9]
    shl eax, 2
    fmul dword ptr [eax + 0x101903b4]
    push esi
    mov esi, ecx
    fadd dword ptr [eax + 0x101903a8]
    fstp dword ptr [esi]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax + 0x101903b8]
R_FreeImageAllocations ENDP
END