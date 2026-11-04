.686
.MODEL FLAT, C
EXTRN sub_1001710D:PROC
EXTRN sub_100171EA:PROC
EXTRN sub_100171F2:PROC
EXTRN sub_1001721B:PROC
EXTRN sub_10017222:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN g_101D1B2C:DWORD:DWORD
EXTRN EXTRN g_101D1B30:DWORD:DWORD
.CODE
FUN_10017190 PROC
    push push esi
    push push 0
    mov mov eax, 010193674h
    call sub_1001710D
    mov mov ecx, dword ptr [g_101D1B2C]
    mov mov dword ptr [g_101D1B30], eax
    mov mov edx, dword ptr [eax + 60]
    mov mov esi, dword ptr [ecx + 60]
    add add esp, 4
    cmp cmp edx, esi
    jne sub_100171EA
    mov mov edx, dword ptr [eax + 64]
    cmp cmp edx, dword ptr [ecx + 64]
    jne sub_100171F2
    mov mov edx, dword ptr [eax + 56]
    cmp cmp edx, dword ptr [ecx + 56]
    je sub_1001721B
    cmp cmp word ptr [eax + 52], 1
    je sub_10017222
    push push 010194360h
    push push 3
    call dword ptr [fp_101D49C8]
    mov mov eax, dword ptr [g_101D1B2C]
    add add esp, 8
    mov mov dword ptr [g_101D1B30], eax
    pop pop esi
    ret ret
FUN_10017190 ENDP
END
