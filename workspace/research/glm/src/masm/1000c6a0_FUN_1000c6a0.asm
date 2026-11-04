.686
.MODEL FLAT, C
EXTRN sub_100171D8:PROC
EXTRN sub_10061CAC:PROC
EXTRN sub_10061CBF:PROC
EXTRN sub_10061CE3:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D4B04:DWORD
EXTRN fp_101D4B1C:DWORD
EXTRN fp_101D4B20:DWORD
EXTRN g_101D1B2C:DWORD
.CODE
FUN_1000c6a0 PROC
    push ecx
    push esi
    push edi
    mov esi, eax
    push 1
    lea eax, [esp + 12]
    push eax
    push esi
    call dword ptr [fp_101D4B04]
    mov edi, eax
    add esp, 12
    test edi, edi
    jge L1
    cmp edi, -2
    push esi
    jne L0
    push 010193190h
    call sub_10061CAC
    add esp, 8
    pop edi
    xor eax, eax
    pop esi
    pop ecx
    ret
L0:
    push 01019316Ch
    call sub_10061CBF
    add esp, 8
    pop edi
    xor eax, eax
    pop esi
    pop ecx
    ret
L1:
    cmp edi, 16
    jae L2
    mov ecx, dword ptr [esp + 8]
    push ecx
    call dword ptr [fp_101D4B1C]
    push esi
    push 010193148h
    call sub_10061CE3
    add esp, 12
    pop edi
    xor eax, eax
    pop esi
    pop ecx
    ret
L2:
    lea edx, [edi + 4]
    push ebx
    push edx
    call dword ptr [fp_101D49D4]
    mov esi, eax
    mov eax, dword ptr [esp + 16]
    push eax
    push 16
    push esi
    call dword ptr [fp_101D4B20]
    mov ecx, dword ptr [esp + 28]
    push ecx
    add edi, -16
    lea ebx, [esi + 20]
    push edi
    push ebx
    call dword ptr [fp_101D4B20]
    mov edx, dword ptr [esp + 40]
    push edx
    call dword ptr [fp_101D4B1C]
    mov edi, dword ptr [esi]
    mov eax, dword ptr [esi + 12]
    lea ecx, [esi + 4]
    add edi, ecx
    add eax, ecx
    mov dword ptr [esi + 16], ebx
    mov dword ptr [esi], edi
    mov cl, byte ptr [eax]
    add esp, 32
    test cl, cl
    pop ebx
    jne L3
    mov eax, dword ptr [g_101D1B2C]
    mov dword ptr [esi + 12], eax
    pop edi
    mov eax, esi
    pop esi
    pop ecx
    ret
L3:
    mov ecx, dword ptr [esp + 16]
    push ecx
    call sub_100171D8
    add esp, 4
    mov dword ptr [esi + 12], eax
    pop edi
    mov eax, esi
    pop esi
    pop ecx
    ret
FUN_1000c6a0 ENDP
END
