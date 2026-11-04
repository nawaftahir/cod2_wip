.686
.MODEL FLAT, C
EXTRN sub_10060CB4:PROC
EXTRN sub_100EFE75:PROC
EXTRN fp_1010C0E0:DWORD
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4A1C:DWORD
EXTRN g_101D1BF4:DWORD
.CODE
FUN_100116c0 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    xor edi, edi
    lea esp, [esp]
L0:
    mov eax, dword ptr [g_101D1BF4]
    mov ecx, dword ptr [eax]
    push ebx
    push 1
    push ebp
    push eax
    call dword ptr [ecx + 0x38]
    mov esi, eax
    test esi, esi
    jge L1
    push 100
    call dword ptr [fp_1010C0E0]
    inc edi
    cmp edi, 20
    jne L0
    push esi
    call sub_100EFE75
    push eax
    push 010193FC4h
    call sub_10060CB4
    push 010194150h
    push 0
    mov esi, eax
    call dword ptr [fp_101D49C8]
    push 0101940F0h
    push 0
    call dword ptr [fp_101D49C8]
    push 010194090h
    push 0
    call dword ptr [fp_101D49C8]
    push esi
    push 010194088h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 44
    pop edi
    pop esi
    pop ebp
    call dword ptr [fp_101D4A1C]
L1:
    pop edi
    pop esi
    pop ebp
    ret
FUN_100116c0 ENDP
END
