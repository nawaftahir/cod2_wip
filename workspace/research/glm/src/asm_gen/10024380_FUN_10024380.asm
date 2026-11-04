; FUN_10024380 @ 0x10024380 — auto-synthesized
    EXTRN g_101ce634:DWORD
    EXTRN g_101da9c8:DWORD
    EXTRN g_10678ab8:DWORD
.CODE
FUN_10024380 PROC
    push ebx
    push edi
    mov edi, eax
    mov eax, dword ptr [g_101da9c8]
    mov edx, dword ptr [eax + 4]
    cmp edx, 0x10000
    mov ebx, ecx
    jge L0
    mov ecx, dword ptr [esp + 0xc]
    mov ecx, dword ptr [ecx]
    cmp ecx, 2
    jne L1
    push ebp
    mov ebp, dword ptr [g_101ce634]
    cmp byte ptr [ebp + 8], 0
    pop ebp
    je L1
    movzx edi, word ptr [edi + 0xa]
    add ebx, 0xfffff000
    shl ebx, 0xa
    add ebx, edi
    shl ebx, 5
    add ebx, esi
    shl ebx, 4
    add ecx, ebx
    jmp L2
    movzx edi, word ptr [edi + 0xa]
    shl edi, 5
    add edi, esi
    shl edi, 0xc
    add edi, ebx
    shl edi, 4
    add ecx, edi
    mov dword ptr [eax + edx*8 + 8], ecx
    mov ecx, dword ptr [esp + 0xc]
    mov dword ptr [eax + edx*8 + 0xc], ecx
    inc dword ptr [g_10678ab8]
    inc dword ptr [eax + 4]
    pop edi
    pop ebx
    ret
FUN_10024380 ENDP
END