; FUN_10018890 @ 0x10018890 — auto-synthesized
    EXTRN fp_101d49d4:DWORD
    sub_1005eb17 PROTO C
.CODE
FUN_10018890 PROC
    push ebx
    push esi
    push edi
    mov edi, eax
    mov esi, edi
    shl esi, 5
    lea eax, [esi + 4]
    push eax
    call dword ptr [fp_101d49d4]
    mov ecx, dword ptr [esp + 0x14]
    mov ebx, eax
    push esi
    push ecx
    lea edx, [ebx + 4]
    push edx
    mov dword ptr [ebx], edi
    call sub_1005eb17
    add esp, 0x10
    test edi, edi
    jle L0
    lea eax, [ebx + 0x20]
    mov ecx, dword ptr [eax - 4]
    mov edx, dword ptr [eax]
    not ecx
    not edx
    mov dword ptr [eax - 4], ecx
    mov dword ptr [eax], edx
    add eax, 0x20
    dec edi
    jne L1
    pop edi
    pop esi
    mov eax, ebx
    pop ebx
    ret
FUN_10018890 ENDP
END