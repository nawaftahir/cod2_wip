.686
.MODEL FLAT, C
EXTRN sub_100194D7:PROC
EXTRN sub_1001A569:PROC
EXTRN sub_1001A571:PROC
EXTRN sub_1001A59C:PROC
EXTRN sub_1001A5E0:PROC
EXTRN sub_1001A624:PROC
EXTRN sub_1001A62C:PROC
EXTRN sub_1001A67B:PROC
EXTRN sub_1001A691:PROC
EXTRN sub_1001A694:PROC
EXTRN sub_1001A69A:PROC
EXTRN sub_1001A6A9:PROC
EXTRN sub_1001A6AC:PROC
EXTRN sub_1001A6D1:PROC
EXTRN sub_1001A76F:PROC
EXTRN sub_1001A770:PROC
EXTRN sub_1001A773:PROC
EXTRN sub_1005F465:PROC
EXTRN sub_1005F5A2:PROC
EXTRN sub_1005F647:PROC
EXTRN sub_1005F6A9:PROC
EXTRN sub_1005F73D:PROC
EXTRN sub_1005FB35:PROC
EXTRN sub_1005FC19:PROC
EXTRN sub_1005FCCD:PROC
EXTRN sub_10061F8E:PROC
EXTRN sub_10061FAE:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_1001a160 PROC
    sub sub esp, 011Ch
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ebx + 12]
    mov mov edx, ecx
    push push ebp
    mov mov ebp, dword ptr [esp + 0124h]
    add add eax, ebx
    push push edi
    shr shr ecx, 2
    mov mov dword ptr [esp + 12], eax
    xor xor eax, eax
    lea lea edi, [esp + 36]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    push push 1
    push push 010195818h
    mov mov ecx, ebp
    mov mov dword ptr [esp + 16], 0
    call sub_1005FB35
    add add esp, 8
    test test eax, eax
    jne L1
    pop pop edi
    xor xor al, al
    pop pop ebp
    add add esp, 011Ch
    ret ret
    mov mov eax, dword ptr [esp + 0134h]
    add add eax, 4
    mov mov dword ptr [esp + 16], eax
    push push esi
    mov mov edx, dword ptr [g_101AAC70]
    lea lea esp, [esp]
    imul imul edx, edx, 045Ch
    add add edx, 0101A66B0h
    mov mov al, byte ptr [edx + 0404h]
    test test al, al
    je L2
    mov mov ecx, dword ptr [edx + 0418h]
    mov mov byte ptr [edx + 0404h], 0
    mov mov dword ptr [ebp], ecx
    mov mov eax, dword ptr [edx + 0414h]
    mov mov dword ptr [edx + 0400h], eax
    push push ebp
L1:
    mov mov eax, 1
    call sub_1005F73D
    mov mov esi, eax
    mov mov al, byte ptr [esi]
    add add esp, 4
    test test al, al
    je L13
    cmp cmp al, 125
    je L14
    mov mov edi, dword ptr [esp + 0130h]
    mov mov ecx, dword ptr [esp + 16]
    push push esi
    push push ebx
    push push edi
    call sub_100194D7
    add add esp, 12
    cmp cmp eax, -1
    jne L7
    mov mov ecx, dword ptr [g_101AAC70]
    imul imul ecx, ecx, 045Ch
    push push edi
    push push esi
    push push 010195294h
    mov mov dword ptr [ecx + 0101A6AC0h], 0101952B0h
    call sub_1005F465
    mov mov edx, dword ptr [g_101AAC70]
    imul imul edx, edx, 045Ch
    push push 1
    push push 01019563Ch
    mov mov ecx, ebp
    mov mov dword ptr [edx + 0101A6AC0h], 0101956FCh
    call sub_1005FC19
    add add esp, 20
    test test eax, eax
    je sub_1001A5E0
    mov mov edx, dword ptr [g_101AAC70]
    mov mov eax, dword ptr [ebp]
    mov mov ecx, edx
    imul imul ecx, ecx, 045Ch
    add add ecx, 0101A66B0h
    test test eax, eax
    je L3
    movsx movsx edx, byte ptr [eax]
    test test edx, edx
    je L11
    lea lea ebx, [ebx]
    inc inc eax
    cmp cmp edx, 10
    je L12
    movsx movsx edx, byte ptr [eax]
    test test edx, edx
    jne L10
    mov mov dword ptr [ebp], eax
    jmp L4
    inc inc dword ptr [ecx + 0400h]
    mov mov dword ptr [ebp], eax
    jmp L5
    mov mov cl, byte ptr [esp + eax + 40]
    test test cl, cl
    jne sub_1001A62C
    mov mov ecx, dword ptr [esp + 16]
    mov mov edi, dword ptr [esp + 20]
    mov mov byte ptr [esp + eax + 40], 1
    lea lea eax, [eax + eax*4]
    lea lea eax, [ecx + eax*4]
    mov mov dword ptr [esp + 32], eax
    mov mov edx, dword ptr [eax + 12]
    add add edx, ebx
    mov mov dword ptr [esp + 36], edx
    mov mov ax, word ptr [eax + 6]
    mov mov word ptr [edi - 2], ax
    lea lea esi, [edi - 4]
    mov mov eax, esi
    lea lea ecx, [esp + 24]
    mov mov edx, ebp
    call L0
    test test al, al
    je sub_1001A67B
    push push 1
    push push 010195820h
    mov mov ecx, ebp
    call sub_1005FCCD
    add add esp, 8
    test test eax, eax
    je sub_1001A694
    cmp cmp word ptr [esi], 3
    jne sub_1001A571
    mov mov eax, dword ptr [edi]
    cmp cmp eax, 14
    jne sub_1001A569
    mov mov eax, dword ptr [esp + 0134h]
    mov mov ecx, dword ptr [esp + 12]
    or or byte ptr [eax], 1
    inc inc ecx
    add add edi, 8
    mov mov dword ptr [esp + 12], ecx
    mov mov dword ptr [esp + 20], edi
    jmp L8
    cmp cmp eax, 15
    jne sub_1001A59C
    mov mov eax, dword ptr [esp + 0134h]
    or or byte ptr [eax], 2
    mov mov ecx, dword ptr [esp + 12]
    inc inc ecx
    add add edi, 8
    mov mov dword ptr [esp + 12], ecx
    mov mov dword ptr [esp + 20], edi
    jmp L9
    push push 0101952BCh
    call sub_1005F5A2
    add add esp, 4
    pop pop esi
    pop pop edi
    xor xor al, al
    pop pop ebp
    add add esp, 011Ch
    ret ret
    mov mov eax, dword ptr [ebx + 12]
    mov mov ecx, dword ptr [esp + 12]
    cmp cmp ecx, eax
    jne sub_1001A624
    pop pop esi
    pop pop edi
    mov mov al, 1
    pop pop ebp
    add add esp, 011Ch
    ret ret
    xor xor ebp, ebp
    test test eax, eax
    jbe sub_1001A69A
    mov mov edx, dword ptr [esp + 0138h]
    mov mov esi, dword ptr [esp + 16]
    lea lea edi, [edx + ecx*8]
    lea lea esp, [esp]
    mov mov al, byte ptr [esp + ebp + 40]
    test test al, al
    jne sub_1001A6A9
    mov mov dword ptr [esp + 32], esi
    mov mov eax, dword ptr [esi + 12]
    add add eax, ebx
    mov mov dword ptr [esp + 36], eax
    mov mov cx, word ptr [esi + 6]
    mov mov word ptr [edi + 2], cx
    mov mov edx, dword ptr [esi]
    add add edx, ebx
    mov mov eax, edi
    lea lea ecx, [esp + 24]
    call L6
    test test al, al
    je sub_1001A6D1
    mov mov ecx, dword ptr [esp + 12]
    inc inc ecx
    mov mov byte ptr [esp + ebp + 40], 1
    mov mov dword ptr [esp + 12], ecx
    add add edi, 8
    mov mov eax, dword ptr [ebx + 12]
    inc inc ebp
    add add esi, 20
    cmp cmp ebp, eax
    jb sub_1001A6AC
    mov mov edx, dword ptr [esp + 12]
    cmp cmp edx, dword ptr [ebx + 12]
    je sub_1001A691
L11:
    mov mov eax, dword ptr [esp + 0130h]
    push push eax
    push push 010195230h
    call sub_1005F647
    mov mov eax, dword ptr [ebx + 12]
    add add esp, 8
    xor xor esi, esi
    test test eax, eax
    jbe sub_1001A76F
    mov mov edi, dword ptr [esp + 16]
    mov mov al, byte ptr [esp + esi + 40]
    test test al, al
    jne sub_1001A770
    mov mov ecx, dword ptr [edi]
    add add ecx, ebx
    push push ecx
    push push 0101932D4h
    call sub_10061F8E
    add add esp, 8
    mov mov eax, dword ptr [ebx + 12]
    inc inc esi
L14:
    add add edi, 20
    cmp cmp esi, eax
    jb sub_1001A773
    mov mov edx, dword ptr [ebx + 12]
    sub sub edx, dword ptr [esp + 12]
    push push edx
    push push 010195210h
    call sub_10061FAE
    add add esp, 8
    pop pop esi
    pop pop edi
    xor xor al, al
    pop pop ebp
    add add esp, 011Ch
    ret ret
    push push edi
    push push esi
    push push 010195254h
    call sub_1005F6A9
    add add esp, 12
    pop pop esi
    pop pop edi
    xor xor al, al
    pop pop ebp
    add add esp, 011Ch
    ret ret
FUN_1001a160 ENDP
END
