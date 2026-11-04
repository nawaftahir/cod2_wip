.686
.MODEL FLAT, C
EXTRN sub_1002DBCE:PROC
EXTRN sub_1002DCF9:PROC
EXTRN sub_1002DCFF:PROC
EXTRN sub_1002DD13:PROC
EXTRN sub_1002DD16:PROC
EXTRN EXTRN fp_101D4B3C:DWORD:DWORD
EXTRN EXTRN fp_101D4B48:DWORD:DWORD
.CODE
FUN_1002dc80 PROC
    sub sub esp, 12
    push push ebp
    push push ebx
    call dword ptr [fp_101D4B48]
    add add esp, 4
    xor xor ebp, ebp
    test test eax, eax
    mov mov dword ptr [esp + 8], eax
    jle sub_1002DCF9
    push push esi
    push push edi
    lea lea ebx, [ebx]
    lea lea eax, [esp + 20]
    push push eax
    push push ebp
    lea lea ecx, [esp + 20]
    push push ecx
    push push ebx
    call dword ptr [fp_101D4B3C]
    mov mov edi, eax
    add add esp, 16
    xor xor esi, esi
    test test edi, edi
    jle sub_1002DD13
    lea lea ecx, [ecx]
    mov mov edx, dword ptr [esp + 12]
    mov mov eax, dword ptr [edx + esi*4]
    push push eax
    push push ebx
    call sub_1002DBCE
    add add esp, 8
    inc inc esi
    cmp cmp esi, edi
    jl sub_1002DD16
    mov mov eax, dword ptr [esp + 16]
    inc inc ebp
    cmp cmp ebp, eax
    jl sub_1002DCFF
    pop pop edi
    pop pop esi
    pop pop ebp
    add add esp, 12
    ret ret
FUN_1002dc80 ENDP
END
