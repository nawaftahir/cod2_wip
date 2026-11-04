.686
.MODEL FLAT, C
EXTRN sub_1003EE1A:PROC
EXTRN sub_1005EB67:PROC
EXTRN sub_100EFE8C:PROC
EXTRN sub_100F6CF3:PROC
EXTRN sub_100F6DAF:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4A1C:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D49A4:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_100387d0 PROC
    push ecx
    push ebx
    push ebp
    push esi
    push edi
    mov edi, ecx
    imul eax, edi
    mov ebp, eax
    mov eax, dword ptr [g_101D49A4]
    mov esi, dword ptr [eax + 8]
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [esi]
    mov eax, ecx
    neg eax
    sbb eax, eax
    and eax, 0FFFFF000h
    add eax, 000002000h
    push eax
    lea eax, [esp + 20]
    push eax
    push ebp
    push ecx
    push esi
    call dword ptr [edx + 0x2c]
    mov ebx, eax
    test ebx, ebx
    jge L0
    push 010194030h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
    push ebx
    call sub_100EFE8C
    push eax
    push 010194008h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    call dword ptr [fp_101D4A1C]
L0:
    mov ecx, dword ptr [esp + 28]
    mov edx, dword ptr [esp + 16]
    push ebp
    push ecx
    push edx
    call sub_1005EB67
    add esp, 12
    lea ebx, [ebx]
L1:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L2
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L2
    push 010198E48h
    push 010193358h
    push eax
    call sub_100F6DAF
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6CF3
    add esp, 16
L2:
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx + 0x30]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L1
    mov ecx, dword ptr [esp + 24]
    mov edx, dword ptr [g_101D49A4]
    mov ebx, dword ptr [edx]
    lea eax, [ecx + ecx*2]
    shl eax, 2
    cmp dword ptr [eax + 010766750h], esi
    jne L3
    cmp dword ptr [eax + 010766754h], ebx
    jne L3
    cmp dword ptr [eax + 010766758h], edi
    je L4
L3:
    push esi
    mov esi, ecx
    call sub_1003EE1A
    mov eax, dword ptr [g_101D49A4]
    mov ecx, dword ptr [eax]
    add esp, 4
    pop edi
    pop esi
    add ecx, ebp
    pop ebp
    mov dword ptr [eax], ecx
    pop ebx
    pop ecx
    ret
L4:
    mov eax, dword ptr [edx]
    pop edi
    pop esi
    add eax, ebp
    pop ebp
    mov dword ptr [edx], eax
    pop ebx
    pop ecx
    ret
FUN_100387d0 ENDP
END
