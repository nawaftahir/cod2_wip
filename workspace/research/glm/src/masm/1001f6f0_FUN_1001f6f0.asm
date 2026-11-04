.686
.MODEL FLAT, C
EXTRN sub_1001DA19:PROC
EXTRN sub_1001DAFE:PROC
EXTRN sub_1001DEEC:PROC
EXTRN sub_1001E494:PROC
EXTRN sub_1001F428:PROC
EXTRN sub_1001F7F7:PROC
EXTRN sub_10020F42:PROC
EXTRN fp_1010C024:DWORD
EXTRN fp_1010C0E4:DWORD
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4B3C:DWORD
EXTRN fp_101D4B40:DWORD
EXTRN fp_101D4B50:DWORD
EXTRN fp_101D4B64:DWORD
EXTRN fp_101D4B74:DWORD
EXTRN fp_101D4BE4:DWORD
EXTRN g_101CE7C8:DWORD
EXTRN g_101CE7D8:DWORD
EXTRN g_101D7E10:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_10692A5C:DWORD
EXTRN g_1076A874:DWORD
.CODE
FUN_1001f6f0 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 000000EB4h
    push ebx
    mov ebx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebx + 12]
    cmp eax, 4
    push esi
    push edi
    lea edi, [ebx + 12]
    mov dword ptr [esp + 20], edi
    jge L15
    push 2
    push 3
    push edi
    call dword ptr [fp_1010C0E4]
    cmp eax, 2
    je L1
L0:
    cmp dword ptr [edi], 4
    jl L0
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L1:
    mov esi, dword ptr [ebx + 4]
    push esi
    mov dword ptr [esp + 36], esi
    call dword ptr [fp_101D4B40]
    add esp, 4
    test eax, eax
    je L3
    mov eax, dword ptr [g_101CE7D8]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L2
    mov ecx, dword ptr [g_101D7E10]
    push esi
    push ecx
    call dword ptr [fp_101D4BE4]
    mov eax, dword ptr [g_101D7E10]
    mov esi, dword ptr [ebp + 12]
    push ebx
    call sub_1001DAFE
    mov eax, dword ptr [g_101D7E10]
    add esp, 12
    push ebx
    call sub_1001DEEC
    add esp, 4
L2:
    mov dword ptr [edi], 4
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L3:
    push esi
    call dword ptr [fp_101D4B64]
    mov dword ptr [esp + 40], eax
    mov eax, dword ptr [ebp + 12]
    mov edx, dword ptr [eax + 56]
    add esp, 4
    push edx
    add eax, 60
    call sub_1001DA19
    fstp dword ptr [esp + 28]
    mov eax, dword ptr [esp + 28]
    add esp, 4
    push eax
    push esi
    call dword ptr [fp_101D4B50]
    add esp, 8
    test eax, eax
    mov dword ptr [esp + 28], eax
    jl L4
    lea ecx, [esp + 40]
    push ecx
    push eax
    lea edx, [esp + 52]
    push edx
    push esi
    call dword ptr [fp_101D4B3C]
    add esp, 16
    push eax
    push 010692A5Ch
    mov dword ptr [esp + 24], eax
    call dword ptr [fp_1010C024]
    mov ecx, dword ptr [esp + 16]
    lea edx, [eax + ecx]
    cmp edx, 000001000h
    jbe L5
    mov eax, dword ptr [g_101DA9C8]
    mov ecx, dword ptr [g_1076A874]
    mov dword ptr [g_10692A5C], 000001000h
    mov eax, dword ptr [eax]
    cmp ecx, eax
    je L4
    push 010196944h
    push 2
    mov dword ptr [g_1076A874], eax
    call dword ptr [fp_101D49C8]
    add esp, 8
L4:
    mov dword ptr [edi], 4
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L5:
    xor edi, edi
    test ecx, ecx
    lea edx, [eax*4 + 010692A60h]
    mov dword ptr [ebx + 44], edx
    mov dword ptr [esp + 24], edi
    lea esi, [esp + 0000000C0h]
    jle L7
L6:
    mov ecx, dword ptr [esp + 28]
    mov edx, dword ptr [ebp + 16]
    lea eax, [esp + 24]
    push eax
    mov eax, dword ptr [ebp + 12]
    push ecx
    push edx
    mov edx, dword ptr [esp + 56]
    mov edx, dword ptr [edx + edi*4]
    push eax
    mov eax, dword ptr [esp + 48]
    push ebx
    mov ecx, edi
    call sub_1001F428
    add esp, 20
    test eax, eax
    je L9
    mov ebx, dword ptr [ebp + 8]
    add esi, eax
    mov eax, dword ptr [esp + 16]
    inc edi
    cmp edi, eax
    jl L6
L7:
    mov edx, dword ptr [g_101DA9C8]
    lea ecx, [esp + 0000000C0h]
    sub esi, ecx
    push esi
    add edx, 000080008h
    push edx
    call dword ptr [fp_1010C024]
    lea ecx, [eax + esi]
    cmp ecx, 000020000h
    jbe L10
    mov eax, dword ptr [g_101DA9C8]
    mov ecx, dword ptr [g_1076A874]
    mov dword ptr [eax + 000080008h], 000020000h
    mov eax, dword ptr [eax]
    cmp ecx, eax
    je L8
    push 01019690Ch
    push 2
    mov dword ptr [g_1076A874], eax
    call dword ptr [fp_101D49C8]
    add esp, 8
L8:
    mov edx, dword ptr [esp + 20]
    mov dword ptr [edx], 4
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L9:
    mov eax, dword ptr [esp + 20]
    mov dword ptr [eax], 4
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L10:
    mov ecx, dword ptr [g_101DA9C8]
    lea edi, [ecx + eax + 00008000Ch]
    mov eax, dword ptr [esp + 16]
    mov ecx, esi
    mov edx, ecx
    shr ecx, 2
    mov dword ptr [ebx + 48], edi
    lea esi, [esp + 0000000C0h]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [g_101CE7C8]
    mov dword ptr [ebx + 16], eax
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L11
    mov edx, dword ptr [esp + 32]
    mov eax, dword ptr [g_101D7E10]
    push edx
    push eax
    call dword ptr [fp_101D4BE4]
    mov edi, dword ptr [g_101D7E10]
    mov eax, dword ptr [ebp + 12]
    add esp, 8
    call sub_1001E494
L11:
    mov eax, dword ptr [esp + 24]
    test eax, eax
    je L14
    mov edx, dword ptr [esp + 32]
    push edx
    call dword ptr [fp_101D4B74]
    mov ecx, dword ptr [esp + 40]
    add esp, 4
    cmp ecx, 1
    mov dword ptr [esp + 28], eax
    jne L12
    mov ecx, dword ptr [ebx + 48]
    mov edx, dword ptr [esp + 16]
    mov dword ptr [esp + 000000094h], ecx
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [esp + 000000098h], edx
    mov dword ptr [esp + 00000009Ch], ecx
    lea edx, [esp + 000000094h]
    mov esi, eax
    mov ecx, 8
    lea edi, [esp + 0000000A0h]
    push edx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1001F7F7
    mov ecx, dword ptr [esp + 24]
    add esp, 4
    mov dword ptr [ecx], 4
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L12:
    mov ecx, dword ptr [esp + 40]
    mov edx, dword ptr [ecx]
    mov dword ptr [esp + 60], edx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [esp + 64], edx
    mov edx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx + 12]
    mov dword ptr [esp + 68], edx
    mov edx, dword ptr [esp + 16]
    test edx, edx
    mov dword ptr [esp + 72], ecx
    jle L13
    mov ecx, edx
    mov esi, ecx
    shr ecx, 2
    xor eax, eax
    lea edi, [esp + 78]
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov eax, dword ptr [esp + 28]
L13:
    mov ecx, dword ptr [ebx + 48]
    mov dword ptr [esp + 56], eax
    mov al, byte ptr [esp + 36]
    mov byte ptr [esp + 77], al
    xor eax, eax
    cmp edx, 10
    setg al
    mov dword ptr [esp + 48], ecx
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [esp + 52], ecx
    push 0
    lea ecx, [esp + 52]
    push ecx
    add eax, 6
    push eax
    mov byte ptr [esp + 88], dl
    call sub_10020F42
    add esp, 12
L14:
    mov ecx, dword ptr [esp + 20]
    mov dword ptr [ecx], 4
L15:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
FUN_1001f6f0 ENDP
END
