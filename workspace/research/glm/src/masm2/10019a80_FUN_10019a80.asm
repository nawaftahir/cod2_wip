.686
.MODEL FLAT, C
EXTRN sub_10019579:PROC
EXTRN sub_10019A55:PROC
EXTRN sub_10019CB9:PROC
EXTRN sub_10019CBB:PROC
EXTRN sub_10019D03:PROC
EXTRN sub_10019D14:PROC
EXTRN sub_10019D4F:PROC
EXTRN sub_10019D98:PROC
EXTRN sub_10019D9B:PROC
EXTRN sub_10019E12:PROC
EXTRN sub_10019E15:PROC
EXTRN sub_10019E17:PROC
EXTRN sub_1005F548:PROC
EXTRN sub_1005F55E:PROC
EXTRN sub_1005F570:PROC
EXTRN sub_1005F574:PROC
EXTRN sub_1005F6F2:PROC
EXTRN sub_1005FB07:PROC
EXTRN sub_1005FBC4:PROC
EXTRN sub_1005FCBF:PROC
EXTRN sub_100600E1:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_10019a80 PROC
    push push ecx
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov esi, dword ptr [esp + 24]
    push push 1
    push push 010195640h
    mov mov ecx, esi
    call sub_1005FB07
    add add esp, 8
    test test eax, eax
    je sub_10019CB9
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L0
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [esi], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push esi
    mov mov eax, 1
    call sub_1005F6F2
    mov mov edi, dword ptr [esp + 40]
    add add esp, 4
    xor xor ebp, ebp
    jmp L1
    lea lea ecx, [ecx]
    mov mov esi, dword ptr [edi]
    test test esi, esi
    je sub_10019D03
    mov mov ecx, eax
    lea lea esp, [esp]
    mov mov bl, byte ptr [ecx]
    mov mov dl, bl
    cmp cmp bl, byte ptr [esi]
    jne L5
    test test dl, dl
    je L5
    mov mov bl, byte ptr [ecx + 1]
    mov mov dl, bl
    cmp cmp bl, byte ptr [esi + 1]
    jne L6
    add add ecx, 2
    add add esi, 2
    test test dl, dl
    jne L2
    xor xor ecx, ecx
    jmp L7
    sbb sbb ecx, ecx
    sbb sbb ecx, -1
    test test ecx, ecx
    je L8
    inc inc ebp
    add add edi, 20
    jmp L3
    mov mov ecx, dword ptr [esp + 36]
    lea lea eax, [ebp + ebp*4]
    lea lea ebx, [ecx + eax*4]
    mov mov eax, dword ptr [ebx + 12]
    test test eax, eax
    je L11
    mov mov ecx, dword ptr [ebx + 8]
    test test ecx, ecx
    jne L9
    mov mov ecx, dword ptr [esp + 28]
    cmp cmp byte ptr [ecx + 5], 1
    jbe L10
    mov mov edi, dword ptr [esp + 24]
    lea lea edx, [esp + 16]
    push push edx
    push push ecx
    call sub_10019A55
    jmp L12
    mov mov edx, dword ptr [ebx + 16]
    mov mov edi, dword ptr [esp + 24]
    lea lea ecx, [esp + 16]
    push push ecx
    push push edx
    call sub_10019579
    add add esp, 8
    test test al, al
    je sub_10019D9B
    mov mov ecx, dword ptr [esp + 32]
    mov mov eax, dword ptr [esp + 16]
    add add ecx, eax
    mov mov dword ptr [esp + 32], ecx
    mov mov ebx, dword ptr [ebx + 8]
    test test ebx, ebx
    je sub_10019CBB
    mov mov dword ptr [esp + 36], ebx
    jmp L4
    mov mov edx, dword ptr [esp + 36]
    lea lea ecx, [ebp + ebp*4]
    movzx movzx esi, byte ptr [edx + ecx*4 + 4]
    add add esi, dword ptr [esp + 32]
    cmp cmp esi, 0BBh
    jge sub_10019D14
    mov mov eax, dword ptr [esp + 40]
    mov mov ecx, dword ptr [esp + 28]
    pop pop edi
    mov mov word ptr [eax + 4], si
    mov mov byte ptr [eax + 6], 0
    mov mov dl, byte ptr [ecx + 5]
    pop pop esi
    pop pop ebp
    mov mov byte ptr [eax + 7], dl
    mov mov al, 1
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov edi, dword ptr [esp + 28]
    mov mov eax, dword ptr [edi + 12]
L8:
    cmp cmp word ptr [eax], 3
    jne sub_10019D4F
    xor xor esi, 2
    mov mov ebx, dword ptr [esp + 24]
    mov mov ecx, ebx
    call sub_1005FBC4
    mov mov cl, byte ptr [eax]
    cmp cmp cl, 59
    jne sub_10019D98
    call sub_1005F570
    mov mov eax, dword ptr [esp + 40]
    mov mov word ptr [eax + 4], si
    mov mov byte ptr [eax + 6], 0
    mov mov ecx, dword ptr [edi + 8]
    mov mov dl, byte ptr [ecx + 8]
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov byte ptr [eax + 7], dl
    mov mov al, 1
    pop pop ebx
    pop pop ecx
    ret ret
    cmp cmp cl, 91
    jne sub_10019E15
    mov mov edi, dword ptr [esp + 40]
    mov mov ecx, ebx
    mov mov word ptr [edi + 4], si
    call sub_100600E1
    test test eax, eax
L9:
    jl sub_10019E12
    cmp cmp eax, 3
    jg sub_10019E17
    push push 1
    push push 0101958A8h
    mov mov ecx, ebx
    mov mov byte ptr [edi + 6], al
    mov mov byte ptr [edi + 7], 1
    call sub_1005FCBF
    add add esp, 8
    pop pop edi
    pop pop esi
    test test eax, eax
    pop pop ebp
L11:
    setne setne al
    pop pop ebx
    pop pop ecx
    ret ret
    push push eax
    push push 010195464h
    call sub_1005F548
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    pop pop ecx
    ret ret
    push push eax
    push push 010195438h
    call sub_1005F55E
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    pop pop ecx
    ret ret
    push push eax
    push push 010195418h
    call sub_1005F574
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
FUN_10019a80 ENDP
END
