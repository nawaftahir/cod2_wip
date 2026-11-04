.686
.MODEL FLAT, C
EXTRN sub_10016969:PROC
EXTRN sub_10016995:PROC
EXTRN sub_100190CC:PROC
EXTRN sub_10019471:PROC
EXTRN sub_100194B2:PROC
EXTRN sub_100194B5:PROC
EXTRN sub_100194BC:PROC
EXTRN sub_100194C2:PROC
EXTRN sub_100194C5:PROC
EXTRN sub_100194C9:PROC
EXTRN sub_100194DE:PROC
EXTRN sub_100194F7:PROC
EXTRN sub_10019510:PROC
EXTRN sub_1001952C:PROC
EXTRN sub_10019545:PROC
EXTRN sub_10019561:PROC
EXTRN sub_1001958C:PROC
EXTRN sub_100195EB:PROC
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
EXTRN EXTRN g_101AAC70:DWORD:DWORD
EXTRN EXTRN g_101AAC74:DWORD:DWORD
EXTRN EXTRN g_101AAC78:DWORD:DWORD
.CODE
FUN_100191a0 PROC
    sub sub esp, 44
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 56]
    xor xor ebx, ebx
    lea lea eax, [esp + 20]
    push push esi
    sub sub eax, 2
    push push edi
    mov mov dword ptr [esp + 24], ebx
    mov mov dword ptr [esp + 20], eax
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    cmp cmp byte ptr [eax + 0404h], bl
    je L1
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], bl
    mov mov dword ptr [ebp], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebp
    mov mov eax, 1
    call sub_1005F6EE
    add add esp, 4
    mov mov esi, eax
    mov mov edi, 010195644h
    mov mov ecx, 7
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L4
    push push 1
    push push 010195640h
    mov mov ecx, ebp
    call sub_1005FB75
    add add esp, 8
    test test eax, eax
    je sub_10019471
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    cmp cmp byte ptr [eax + 0404h], bl
    je L2
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], bl
    mov mov dword ptr [ebp], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebp
    mov mov eax, 1
    call sub_1005F75E
    add add esp, 4
    lea lea ebx, [esp + 18]
    mov mov edx, ebp
    call sub_100190CC
    test test al, al
    je sub_100194C5
    push push 1
    push push 01019563Ch
    mov mov ecx, ebp
    call sub_1005FBE2
    add add esp, 8
    test test eax, eax
    je sub_100194DE
    push push 1
    push push 010195634h
    mov mov ecx, ebp
    call sub_1005FBFB
    add add esp, 8
    test test eax, eax
    je sub_100194F7
    push push 1
    push push 010195640h
    mov mov ecx, ebp
    call sub_1005FC14
    add add esp, 8
    test test eax, eax
    je sub_10019510
    mov mov ecx, ebp
    call sub_1005FB86
    push push ebp
    lea lea ebx, [esp + 23]
    call L0
    add add esp, 4
    test test al, al
    je sub_1001952C
    push push 1
    push push 010195820h
    mov mov ecx, ebp
    call sub_1005FC49
    add add esp, 8
    test test eax, eax
    je sub_10019545
    mov mov edi, dword ptr [esp + 24]
    test test edi, edi
    mov mov bl, byte ptr [esp + 18]
    mov mov dl, byte ptr [esp + 19]
    mov mov esi, edi
    jle sub_100194B2
    mov mov eax, dword ptr [esp + 20]
    lea lea ebx, [ebx]
    mov mov cl, byte ptr [eax]
    cmp cmp cl, dl
    jb sub_100194C2
    jne sub_100194B5
    cmp cmp byte ptr [eax + 1], bl
    jb sub_100194C9
    mov mov cx, word ptr [eax]
    mov mov word ptr [eax + 2], cx
    dec dec esi
    sub sub eax, 2
    test test esi, esi
    jg sub_100194BC
    mov mov ecx, dword ptr [esp + 20]
    inc inc edi
    add add ecx, 2
    cmp cmp edi, 16
    mov mov byte ptr [esp + esi*2 + 28], dl
    mov mov byte ptr [esp + esi*2 + 29], bl
    mov mov dword ptr [esp + 24], edi
    mov mov dword ptr [esp + 20], ecx
    jae sub_1001958C
    xor xor ebx, ebx
    jmp L3
    mov mov esi, dword ptr [g_101AAC70]
    imul imul esi, esi, 045Ch
    add add esi, 0101A66B0h
    cmp cmp byte ptr [esi + 0404h], bl
    je sub_10019561
    push push 01019B90Ch
    call sub_1005F4B4
    add add esp, 4
    mov mov ecx, dword ptr [esp + 24]
    mov mov byte ptr [esi + 0404h], 1
    mov mov edx, dword ptr [g_101AAC78]
    mov mov esi, dword ptr [esp + 68]
    lea lea eax, [esp + 19]
    push push eax
    mov mov dword ptr [g_101AAC74], edx
    push push ecx
    lea lea edx, [esp + 36]
    push push edx
    add add esi, 4
    call sub_10016995
    mov mov dword ptr [esi], eax
    mov mov al, byte ptr [esp + 31]
    add add esp, 12
    cmp cmp al, bl
    jne sub_100195EB
    mov mov ebx, esi
    call sub_10016969
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov al, 1
    pop pop ebx
    add add esp, 44
    ret ret
    push push edi
    push push 010195614h
    call sub_1005F59E
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    add add esp, 44
    ret ret
FUN_100191a0 ENDP
END
