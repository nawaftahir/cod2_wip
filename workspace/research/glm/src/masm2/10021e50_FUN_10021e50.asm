.686
.MODEL FLAT, C
EXTRN sub_100013DE:PROC
EXTRN sub_10005A19:PROC
EXTRN sub_10016F81:PROC
EXTRN sub_1001E5E4:PROC
EXTRN sub_1001E693:PROC
EXTRN sub_10020EC1:PROC
EXTRN sub_10021C85:PROC
EXTRN sub_10021FEB:PROC
EXTRN sub_10021FF2:PROC
EXTRN sub_10022063:PROC
EXTRN sub_1002207E:PROC
EXTRN sub_100220B2:PROC
EXTRN sub_1002212E:PROC
EXTRN sub_1002215F:PROC
EXTRN sub_10028D49:PROC
EXTRN sub_10032F6E:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4A5C:DWORD:DWORD
EXTRN EXTRN fp_101D4AF0:DWORD:DWORD
EXTRN EXTRN fp_101D4AF4:DWORD:DWORD
EXTRN EXTRN g_101CE694:DWORD:DWORD
EXTRN EXTRN g_101CE6B0:DWORD:DWORD
EXTRN EXTRN g_101CE6C8:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE70C:DWORD:DWORD
EXTRN EXTRN g_101CE7C0:DWORD:DWORD
EXTRN EXTRN g_101D0B00:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D4810:DWORD:DWORD
EXTRN EXTRN g_101D489C:DWORD:DWORD
EXTRN EXTRN g_101D49C4:DWORD:DWORD
EXTRN EXTRN g_101D4D00:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
.CODE
FUN_10021e50 PROC
    call sub_10021C85
    test test al, al
    je L0
    call sub_100013DE
    mov mov eax, dword ptr [g_101CE694]
    mov mov cl, byte ptr [eax + 7]
    test test cl, cl
    je L3
    push push eax
    call dword ptr [fp_101D4A5C]
    mov mov eax, dword ptr [g_101CE708]
    mov mov ecx, dword ptr [eax + 8]
    add add esp, 4
    cmp cmp ecx, 2
    je L4
    mov mov ecx, dword ptr [g_101CE694]
    mov mov al, byte ptr [ecx + 8]
    test test al, al
    je L5
    mov mov eax, dword ptr [g_101D489C]
    test test eax, eax
    jne L6
    push push 010196A18h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    mov mov edx, dword ptr [g_101CE7C0]
    mov mov al, byte ptr [edx + 8]
    test test al, al
    je L7
    mov mov eax, dword ptr [g_101D1B9C]
    test test eax, eax
    je L8
    push push esi
    lea lea esi, [eax + 0160h]
    call sub_10028D49
    pop pop esi
    mov mov eax, dword ptr [g_101CE6C8]
    mov mov cl, byte ptr [eax + 7]
    test test cl, cl
    push push ebx
    jne L9
    xor xor bl, bl
    jmp L11
    push push eax
    call dword ptr [fp_101D4A5C]
    add add esp, 4
L5:
    mov mov bl, 1
    mov mov ecx, dword ptr [g_101CE6B0]
    mov mov al, byte ptr [ecx + 7]
    test test al, al
    jne L12
    xor xor al, al
    jmp L13
    push push ecx
    call dword ptr [fp_101D4A5C]
    mov mov ecx, dword ptr [g_101CE6B0]
    add add esp, 4
    mov mov al, 1
    or or al, bl
    pop pop ebx
    je sub_10021FF2
    mov mov al, byte ptr [ecx + 8]
    test test al, al
    je sub_10021FEB
    mov mov dword ptr [g_101D4810], 0
    jmp L1
    mov mov eax, dword ptr [g_101CE6C8]
    mov mov ecx, dword ptr [eax + 8]
    mov mov dword ptr [g_101D4810], ecx
    jmp L2
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    mov mov al, byte ptr [g_101D4D00]
    test test al, al
    je sub_1002207E
    mov mov eax, dword ptr [g_101D0B00]
    test test eax, eax
    je sub_10022063
    mov mov dword ptr [g_101D0B00], 0
    call sub_10016F81
    call L10
L10:
    push push 0
    call dword ptr [fp_101D4AF4]
    mov mov eax, dword ptr [g_101CE70C]
    mov mov cl, byte ptr [eax + 8]
    add add esp, 4
    test test cl, cl
    je sub_100220B2
    push push 0
    call sub_1001E5E4
    pop pop ecx
    ret ret
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    int3 int3
    mov mov al, byte ptr [g_101D4D00]
    test test al, al
    je sub_1002212E
    call sub_10032F6E
    call sub_1001E693
    call dword ptr [fp_101D4AF0]
    mov mov eax, dword ptr [g_101DA9C8]
    add add eax, 0249D18h
    push push eax
    call sub_10005A19
    add add esp, 4
    call sub_10020EC1
    mov mov eax, dword ptr [g_101D49C4]
    test test eax, eax
    je sub_1002215F
FUN_10021e50 ENDP
END
