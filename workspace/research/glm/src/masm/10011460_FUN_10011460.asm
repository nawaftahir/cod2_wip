.686
.MODEL FLAT, C
EXTRN g_101D1BF4:DWORD
EXTRN g_101D4814:DWORD
EXTRN g_101D4818:DWORD
.CODE
FUN_10011460 PROC
    push ecx
    push esi
    mov esi, dword ptr [edi + 32]
    cmp esi, 1
    jle L1
    lea ebx, [ebx]
L0:
    mov eax, dword ptr [g_101D1BF4]
    lea edx, [esp + 4]
    push edx
    xor edx, edx
    mov dword ptr [g_101D4814], esi
    cmp byte ptr [edi + 8], dl
    mov ecx, dword ptr [eax]
    sete dl
    push esi
    push edx
    push 21
    push 1
    push 0
    push eax
    call dword ptr [ecx + 0x2c]
    test eax, eax
    jge L2
    dec esi
    cmp esi, 1
    jg L0
L1:
    mov dword ptr [g_101D4814], 0
    mov dword ptr [g_101D4818], 0
    pop esi
    pop ecx
    ret
L2:
    mov eax, dword ptr [esp + 4]
    dec eax
    mov dword ptr [g_101D4818], eax
    pop esi
    pop ecx
    ret
FUN_10011460 ENDP
END
