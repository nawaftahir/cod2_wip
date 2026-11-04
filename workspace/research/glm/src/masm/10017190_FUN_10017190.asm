.686
.MODEL FLAT, C
EXTRN sub_1001710D:PROC
EXTRN fp_101D49C8:DWORD
EXTRN g_101D1B2C:DWORD
EXTRN g_101D1B30:DWORD
.CODE
FUN_10017190 PROC
    push esi
    push 0
    mov eax, 010193674h
    call sub_1001710D
    mov ecx, dword ptr [g_101D1B2C]
    mov dword ptr [g_101D1B30], eax
    mov edx, dword ptr [eax + 60]
    mov esi, dword ptr [ecx + 60]
    add esp, 4
    cmp edx, esi
    jne L0
    mov edx, dword ptr [eax + 64]
    cmp edx, dword ptr [ecx + 64]
    jne L0
    mov edx, dword ptr [eax + 56]
    cmp edx, dword ptr [ecx + 56]
    je L1
L0:
    cmp word ptr [eax + 52], 1
    je L1
    push 010194360h
    push 3
    call dword ptr [fp_101D49C8]
    mov eax, dword ptr [g_101D1B2C]
    add esp, 8
    mov dword ptr [g_101D1B30], eax
L1:
    pop esi
    ret
FUN_10017190 ENDP
END
