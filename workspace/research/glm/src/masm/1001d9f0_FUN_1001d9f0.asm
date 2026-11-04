.686
.MODEL FLAT, C
EXTRN sub_1001D97F:PROC
EXTRN fp_101D4B98:DWORD
EXTRN fp_101D4BA0:DWORD
EXTRN fp_101D4BD8:DWORD
.CODE
FUN_1001d9f0 PROC
    push ecx
    push ebp
    mov ebp, dword ptr [esp + 20]
    push esi
    push edi
    push ebx
    mov esi, eax
    call dword ptr [fp_101D4B98]
    mov edi, eax
    mov eax, dword ptr [esi + 56]
    push eax
    lea eax, [esi + 60]
    call sub_1001D97F
    fstp dword ptr [esp + 20]
    add esp, 8
    xor esi, esi
    test edi, edi
    jle L1
    lea esp, [esp]
L0:
    mov ecx, dword ptr [esp + 12]
    push ecx
    push esi
    push ebx
    call dword ptr [fp_101D4BD8]
    add esp, 12
    mov byte ptr [esi + ebp], al
    inc esi
    cmp esi, edi
    jl L0
L1:
    mov edx, dword ptr [esp + 24]
    mov eax, dword ptr [esp + 20]
    push ebp
    push edx
    push eax
    push ebx
    call dword ptr [fp_101D4BA0]
    add esp, 16
    pop edi
    pop esi
    pop ebp
    pop ecx
    ret
FUN_1001d9f0 ENDP
END
