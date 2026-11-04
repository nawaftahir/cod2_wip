.686
.MODEL FLAT, C
EXTRN sub_10019579:PROC
EXTRN sub_10019A55:PROC
EXTRN sub_1005F548:PROC
EXTRN sub_1005F55E:PROC
EXTRN sub_1005F570:PROC
EXTRN sub_1005F574:PROC
EXTRN sub_1005F6F2:PROC
EXTRN sub_1005FB07:PROC
EXTRN sub_1005FBC4:PROC
EXTRN sub_1005FCBF:PROC
EXTRN sub_100600E1:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_10019a80 PROC
    push ecx
    push ebx
    push ebp
    push esi
    push edi
L0:
    mov esi, dword ptr [esp + 24]
    push 1
    push 010195640h
    mov ecx, esi
    call sub_1005FB07
    add esp, 8
    test eax, eax
    je L18
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L1
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [esi], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L1:
    push esi
    mov eax, 1
    call sub_1005F6F2
    mov edi, dword ptr [esp + 40]
    add esp, 4
    xor ebp, ebp
    jmp L2
    lea ecx, [ecx]
L2:
    mov esi, dword ptr [edi]
    test esi, esi
    je L17
    mov ecx, eax
    lea esp, [esp]
L3:
    mov bl, byte ptr [ecx]
    mov dl, bl
    cmp bl, byte ptr [esi]
    jne L5
    test dl, dl
    je L4
    mov bl, byte ptr [ecx + 1]
    mov dl, bl
    cmp bl, byte ptr [esi + 1]
    jne L5
    add ecx, 2
    add esi, 2
    test dl, dl
    jne L3
L4:
    xor ecx, ecx
    jmp L6
L5:
    sbb ecx, ecx
    sbb ecx, -1
L6:
    test ecx, ecx
    je L7
    inc ebp
    add edi, 20
    jmp L2
L7:
    mov ecx, dword ptr [esp + 36]
    lea eax, [ebp + ebp*4]
    lea ebx, [ecx + eax*4]
    mov eax, dword ptr [ebx + 12]
    test eax, eax
    je L10
    mov ecx, dword ptr [ebx + 8]
    test ecx, ecx
    jne L8
    mov ecx, dword ptr [esp + 28]
    cmp byte ptr [ecx + 5], 1
    jbe L8
    mov edi, dword ptr [esp + 24]
    lea edx, [esp + 16]
    push edx
    push ecx
    call sub_10019A55
    jmp L9
L8:
    mov edx, dword ptr [ebx + 16]
    mov edi, dword ptr [esp + 24]
    lea ecx, [esp + 16]
    push ecx
    push edx
    call sub_10019579
L9:
    add esp, 8
    test al, al
    je L18
    mov ecx, dword ptr [esp + 32]
    mov eax, dword ptr [esp + 16]
    add ecx, eax
    mov dword ptr [esp + 32], ecx
L10:
    mov ebx, dword ptr [ebx + 8]
    test ebx, ebx
    je L11
    mov dword ptr [esp + 36], ebx
    jmp L0
L11:
    mov edx, dword ptr [esp + 36]
    lea ecx, [ebp + ebp*4]
    movzx esi, byte ptr [edx + ecx*4 + 4]
    add esi, dword ptr [esp + 32]
    cmp esi, 0000000BBh
    jge L12
    mov eax, dword ptr [esp + 40]
    mov ecx, dword ptr [esp + 28]
    pop edi
    mov word ptr [eax + 4], si
    mov byte ptr [eax + 6], 0
    mov dl, byte ptr [ecx + 5]
    pop esi
    pop ebp
    mov byte ptr [eax + 7], dl
    mov al, 1
    pop ebx
    pop ecx
    ret
L12:
    mov edi, dword ptr [esp + 28]
    mov eax, dword ptr [edi + 12]
    cmp word ptr [eax], 3
    jne L13
    xor esi, 2
L13:
    mov ebx, dword ptr [esp + 24]
    mov ecx, ebx
    call sub_1005FBC4
    mov cl, byte ptr [eax]
    cmp cl, 59
    jne L14
    call sub_1005F570
    mov eax, dword ptr [esp + 40]
    mov word ptr [eax + 4], si
    mov byte ptr [eax + 6], 0
    mov ecx, dword ptr [edi + 8]
    mov dl, byte ptr [ecx + 8]
    pop edi
    pop esi
    pop ebp
    mov byte ptr [eax + 7], dl
    mov al, 1
    pop ebx
    pop ecx
    ret
L14:
    cmp cl, 91
    jne L16
    mov edi, dword ptr [esp + 40]
    mov ecx, ebx
    mov word ptr [edi + 4], si
    call sub_100600E1
    test eax, eax
    jl L15
    cmp eax, 3
    jg L15
    push 1
    push 0101958A8h
    mov ecx, ebx
    mov byte ptr [edi + 6], al
    mov byte ptr [edi + 7], 1
    call sub_1005FCBF
    add esp, 8
    pop edi
    pop esi
    test eax, eax
    pop ebp
    setne al
    pop ebx
    pop ecx
    ret
L15:
    push eax
    push 010195464h
    call sub_1005F548
    add esp, 8
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    pop ecx
    ret
L16:
    push eax
    push 010195438h
    call sub_1005F55E
    add esp, 8
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    pop ecx
    ret
L17:
    push eax
    push 010195418h
    call sub_1005F574
    add esp, 8
L18:
    pop edi
    pop esi
    pop ebp
    xor al, al
FUN_10019a80 ENDP
END
