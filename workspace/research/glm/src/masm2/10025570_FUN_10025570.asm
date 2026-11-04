.686
.MODEL FLAT, C
EXTRN sub_100256B5:PROC
EXTRN sub_100256EC:PROC
EXTRN sub_10025706:PROC
EXTRN sub_10025716:PROC
EXTRN sub_1005A98E:PROC
EXTRN sub_1005AE1E:PROC
EXTRN sub_1005BCCD:PROC
EXTRN sub_1005BD3E:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BDE8:DWORD:DWORD
EXTRN EXTRN g_101CE678:DWORD:DWORD
EXTRN EXTRN g_101CE814:DWORD:DWORD
.CODE
FUN_10025570 PROC
    xor xor eax, eax
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    push push esi
    push push edi
    mov mov ecx, 83
    mov mov edi, ebx
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebp]
    mov mov dword ptr [ebx + 48], eax
    mov mov ecx, dword ptr [ebp + 4]
    mov mov dword ptr [ebx + 52], ecx
    mov mov edx, dword ptr [ebp + 8]
    mov mov dword ptr [ebx + 56], edx
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [ebx + 60], eax
    mov mov dword ptr [ebx + 64], 0
    mov mov dword ptr [ebx + 68], 03F800000h
    mov mov ecx, dword ptr [ebp + 24]
    mov mov dword ptr [ebx], ecx
    mov mov edx, dword ptr [ebp + 28]
    mov mov dword ptr [ebx + 4], edx
    mov mov eax, dword ptr [ebp + 32]
    mov mov dword ptr [ebx + 8], eax
    mov mov edx, dword ptr [ebp + 36]
    mov mov dword ptr [ebx + 12], edx
    mov mov eax, dword ptr [ebp + 40]
    mov mov dword ptr [ebx + 16], eax
    mov mov edx, dword ptr [ebp + 44]
    mov mov dword ptr [ebx + 20], edx
    mov mov eax, dword ptr [ebp + 48]
    lea lea ecx, [ebx + 12]
    mov mov dword ptr [ebx + 24], eax
    mov mov edx, dword ptr [ebp + 52]
    mov mov dword ptr [ebx + 28], edx
    mov mov eax, dword ptr [ebp + 56]
    mov mov dword ptr [ebx + 32], eax
    mov mov edx, dword ptr [ebp + 60]
    mov mov dword ptr [ebx + 36], edx
    mov mov eax, dword ptr [ebp + 64]
    mov mov dword ptr [ebx + 40], eax
    mov mov edx, dword ptr [ebp + 68]
    mov mov dword ptr [ebx + 44], edx
    lea lea edi, [ebx + 72]
    mov mov edx, ebx
    mov mov eax, edi
    call sub_1005BD3E
    fld fld dword ptr [ebp + 76]
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_100256B5
    mov mov eax, dword ptr [ebp + 76]
    mov mov dword ptr [esp + 16], eax
    jmp sub_100256EC
    mov mov ecx, dword ptr [g_101CE814]
    fld fld dword ptr [ecx + 8]
    fld fld dword ptr [g_1019BDE8]
    fsub fsub st(1)
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 1
    jne sub_10025706
    fstp fstp st(0)
    mov mov dword ptr [esp + 16], 03C23D70Ah
    jmp sub_10025716
    fstp fstp dword ptr [esp + 16]
    mov mov edx, dword ptr [esp + 16]
    mov mov eax, dword ptr [ebp + 20]
    mov mov ecx, dword ptr [ebp + 16]
    push push edx
    push push eax
    lea lea esi, [ebx + 088h]
    push push ecx
    call sub_1005BCCD
    mov mov edx, dword ptr [g_101CE678]
    mov mov eax, dword ptr [edx + 8]
    mov mov dword ptr [ebx + 0148h], eax
    add add esp, 12
    lea lea edx, [ebx + 0C8h]
    mov mov eax, esi
    mov mov ecx, edi
    call sub_1005A98E
    pop pop edi
    pop pop esi
    lea lea ecx, [ebx + 0108h]
    mov mov eax, edx
    pop pop ebp
    jmp sub_1005AE1E
FUN_10025570 ENDP
END
