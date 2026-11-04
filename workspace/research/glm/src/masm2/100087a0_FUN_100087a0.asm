.686
.MODEL FLAT, C
EXTRN sub_1000641F:PROC
EXTRN sub_100084F0:PROC
EXTRN sub_100086BF:PROC
EXTRN sub_100088C8:PROC
EXTRN sub_100088CF:PROC
EXTRN sub_100088D8:PROC
EXTRN sub_100088EF:PROC
EXTRN sub_100088FA:PROC
EXTRN sub_10008909:PROC
EXTRN sub_1000897A:PROC
EXTRN sub_1000897C:PROC
EXTRN sub_10008994:PROC
EXTRN sub_1001F7E0:PROC
EXTRN sub_1001FB6C:PROC
EXTRN sub_1002008F:PROC
EXTRN sub_10024790:PROC
EXTRN EXTRN fp_101D4BF8:DWORD:DWORD
EXTRN EXTRN g_1019BD78:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_10678510:DWORD:DWORD
.CODE
FUN_100087a0 PROC
    mov mov eax, dword ptr [esp + 4]
    mov mov edx, dword ptr [g_10678510]
    sub sub esp, 24
    push push ebx
    push push ebp
    push push esi
    mov mov esi, eax
    mov mov ebp, eax
    imul imul esi, esi, 52
    imul imul ebp, ebp, 116
    push push edi
    lea lea edi, [esp + 28]
    lea lea ebx, [esp + 16]
    add add esi, 010678AC4h
    add add ebp, edx
    call sub_100084F0
    mov mov eax, dword ptr [esp + 52]
    mov mov ecx, dword ptr [esp + 48]
    mov mov edx, ebx
    call sub_1000641F
    test test al, al
    jne sub_100088FA
    fld fld dword ptr [esp + 28]
    fsub fsub dword ptr [esp + 16]
    fcomp fcomp dword ptr [g_1019BD78]
    fld fld dword ptr [esp + 32]
    fsub fsub dword ptr [esp + 20]
    fnstsw fnstsw ax
    fcomp fcomp dword ptr [g_1019BD78]
    test test ah, 65
    fnstsw fnstsw ax
    jne L0
    test test ah, 65
    je sub_100088D8
    fld fld dword ptr [esp + 36]
    fsub fsub dword ptr [esp + 24]
    fcomp fcomp dword ptr [g_1019BD78]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_100088C8
    jmp sub_100088EF
    test test ah, 65
    jne sub_100088CF
    fld fld dword ptr [esp + 36]
    fsub fsub dword ptr [esp + 24]
    fcomp fcomp dword ptr [g_1019BD78]
    fnstsw fnstsw ax
    test test ah, 65
    je sub_10008909
    mov mov edx, dword ptr [esp + 44]
    lea lea eax, [esp + 28]
    push push eax
    mov mov eax, dword ptr [g_101D1B9C]
    lea lea ecx, [esp + 20]
    push push ecx
    mov mov ecx, dword ptr [eax + 12]
    push push edx
    push push ecx
    call sub_100086BF
    add add esp, 16
    cmp cmp eax, -1
    jne sub_1000897A
    push push esi
    mov mov eax, ebp
    call sub_1002008F
    mov mov edx, dword ptr [esi + 8]
    add add esp, 4
    push push edx
    call dword ptr [fp_101D4BF8]
    mov mov eax, dword ptr [ebp]
    add add esp, 4
    cmp cmp eax, 1
    jne sub_1000897C
    push push -1
    push push ebp
    push push esi
    call sub_1001F7E0
    add add esp, 12
    jmp sub_10008994
    push push ebp
    push push esi
    call sub_1001FB6C
    add add esp, 8
    mov mov eax, dword ptr [esp + 44]
    push push eax
    mov mov dword ptr [esi + 12], 5
    call sub_10024790
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 24
    ret ret
FUN_100087a0 ENDP
END
