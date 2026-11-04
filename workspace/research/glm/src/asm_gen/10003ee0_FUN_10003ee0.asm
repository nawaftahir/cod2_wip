; FUN_10003ee0 @ 0x10003ee0 — auto-synthesized
    EXTRN fp_101d49d4:DWORD
    EXTRN g_101ae4a0:DWORD
    EXTRN g_101ae4a4:DWORD
    sub_10001959 PROTO C
    sub_10003dd8 PROTO C
    sub_10003ff7 PROTO C
.CODE
FUN_10003ee0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push edi
    mov ebx, 0xc
    mov edx, 0x16
    mov eax, ebp
    call sub_10001959
    mov esi, eax
    mov eax, dword ptr [ebp]
    mov edi, dword ptr [eax + 0xbc]
    mov eax, dword ptr [ebp + 4]
    lea ecx, [esi + esi*2]
    shl ecx, 4
    push ecx
    add edi, eax
    call dword ptr [fp_101d49d4]
    add esp, 4
    test esi, esi
    mov dword ptr [g_101ae4a0], eax
    mov dword ptr [g_101ae4a4], esi
    jle L0
    lea ecx, [edi + 8]
    add eax, 0x18
    mov ebx, esi
    mov edi, dword ptr [ecx - 4]
    test edi, edi
    je L1
    mov edx, dword ptr [ecx - 8]
    jmp L2
    or edx, 0xffffffff
    mov dword ptr [eax + 4], edx
    mov dword ptr [eax], edi
    mov edx, dword ptr [ecx]
    mov dword ptr [eax + 0x10], edx
    add ecx, 0xc
    add eax, 0x30
    dec ebx
    jne L3
    xor eax, eax
    test esi, esi
    jle sub_10003ff7
    jmp L4
    lea ebx, [ebx]
    mov ebx, dword ptr [g_101ae4a0]
    lea edx, [eax + eax*2]
    lea ecx, [eax + 1]
    shl edx, 4
    push ecx
    add edx, ebx
    push edx
    call sub_10003dd8
    add esp, 8
    cmp eax, esi
FUN_10003ee0 ENDP
END