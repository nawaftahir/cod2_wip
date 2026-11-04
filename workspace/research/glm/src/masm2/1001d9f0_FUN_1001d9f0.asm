.686
.MODEL FLAT, C
EXTRN sub_1001D97F:PROC
EXTRN sub_1001DA64:PROC
EXTRN sub_1001DA68:PROC
EXTRN EXTRN fp_101D4B98:DWORD:DWORD
EXTRN EXTRN fp_101D4BA0:DWORD:DWORD
EXTRN EXTRN fp_101D4BD8:DWORD:DWORD
.CODE
FUN_1001d9f0 PROC
    push push ecx
    push push ebp
    mov mov ebp, dword ptr [esp + 20]
    push push esi
    push push edi
    push push ebx
    mov mov esi, eax
    call dword ptr [fp_101D4B98]
    mov mov edi, eax
    mov mov eax, dword ptr [esi + 56]
    push push eax
    lea lea eax, [esi + 60]
    call sub_1001D97F
    fstp fstp dword ptr [esp + 20]
    add add esp, 8
    xor xor esi, esi
    test test edi, edi
    jle sub_1001DA64
    lea lea esp, [esp]
    mov mov ecx, dword ptr [esp + 12]
    push push ecx
    push push esi
    push push ebx
    call dword ptr [fp_101D4BD8]
    add add esp, 12
    mov mov byte ptr [esi + ebp], al
    inc inc esi
    cmp cmp esi, edi
    jl sub_1001DA68
    mov mov edx, dword ptr [esp + 24]
    mov mov eax, dword ptr [esp + 20]
    push push ebp
    push push edx
    push push eax
    push push ebx
    call dword ptr [fp_101D4BA0]
    add add esp, 16
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ecx
    ret ret
FUN_1001d9f0 ENDP
END
