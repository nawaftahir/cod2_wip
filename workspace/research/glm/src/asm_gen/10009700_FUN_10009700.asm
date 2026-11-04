; FUN_10009700 @ 0x10009700 — auto-synthesized
    EXTRN g_101ce5c0:DWORD
    EXTRN g_101ce5c4:DWORD
    sub_10007ea5 PROTO C
.CODE
FUN_10009700 PROC
    push ebp
    mov ebp, dword ptr [g_101ce5c0]
    push esi
    xor esi, esi
    test ebp, ebp
    push edi
    jle L0
    mov edi, dword ptr [g_101ce5c4]
    mov eax, dword ptr [edi + esi*4]
    mov ecx, dword ptr [eax + 0x1c]
    mov edx, dword ptr [eax + 0x20]
    mov eax, ebx
    call sub_10007ea5
    test al, al
    jne L1
    inc esi
    cmp esi, ebp
    jl L2
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
FUN_10009700 ENDP
END