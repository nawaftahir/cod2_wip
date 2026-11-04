.686
.MODEL FLAT, C
EXTRN sub_10016969:PROC
EXTRN sub_10016995:PROC
EXTRN sub_100190CC:PROC
EXTRN sub_10019200:PROC
EXTRN sub_1005F4B4:PROC
EXTRN sub_1005F59E:PROC
EXTRN sub_1005F6EE:PROC
EXTRN sub_1005F75E:PROC
EXTRN sub_1005FB75:PROC
EXTRN sub_1005FB86:PROC
EXTRN sub_1005FBE2:PROC
EXTRN sub_1005FBFB:PROC
EXTRN sub_1005FC14:PROC
EXTRN sub_1005FC49:PROC
EXTRN g_101AAC70:DWORD
EXTRN g_101AAC74:DWORD
EXTRN g_101AAC78:DWORD
.CODE
FUN_100191a0 PROC
    sub esp, 44
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 56]
    xor ebx, ebx
    lea eax, [esp + 20]
    push esi
    sub eax, 2
    push edi
    mov dword ptr [esp + 24], ebx
    mov dword ptr [esp + 20], eax
    lea esp, [esp]
L0:
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    cmp byte ptr [eax + 000000404h], bl
    je L1
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], bl
    mov dword ptr [ebp], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L1:
    push ebp
    mov eax, 1
    call sub_1005F6EE
    add esp, 4
    mov esi, eax
    mov edi, 010195644h
    mov ecx, 7
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L6
    push 1
    push 010195640h
    mov ecx, ebp
    call sub_1005FB75
    add esp, 8
    test eax, eax
    je L10
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    cmp byte ptr [eax + 000000404h], bl
    je L2
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], bl
    mov dword ptr [ebp], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L2:
    push ebp
    mov eax, 1
    call sub_1005F75E
    add esp, 4
    lea ebx, [esp + 18]
    mov edx, ebp
    call sub_100190CC
    test al, al
    je L10
    push 1
    push 01019563Ch
    mov ecx, ebp
    call sub_1005FBE2
    add esp, 8
    test eax, eax
    je L10
    push 1
    push 010195634h
    mov ecx, ebp
    call sub_1005FBFB
    add esp, 8
    test eax, eax
    je L10
    push 1
    push 010195640h
    mov ecx, ebp
    call sub_1005FC14
    add esp, 8
    test eax, eax
    je L10
    mov ecx, ebp
    call sub_1005FB86
    push ebp
    lea ebx, [esp + 23]
    call sub_10019200
    add esp, 4
    test al, al
    je L10
    push 1
    push 010195820h
    mov ecx, ebp
    call sub_1005FC49
    add esp, 8
    test eax, eax
    je L10
    mov edi, dword ptr [esp + 24]
    test edi, edi
    mov bl, byte ptr [esp + 18]
    mov dl, byte ptr [esp + 19]
    mov esi, edi
    jle L5
    mov eax, dword ptr [esp + 20]
    lea ebx, [ebx]
L3:
    mov cl, byte ptr [eax]
    cmp cl, dl
    jb L5
    jne L4
    cmp byte ptr [eax + 1], bl
    jb L5
L4:
    mov cx, word ptr [eax]
    mov word ptr [eax + 2], cx
    dec esi
    sub eax, 2
    test esi, esi
    jg L3
L5:
    mov ecx, dword ptr [esp + 20]
    inc edi
    add ecx, 2
    cmp edi, 16
    mov byte ptr [esp + esi*2 + 28], dl
    mov byte ptr [esp + esi*2 + 29], bl
    mov dword ptr [esp + 24], edi
    mov dword ptr [esp + 20], ecx
    jae L9
    xor ebx, ebx
    jmp L0
L6:
    mov esi, dword ptr [g_101AAC70]
    imul esi, esi, 00000045Ch
    add esi, 0101A66B0h
    cmp byte ptr [esi + 000000404h], bl
    je L7
    push 01019B90Ch
    call sub_1005F4B4
    add esp, 4
L7:
    mov ecx, dword ptr [esp + 24]
    mov byte ptr [esi + 000000404h], 1
    mov edx, dword ptr [g_101AAC78]
    mov esi, dword ptr [esp + 68]
    lea eax, [esp + 19]
    push eax
    mov dword ptr [g_101AAC74], edx
    push ecx
    lea edx, [esp + 36]
    push edx
    add esi, 4
    call sub_10016995
    mov dword ptr [esi], eax
    mov al, byte ptr [esp + 31]
    add esp, 12
    cmp al, bl
    jne L8
    mov ebx, esi
    call sub_10016969
L8:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    add esp, 44
    ret
L9:
    push edi
    push 010195614h
    call sub_1005F59E
    add esp, 8
L10:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    add esp, 44
    ret
FUN_100191a0 ENDP
END
