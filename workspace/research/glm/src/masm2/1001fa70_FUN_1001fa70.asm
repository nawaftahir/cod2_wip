.686
.MODEL FLAT, C
EXTRN sub_1001DAAC:PROC
EXTRN sub_1001DAF1:PROC
EXTRN sub_1001DED9:PROC
EXTRN sub_1001E465:PROC
EXTRN sub_1001F28D:PROC
EXTRN sub_1001FD87:PROC
EXTRN sub_1001FE21:PROC
EXTRN sub_1001FE27:PROC
EXTRN sub_1001FED1:PROC
EXTRN sub_1001FEEE:PROC
EXTRN sub_1001FF40:PROC
EXTRN sub_1001FF98:PROC
EXTRN sub_1001FFD1:PROC
EXTRN sub_10020EC6:PROC
EXTRN EXTRN fp_1010C024:DWORD:DWORD
EXTRN EXTRN fp_1010C0E4:DWORD:DWORD
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4B7C:DWORD:DWORD
EXTRN EXTRN fp_101D4BA8:DWORD:DWORD
EXTRN EXTRN fp_101D4BB0:DWORD:DWORD
EXTRN EXTRN fp_101D4BD0:DWORD:DWORD
EXTRN EXTRN g_101CE7C8:DWORD:DWORD
EXTRN EXTRN g_101CE7D8:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_10692A5C:DWORD:DWORD
EXTRN EXTRN g_1076A86C:DWORD:DWORD
.CODE
FUN_1001fa70 PROC
    sub sub esp, 0FACh
    push push ebp
    mov mov ebp, dword ptr [esp + 0FB4h]
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp eax, 4
    push push esi
    lea lea esi, [ebp + 12]
    mov mov dword ptr [esp + 8], esi
    jge sub_1001FD87
    push push 2
    push push 3
    push push esi
    call dword ptr [fp_1010C0E4]
    cmp cmp eax, 2
    je L1
    cmp cmp dword ptr [esi], 4
    jl L0
    pop pop esi
    pop pop ebp
    add add esp, 0FACh
    ret ret
    push push edi
    mov mov edi, dword ptr [ebp + 4]
    push push edi
    mov mov dword ptr [esp + 28], edi
    call dword ptr [fp_101D4B7C]
    add add esp, 4
    test test eax, eax
    je L3
    mov mov eax, dword ptr [g_101CE7D8]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L2
    mov mov esi, dword ptr [esp + 0FC0h]
L0:
    push push ebp
    mov mov eax, edi
    call sub_1001DAF1
    push push ebp
L1:
    mov mov eax, edi
    call sub_1001DED9
    mov mov esi, dword ptr [esp + 20]
    add add esp, 8
    pop pop edi
    mov mov dword ptr [esi], 4
    pop pop esi
    pop pop ebp
    add add esp, 0FACh
    ret ret
    push push ebx
    push push edi
    call dword ptr [fp_101D4BD0]
    lea lea ecx, [esp + 44]
    push push ecx
    mov mov dword ptr [esp + 40], eax
    lea lea edx, [esp + 112]
    push push edx
    lea lea eax, [esp + 0C8h]
    push push eax
    mov mov eax, dword ptr [esp + 0FD4h]
    mov mov ebx, edi
    call sub_1001DAAC
    mov mov ebx, eax
    add add esp, 16
    test test ebx, ebx
    mov mov dword ptr [esp + 24], ebx
    je L4
    push push edi
    call dword ptr [fp_101D4BA8]
    add add esp, 4
    test test eax, eax
    mov mov dword ptr [esp + 36], eax
    je L5
    push push ebx
    push push 010692A5Ch
    call dword ptr [fp_1010C024]
    lea lea ecx, [eax + ebx]
    cmp cmp ecx, 01000h
    jbe L6
    mov mov edx, dword ptr [g_101DA9C8]
    mov mov ecx, dword ptr [g_1076A86C]
    mov mov dword ptr [g_10692A5C], 01000h
    mov mov eax, dword ptr [edx]
    cmp cmp ecx, eax
    je L7
    push push 010196944h
    push push 2
    mov mov dword ptr [g_1076A86C], eax
    call dword ptr [fp_101D49C8]
    add add esp, 8
    pop pop ebx
    pop pop edi
    mov mov dword ptr [esi], 4
    pop pop esi
    pop pop ebp
    add add esp, 0FACh
    ret ret
    lea lea eax, [eax*4 + 010692A60h]
    xor xor edi, edi
    test test ebx, ebx
    mov mov dword ptr [ebp + 44], eax
    lea lea esi, [esp + 01BCh]
    jle L8
    lea lea ecx, [esp + 0BCh]
    mov mov dword ptr [esp + 20], ecx
    mov mov eax, dword ptr [esp + 28]
    lea lea edx, [esp + 40]
    push push edx
    push push edi
    push push eax
    mov mov eax, dword ptr [esp + 32]
    push push ebp
    mov mov ebx, esi
    call sub_1001F28D
    add add esp, 16
    test test eax, eax
    je sub_1001FED1
    mov mov ecx, dword ptr [esp + 20]
    add add esi, eax
    mov mov eax, dword ptr [esp + 24]
    inc inc edi
    add add ecx, 4
    cmp cmp edi, eax
    mov mov dword ptr [esp + 20], ecx
    jl L9
    mov mov ebx, eax
    mov mov eax, dword ptr [g_101DA9C8]
    lea lea edx, [esp + 01BCh]
    sub sub esi, edx
    push push esi
    add add eax, 080008h
    push push eax
    call dword ptr [fp_1010C024]
    lea lea ecx, [eax + esi]
    cmp cmp ecx, 020000h
    jbe sub_1001FE21
    mov mov eax, dword ptr [g_101DA9C8]
    mov mov ecx, dword ptr [g_1076A86C]
    mov mov dword ptr [eax + 080008h], 020000h
    mov mov eax, dword ptr [eax]
    cmp cmp ecx, eax
    je sub_1001FE27
    push push 01019690Ch
    push push 2
    mov mov dword ptr [g_1076A86C], eax
    call dword ptr [fp_101D49C8]
    add add esp, 8
    mov mov edx, dword ptr [esp + 16]
    pop pop ebx
    pop pop edi
L4:
    pop pop esi
    mov mov dword ptr [edx], 4
    pop pop ebp
    add add esp, 0FACh
    ret ret
    mov mov ecx, dword ptr [g_101DA9C8]
    lea lea edi, [ecx + eax + 08000Ch]
    mov mov eax, dword ptr [g_101CE7C8]
    mov mov ecx, esi
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov dword ptr [ebp + 48], edi
    lea lea esi, [esp + 01BCh]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov esi, dword ptr [esp + 28]
    mov mov dword ptr [ebp + 16], ebx
    mov mov ecx, dword ptr [eax + 8]
L7:
    test test ecx, ecx
    je sub_1001FEEE
    mov mov eax, dword ptr [esp + 0FC4h]
    mov mov edi, esi
    mov mov ebx, ebp
    call sub_1001E465
    mov mov ebx, dword ptr [esp + 24]
    cmp cmp dword ptr [esp + 32], 1
    jne sub_1001FF40
    mov mov ecx, dword ptr [ebp + 48]
    mov mov edx, dword ptr [esp + 0FC4h]
    mov mov esi, dword ptr [esp + 36]
    push push 0
    mov mov dword ptr [esp + 52], ecx
    lea lea eax, [esp + 52]
    mov mov ecx, 8
    lea lea edi, [esp + 64]
    push push eax
    mov mov dword ptr [esp + 60], ebx
    mov mov dword ptr [esp + 64], edx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    push push 2
    jmp sub_1001FFD1
    xor xor edi, edi
    test test ebx, ebx
    jle sub_1001FF98
    movsx movsx eax, word ptr [esp + edi*4 + 0BCh]
    push push eax
    push push esi
    call dword ptr [fp_101D4BB0]
    add add esp, 8
    mov mov byte ptr [esp + edi + 122], al
    inc inc edi
    cmp cmp edi, ebx
    jl sub_1001FF98
    mov mov eax, dword ptr [esp + 36]
    mov mov edx, dword ptr [esp + 0FC4h]
    mov mov ecx, dword ptr [ebp + 48]
    mov mov dword ptr [esp + 100], eax
    xor xor eax, eax
    cmp cmp ebx, 10
    setg setg al
    mov mov dword ptr [esp + 96], edx
    push push 0
    lea lea edx, [esp + 96]
    mov mov dword ptr [esp + 96], ecx
    mov mov cl, byte ptr [esp + 36]
    push push edx
    add add eax, 6
    mov mov byte ptr [esp + 080h], bl
    mov mov byte ptr [esp + 081h], cl
    push push eax
    call sub_10020EC6
    add add esp, 12
    mov mov ecx, dword ptr [esp + 16]
    pop pop ebx
    mov mov dword ptr [ecx], 4
    pop pop edi
    pop pop esi
    pop pop ebp
    add add esp, 0FACh
    ret ret
FUN_1001fa70 ENDP
END
