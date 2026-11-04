.686
.MODEL FLAT, C
EXTRN sub_1001DA19:PROC
EXTRN sub_1001DAFE:PROC
EXTRN sub_1001DEEC:PROC
EXTRN sub_1001E494:PROC
EXTRN sub_1001F428:PROC
EXTRN sub_1001FA84:PROC
EXTRN sub_1001FA85:PROC
EXTRN sub_1001FAC5:PROC
EXTRN sub_1001FACC:PROC
EXTRN sub_1001FBB6:PROC
EXTRN sub_1001FC76:PROC
EXTRN sub_1001FCD5:PROC
EXTRN sub_1001FD2E:PROC
EXTRN sub_10020F42:PROC
EXTRN EXTRN fp_1010C024:DWORD:DWORD
EXTRN EXTRN fp_1010C0E4:DWORD:DWORD
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4B3C:DWORD:DWORD
EXTRN EXTRN fp_101D4B40:DWORD:DWORD
EXTRN EXTRN fp_101D4B50:DWORD:DWORD
EXTRN EXTRN fp_101D4B64:DWORD:DWORD
EXTRN EXTRN fp_101D4B74:DWORD:DWORD
EXTRN EXTRN fp_101D4BE4:DWORD:DWORD
EXTRN EXTRN g_101CE7C8:DWORD:DWORD
EXTRN EXTRN g_101CE7D8:DWORD:DWORD
EXTRN EXTRN g_101D7E10:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_10692A5C:DWORD:DWORD
EXTRN EXTRN g_1076A874:DWORD:DWORD
.CODE
FUN_1001f6f0 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    sub sub esp, 0EB4h
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebx + 12]
    cmp cmp eax, 4
    push push esi
    push push edi
    lea lea edi, [ebx + 12]
    mov mov dword ptr [esp + 20], edi
    jge sub_1001FA84
    push push 2
    push push 3
    push push edi
    call dword ptr [fp_1010C0E4]
    cmp cmp eax, 2
    je L1
    cmp cmp dword ptr [edi], 4
    jl L0
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
    mov mov esi, dword ptr [ebx + 4]
    push push esi
    mov mov dword ptr [esp + 36], esi
    call dword ptr [fp_101D4B40]
    add add esp, 4
    test test eax, eax
    je L3
    mov mov eax, dword ptr [g_101CE7D8]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L2
    mov mov ecx, dword ptr [g_101D7E10]
    push push esi
    push push ecx
    call dword ptr [fp_101D4BE4]
    mov mov eax, dword ptr [g_101D7E10]
    mov mov esi, dword ptr [ebp + 12]
    push push ebx
    call sub_1001DAFE
    mov mov eax, dword ptr [g_101D7E10]
    add add esp, 12
    push push ebx
    call sub_1001DEEC
    add add esp, 4
    mov mov dword ptr [edi], 4
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
    push push esi
    call dword ptr [fp_101D4B64]
    mov mov dword ptr [esp + 40], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov edx, dword ptr [eax + 56]
    add add esp, 4
    push push edx
    add add eax, 60
    call sub_1001DA19
    fstp fstp dword ptr [esp + 28]
    mov mov eax, dword ptr [esp + 28]
    add add esp, 4
    push push eax
    push push esi
    call dword ptr [fp_101D4B50]
    add add esp, 8
    test test eax, eax
    mov mov dword ptr [esp + 28], eax
    jl L5
    lea lea ecx, [esp + 40]
    push push ecx
    push push eax
    lea lea edx, [esp + 52]
    push push edx
    push push esi
    call dword ptr [fp_101D4B3C]
    add add esp, 16
    push push eax
    push push 010692A5Ch
L3:
    mov mov dword ptr [esp + 24], eax
    call dword ptr [fp_1010C024]
    mov mov ecx, dword ptr [esp + 16]
    lea lea edx, [eax + ecx]
    cmp cmp edx, 01000h
    jbe L6
    mov mov eax, dword ptr [g_101DA9C8]
    mov mov ecx, dword ptr [g_1076A874]
    mov mov dword ptr [g_10692A5C], 01000h
    mov mov eax, dword ptr [eax]
    cmp cmp ecx, eax
    je L7
    push push 010196944h
    push push 2
    mov mov dword ptr [g_1076A874], eax
    call dword ptr [fp_101D49C8]
    add add esp, 8
    mov mov dword ptr [edi], 4
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
    xor xor edi, edi
    test test ecx, ecx
    lea lea edx, [eax*4 + 010692A60h]
    mov mov dword ptr [ebx + 44], edx
    mov mov dword ptr [esp + 24], edi
    lea lea esi, [esp + 0C0h]
    jle L8
    mov mov ecx, dword ptr [esp + 28]
    mov mov edx, dword ptr [ebp + 16]
    lea lea eax, [esp + 24]
    push push eax
    mov mov eax, dword ptr [ebp + 12]
    push push ecx
    push push edx
    mov mov edx, dword ptr [esp + 56]
    mov mov edx, dword ptr [edx + edi*4]
    push push eax
    mov mov eax, dword ptr [esp + 48]
    push push ebx
    mov mov ecx, edi
    call sub_1001F428
    add add esp, 20
    test test eax, eax
    je sub_1001FA85
    mov mov ebx, dword ptr [ebp + 8]
    add add esi, eax
    mov mov eax, dword ptr [esp + 16]
    inc inc edi
    cmp cmp edi, eax
    jl L8
    mov mov edx, dword ptr [g_101DA9C8]
    lea lea ecx, [esp + 0C0h]
    sub sub esi, ecx
    push push esi
    add add edx, 080008h
    push push edx
    call dword ptr [fp_1010C024]
    lea lea ecx, [eax + esi]
    cmp cmp ecx, 020000h
    jbe sub_1001FACC
    mov mov eax, dword ptr [g_101DA9C8]
    mov mov ecx, dword ptr [g_1076A874]
    mov mov dword ptr [eax + 080008h], 020000h
    mov mov eax, dword ptr [eax]
    cmp cmp ecx, eax
    je sub_1001FAC5
    push push 01019690Ch
    push push 2
    mov mov dword ptr [g_1076A874], eax
    call dword ptr [fp_101D49C8]
    add add esp, 8
    mov mov edx, dword ptr [esp + 20]
    mov mov dword ptr [edx], 4
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
    mov mov eax, dword ptr [esp + 20]
    mov mov dword ptr [eax], 4
    pop pop edi
    pop pop esi
L5:
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
    mov mov ecx, dword ptr [g_101DA9C8]
    lea lea edi, [ecx + eax + 08000Ch]
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, esi
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov dword ptr [ebx + 48], edi
    lea lea esi, [esp + 0C0h]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [g_101CE7C8]
    mov mov dword ptr [ebx + 16], eax
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je sub_1001FBB6
    mov mov edx, dword ptr [esp + 32]
    mov mov eax, dword ptr [g_101D7E10]
    push push edx
    push push eax
    call dword ptr [fp_101D4BE4]
    mov mov edi, dword ptr [g_101D7E10]
    mov mov eax, dword ptr [ebp + 12]
    add add esp, 8
    call sub_1001E494
    mov mov eax, dword ptr [esp + 24]
    test test eax, eax
    je sub_1001FCD5
    mov mov edx, dword ptr [esp + 32]
    push push edx
    call dword ptr [fp_101D4B74]
    mov mov ecx, dword ptr [esp + 40]
    add add esp, 4
    cmp cmp ecx, 1
    mov mov dword ptr [esp + 28], eax
    jne sub_1001FC76
    mov mov ecx, dword ptr [ebx + 48]
    mov mov edx, dword ptr [esp + 16]
    mov mov dword ptr [esp + 094h], ecx
    mov mov ecx, dword ptr [ebp + 12]
    mov mov dword ptr [esp + 098h], edx
    mov mov dword ptr [esp + 09Ch], ecx
    lea lea edx, [esp + 094h]
    mov mov esi, eax
    mov mov ecx, 8
    lea lea edi, [esp + 0A0h]
    push push edx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    call L4
    mov mov ecx, dword ptr [esp + 24]
    add add esp, 4
    mov mov dword ptr [ecx], 4
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
    mov mov ecx, dword ptr [esp + 40]
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [esp + 60], edx
    mov mov edx, dword ptr [ecx + 4]
    mov mov dword ptr [esp + 64], edx
    mov mov edx, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ecx + 12]
    mov mov dword ptr [esp + 68], edx
    mov mov edx, dword ptr [esp + 16]
    test test edx, edx
    mov mov dword ptr [esp + 72], ecx
    jle sub_1001FD2E
    mov mov ecx, edx
    mov mov esi, ecx
    shr shr ecx, 2
    xor xor eax, eax
    lea lea edi, [esp + 78]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, esi
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov eax, dword ptr [esp + 28]
    mov mov ecx, dword ptr [ebx + 48]
    mov mov dword ptr [esp + 56], eax
    mov mov al, byte ptr [esp + 36]
    mov mov byte ptr [esp + 77], al
    xor xor eax, eax
    cmp cmp edx, 10
    setg setg al
    mov mov dword ptr [esp + 48], ecx
    mov mov ecx, dword ptr [ebp + 12]
    mov mov dword ptr [esp + 52], ecx
    push push 0
    lea lea ecx, [esp + 52]
    push push ecx
    add add eax, 6
    push push eax
    mov mov byte ptr [esp + 88], dl
    call sub_10020F42
    add add esp, 12
    mov mov ecx, dword ptr [esp + 20]
    mov mov dword ptr [ecx], 4
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_1001f6f0 ENDP
END
