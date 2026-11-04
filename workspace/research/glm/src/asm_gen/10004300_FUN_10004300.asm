; FUN_10004300 @ 0x10004300 — auto-synthesized
    EXTRN fp_101d49d4:DWORD
    EXTRN g_101ae374:DWORD
    EXTRN g_101ae378:DWORD
    sub_1000195a PROTO C
.CODE
FUN_10004300 PROC
    push ecx
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x10]
    push esi
    push edi
    mov ebx, 0x20
    mov edx, 0xa
    mov eax, ebp
    call sub_1000195a
    mov esi, eax
    mov eax, dword ptr [ebp]
    mov edi, dword ptr [eax + 0x5c]
    mov eax, dword ptr [ebp + 4]
    mov ecx, esi
    shl ecx, 5
    push ecx
    mov dword ptr [esp + 0x1c], esi
    add edi, eax
    call dword ptr [fp_101d49d4]
    add esp, 4
    test esi, esi
    mov dword ptr [g_101ae378], eax
    mov dword ptr [g_101ae374], esi
    jle L0
    mov ebp, edi
    sub ebp, eax
    lea ebx, [eax + 0x1c]
    lea ecx, [eax + 0xc]
    lea esi, [edi + 0x18]
    lea edx, [edi + 0x10]
    sub eax, edi
    mov edi, dword ptr [esp + 0x18]
    mov dword ptr [esp + 0x10], ebp
    mov dword ptr [esp + 0x18], edi
    jmp L1
    mov ebp, dword ptr [esp + 0x10]
    lea ecx, [ecx]
    mov edi, dword ptr [edx - 0x10]
    mov dword ptr [ecx - 0xc], edi
    mov edi, dword ptr [ecx + ebp]
    mov dword ptr [ecx], edi
    mov edi, dword ptr [edx - 0xc]
    mov dword ptr [ecx - 8], edi
    mov edi, dword ptr [edx]
    mov dword ptr [ecx + 4], edi
    mov edi, dword ptr [edx - 8]
    mov dword ptr [ecx - 4], edi
    mov edi, dword ptr [edx + 4]
    mov dword ptr [ecx + 8], edi
    mov edi, dword ptr [esi + 4]
    test edi, edi
    je L2
    mov ebp, dword ptr [esi]
    jmp L3
    or ebp, 0xffffffff
    mov dword ptr [esi + eax], edi
    mov edi, dword ptr [esp + 0x18]
    mov dword ptr [ebx], ebp
    add ecx, 0x20
    add edx, 0x20
    add esi, 0x20
    add ebx, 0x20
    dec edi
    mov dword ptr [esp + 0x18], edi
    jne L4
    pop edi
    pop esi
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_10004300 ENDP
END