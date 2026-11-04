.686
.MODEL FLAT, C
EXTRN sub_10026148:PROC
EXTRN sub_10026368:PROC
EXTRN sub_100F5F33:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D49E0:DWORD:DWORD
EXTRN EXTRN fp_101D4B14:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
.CODE
FUN_10026290 PROC
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov ecx, dword ptr [eax + 4]
    sub sub esp, 0108h
    push push esi
    push push ecx
    lea lea edx, [esp + 12]
    push push 010196F20h
    push push edx
    call sub_100F5F33
    add add esp, 12
    push push 18
    push push 080h
    mov mov eax, 3
    mov mov ecx, 080h
    call sub_10026148
    mov mov esi, eax
    add add esp, 8
    test test esi, esi
    je sub_10026368
    xor xor eax, eax
    mov mov ecx, esi
    mov mov dword ptr [ecx], eax
    mov mov dword ptr [ecx + 4], eax
    mov mov dword ptr [ecx + 8], eax
    mov mov dword ptr [ecx + 12], eax
    push push 0C012h
    mov mov word ptr [ecx + 16], ax
    lea lea edx, [esp + 12]
    push push esi
    push push edx
    mov mov byte ptr [esi + 2], 2
    mov mov byte ptr [esi + 12], 080h
    mov mov byte ptr [esi + 14], 080h
    mov mov byte ptr [esi + 16], 24
    call dword ptr [fp_101D4B14]
    add add esp, 12
    push push esi
    call dword ptr [fp_101D49E0]
    add add esp, 4
    lea lea eax, [esp + 8]
    push push eax
    push push 010196F14h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    pop pop esi
    add add esp, 0108h
    ret ret
FUN_10026290 ENDP
END
