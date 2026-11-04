.686
.MODEL FLAT, C
EXTRN sub_1005A98E:PROC
EXTRN sub_1005AE1E:PROC
EXTRN sub_1005BCCD:PROC
EXTRN sub_1005BD3E:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_1019BDE8:DWORD
EXTRN g_101CE678:DWORD
EXTRN g_101CE814:DWORD
.CODE
FUN_10025570 PROC
    xor eax, eax
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    mov ecx, 83
    mov edi, ebx
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebp]
    mov dword ptr [ebx + 48], eax
    mov ecx, dword ptr [ebp + 4]
    mov dword ptr [ebx + 52], ecx
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [ebx + 56], edx
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [ebx + 60], eax
    mov dword ptr [ebx + 64], 0
    mov dword ptr [ebx + 68], 03F800000h
    mov ecx, dword ptr [ebp + 24]
    mov dword ptr [ebx], ecx
    mov edx, dword ptr [ebp + 28]
    mov dword ptr [ebx + 4], edx
    mov eax, dword ptr [ebp + 32]
    mov dword ptr [ebx + 8], eax
    mov edx, dword ptr [ebp + 36]
    mov dword ptr [ebx + 12], edx
    mov eax, dword ptr [ebp + 40]
    mov dword ptr [ebx + 16], eax
    mov edx, dword ptr [ebp + 44]
    mov dword ptr [ebx + 20], edx
    mov eax, dword ptr [ebp + 48]
    lea ecx, [ebx + 12]
    mov dword ptr [ebx + 24], eax
    mov edx, dword ptr [ebp + 52]
    mov dword ptr [ebx + 28], edx
    mov eax, dword ptr [ebp + 56]
    mov dword ptr [ebx + 32], eax
    mov edx, dword ptr [ebp + 60]
    mov dword ptr [ebx + 36], edx
    mov eax, dword ptr [ebp + 64]
    mov dword ptr [ebx + 40], eax
    mov edx, dword ptr [ebp + 68]
    mov dword ptr [ebx + 44], edx
    lea edi, [ebx + 72]
    mov edx, ebx
    mov eax, edi
    call sub_1005BD3E
    fld dword ptr [ebp + 76]
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L0
    mov eax, dword ptr [ebp + 76]
    mov dword ptr [esp + 16], eax
    jmp L2
L0:
    mov ecx, dword ptr [g_101CE814]
    fld dword ptr [ecx + 8]
    fld dword ptr [g_1019BDE8]
    fsub st(1)
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 1
    jne L1
    fstp st(0)
    mov dword ptr [esp + 16], 03C23D70Ah
    jmp L2
L1:
    fstp dword ptr [esp + 16]
L2:
    mov edx, dword ptr [esp + 16]
    mov eax, dword ptr [ebp + 20]
    mov ecx, dword ptr [ebp + 16]
    push edx
    push eax
    lea esi, [ebx + 000000088h]
    push ecx
    call sub_1005BCCD
    mov edx, dword ptr [g_101CE678]
    mov eax, dword ptr [edx + 8]
    mov dword ptr [ebx + 000000148h], eax
    add esp, 12
    lea edx, [ebx + 0000000C8h]
    mov eax, esi
    mov ecx, edi
    call sub_1005A98E
    pop edi
    pop esi
    lea ecx, [ebx + 000000108h]
    mov eax, edx
    pop ebp
    jmp sub_1005AE1E
FUN_10025570 ENDP
END
