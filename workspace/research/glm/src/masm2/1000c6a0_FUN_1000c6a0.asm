.686
.MODEL FLAT, C
EXTRN sub_1000C82E:PROC
EXTRN sub_100171D8:PROC
EXTRN sub_10061CAC:PROC
EXTRN sub_10061CBF:PROC
EXTRN sub_10061CE3:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D4B04:DWORD:DWORD
EXTRN EXTRN fp_101D4B1C:DWORD:DWORD
EXTRN EXTRN fp_101D4B20:DWORD:DWORD
EXTRN EXTRN g_101D1B2C:DWORD:DWORD
.CODE
FUN_1000c6a0 PROC
    push push ecx
    push push esi
    push push edi
    mov mov esi, eax
    push push 1
    lea lea eax, [esp + 12]
    push push eax
    push push esi
    call dword ptr [fp_101D4B04]
    mov mov edi, eax
    add add esp, 12
    test test edi, edi
    jge L1
    cmp cmp edi, -2
    push push esi
    jne L0
    push push 010193190h
    call sub_10061CAC
    add add esp, 8
    pop pop edi
    xor xor eax, eax
    pop pop esi
    pop pop ecx
    ret ret
    push push 01019316Ch
    call sub_10061CBF
    add add esp, 8
    pop pop edi
    xor xor eax, eax
    pop pop esi
    pop pop ecx
    ret ret
    cmp cmp edi, 16
    jae L2
    mov mov ecx, dword ptr [esp + 8]
    push push ecx
    call dword ptr [fp_101D4B1C]
    push push esi
    push push 010193148h
    call sub_10061CE3
    add add esp, 12
    pop pop edi
    xor xor eax, eax
    pop pop esi
    pop pop ecx
    ret ret
    lea lea edx, [edi + 4]
    push push ebx
    push push edx
    call dword ptr [fp_101D49D4]
    mov mov esi, eax
    mov mov eax, dword ptr [esp + 16]
    push push eax
    push push 16
    push push esi
    call dword ptr [fp_101D4B20]
    mov mov ecx, dword ptr [esp + 28]
    push push ecx
    add add edi, -16
    lea lea ebx, [esi + 20]
    push push edi
    push push ebx
    call dword ptr [fp_101D4B20]
    mov mov edx, dword ptr [esp + 40]
    push push edx
    call dword ptr [fp_101D4B1C]
    mov mov edi, dword ptr [esi]
    mov mov eax, dword ptr [esi + 12]
    lea lea ecx, [esi + 4]
    add add edi, ecx
    add add eax, ecx
    mov mov dword ptr [esi + 16], ebx
    mov mov dword ptr [esi], edi
    mov mov cl, byte ptr [eax]
    add add esp, 32
    test test cl, cl
    pop pop ebx
    jne sub_1000C82E
    mov mov eax, dword ptr [g_101D1B2C]
    mov mov dword ptr [esi + 12], eax
    pop pop edi
    mov mov eax, esi
    pop pop esi
    pop pop ecx
    ret ret
    mov mov ecx, dword ptr [esp + 16]
    push push ecx
    call sub_100171D8
    add add esp, 4
    mov mov dword ptr [esi + 12], eax
    pop pop edi
    mov mov eax, esi
    pop pop esi
    pop pop ecx
    ret ret
FUN_1000c6a0 ENDP
END
