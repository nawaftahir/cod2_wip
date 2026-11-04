.686
.MODEL FLAT, C
EXTRN sub_1002DFA8:PROC
EXTRN sub_1003A8FF:PROC
EXTRN g_101CE708:DWORD
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9CC:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072D9E0:DWORD
.CODE
FUN_1003ef30 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    push ecx
    mov eax, dword ptr [g_1072D9CC]
    push ebx
    push esi
    mov esi, 1
    cmp eax, esi
    push edi
    je L2
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L0
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L1
L0:
    call sub_1003A8FF
L1:
    mov dword ptr [g_1072D9CC], esi
L2:
    mov ebx, dword ptr [ebp + 8]
    movzx eax, word ptr [ebx + 10]
    mov ecx, dword ptr [g_1072D9D4]
    lea edx, [eax + ecx]
    cmp edx, 00000154Ah
    jg L3
    mov ecx, dword ptr [g_1072D9D0]
    add eax, -2
    lea edx, [ecx + eax*2]
    add edx, eax
    cmp edx, 000100000h
    jle L4
L3:
    call sub_1002DFA8
L4:
    mov eax, dword ptr [g_101CE708]
    cmp dword ptr [eax + 8], 2
    jne L6
    xor edx, edx
    cmp word ptr [ebx + 10], dx
    jbe L7
    xor esi, esi
    jmp L5
    lea esp, [esp]
    mov edi, edi
L5:
    mov ecx, dword ptr [g_1072D9D4]
    lea eax, [ecx + edx]
    mov ecx, dword ptr [ebx + 12]
    mov edi, dword ptr [ecx + esi]
    add ecx, esi
    shl eax, 5
    add eax, 0106D3200h
    mov dword ptr [eax], edi
    mov edi, dword ptr [ecx + 4]
    mov dword ptr [eax + 4], edi
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [eax + 8], ecx
    mov ecx, dword ptr [g_1072D9D4]
    mov eax, dword ptr [ebx + 12]
    mov eax, dword ptr [eax + esi + 24]
    add ecx, edx
    shl ecx, 5
    mov dword ptr [ecx + 0106D320Ch], eax
    mov ecx, dword ptr [g_1072D9D4]
    lea eax, [ecx + edx]
    mov ecx, dword ptr [ebx + 12]
    mov edi, dword ptr [ecx + esi + 28]
    shl eax, 5
    add eax, 0106D3210h
    mov dword ptr [eax], edi
    lea ecx, [ecx + esi + 28]
    mov ecx, dword ptr [ecx + 4]
    mov dword ptr [eax + 4], ecx
    mov eax, dword ptr [g_1072D9D4]
    mov ecx, dword ptr [ebx + 12]
    mov edi, dword ptr [ecx + esi + 36]
    add eax, edx
    shl eax, 5
    add eax, 0106D3218h
    lea ecx, [ecx + esi + 36]
    mov dword ptr [eax], edi
    mov ecx, dword ptr [ecx + 4]
    mov dword ptr [eax + 4], ecx
    movzx eax, word ptr [ebx + 10]
    inc edx
    add esi, 68
    cmp edx, eax
    jl L5
    jmp L7
L6:
    movzx ecx, word ptr [ebx + 10]
    mov edi, dword ptr [g_1072D9D4]
    imul ecx, ecx, 68
    mov esi, dword ptr [ebx + 12]
    imul edi, edi, 68
    mov edx, ecx
    shr ecx, 2
    add edi, 0106D3200h
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
L7:
    movzx ecx, word ptr [ebx + 10]
    sub ecx, 2
    xor eax, eax
    test ecx, ecx
    jle L9
    jmp L8
    lea ecx, [ecx]
L8:
    mov edi, dword ptr [g_1072D9D0]
    mov edx, dword ptr [g_1072D9B0]
    mov si, word ptr [g_1072D9D4]
    mov word ptr [edx + edi*2], si
    mov edx, dword ptr [g_1072D9D4]
    mov edi, dword ptr [g_1072D9D0]
    mov esi, dword ptr [g_1072D9B0]
    lea edx, [eax + edx + 1]
    mov word ptr [esi + edi*2 + 2], dx
    mov edx, dword ptr [g_1072D9D4]
    mov esi, dword ptr [g_1072D9D0]
    mov edi, dword ptr [g_1072D9B0]
    lea edx, [eax + edx + 2]
    mov word ptr [edi + esi*2 + 4], dx
    mov edi, dword ptr [g_1072D9D0]
    add edi, 3
    inc eax
    cmp eax, ecx
    mov dword ptr [g_1072D9D0], edi
    jl L8
    movzx eax, word ptr [ebx + 10]
    add dword ptr [g_1072D9D4], eax
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
L9:
    movzx ecx, word ptr [ebx + 10]
    mov eax, dword ptr [g_1072D9D4]
    pop edi
FUN_1003ef30 ENDP
END
