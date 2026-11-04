; FUN_100043d0 @ 0x100043d0 — auto-synthesized
    EXTRN fp_101d49d4:DWORD
    EXTRN g_101ae494:DWORD
    sub_10001959 PROTO C
.CODE
FUN_100043d0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push edi
    mov ebx, 4
    mov edx, 0xb
    mov eax, ebp
    call sub_10001959
    mov esi, eax
    mov eax, dword ptr [ebp]
    mov edi, dword ptr [eax + 0x64]
    mov eax, dword ptr [ebp + 4]
    lea ecx, [esi*4]
    push ecx
    add edi, eax
    call dword ptr [fp_101d49d4]
    add esp, 4
    test esi, esi
    mov dword ptr [g_101ae494], eax
    jle L0
    sub edi, eax
    mov edx, dword ptr [edi + eax]
    mov dword ptr [eax], edx
    add eax, 4
    dec esi
    jne L1
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_100043d0 ENDP
END