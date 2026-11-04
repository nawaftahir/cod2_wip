.686
.MODEL FLAT, C
EXTRN sub_1001DAAC:PROC
EXTRN sub_1001DAF1:PROC
EXTRN sub_1001DED9:PROC
EXTRN sub_1001E465:PROC
EXTRN sub_1001F28D:PROC
EXTRN sub_10020EC6:PROC
EXTRN fp_1010C024:DWORD
EXTRN fp_1010C0E4:DWORD
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4B7C:DWORD
EXTRN fp_101D4BA8:DWORD
EXTRN fp_101D4BB0:DWORD
EXTRN fp_101D4BD0:DWORD
EXTRN g_101CE7C8:DWORD
EXTRN g_101CE7D8:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_10692A5C:DWORD
EXTRN g_1076A86C:DWORD
.CODE
FUN_1001fa70 PROC
    sub esp, 000000FACh
    push ebp
    mov ebp, dword ptr [esp + 000000FB4h]
    mov eax, dword ptr [ebp + 12]
    cmp eax, 4
    push esi
    lea esi, [ebp + 12]
    mov dword ptr [esp + 8], esi
    jge L16
    push 2
    push 3
    push esi
    call dword ptr [fp_1010C0E4]
    cmp eax, 2
    je L1
L0:
    cmp dword ptr [esi], 4
    jl L0
    pop esi
    pop ebp
    add esp, 000000FACh
    ret
L1:
    push edi
    mov edi, dword ptr [ebp + 4]
    push edi
    mov dword ptr [esp + 28], edi
    call dword ptr [fp_101D4B7C]
    add esp, 4
    test eax, eax
    je L3
    mov eax, dword ptr [g_101CE7D8]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L2
    mov esi, dword ptr [esp + 000000FC0h]
    push ebp
    mov eax, edi
    call sub_1001DAF1
    push ebp
    mov eax, edi
    call sub_1001DED9
    mov esi, dword ptr [esp + 20]
    add esp, 8
L2:
    pop edi
    mov dword ptr [esi], 4
    pop esi
    pop ebp
    add esp, 000000FACh
    ret
L3:
    push ebx
    push edi
    call dword ptr [fp_101D4BD0]
    lea ecx, [esp + 44]
    push ecx
    mov dword ptr [esp + 40], eax
    lea edx, [esp + 112]
    push edx
    lea eax, [esp + 0000000C8h]
    push eax
    mov eax, dword ptr [esp + 000000FD4h]
    mov ebx, edi
    call sub_1001DAAC
    mov ebx, eax
    add esp, 16
    test ebx, ebx
    mov dword ptr [esp + 24], ebx
    je L4
    push edi
    call dword ptr [fp_101D4BA8]
    add esp, 4
    test eax, eax
    mov dword ptr [esp + 36], eax
    je L4
    push ebx
    push 010692A5Ch
    call dword ptr [fp_1010C024]
    lea ecx, [eax + ebx]
    cmp ecx, 000001000h
    jbe L5
    mov edx, dword ptr [g_101DA9C8]
    mov ecx, dword ptr [g_1076A86C]
    mov dword ptr [g_10692A5C], 000001000h
    mov eax, dword ptr [edx]
    cmp ecx, eax
    je L4
    push 010196944h
    push 2
    mov dword ptr [g_1076A86C], eax
    call dword ptr [fp_101D49C8]
    add esp, 8
L4:
    pop ebx
    pop edi
    mov dword ptr [esi], 4
    pop esi
    pop ebp
    add esp, 000000FACh
    ret
L5:
    lea eax, [eax*4 + 010692A60h]
    xor edi, edi
    test ebx, ebx
    mov dword ptr [ebp + 44], eax
    lea esi, [esp + 0000001BCh]
    jle L7
    lea ecx, [esp + 0000000BCh]
    mov dword ptr [esp + 20], ecx
L6:
    mov eax, dword ptr [esp + 28]
    lea edx, [esp + 40]
    push edx
    push edi
    push eax
    mov eax, dword ptr [esp + 32]
    push ebp
    mov ebx, esi
    call sub_1001F28D
    add esp, 16
    test eax, eax
    je L15
    mov ecx, dword ptr [esp + 20]
    add esi, eax
    mov eax, dword ptr [esp + 24]
    inc edi
    add ecx, 4
    cmp edi, eax
    mov dword ptr [esp + 20], ecx
    jl L6
    mov ebx, eax
L7:
    mov eax, dword ptr [g_101DA9C8]
    lea edx, [esp + 0000001BCh]
    sub esi, edx
    push esi
    add eax, 000080008h
    push eax
    call dword ptr [fp_1010C024]
    lea ecx, [eax + esi]
    cmp ecx, 000020000h
    jbe L9
    mov eax, dword ptr [g_101DA9C8]
    mov ecx, dword ptr [g_1076A86C]
    mov dword ptr [eax + 000080008h], 000020000h
    mov eax, dword ptr [eax]
    cmp ecx, eax
    je L8
    push 01019690Ch
    push 2
    mov dword ptr [g_1076A86C], eax
    call dword ptr [fp_101D49C8]
    add esp, 8
L8:
    mov edx, dword ptr [esp + 16]
    pop ebx
    pop edi
    pop esi
    mov dword ptr [edx], 4
    pop ebp
    add esp, 000000FACh
    ret
L9:
    mov ecx, dword ptr [g_101DA9C8]
    lea edi, [ecx + eax + 00008000Ch]
    mov eax, dword ptr [g_101CE7C8]
    mov ecx, esi
    mov edx, ecx
    shr ecx, 2
    mov dword ptr [ebp + 48], edi
    lea esi, [esp + 0000001BCh]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov esi, dword ptr [esp + 28]
    mov dword ptr [ebp + 16], ebx
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L10
    mov eax, dword ptr [esp + 000000FC4h]
    mov edi, esi
    mov ebx, ebp
    call sub_1001E465
    mov ebx, dword ptr [esp + 24]
L10:
    cmp dword ptr [esp + 32], 1
    jne L11
    mov ecx, dword ptr [ebp + 48]
    mov edx, dword ptr [esp + 000000FC4h]
    mov esi, dword ptr [esp + 36]
    push 0
    mov dword ptr [esp + 52], ecx
    lea eax, [esp + 52]
    mov ecx, 8
    lea edi, [esp + 64]
    push eax
    mov dword ptr [esp + 60], ebx
    mov dword ptr [esp + 64], edx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    push 2
    jmp L14
L11:
    xor edi, edi
    test ebx, ebx
    jle L13
L12:
    movsx eax, word ptr [esp + edi*4 + 0000000BCh]
    push eax
    push esi
    call dword ptr [fp_101D4BB0]
    add esp, 8
    mov byte ptr [esp + edi + 122], al
    inc edi
    cmp edi, ebx
    jl L12
L13:
    mov eax, dword ptr [esp + 36]
    mov edx, dword ptr [esp + 000000FC4h]
    mov ecx, dword ptr [ebp + 48]
    mov dword ptr [esp + 100], eax
    xor eax, eax
    cmp ebx, 10
    setg al
    mov dword ptr [esp + 96], edx
    push 0
    lea edx, [esp + 96]
    mov dword ptr [esp + 96], ecx
    mov cl, byte ptr [esp + 36]
    push edx
    add eax, 6
    mov byte ptr [esp + 000000080h], bl
    mov byte ptr [esp + 000000081h], cl
    push eax
L14:
    call sub_10020EC6
    add esp, 12
L15:
    mov ecx, dword ptr [esp + 16]
    pop ebx
    mov dword ptr [ecx], 4
    pop edi
L16:
    pop esi
    pop ebp
    add esp, 000000FACh
    ret
FUN_1001fa70 ENDP
END
