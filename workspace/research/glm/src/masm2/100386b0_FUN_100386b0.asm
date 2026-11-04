.686
.MODEL FLAT, C
EXTRN sub_1003885B:PROC
EXTRN sub_1003885E:PROC
EXTRN sub_10038869:PROC
EXTRN sub_100388BB:PROC
EXTRN sub_1003EDB8:PROC
EXTRN sub_1005EB9F:PROC
EXTRN sub_100EFEC4:PROC
EXTRN sub_100F6D26:PROC
EXTRN sub_100F6DE2:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4A1C:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D4810:DWORD:DWORD
EXTRN EXTRN g_101D497C:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076674C:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_100386b0 PROC
    push push ecx
    push push ebx
    mov mov ebx, eax
    mov mov eax, dword ptr [g_101D497C]
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [eax + 4]
    add add ebx, ebx
    add add ecx, ebx
    cmp cmp ecx, edx
    setg setg dl
    test test dl, dl
    push push ebp
    push push esi
    je L0
    mov mov dword ptr [eax], 0
    mov mov eax, dword ptr [g_101D497C]
    cmp cmp dword ptr [eax], 0
    jne L1
    mov mov eax, 0101D4970h
    mov mov dword ptr [g_101D497C], eax
    mov mov ecx, dword ptr [eax]
    mov mov esi, dword ptr [eax + 8]
    mov mov ebp, ecx
    shr shr ebp, 1
    test test dl, dl
    jne L2
    mov mov eax, dword ptr [g_101D4810]
    test test eax, eax
    jne L3
    test test ecx, ecx
    je L4
    mov mov eax, 01000h
    jmp L5
    mov mov eax, 02000h
    mov mov edx, dword ptr [esi]
    push push edi
    push push eax
    lea lea eax, [esp + 20]
    push push eax
    push push ebx
    push push ecx
    push push esi
    call call dword ptr [edx + 44]
    mov mov edi, eax
    test test edi, edi
    jge L6
    push push 010194030h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    push push edi
    call sub_100EFEC4
    push push eax
    push push 010194008h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    call dword ptr [fp_101D4A1C]
    mov mov ecx, dword ptr [esp + 24]
    mov mov edx, dword ptr [esp + 16]
    push push ebx
    push push ecx
L4:
    push push edx
    call sub_1005EB9F
    add add esp, 12
    pop pop edi
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_1003885B
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_10038869
    push push 010198E58h
    push push 010193358h
    push push eax
    call sub_100F6DE2
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6D26
    add add esp, 16
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx + 48]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003885E
    cmp cmp dword ptr [g_1076674C], esi
    je sub_100388BB
    call sub_1003EDB8
    mov mov eax, dword ptr [g_101D497C]
    mov mov ecx, dword ptr [eax]
    add add ecx, ebx
L6:
    pop pop esi
    mov mov dword ptr [eax], ecx
    mov mov eax, ebp
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
FUN_100386b0 ENDP
END
