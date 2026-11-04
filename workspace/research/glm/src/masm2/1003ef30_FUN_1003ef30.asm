.686
.MODEL FLAT, C
EXTRN sub_1002DFA8:PROC
EXTRN sub_1003A8FF:PROC
EXTRN sub_1003F1A5:PROC
EXTRN sub_1003F1ED:PROC
EXTRN sub_1003F251:PROC
EXTRN sub_1003F25D:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9CC:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
.CODE
FUN_1003ef30 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    push push ecx
    mov mov eax, dword ptr [g_1072D9CC]
    push push ebx
    push push esi
    mov mov esi, 1
    cmp cmp eax, esi
    push push edi
    je L1
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne L0
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L2
    call sub_1003A8FF
    mov mov dword ptr [g_1072D9CC], esi
    mov mov ebx, dword ptr [ebp + 8]
    movzx movzx eax, word ptr [ebx + 10]
    mov mov ecx, dword ptr [g_1072D9D4]
    lea lea edx, [eax + ecx]
    cmp cmp edx, 0154Ah
L0:
    jg L3
L1:
    mov mov ecx, dword ptr [g_1072D9D0]
    add add eax, -2
    lea lea edx, [ecx + eax*2]
L2:
    add add edx, eax
    cmp cmp edx, 0100000h
    jle L4
    call sub_1002DFA8
    mov mov eax, dword ptr [g_101CE708]
    cmp cmp dword ptr [eax + 8], 2
    jne L6
    xor xor edx, edx
    cmp cmp word ptr [ebx + 10], dx
    jbe L8
    xor xor esi, esi
    jmp L5
    lea lea esp, [esp]
    mov mov edi, edi
    mov mov ecx, dword ptr [g_1072D9D4]
    lea lea eax, [ecx + edx]
    mov mov ecx, dword ptr [ebx + 12]
    mov mov edi, dword ptr [ecx + esi]
    add add ecx, esi
    shl shl eax, 5
    add add eax, 0106D3200h
    mov mov dword ptr [eax], edi
    mov mov edi, dword ptr [ecx + 4]
    mov mov dword ptr [eax + 4], edi
    mov mov ecx, dword ptr [ecx + 8]
    mov mov dword ptr [eax + 8], ecx
    mov mov ecx, dword ptr [g_1072D9D4]
    mov mov eax, dword ptr [ebx + 12]
    mov mov eax, dword ptr [eax + esi + 24]
    add add ecx, edx
    shl shl ecx, 5
    mov mov dword ptr [ecx + 0106D320Ch], eax
    mov mov ecx, dword ptr [g_1072D9D4]
    lea lea eax, [ecx + edx]
    mov mov ecx, dword ptr [ebx + 12]
    mov mov edi, dword ptr [ecx + esi + 28]
    shl shl eax, 5
    add add eax, 0106D3210h
    mov mov dword ptr [eax], edi
    lea lea ecx, [ecx + esi + 28]
    mov mov ecx, dword ptr [ecx + 4]
    mov mov dword ptr [eax + 4], ecx
    mov mov eax, dword ptr [g_1072D9D4]
    mov mov ecx, dword ptr [ebx + 12]
    mov mov edi, dword ptr [ecx + esi + 36]
    add add eax, edx
    shl shl eax, 5
    add add eax, 0106D3218h
    lea lea ecx, [ecx + esi + 36]
    mov mov dword ptr [eax], edi
    mov mov ecx, dword ptr [ecx + 4]
    mov mov dword ptr [eax + 4], ecx
    movzx movzx eax, word ptr [ebx + 10]
    inc inc edx
    add add esi, 68
    cmp cmp edx, eax
    jl L7
    jmp sub_1003F1A5
    movzx movzx ecx, word ptr [ebx + 10]
    mov mov edi, dword ptr [g_1072D9D4]
    imul imul ecx, ecx, 68
    mov mov esi, dword ptr [ebx + 12]
    imul imul edi, edi, 68
    mov mov edx, ecx
    shr shr ecx, 2
    add add edi, 0106D3200h
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    movzx movzx ecx, word ptr [ebx + 10]
    sub sub ecx, 2
    xor xor eax, eax
    test test ecx, ecx
    jle sub_1003F25D
    jmp sub_1003F1ED
    lea lea ecx, [ecx]
    mov mov edi, dword ptr [g_1072D9D0]
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov si, word ptr [g_1072D9D4]
    mov mov word ptr [edx + edi*2], si
    mov mov edx, dword ptr [g_1072D9D4]
    mov mov edi, dword ptr [g_1072D9D0]
    mov mov esi, dword ptr [g_1072D9B0]
    lea lea edx, [eax + edx + 1]
    mov mov word ptr [esi + edi*2 + 2], dx
    mov mov edx, dword ptr [g_1072D9D4]
    mov mov esi, dword ptr [g_1072D9D0]
L6:
    mov mov edi, dword ptr [g_1072D9B0]
    lea lea edx, [eax + edx + 2]
    mov mov word ptr [edi + esi*2 + 4], dx
    mov mov edi, dword ptr [g_1072D9D0]
    add add edi, 3
    inc inc eax
    cmp cmp eax, ecx
    mov mov dword ptr [g_1072D9D0], edi
    jl sub_1003F251
    movzx movzx eax, word ptr [ebx + 10]
    add add dword ptr [g_1072D9D4], eax
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
L8:
    ret ret
    movzx movzx ecx, word ptr [ebx + 10]
    mov mov eax, dword ptr [g_1072D9D4]
    pop pop edi
FUN_1003ef30 ENDP
END
