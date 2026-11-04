; FUN_10008570 @ 0x10008570 — auto-synthesized
    EXTRN fp_101d49c8:DWORD
    EXTRN g_101ce580:DWORD
    sub_1005c888 PROTO C
.CODE
FUN_10008570 PROC
    mov ecx, dword ptr [g_101ce580]
    cmp ecx, 0x1000
    push esi
    mov esi, dword ptr [esp + 8]
    push edi
    mov edi, eax
    jne L0
    push ecx
    push 0x101925a8
    push 1
    call dword ptr [fp_101d49c8]
    add esp, 0xc
    pop edi
    pop esi
    ret
    mov eax, dword ptr [esi + 0x38]
    test eax, eax
    je L1
    cmp dword ptr [eax], ebx
    je L2
    mov eax, dword ptr [eax + 0x1c]
    test eax, eax
    jne L3
    mov eax, ecx
    shl eax, 5
    add eax, 0x101ae580
    inc ecx
    mov dword ptr [g_101ce580], ecx
    mov dword ptr [eax], ebx
    mov ecx, dword ptr [edx]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [edx + 4]
    mov dword ptr [eax + 8], ecx
    mov edx, dword ptr [edx + 8]
    mov dword ptr [eax + 0xc], edx
    mov ecx, dword ptr [edi]
    mov dword ptr [eax + 0x10], ecx
    mov edx, dword ptr [edi + 4]
    mov dword ptr [eax + 0x14], edx
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [eax + 0x18], ecx
    mov edx, dword ptr [esi + 0x38]
    mov dword ptr [eax + 0x1c], edx
    pop edi
    mov dword ptr [esi + 0x38], eax
    pop esi
    ret
    lea esi, [eax + 0x10]
    lea ecx, [eax + 4]
    call sub_1005c888
    pop edi
    pop esi
    ret
FUN_10008570 ENDP
END