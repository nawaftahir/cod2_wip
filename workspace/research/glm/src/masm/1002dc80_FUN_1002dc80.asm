.686
.MODEL FLAT, C
EXTRN sub_1002DBCE:PROC
EXTRN fp_101D4B3C:DWORD
EXTRN fp_101D4B48:DWORD
.CODE
FUN_1002dc80 PROC
    sub esp, 12
    push ebp
    push ebx
    call dword ptr [fp_101D4B48]
    add esp, 4
    xor ebp, ebp
    test eax, eax
    mov dword ptr [esp + 8], eax
    jle L3
    push esi
    push edi
    lea ebx, [ebx]
L0:
    lea eax, [esp + 20]
    push eax
    push ebp
    lea ecx, [esp + 20]
    push ecx
    push ebx
    call dword ptr [fp_101D4B3C]
    mov edi, eax
    add esp, 16
    xor esi, esi
    test edi, edi
    jle L2
    lea ecx, [ecx]
L1:
    mov edx, dword ptr [esp + 12]
    mov eax, dword ptr [edx + esi*4]
    push eax
    push ebx
    call sub_1002DBCE
    add esp, 8
    inc esi
    cmp esi, edi
    jl L1
L2:
    mov eax, dword ptr [esp + 16]
    inc ebp
    cmp ebp, eax
    jl L0
    pop edi
    pop esi
L3:
    pop ebp
    add esp, 12
    ret
FUN_1002dc80 ENDP
END
