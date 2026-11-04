.686
.MODEL FLAT, C
EXTRN sub_1002E8C2:PROC
EXTRN sub_10032FD2:PROC
EXTRN sub_10033097:PROC
EXTRN sub_1003A94D:PROC
EXTRN EXTRN fp_1010C02C:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101D1B2C:DWORD:DWORD
.CODE
FUN_100330c0 PROC
    sub sub esp, 24
    push push ebx
    push push ebp
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [g_101D1B2C]
    mov mov ecx, dword ptr [esi + 60]
    cmp cmp ecx, dword ptr [eax + 60]
    push push edi
    mov mov edi, dword ptr [esp + 52]
    jne L0
    mov mov edx, dword ptr [esi + 64]
    cmp cmp edx, dword ptr [eax + 64]
    jne L1
    mov mov ecx, dword ptr [esi + 56]
    cmp cmp ecx, dword ptr [eax + 56]
    jne L2
    fld fld dword ptr [g_1019BC84]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 24
    ret ret
    lea lea edx, [esp + 24]
    push push edx
    call sub_10032FD2
    add add esp, 4
    test test edi, edi
    jle L3
    mov mov ebp, dword ptr [esp + 48]
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esp + 44]
    push push 03F800000h
    push push 03F800000h
    push push 0
    push push 0
L2:
    push push ebp
    push push eax
    push push 0
    push push 0
    or or ebx, -1
    mov mov eax, esi
    call sub_1002E8C2
    add add esp, 32
    dec dec edi
    jne L4
    call sub_1003A94D
    lea lea ecx, [esp + 16]
    push push ecx
    call sub_10033097
    add add esp, 4
    lea lea edx, [esp + 32]
    push push edx
    call dword ptr [fp_1010C02C]
    fild fild dword ptr [esp + 52]
    mov mov esi, dword ptr [esp + 24]
    mov mov eax, dword ptr [esp + 16]
    mov mov edx, dword ptr [esp + 28]
    mov mov ecx, dword ptr [esp + 20]
    sub sub eax, esi
    sbb sbb ecx, edx
    mov mov dword ptr [esp + 24], eax
    mov mov dword ptr [esp + 28], ecx
    fild fild qword ptr [esp + 24]
    fild fild qword ptr [esp + 32]
    pop pop edi
    pop pop esi
    pop pop ebp
    fdivp fdivp st(1)
    pop pop ebx
    fdivp fdivp st(1)
    add add esp, 24
L4:
    ret ret
FUN_100330c0 ENDP
END
