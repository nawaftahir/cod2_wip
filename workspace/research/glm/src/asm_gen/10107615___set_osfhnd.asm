; __set_osfhnd @ 0x10107615 — auto-synthesized
    EXTRN fp_1010c0c0:DWORD
    EXTRN g_101add8c:DWORD
    EXTRN g_1076ac9c:DWORD
    sub_100fc27e PROTO C
    sub_100fc292 PROTO C
.CODE
__set_osfhnd PROC
    mov ecx, dword ptr [esp + 4]
    cmp ecx, dword ptr [g_1076ac9c]
    push esi
    push edi
    jae L0
    mov eax, ecx
    sar eax, 5
    lea edi, [eax*4 + 0x1076aca0]
    mov eax, ecx
    and eax, 0x1f
    lea esi, [eax + eax*8]
    mov eax, dword ptr [edi]
    shl esi, 2
    cmp dword ptr [esi + eax], -1
    jne L0
    cmp dword ptr [g_101add8c], 1
    push ebx
    mov ebx, dword ptr [esp + 0x14]
    jne L1
    sub ecx, 0
    je L2
    dec ecx
    je L3
    dec ecx
    jne L1
    push ebx
    push -0xc
    jmp L4
    push ebx
    push -0xb
    jmp L4
    push ebx
    push -0xa
    call dword ptr [fp_1010c0c0]
    mov eax, dword ptr [edi]
    mov dword ptr [esi + eax], ebx
    xor eax, eax
    pop ebx
    jmp L5
    call sub_100fc27e
    mov dword ptr [eax], 9
    call sub_100fc292
    and dword ptr [eax], 0
    or eax, 0xffffffff
    pop edi
    pop esi
    ret
__set_osfhnd ENDP
END