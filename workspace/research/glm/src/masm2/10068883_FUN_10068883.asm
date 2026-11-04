.686
.MODEL FLAT, C
EXTRN sub_10068AFC:PROC
EXTRN sub_10068B1D:PROC
EXTRN sub_10068B22:PROC
EXTRN sub_10068B2A:PROC
EXTRN sub_10068B2B:PROC
EXTRN sub_10068B4F:PROC
EXTRN sub_10068B82:PROC
EXTRN sub_10068B8B:PROC
EXTRN sub_10068BA3:PROC
EXTRN sub_10068BB6:PROC
EXTRN sub_10068BBB:PROC
EXTRN sub_10068BD3:PROC
EXTRN sub_10068BE3:PROC
EXTRN sub_10068BED:PROC
EXTRN sub_10068C04:PROC
EXTRN sub_10068C19:PROC
EXTRN sub_10068C30:PROC
EXTRN sub_10068C4A:PROC
EXTRN sub_10068C51:PROC
EXTRN sub_10068C5F:PROC
EXTRN sub_10068C6E:PROC
EXTRN sub_10068C7B:PROC
EXTRN sub_10068C81:PROC
EXTRN sub_10068C96:PROC
EXTRN sub_10068CA6:PROC
EXTRN sub_10068CAB:PROC
EXTRN sub_10068CBF:PROC
EXTRN sub_10068CE2:PROC
EXTRN sub_10068CFE:PROC
EXTRN sub_100F73B3:PROC
EXTRN sub_100F7462:PROC
EXTRN sub_100F855E:PROC
EXTRN sub_100F85E8:PROC
EXTRN sub_100F8670:PROC
.CODE
FUN_10068883 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 28
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    cmp cmp byte ptr [edi], 0
    mov mov esi, edi
    je L0
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F855E
    test test eax, eax
    pop pop ecx
    je L1
    inc inc esi
    cmp cmp byte ptr [esi], 0
    jne L0
    cmp cmp byte ptr [esi], 0
    je L2
    push push esi
    call sub_100F7462
    pop pop ecx
    mov mov byte ptr [ebp - 1], al
    jmp L3
    mov mov byte ptr [ebp - 1], 0
    cmp cmp byte ptr [ebp - 1], 15
    jbe L4
    mov mov eax, dword ptr [ebp + 12]
    mov mov byte ptr [eax], 0
    mov mov eax, dword ptr [ebp + 16]
    mov mov byte ptr [eax], 0FFh
    mov mov eax, 080004005h
    jmp sub_10068B1D
    push push ebx
    mov mov ebx, esi
    sub sub ebx, edi
    je sub_10068B22
    cmp cmp ebx, 20
    ja sub_10068B2B
    mov mov al, byte ptr [esi]
    test test al, al
    je L6
    movsx movsx eax, al
L3:
    push push eax
    call sub_100F8670
    test test eax, eax
    pop pop ecx
    je L7
    inc inc esi
    mov mov al, byte ptr [esi]
    test test al, al
    jne L5
    cmp cmp byte ptr [esi], 0
    jne sub_10068B4F
    cmp cmp byte ptr [edi], 0
    mov mov esi, edi
    je L8
    lea lea edi, [ebp - 28]
    sub sub edi, dword ptr [ebp + 8]
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F85E8
    test test eax, eax
    pop pop ecx
    je L10
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F73B3
    mov mov byte ptr [edi + esi], al
    inc inc esi
    cmp cmp byte ptr [esi], 0
    pop pop ecx
    jne L9
    push push 9
    pop pop edx
    mov mov edi, 01010EBE8h
    lea lea esi, [ebp - 28]
    mov mov ecx, edx
    xor xor eax, eax
    mov mov byte ptr [ebp + ebx - 28], 0
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L11
    xor xor al, al
    jmp sub_10068B8B
    push push 12
    mov mov edi, 01010EBDCh
    lea lea esi, [ebp - 28]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L12
    mov mov al, 1
    jmp sub_10068BA3
    push push 13
    mov mov edi, 01010EBCCh
    lea lea esi, [ebp - 28]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L13
    mov mov al, 2
L7:
    jmp sub_10068BBB
    push push 7
    mov mov edi, 01010EBC4h
    lea lea esi, [ebp - 28]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L14
    mov mov al, 3
    jmp sub_10068BD3
    push push 6
    pop pop eax
    mov mov edi, 01010EBBCh
    lea lea esi, [ebp - 28]
    mov mov ecx, eax
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10068AFC
    mov mov al, 4
    jmp sub_10068BED
    mov mov edi, 01010EBB0h
    lea lea esi, [ebp - 28]
    mov mov ecx, edx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10068B2A
    mov mov al, 5
    jmp sub_10068C04
L8:
    push push 8
    mov mov edi, 01010EBA8h
    lea lea esi, [ebp - 28]
    pop pop ecx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_10068C19
    mov mov edi, 01010EB9Ch
    lea lea esi, [ebp - 28]
    mov mov ecx, edx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10068B82
    mov mov al, 7
    jmp sub_10068C30
    push push 11
    pop pop eax
    mov mov edi, 01010EB90h
    lea lea esi, [ebp - 28]
    mov mov ecx, eax
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10068BB6
    mov mov al, 8
    jmp sub_10068C4A
    push push 10
    mov mov edi, 01010EB84h
    lea lea esi, [ebp - 28]
    pop pop ecx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10068BE3
    mov mov al, dl
    jmp sub_10068C5F
    push push 6
    mov mov edi, 01010EB7Ch
    lea lea esi, [ebp - 28]
    pop pop ecx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_10068C6E
    push push 4
    mov mov edi, 01010EB78h
    lea lea esi, [ebp - 28]
    pop pop ecx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_10068C81
    push push 6
    mov mov edi, 01010EB70h
    lea lea esi, [ebp - 28]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10068C51
L12:
    mov mov al, 12
    jmp sub_10068C96
    push push 7
    mov mov edi, 01010EB68h
    lea lea esi, [ebp - 28]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10068C7B
    mov mov al, 13
    jmp sub_10068CAB
    push push 8
    mov mov edi, 01010EB60h
    lea lea esi, [ebp - 28]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10068CA6
    mov mov byte ptr [ebp - 1], al
    jmp sub_10068CBF
    mov mov edi, 01010EB54h
    lea lea esi, [ebp - 28]
    mov mov ecx, edx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10068CE2
    mov mov byte ptr [ebp - 1], 1
    mov mov al, 10
    mov mov ecx, dword ptr [ebp + 12]
    mov mov byte ptr [ecx], al
    mov mov eax, dword ptr [ebp + 16]
    mov mov cl, byte ptr [ebp - 1]
    mov mov byte ptr [eax], cl
    xor xor eax, eax
    jmp sub_10068CFE
    mov mov eax, 080004005h
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
    ret ret 12
FUN_10068883 ENDP
END
