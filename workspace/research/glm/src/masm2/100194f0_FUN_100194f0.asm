.686
.MODEL FLAT, C
EXTRN sub_1001962A:PROC
EXTRN sub_1001963D:PROC
EXTRN sub_10019640:PROC
EXTRN sub_10019650:PROC
EXTRN sub_10019683:PROC
EXTRN sub_100196A5:PROC
EXTRN sub_100196DF:PROC
EXTRN sub_100196F5:PROC
EXTRN sub_1005F484:PROC
EXTRN sub_1005F6F9:PROC
EXTRN sub_1005FB0E:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_100194f0 PROC
    push push ecx
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 28]
    push push edi
    mov mov edi, dword ptr [esp + 24]
    lea lea ecx, [ecx]
    push push 1
    push push 010195640h
    mov mov ecx, edi
    call sub_1005FB0E
    add add esp, 8
    test test eax, eax
    je sub_10019640
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L1
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [edi], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push edi
    mov mov eax, 1
    call sub_1005F6F9
    add add esp, 4
    xor xor ebp, ebp
    mov mov edi, esi
    mov mov esi, dword ptr [edi]
    test test esi, esi
    je sub_10019683
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
    jne sub_1001962A
    add add ecx, 2
    add add esi, 2
    test test dl, dl
    jne L3
    xor xor ecx, ecx
    jmp sub_1001963D
    sbb sbb ecx, ecx
    sbb sbb ecx, -1
    test test ecx, ecx
    je sub_10019650
    inc inc ebp
    add add edi, 20
    jmp L4
    mov mov ebx, dword ptr [esp + 32]
    mov mov edi, dword ptr [esp + 24]
    lea lea eax, [ebp + ebp*4]
    lea lea esi, [ebx + eax*4]
    mov mov eax, dword ptr [esi + 12]
    test test eax, eax
    je sub_100196A5
    mov mov edx, dword ptr [esi + 16]
    lea lea ecx, [esp + 16]
    push push ecx
    push push edx
    call L0
    add add esp, 8
    test test al, al
    je sub_100196F5
    mov mov ecx, dword ptr [esp + 28]
    mov mov eax, dword ptr [esp + 16]
    add add ecx, eax
    mov mov dword ptr [esp + 28], ecx
    mov mov esi, dword ptr [esi + 8]
    test test esi, esi
    je sub_100196DF
    mov mov dword ptr [esp + 32], esi
    jmp L2
    mov mov eax, dword ptr [esp + 28]
    lea lea ecx, [ebp + ebp*4]
    mov mov edx, dword ptr [ebx + ecx*4 + 4]
    pop pop edi
    add add edx, eax
    mov mov eax, dword ptr [esp + 32]
    pop pop esi
    pop pop ebp
    mov mov dword ptr [eax + 4], edx
    mov mov al, 1
    pop pop ebx
    pop pop ecx
    ret ret
    push push eax
    push push 010195594h
    call sub_1005F484
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
L5:
    pop pop ebx
    pop pop ecx
    ret ret
FUN_100194f0 ENDP
END
