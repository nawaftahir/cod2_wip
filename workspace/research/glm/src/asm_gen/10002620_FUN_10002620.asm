; FUN_10002620 @ 0x10002620 — auto-synthesized
    EXTRN fp_101d49d4:DWORD
    EXTRN g_101ae3a4:DWORD
    EXTRN g_101ae3a8:DWORD
    sub_10001958 PROTO C
.CODE
FUN_10002620 PROC
    push ebx
    push esi
    mov esi, dword ptr [edi]
    mov ebx, 8
    mov edx, 2
    mov eax, edi
    add esi, 0x18
    call sub_10001958
    mov dword ptr [g_101ae3a4], eax
    mov eax, dword ptr [esi]
    push eax
    call dword ptr [fp_101d49d4]
    mov edx, dword ptr [g_101ae3a4]
    mov dword ptr [g_101ae3a8], eax
    mov ecx, dword ptr [esi + 4]
    add ecx, dword ptr [edi + 4]
    add esp, 4
    xor esi, esi
    test edx, edx
    jle L0
    mov edx, dword ptr [ecx]
    mov dword ptr [eax], edx
    mov dl, byte ptr [ecx + 4]
    mov byte ptr [eax + 4], dl
    mov dl, byte ptr [ecx + 5]
    mov byte ptr [eax + 5], dl
    mov dx, word ptr [ecx + 6]
    mov word ptr [eax + 6], dx
    mov edx, dword ptr [g_101ae3a4]
    inc esi
    add ecx, 8
    add eax, 8
    cmp esi, edx
    jl L1
    pop esi
    pop ebx
    ret
FUN_10002620 ENDP
END