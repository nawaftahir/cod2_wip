.686
.MODEL FLAT, C
EXTRN sub_1002E8C2:PROC
EXTRN sub_10032FD2:PROC
EXTRN sub_10033097:PROC
EXTRN sub_1003A94D:PROC
EXTRN fp_1010C02C:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_101D1B2C:DWORD
.CODE
FUN_100330c0 PROC
    sub esp, 24
    push ebx
    push ebp
    push esi
    mov esi, eax
    mov eax, dword ptr [g_101D1B2C]
    mov ecx, dword ptr [esi + 60]
    cmp ecx, dword ptr [eax + 60]
    push edi
    mov edi, dword ptr [esp + 52]
    jne L0
    mov edx, dword ptr [esi + 64]
    cmp edx, dword ptr [eax + 64]
    jne L0
    mov ecx, dword ptr [esi + 56]
    cmp ecx, dword ptr [eax + 56]
    jne L0
    fld dword ptr [g_1019BC84]
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 24
    ret
L0:
    lea edx, [esp + 24]
    push edx
    call sub_10032FD2
    add esp, 4
    test edi, edi
    jle L2
    mov ebp, dword ptr [esp + 48]
    lea ecx, [ecx]
L1:
    mov eax, dword ptr [esp + 44]
    push 03F800000h
    push 03F800000h
    push 0
    push 0
    push ebp
    push eax
    push 0
    push 0
    or ebx, 0FFFFFFFFh
    mov eax, esi
    call sub_1002E8C2
    add esp, 32
    dec edi
    jne L1
L2:
    call sub_1003A94D
    lea ecx, [esp + 16]
    push ecx
    call sub_10033097
    add esp, 4
    lea edx, [esp + 32]
    push edx
    call dword ptr [fp_1010C02C]
    fild dword ptr [esp + 52]
    mov esi, dword ptr [esp + 24]
    mov eax, dword ptr [esp + 16]
    mov edx, dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 20]
    sub eax, esi
    sbb ecx, edx
    mov dword ptr [esp + 24], eax
    mov dword ptr [esp + 28], ecx
    fild qword ptr [esp + 24]
    fild qword ptr [esp + 32]
    pop edi
    pop esi
    pop ebp
    fdivp st(1)
    pop ebx
    fdivp st(1)
    add esp, 24
    ret
FUN_100330c0 ENDP
END
