.686
.MODEL FLAT, C
EXTRN sub_1003EDB8:PROC
EXTRN sub_1005EB9F:PROC
EXTRN sub_100EFEC4:PROC
EXTRN sub_100F6D26:PROC
EXTRN sub_100F6DE2:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4A1C:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D4810:DWORD
EXTRN g_101D497C:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076674C:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_100386b0 PROC
    push ecx
    push ebx
    mov ebx, eax
    mov eax, dword ptr [g_101D497C]
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    add ebx, ebx
    add ecx, ebx
    cmp ecx, edx
    setg dl
    test dl, dl
    push ebp
    push esi
    je L0
    mov dword ptr [eax], 0
    mov eax, dword ptr [g_101D497C]
L0:
    cmp dword ptr [eax], 0
    jne L1
    mov eax, 0101D4970h
    mov dword ptr [g_101D497C], eax
L1:
    mov ecx, dword ptr [eax]
    mov esi, dword ptr [eax + 8]
    mov ebp, ecx
    shr ebp, 1
    test dl, dl
    jne L3
    mov eax, dword ptr [g_101D4810]
    test eax, eax
    jne L2
    test ecx, ecx
    je L3
L2:
    mov eax, 000001000h
    jmp L4
L3:
    mov eax, 000002000h
L4:
    mov edx, dword ptr [esi]
    push edi
    push eax
    lea eax, [esp + 20]
    push eax
    push ebx
    push ecx
    push esi
    call dword ptr [edx + 0x2c]
    mov edi, eax
    test edi, edi
    jge L5
    push 010194030h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
    push edi
    call sub_100EFEC4
    push eax
    push 010194008h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    call dword ptr [fp_101D4A1C]
L5:
    mov ecx, dword ptr [esp + 24]
    mov edx, dword ptr [esp + 16]
    push ebx
    push ecx
    push edx
    call sub_1005EB9F
    add esp, 12
    pop edi
L6:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L7
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L7
    push 010198E58h
    push 010193358h
    push eax
    call sub_100F6DE2
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6D26
    add esp, 16
L7:
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx + 0x30]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L6
    cmp dword ptr [g_1076674C], esi
    je L8
    call sub_1003EDB8
L8:
    mov eax, dword ptr [g_101D497C]
    mov ecx, dword ptr [eax]
    add ecx, ebx
    pop esi
    mov dword ptr [eax], ecx
    mov eax, ebp
    pop ebp
    pop ebx
    pop ecx
    ret
FUN_100386b0 ENDP
END
