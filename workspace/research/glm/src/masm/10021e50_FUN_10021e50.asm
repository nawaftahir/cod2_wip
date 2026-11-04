.686
.MODEL FLAT, C
EXTRN sub_100013DE:PROC
EXTRN sub_10005A19:PROC
EXTRN sub_10016F81:PROC
EXTRN sub_1001E5E4:PROC
EXTRN sub_1001E693:PROC
EXTRN sub_10020EC1:PROC
EXTRN sub_10021C85:PROC
EXTRN sub_10021E85:PROC
EXTRN sub_10021E98:PROC
EXTRN sub_1002212E:PROC
EXTRN sub_1002215F:PROC
EXTRN sub_10028D49:PROC
EXTRN sub_10032F6E:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4A5C:DWORD
EXTRN fp_101D4AF0:DWORD
EXTRN fp_101D4AF4:DWORD
EXTRN g_101CE694:DWORD
EXTRN g_101CE6B0:DWORD
EXTRN g_101CE6C8:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_101CE70C:DWORD
EXTRN g_101CE7C0:DWORD
EXTRN g_101D0B00:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D4810:DWORD
EXTRN g_101D489C:DWORD
EXTRN g_101D49C4:DWORD
EXTRN g_101D4D00:DWORD
EXTRN g_101DA9C8:DWORD
.CODE
FUN_10021e50 PROC
L0:
    call sub_10021C85
    test al, al
    je L1
    call sub_100013DE
L1:
    mov eax, dword ptr [g_101CE694]
    mov cl, byte ptr [eax + 7]
    test cl, cl
    je L2
    push eax
    call dword ptr [fp_101D4A5C]
    mov eax, dword ptr [g_101CE708]
    mov ecx, dword ptr [eax + 8]
    add esp, 4
    cmp ecx, 2
    je L2
    mov ecx, dword ptr [g_101CE694]
    mov al, byte ptr [ecx + 8]
    test al, al
    je L2
    mov eax, dword ptr [g_101D489C]
    test eax, eax
    jne L2
    push 010196A18h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
L2:
    mov edx, dword ptr [g_101CE7C0]
    mov al, byte ptr [edx + 8]
    test al, al
    je L3
    mov eax, dword ptr [g_101D1B9C]
    test eax, eax
    je L3
    push esi
    lea esi, [eax + 000000160h]
    call sub_10028D49
    pop esi
L3:
    mov eax, dword ptr [g_101CE6C8]
    mov cl, byte ptr [eax + 7]
    test cl, cl
    push ebx
    jne L4
    xor bl, bl
    jmp L5
L4:
    push eax
    call dword ptr [fp_101D4A5C]
    add esp, 4
    mov bl, 1
L5:
    mov ecx, dword ptr [g_101CE6B0]
    mov al, byte ptr [ecx + 7]
    test al, al
    jne L6
    xor al, al
    jmp L7
L6:
    push ecx
    call dword ptr [fp_101D4A5C]
    mov ecx, dword ptr [g_101CE6B0]
    add esp, 4
    mov al, 1
L7:
    or al, bl
    pop ebx
    je L9
    mov al, byte ptr [ecx + 8]
    test al, al
    je L8
    mov dword ptr [g_101D4810], 0
    jmp sub_10021E85
L8:
    mov eax, dword ptr [g_101CE6C8]
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [g_101D4810], ecx
L9:
    jmp sub_10021E98
    int3
    int3
    int3
    int3
    int3
    int3
    int3
    int3
    mov al, byte ptr [g_101D4D00]
    test al, al
    je L11
    mov eax, dword ptr [g_101D0B00]
    test eax, eax
    je L10
    mov dword ptr [g_101D0B00], 0
    call sub_10016F81
L10:
    call L0
    push 0
    call dword ptr [fp_101D4AF4]
    mov eax, dword ptr [g_101CE70C]
    mov cl, byte ptr [eax + 8]
    add esp, 4
    test cl, cl
    je L11
    push 0
    call sub_1001E5E4
    pop ecx
L11:
    ret
    int3
    int3
    int3
    int3
    int3
    int3
    int3
    int3
    int3
    int3
    mov al, byte ptr [g_101D4D00]
    test al, al
    je sub_1002212E
    call sub_10032F6E
    call sub_1001E693
    call dword ptr [fp_101D4AF0]
    mov eax, dword ptr [g_101DA9C8]
    add eax, 000249D18h
    push eax
    call sub_10005A19
    add esp, 4
    call sub_10020EC1
    mov eax, dword ptr [g_101D49C4]
    test eax, eax
    je sub_1002215F
FUN_10021e50 ENDP
END
