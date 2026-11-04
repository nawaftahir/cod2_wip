.686
.MODEL FLAT, C
EXTRN fp_101D4B3C:DWORD
EXTRN fp_101D4B48:DWORD
.CODE
FUN_100296a0 PROC
    sub esp, 8
    push ebp
    push esi
    push edi
    push ebx
    xor edi, edi
    call dword ptr [fp_101D4B48]
    mov ebp, eax
    add esp, 4
    xor esi, esi
    test ebp, ebp
    jle L2
    lea ebx, [ebx]
L0:
    lea eax, [esp + 12]
    push eax
    push esi
    lea ecx, [esp + 24]
    push ecx
    push ebx
    call dword ptr [fp_101D4B3C]
    add esp, 16
    cmp edi, eax
    jge L1
    mov edi, eax
L1:
    inc esi
    cmp esi, ebp
    jl L0
L2:
    mov eax, edi
    pop edi
    pop esi
    pop ebp
    add esp, 8
    ret
FUN_100296a0 ENDP
END
