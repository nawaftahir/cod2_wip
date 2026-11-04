.686
.MODEL FLAT, C
EXTRN sub_100114F1:PROC
EXTRN EXTRN g_101D1BF4:DWORD:DWORD
EXTRN EXTRN g_101D4814:DWORD:DWORD
EXTRN EXTRN g_101D4818:DWORD:DWORD
.CODE
FUN_10011460 PROC
    push push ecx
    push push esi
    mov mov esi, dword ptr [edi + 32]
    cmp cmp esi, 1
    jle L0
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [g_101D1BF4]
    lea lea edx, [esp + 4]
    push push edx
    xor xor edx, edx
    mov mov dword ptr [g_101D4814], esi
    cmp cmp byte ptr [edi + 8], dl
    mov mov ecx, dword ptr [eax]
    sete sete dl
    push push esi
    push push edx
    push push 21
    push push 1
    push push 0
    push push eax
    call call dword ptr [ecx + 44]
    test test eax, eax
    jge sub_100114F1
    dec dec esi
    cmp cmp esi, 1
    jg L1
    mov mov dword ptr [g_101D4814], 0
L0:
    mov mov dword ptr [g_101D4818], 0
    pop pop esi
    pop pop ecx
    ret ret
    mov mov eax, dword ptr [esp + 4]
    dec dec eax
    mov mov dword ptr [g_101D4818], eax
    pop pop esi
    pop pop ecx
    ret ret
FUN_10011460 ENDP
END
