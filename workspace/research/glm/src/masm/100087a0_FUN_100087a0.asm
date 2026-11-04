.686
.MODEL FLAT, C
EXTRN sub_1000641F:PROC
EXTRN sub_100084F0:PROC
EXTRN sub_100086BF:PROC
EXTRN sub_1001F7E0:PROC
EXTRN sub_1001FB6C:PROC
EXTRN sub_1002008F:PROC
EXTRN sub_10024790:PROC
EXTRN fp_101D4BF8:DWORD
EXTRN g_1019BD78:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_10678510:DWORD
.CODE
FUN_100087a0 PROC
    mov eax, dword ptr [esp + 4]
    mov edx, dword ptr [g_10678510]
    sub esp, 24
    push ebx
    push ebp
    push esi
    mov esi, eax
    mov ebp, eax
    imul esi, esi, 52
    imul ebp, ebp, 116
    push edi
    lea edi, [esp + 28]
    lea ebx, [esp + 16]
    add esi, 010678AC4h
    add ebp, edx
    call sub_100084F0
    mov eax, dword ptr [esp + 52]
    mov ecx, dword ptr [esp + 48]
    mov edx, ebx
    call sub_1000641F
    test al, al
    jne L5
    fld dword ptr [esp + 28]
    fsub dword ptr [esp + 16]
    fcomp dword ptr [g_1019BD78]
    fld dword ptr [esp + 32]
    fsub dword ptr [esp + 20]
    fnstsw ax
    fcomp dword ptr [g_1019BD78]
    test ah, 65
    fnstsw ax
    jne L0
    test ah, 65
    je L2
    fld dword ptr [esp + 36]
    fsub dword ptr [esp + 24]
    fcomp dword ptr [g_1019BD78]
    fnstsw ax
    test ah, 65
    jne L1
    jmp L2
L0:
    test ah, 65
    jne L1
    fld dword ptr [esp + 36]
    fsub dword ptr [esp + 24]
    fcomp dword ptr [g_1019BD78]
    fnstsw ax
    test ah, 65
    je L2
L1:
    mov edx, dword ptr [esp + 44]
    lea eax, [esp + 28]
    push eax
    mov eax, dword ptr [g_101D1B9C]
    lea ecx, [esp + 20]
    push ecx
    mov ecx, dword ptr [eax + 12]
    push edx
    push ecx
    call sub_100086BF
    add esp, 16
    cmp eax, -1
    jne L5
L2:
    push esi
    mov eax, ebp
    call sub_1002008F
    mov edx, dword ptr [esi + 8]
    add esp, 4
    push edx
    call dword ptr [fp_101D4BF8]
    mov eax, dword ptr [ebp]
    add esp, 4
    cmp eax, 1
    jne L3
    push -1
    push ebp
    push esi
    call sub_1001F7E0
    add esp, 12
    jmp L4
L3:
    push ebp
    push esi
    call sub_1001FB6C
    add esp, 8
L4:
    mov eax, dword ptr [esp + 44]
    push eax
    mov dword ptr [esi + 12], 5
    call sub_10024790
    add esp, 4
L5:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 24
    ret
FUN_100087a0 ENDP
END
