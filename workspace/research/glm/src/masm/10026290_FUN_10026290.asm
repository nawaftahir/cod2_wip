.686
.MODEL FLAT, C
EXTRN sub_10026148:PROC
EXTRN sub_100F5F33:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D49E0:DWORD
EXTRN fp_101D4B14:DWORD
EXTRN g_101D1B9C:DWORD
.CODE
FUN_10026290 PROC
    mov eax, dword ptr [g_101D1B9C]
    mov ecx, dword ptr [eax + 4]
    sub esp, 000000108h
    push esi
    push ecx
    lea edx, [esp + 12]
    push 010196F20h
    push edx
    call sub_100F5F33
    add esp, 12
    push 18
    push 000000080h
    mov eax, 3
    mov ecx, 000000080h
    call sub_10026148
    mov esi, eax
    add esp, 8
    test esi, esi
    je L0
    xor eax, eax
    mov ecx, esi
    mov dword ptr [ecx], eax
    mov dword ptr [ecx + 4], eax
    mov dword ptr [ecx + 8], eax
    mov dword ptr [ecx + 12], eax
    push 00000C012h
    mov word ptr [ecx + 16], ax
    lea edx, [esp + 12]
    push esi
    push edx
    mov byte ptr [esi + 2], 2
    mov byte ptr [esi + 12], 000000080h
    mov byte ptr [esi + 14], 000000080h
    mov byte ptr [esi + 16], 24
    call dword ptr [fp_101D4B14]
    add esp, 12
    push esi
    call dword ptr [fp_101D49E0]
    add esp, 4
    lea eax, [esp + 8]
    push eax
    push 010196F14h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
L0:
    pop esi
    add esp, 000000108h
    ret
FUN_10026290 ENDP
END
