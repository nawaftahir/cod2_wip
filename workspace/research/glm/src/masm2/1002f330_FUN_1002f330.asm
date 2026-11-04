.686
.MODEL FLAT, C
EXTRN sub_1002F3F1:PROC
EXTRN sub_1002F40E:PROC
EXTRN sub_1002F413:PROC
EXTRN sub_1002F41C:PROC
EXTRN sub_1002F41F:PROC
EXTRN sub_1002F42C:PROC
EXTRN sub_1002F43F:PROC
EXTRN sub_1002F447:PROC
EXTRN sub_1002F47C:PROC
EXTRN sub_1002F480:PROC
EXTRN sub_1002F481:PROC
EXTRN EXTRN g_101CE748:DWORD:DWORD
EXTRN EXTRN g_101CE828:DWORD:DWORD
EXTRN EXTRN g_106D3194:DWORD:DWORD
EXTRN EXTRN g_1072DDC4:DWORD:DWORD
.CODE
FUN_1002f330 PROC
    cmp cmp eax, 6
    push push esi
    jne L2
    cmp cmp edx, 31
    jne L3
    cmp cmp ecx, 07FEh
    jne L0
    mov mov eax, 9
    jmp L4
    cmp cmp ecx, 07FFh
    jne L1
    mov mov eax, 15
    jmp sub_1002F3F1
    mov mov edx, dword ptr [g_1072DDC4]
    imul imul ecx, ecx, 116
    mov mov esi, dword ptr [ecx + edx]
    xor xor eax, eax
    cmp cmp esi, 2
    setne setne al
    dec dec eax
    and and eax, 3
    add add eax, 9
    jmp sub_1002F40E
    mov mov edx, dword ptr [g_101CE748]
L2:
    push push ebx
    mov mov bl, byte ptr [edx + 8]
    test test bl, bl
    pop pop ebx
    jne sub_1002F413
    test test eax, eax
    je L5
    cmp cmp eax, 2
    jne sub_1002F41C
    cmp cmp ecx, 07FFh
    je sub_1002F41F
    cmp cmp ecx, 07FEh
    jge sub_1002F42C
    mov mov esi, dword ptr [g_1072DDC4]
    imul imul ecx, ecx, 116
    mov mov edx, dword ptr [ecx + esi]
    add add ecx, esi
    cmp cmp edx, 2
    jg sub_1002F43F
    mov mov edx, dword ptr [ecx + 4]
    test test dh, 1
    jne sub_1002F447
    or or eax, -1
    pop pop esi
    ret ret
    cmp cmp eax, 3
    jl sub_1002F47C
    cmp cmp eax, 26
    jg sub_1002F481
    mov mov ecx, dword ptr [g_101CE828]
    mov mov dl, byte ptr [ecx + 8]
    test test dl, dl
    jne sub_1002F480
    xor xor ecx, ecx
    add add eax, ecx
    pop pop esi
    ret ret
    mov mov edx, dword ptr [g_106D3194]
    mov mov ecx, dword ptr [edx + 0219CECh]
L5:
    add add eax, ecx
    pop pop esi
    ret ret
FUN_1002f330 ENDP
END
