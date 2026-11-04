; FUN_10024610 @ 0x10024610 — auto-synthesized
    EXTRN g_101ce654:DWORD
    EXTRN g_101d1b9c:DWORD
    sub_100243d0 PROTO C
.CODE
FUN_10024610 PROC
    mov ecx, dword ptr [g_101ce654]
    mov dword ptr [eax + 0xc], 5
    mov dl, byte ptr [ecx + 8]
    test dl, dl
    je L0
    push ebx
    push ebp
    mov ebp, dword ptr [eax + 4]
    mov ecx, dword ptr [ebp + 0x18]
    mov eax, dword ptr [ebp + 0x1c]
    xor ebx, ebx
    test ecx, ecx
    jle L1
    push esi
    push edi
    lea edi, [eax + eax*2]
    shl edi, 2
    lea ecx, [ecx]
    mov edx, dword ptr [g_101d1b9c]
    mov eax, dword ptr [edx + 0x14]
    mov ecx, dword ptr [eax + edi + 8]
    movzx esi, word ptr [eax + edi + 4]
    add eax, edi
    mov eax, dword ptr [eax]
    push ecx
    mov ecx, dword ptr [esp + 0x18]
    call sub_100243d0
    mov eax, dword ptr [ebp + 0x18]
    add esp, 4
    inc ebx
    add edi, 0xc
    cmp ebx, eax
    jl L2
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10024610 ENDP
END