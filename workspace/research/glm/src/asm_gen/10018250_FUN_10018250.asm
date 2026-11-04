; FUN_10018250 @ 0x10018250 — auto-synthesized
    EXTRN g_101da964:DWORD
    EXTRN g_101da968:DWORD
    sub_100f78fa PROTO C
.CODE
FUN_10018250 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push edi
    mov edi, dword ptr [g_101da964]
    xor ebx, ebx
    dec edi
    js L0
    mov ecx, dword ptr [g_101da968]
    lea esi, [edi + ebx]
    sar esi, 1
    lea eax, [esi + esi*2]
    mov edx, dword ptr [ecx + eax*4]
    push edx
    push ebp
    call sub_100f78fa
    add esp, 8
    test eax, eax
    je L1
    jge L2
    lea edi, [esi - 1]
    jmp L3
    lea ebx, [esi + 1]
    cmp ebx, edi
    jle L4
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
    mov ecx, dword ptr [g_101da968]
    lea eax, [esi + esi*2]
    mov edx, dword ptr [ecx + eax*4 + 8]
    lea eax, [ecx + eax*4]
    mov ecx, dword ptr [esp + 0x1c]
    pop edi
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [esp + 0x14]
    pop esi
    pop ebp
    mov dword ptr [eax], edx
    mov al, 1
    pop ebx
    ret
FUN_10018250 ENDP
END