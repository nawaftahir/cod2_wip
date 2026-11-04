.686
.MODEL FLAT, C
EXTRN sub_100863E9:PROC
EXTRN sub_1008B170:PROC
EXTRN sub_1008B290:PROC
EXTRN sub_1008B2CF:PROC
EXTRN sub_100BAAF4:PROC
EXTRN sub_100BAAFC:PROC
EXTRN sub_100BAB13:PROC
EXTRN sub_100BAB5B:PROC
EXTRN sub_100BAB61:PROC
EXTRN sub_100BAB6F:PROC
EXTRN sub_100BAB75:PROC
EXTRN sub_100BABAA:PROC
EXTRN sub_100BABC4:PROC
EXTRN sub_100BABE7:PROC
EXTRN sub_100BABEE:PROC
EXTRN sub_100BABF4:PROC
EXTRN sub_100BABFE:PROC
EXTRN sub_100BAC2C:PROC
EXTRN sub_100BAC76:PROC
EXTRN sub_100BAC92:PROC
EXTRN sub_100BACBE:PROC
EXTRN sub_100BACC4:PROC
EXTRN sub_100F5E21:PROC
EXTRN sub_100F74C4:PROC
EXTRN sub_100F792F:PROC
EXTRN sub_100F79F4:PROC
EXTRN sub_100F85C0:PROC
EXTRN sub_100F86D3:PROC
.CODE
FUN_100ba898 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 76
    and and dword ptr [ebp - 8], 0
    push push ebx
    mov mov ebx, dword ptr [ebp + 20]
    and and dword ptr [ebx], 0
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [esi + 104]
    and and byte ptr [esi + 3], 0BFh
    push push edi
    mov mov edi, dword ptr [eax + 24]
    push push 63
    lea lea eax, [ebp - 76]
    push push edi
    push push eax
    mov mov dword ptr [ebp - 4], ecx
    call sub_100F5E21
    add add esp, 12
    cmp cmp byte ptr [ebp - 76], 0
    mov mov byte ptr [ebp - 13], 0
    lea lea eax, [ebp - 76]
    je L0
    cmp cmp byte ptr [eax], 95
    je L1
    inc inc eax
    cmp cmp byte ptr [eax], 0
    jne L0
    cmp cmp byte ptr [eax], 95
    jne L2
    mov mov byte ptr [eax], 0
    inc inc eax
    push push 01010ECECh
    push push eax
    call sub_100F792F
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne L4
    mov mov dword ptr [ebp - 8], 1
    cmp cmp byte ptr [ebp - 76], 0
    lea lea edi, [ebp - 76]
    je L6
    movsx movsx eax, byte ptr [edi]
    push push eax
    call sub_100F85C0
    test test eax, eax
    pop pop ecx
    je L5
    inc inc edi
    cmp cmp byte ptr [edi], 0
    jne L3
    cmp cmp byte ptr [edi], 0
L0:
    je L7
    push push edi
    call sub_100F74C4
    pop pop ecx
    mov mov dword ptr [ebp + 8], eax
    jmp L8
    push push edi
    push push 01011A054h
    mov mov dword ptr [ebx], 1
    and and dword ptr [esi + 108], 0
    push push 01196h
    push push dword ptr [esi + 104]
    push push dword ptr [ebp - 4]
    call sub_1008B170
    add add esp, 20
L2:
    jmp sub_100BAB75
    and and dword ptr [ebp + 8], 0
    cmp cmp byte ptr [edi], 0
    je L9
    mov mov byte ptr [edi], 0
    inc inc edi
    mov mov al, byte ptr [edi]
    test test al, al
    je L11
    movsx movsx eax, al
    push push eax
    call sub_100F86D3
    test test eax, eax
    pop pop ecx
    je L12
    inc inc edi
    mov mov al, byte ptr [edi]
    test test al, al
    jne L10
    cmp cmp byte ptr [edi], 0
    je L13
    or or dword ptr [ebp + 8], -1
    jmp L14
    mov mov eax, dword ptr [esi + 112]
    shr shr eax, 2
    add add dword ptr [ebp + 8], eax
    mov mov ecx, dword ptr [ebp - 4]
    push push esi
    call sub_100863E9
    mov mov edi, dword ptr [ebp + 12]
    xor xor ebx, ebx
    cmp cmp dword ptr [edi + 16], -1
    mov mov dword ptr [ebp - 12], eax
    je sub_100BABC4
    lea lea eax, [ebp - 76]
    push push eax
    push push dword ptr [edi]
    call sub_100F79F4
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_100BAAFC
    mov mov ax, word ptr [edi + 4]
    mov mov ebx, edi
    and and eax, dword ptr [ebp + 16]
    test test ax, ax
    jne sub_100BAB13
L6:
    add add edi, 36
    cmp cmp dword ptr [edi + 16], -1
    jne sub_100BAAF4
    test test ebx, ebx
    je sub_100BABF4
    cmp cmp dword ptr [edi + 16], -1
    je sub_100BABFE
    cmp cmp dword ptr [ebp - 8], 0
    je sub_100BAB5B
    test test byte ptr [ebx + 8], 1
    jne sub_100BAB61
    mov mov eax, 040000000h
    or or dword ptr [esi], eax
    jmp sub_100BAB6F
    mov mov eax, 040000000h
    mov mov ecx, dword ptr [ebx + 12]
    test test ecx, ecx
    je sub_100BABAA
    push push dword ptr [ebp + 8]
    lea lea eax, [ebp - 76]
    push push ecx
    push push eax
    push push dword ptr [ebp - 12]
    push push 01011A018h
    push push 01261h
    push push dword ptr [esi + 104]
    push push dword ptr [ebp - 4]
    call sub_1008B2CF
    add add esp, 32
    mov mov eax, 040000000h
    mov mov ecx, dword ptr [ebp + 8]
    cmp cmp ecx, dword ptr [edi + 20]
    jb sub_100BABE7
    cmp cmp ecx, dword ptr [edi + 24]
    jb sub_100BABEE
    or or dword ptr [esi], eax
    mov mov edx, dword ptr [esi + 16]
    cmp cmp edx, dword ptr [edi + 32]
    jb sub_100BAC2C
    or or dword ptr [esi], eax
    push push dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp + 20]
    mov mov dword ptr [eax], 1
    lea lea eax, [ebp - 76]
    push push eax
    push push 010119FF0h
    push push 011CBh
    push push dword ptr [esi + 104]
    push push dword ptr [ebp - 4]
    call sub_1008B290
    add add esp, 24
    jmp sub_100BAC92
    xor xor edx, edx
    mov mov dx, word ptr [ebx + 4]
L13:
    and and edx, dword ptr [ebp + 16]
    test test dx, dx
    jne sub_100BAC76
    or or dword ptr [esi], eax
    mov mov eax, dword ptr [ebx + 28]
    add add eax, ecx
L14:
    mov mov ecx, dword ptr [ebx + 16]
    shl shl eax, 16
    and and ecx, 0FFFFh
    or or eax, ecx
    cmp cmp dword ptr [ebp - 8], 0
    mov mov dword ptr [esi + 108], eax
    je sub_100BACBE
    or or byte ptr [esi + 3], 1
    jmp sub_100BACC4
    or or byte ptr [esi + 3], 64
    and and dword ptr [esi + 108], 0
    mov mov ecx, dword ptr [ebp + 20]
    xor xor eax, eax
    cmp cmp dword ptr [ecx], eax
    pop pop edi
    pop pop esi
    setne setne al
    pop pop ebx
    leave leave
    ret ret 16
FUN_100ba898 ENDP
END
