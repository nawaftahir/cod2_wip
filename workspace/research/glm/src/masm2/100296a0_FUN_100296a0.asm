.686
.MODEL FLAT, C
EXTRN sub_100296FA:PROC
EXTRN sub_10029700:PROC
EXTRN sub_10029714:PROC
EXTRN EXTRN fp_101D4B3C:DWORD:DWORD
EXTRN EXTRN fp_101D4B48:DWORD:DWORD
.CODE
FUN_100296a0 PROC
    sub sub esp, 8
    push push ebp
    push push esi
    push push edi
    push push ebx
    xor xor edi, edi
    call dword ptr [fp_101D4B48]
    mov mov ebp, eax
    add add esp, 4
    xor xor esi, esi
    test test ebp, ebp
    jle sub_100296FA
    lea lea ebx, [ebx]
    lea lea eax, [esp + 12]
    push push eax
    push push esi
    lea lea ecx, [esp + 24]
    push push ecx
    push push ebx
    call dword ptr [fp_101D4B3C]
    add add esp, 16
    cmp cmp edi, eax
    jge sub_10029714
    mov mov edi, eax
    inc inc esi
    cmp cmp esi, ebp
    jl sub_10029700
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebp
    add add esp, 8
    ret ret
FUN_100296a0 ENDP
END
