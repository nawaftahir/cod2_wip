.686
.MODEL FLAT, C
EXTRN sub_1001176C:PROC
EXTRN sub_10060CB4:PROC
EXTRN sub_100EFE75:PROC
EXTRN EXTRN fp_1010C0E0:DWORD:DWORD
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4A1C:DWORD:DWORD
EXTRN EXTRN g_101D1BF4:DWORD:DWORD
.CODE
FUN_100116c0 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    push push esi
    push push edi
    xor xor edi, edi
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101D1BF4]
    mov mov ecx, dword ptr [eax]
    push push ebx
    push push 1
    push push ebp
    push push eax
    call call dword ptr [ecx + 56]
    mov mov esi, eax
    test test esi, esi
    jge sub_1001176C
    push push 100
    call dword ptr [fp_1010C0E0]
    inc inc edi
    cmp cmp edi, 20
    jne L0
    push push esi
    call sub_100EFE75
    push push eax
    push push 010193FC4h
    call sub_10060CB4
    push push 010194150h
    push push 0
    mov mov esi, eax
    call dword ptr [fp_101D49C8]
    push push 0101940F0h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 010194090h
    push push 0
    call dword ptr [fp_101D49C8]
    push push esi
    push push 010194088h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 44
    pop pop edi
    pop pop esi
    pop pop ebp
    call dword ptr [fp_101D4A1C]
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
FUN_100116c0 ENDP
END
