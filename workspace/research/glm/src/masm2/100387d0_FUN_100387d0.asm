.686
.MODEL FLAT, C
EXTRN sub_10038915:PROC
EXTRN sub_10038918:PROC
EXTRN sub_10038923:PROC
EXTRN sub_100389A4:PROC
EXTRN sub_100389AC:PROC
EXTRN sub_100389D0:PROC
EXTRN sub_1003EE1A:PROC
EXTRN sub_1005EB67:PROC
EXTRN sub_100EFE8C:PROC
EXTRN sub_100F6CF3:PROC
EXTRN sub_100F6DAF:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4A1C:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D49A4:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_100387d0 PROC
    push push ecx
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, ecx
    imul imul eax, edi
    mov mov ebp, eax
    mov mov eax, dword ptr [g_101D49A4]
    mov mov esi, dword ptr [eax + 8]
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [esi]
    mov mov eax, ecx
    neg neg eax
    sbb sbb eax, eax
    and and eax, 0FFFFF000h
    add add eax, 02000h
    push push eax
    lea lea eax, [esp + 20]
    push push eax
    push push ebp
    push push ecx
    push push esi
    call call dword ptr [edx + 44]
    mov mov ebx, eax
    test test ebx, ebx
    jge L0
    push push 010194030h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    push push ebx
    call sub_100EFE8C
    push push eax
    push push 010194008h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    call dword ptr [fp_101D4A1C]
    mov mov ecx, dword ptr [esp + 28]
    mov mov edx, dword ptr [esp + 16]
    push push ebp
    push push ecx
    push push edx
    call sub_1005EB67
    add add esp, 12
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_10038915
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_10038923
    push push 010198E48h
    push push 010193358h
    push push eax
    call sub_100F6DAF
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6CF3
    add add esp, 16
    mov mov edx, dword ptr [esi]
    push push esi
    call call dword ptr [edx + 48]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_10038918
    mov mov ecx, dword ptr [esp + 24]
    mov mov edx, dword ptr [g_101D49A4]
    mov mov ebx, dword ptr [edx]
    lea lea eax, [ecx + ecx*2]
    shl shl eax, 2
    cmp cmp dword ptr [eax + 010766750h], esi
    jne sub_100389A4
    cmp cmp dword ptr [eax + 010766754h], ebx
    jne sub_100389AC
    cmp cmp dword ptr [eax + 010766758h], edi
    je sub_100389D0
    push push esi
    mov mov esi, ecx
    call sub_1003EE1A
    mov mov eax, dword ptr [g_101D49A4]
    mov mov ecx, dword ptr [eax]
    add add esp, 4
    pop pop edi
    pop pop esi
    add add ecx, ebp
    pop pop ebp
    mov mov dword ptr [eax], ecx
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov eax, dword ptr [edx]
    pop pop edi
    pop pop esi
    add add eax, ebp
    pop pop ebp
    mov mov dword ptr [edx], eax
    pop pop ebx
    pop pop ecx
    ret ret
FUN_100387d0 ENDP
END
