.686
.MODEL FLAT, C
EXTRN g_101CE748:DWORD
EXTRN g_101CE828:DWORD
EXTRN g_106D3194:DWORD
EXTRN g_1072DDC4:DWORD
.CODE
FUN_1002f330 PROC
    cmp eax, 6
    push esi
    jne L2
    cmp edx, 31
    jne L2
    cmp ecx, 0000007FEh
    jne L0
    mov eax, 9
    jmp L6
L0:
    cmp ecx, 0000007FFh
    jne L1
    mov eax, 15
    jmp L6
L1:
    mov edx, dword ptr [g_1072DDC4]
    imul ecx, ecx, 116
    mov esi, dword ptr [ecx + edx]
    xor eax, eax
    cmp esi, 2
    setne al
    dec eax
    and eax, 3
    add eax, 9
    jmp L6
L2:
    mov edx, dword ptr [g_101CE748]
    push ebx
    mov bl, byte ptr [edx + 8]
    test bl, bl
    pop ebx
    jne L5
    test eax, eax
    je L3
    cmp eax, 2
    jne L5
L3:
    cmp ecx, 0000007FFh
    je L4
    cmp ecx, 0000007FEh
    jge L5
    mov esi, dword ptr [g_1072DDC4]
    imul ecx, ecx, 116
    mov edx, dword ptr [ecx + esi]
    add ecx, esi
    cmp edx, 2
    jg L5
    mov edx, dword ptr [ecx + 4]
    test dh, 1
    jne L5
L4:
    or eax, 0FFFFFFFFh
    pop esi
    ret
L5:
    cmp eax, 3
    jl L8
    cmp eax, 26
    jg L8
L6:
    mov ecx, dword ptr [g_101CE828]
    mov dl, byte ptr [ecx + 8]
    test dl, dl
    jne L7
    xor ecx, ecx
    add eax, ecx
    pop esi
    ret
L7:
    mov edx, dword ptr [g_106D3194]
    mov ecx, dword ptr [edx + 000219CECh]
    add eax, ecx
L8:
    pop esi
    ret
FUN_1002f330 ENDP
END
