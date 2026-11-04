.686
.MODEL FLAT, C
EXTRN sub_10019557:PROC
EXTRN sub_1005F484:PROC
EXTRN sub_1005F6F9:PROC
EXTRN sub_1005FB0E:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_100194f0 PROC
    push ecx
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 28]
    push edi
    mov edi, dword ptr [esp + 24]
    lea ecx, [ecx]
L0:
    push 1
    push 010195640h
    mov ecx, edi
    call sub_1005FB0E
    add esp, 8
    test eax, eax
    je L11
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    je L1
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [edi], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L1:
    push edi
    mov eax, 1
    call sub_1005F6F9
    add esp, 4
    xor ebp, ebp
    mov edi, esi
L2:
    mov esi, dword ptr [edi]
    test esi, esi
    je L10
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
    mov ebx, dword ptr [esp + 32]
    mov edi, dword ptr [esp + 24]
    lea eax, [ebp + ebp*4]
    lea esi, [ebx + eax*4]
    mov eax, dword ptr [esi + 12]
    test eax, eax
    je L8
    mov edx, dword ptr [esi + 16]
    lea ecx, [esp + 16]
    push ecx
    push edx
    call sub_10019557
    add esp, 8
    test al, al
    je L11
    mov ecx, dword ptr [esp + 28]
    mov eax, dword ptr [esp + 16]
    add ecx, eax
    mov dword ptr [esp + 28], ecx
L8:
    mov esi, dword ptr [esi + 8]
    test esi, esi
    je L9
    mov dword ptr [esp + 32], esi
    jmp L0
L9:
    mov eax, dword ptr [esp + 28]
    lea ecx, [ebp + ebp*4]
    mov edx, dword ptr [ebx + ecx*4 + 4]
    pop edi
    add edx, eax
    mov eax, dword ptr [esp + 32]
    pop esi
    pop ebp
    mov dword ptr [eax + 4], edx
    mov al, 1
    pop ebx
    pop ecx
    ret
L10:
    push eax
    push 010195594h
    call sub_1005F484
    add esp, 8
L11:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    pop ecx
    ret
FUN_100194f0 ENDP
END
