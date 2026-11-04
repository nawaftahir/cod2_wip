; FUN_10004670 @ 0x10004670 — auto-synthesized
    EXTRN fp_101d49d4:DWORD
    EXTRN g_101ae490:DWORD
    EXTRN g_101ae498:DWORD
    sub_10001959 PROTO C
    sub_1000471d PROTO C
.CODE
FUN_10004670 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push edi
    mov ebx, 2
    mov edx, 0x15
    mov eax, ebp
    call sub_10001959
    mov esi, eax
    mov eax, dword ptr [ebp]
    mov edi, dword ptr [eax + 0xb4]
    mov eax, dword ptr [ebp + 4]
    lea ecx, [esi*4]
    push ecx
    add edi, eax
    call dword ptr [fp_101d49d4]
    add esp, 4
    xor ecx, ecx
    test esi, esi
    mov dword ptr [g_101ae490], eax
    jle sub_1000471d
    jmp L0
    lea esp, [esp]
    mov edi, edi
    movsx edx, word ptr [edi + ecx*2]
    mov ebx, dword ptr [g_101ae498]
    lea edx, [edx + edx*8]
    lea edx, [ebx + edx*4]
    mov dword ptr [eax + ecx*4], edx
    inc ecx
FUN_10004670 ENDP
END