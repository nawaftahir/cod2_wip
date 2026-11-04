; FUN_10034010 @ 0x10034010 — auto-synthesized
    EXTRN g_1019bcac:DWORD
    sub_100317a9 PROTO C
    sub_1010a8f8 PROTO C
    sub_1010a909 PROTO C
    sub_1010a919 PROTO C
    sub_1010a92a PROTO C
.CODE
FUN_10034010 PROC
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push edi
    mov edi, dword ptr [esp + 0x1c]
    mov esi, eax
    lea eax, [edi + 2]
    cmp eax, ecx
    jle L0
    mov ecx, dword ptr [esp + 0x18]
    push ecx
    mov eax, edi
    cdq
    push esi
    sub eax, edx
    sar eax, 1
    push 1
    push eax
    call sub_100317a9
    add esp, 0x10
    xor edi, edi
    mov edx, edi
    shl edx, 4
    add esi, edx
    test ebx, ebx
    jne L1
    mov dword ptr [esi + 0xc], 0xffffffff
    jmp L2
    fld dword ptr [ebx + 8]
    fmul dword ptr [g_1019bcac]
    call sub_1010a8f8
    mov byte ptr [esi + 0xc], al
    fld dword ptr [ebx + 4]
    fmul dword ptr [g_1019bcac]
    call sub_1010a909
    mov byte ptr [esi + 0xd], al
    fld dword ptr [ebx]
    fmul dword ptr [g_1019bcac]
    call sub_1010a919
    mov byte ptr [esi + 0xe], al
    fld dword ptr [ebx + 0xc]
    fmul dword ptr [g_1019bcac]
    call sub_1010a92a
    mov byte ptr [esi + 0xf], al
    mov eax, dword ptr [esi + 0xc]
    mov dword ptr [esi + 0x1c], eax
    mov eax, dword ptr [esp + 0x10]
    mov ecx, dword ptr [eax]
    mov dword ptr [esi], ecx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [esi + 4], edx
    mov eax, dword ptr [eax + 8]
    mov dword ptr [esi + 8], eax
    mov ecx, dword ptr [ebp]
    mov dword ptr [esi + 0x10], ecx
    mov edx, dword ptr [ebp + 4]
    mov dword ptr [esi + 0x14], edx
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [esi + 0x18], eax
    lea eax, [edi + 2]
    pop edi
    pop esi
    pop ebp
    ret
FUN_10034010 ENDP
END