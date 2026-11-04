.686
.MODEL FLAT, C
EXTRN sub_10010C18:PROC
EXTRN sub_10011305:PROC
EXTRN sub_1001135A:PROC
EXTRN sub_1001135C:PROC
EXTRN sub_10011361:PROC
EXTRN sub_100113A9:PROC
EXTRN sub_10011640:PROC
EXTRN sub_10011775:PROC
EXTRN sub_1001177A:PROC
EXTRN sub_1001181E:PROC
EXTRN sub_10011832:PROC
EXTRN sub_10011871:PROC
EXTRN sub_10011878:PROC
EXTRN sub_100118A5:PROC
.CODE
FUN_10010d40 PROC
    sub sub esp, 84
    mov mov ecx, dword ptr [esi + 24]
    mov mov eax, dword ptr [esi + 8]
    mov mov edx, dword ptr [esi + 12]
    push push ebx
    push push ebp
L1:
    mov mov ebp, dword ptr [esp + 100]
    sar sar eax, cl
    sar sar edx, cl
    push push edi
    mov mov edi, 1
    cmp cmp eax, edi
    mov mov dword ptr [esp + 32], eax
    mov mov dword ptr [esp + 28], edx
    jle L16
    cmp cmp edx, edi
    jle L17
    mov mov cl, byte ptr [esi + 28]
    test test cl, cl
    jne L4
    mov mov ecx, dword ptr [esi + 4]
    xor xor edx, edx
    mov mov dh, byte ptr [ecx + 1]
    add add ecx, 2
    mov mov dl, byte ptr [ecx - 2]
    mov mov word ptr [esi + 2], 0
    mov mov dword ptr [esi + 4], ecx
    mov mov byte ptr [esi + 28], 1
    mov mov word ptr [esi], dx
    mov mov ebx, dword ptr [esi + 20]
    mov mov ecx, ebx
    imul imul ecx, eax
    mov mov al, byte ptr [esi]
    and and al, 1
    mov mov byte ptr [esp + 15], al
    mov mov eax, esi
    mov mov dword ptr [esp + 16], ebx
    mov mov dword ptr [esp + 24], ecx
    call sub_10010C18
    mov mov al, byte ptr [esp + 15]
    test test al, al
    je L7
    mov mov eax, dword ptr [esp + 28]
    imul imul eax, dword ptr [esp + 32]
    cdq cdq
    and and edx, 3
    add add eax, edx
    sar sar eax, 2
    push push eax
    mov mov eax, dword ptr [esp + 104]
    mov mov ebx, esi
    call L1
    mov mov ebx, dword ptr [esp + 20]
    add add esp, 4
    mov mov eax, dword ptr [esp + 28]
    test test eax, eax
    jle sub_100113A9
    mov mov ecx, dword ptr [esp + 32]
    dec dec eax
    shr shr eax, 1
    inc inc eax
    mov mov dword ptr [esp + 44], eax
    lea lea ecx, [ecx]
    test test ecx, ecx
    jle sub_1001135A
    lea lea eax, [ecx - 1]
    shr shr eax, 1
    inc inc eax
    mov mov dword ptr [esp + 40], eax
    cmp cmp dword ptr [esi + 16], 1
    je L15
    xor xor edi, edi
    mov mov di, word ptr [esi]
    mov mov dx, word ptr [esi + 2]
    xor xor ebx, ebx
    push push 0FFh
    push push 9
    push push 010182988h
    mov mov eax, edi
    and and eax, 1
    mov mov dword ptr [esp + 32], eax
    mov mov eax, dword ptr [esi + 4]
    shr shr di, 1
    mov mov word ptr [esi], di
    mov mov bh, byte ptr [eax + 3]
    movzx movzx ecx, byte ptr [eax + 1]
    mov mov bl, byte ptr [eax + 2]
    shl shl ebx, 8
    or or ebx, ecx
    movzx movzx ecx, byte ptr [eax]
    shl shl ebx, 8
    or or ebx, ecx
    mov mov cl, dl
    shr shr ebx, cl
    lea lea ecx, [edx + 1]
    movzx movzx edx, cx
    shr shr edx, 3
    shl shl ebx, 15
    add add edx, eax
    and and ecx, 7
    or or ebx, edi
    mov mov eax, esi
    mov mov word ptr [esi], bx
    mov mov dword ptr [esi + 4], edx
    mov mov word ptr [esi + 2], cx
    call L0
    push push 0FFh
    mov mov ebx, eax
    push push 9
    push push 010182988h
    mov mov eax, esi
    mov mov dword ptr [esp + 72], ebx
    call L2
    push push 0FFh
    mov mov edi, eax
    push push 9
    push push 010182988h
    mov mov eax, esi
    mov mov dword ptr [esp + 88], edi
    call L3
    mov mov ecx, dword ptr [esp + 088h]
    movzx movzx ecx, byte ptr [ecx]
    shl shl ecx, 1
    lea lea edx, [ecx + eax]
    add add edx, edi
    add add edx, ebx
    sar sar edx, 1
    add add dl, byte ptr [esp + 56]
    mov mov dword ptr [esp + 92], eax
    mov mov byte ptr [ebp], dl
    mov mov edx, ecx
    sub sub edx, eax
    mov mov eax, dword ptr [esp + 52]
    mov mov dword ptr [esp + 72], edx
    sub sub edx, edi
    add add edx, ebx
    sar sar edx, 1
    mov mov byte ptr [eax + ebp], dl
    mov mov edx, dword ptr [esp + 72]
    mov mov eax, dword ptr [esp + 60]
    sub sub edx, ebx
    add add edx, edi
    sar sar edx, 1
    mov mov byte ptr [eax + ebp], dl
    mov mov edx, dword ptr [esp + 52]
    sub sub ecx, edi
    mov mov edi, dword ptr [esp + 92]
    add add eax, edx
    sub sub ecx, ebx
    add add esp, 36
    mov mov dword ptr [esp + 36], eax
    add add ecx, edi
    sar sar ecx, 1
    mov mov byte ptr [eax + ebp], cl
    cmp cmp dword ptr [esi + 16], 3
    jl sub_10011305
    xor xor edi, edi
    mov mov di, word ptr [esi]
    xor xor edx, edx
    push push 01FEh
    push push 10
    push push 010186988h
    mov mov eax, edi
    and and eax, 1
    mov mov dword ptr [esp + 32], eax
    mov mov eax, dword ptr [esi + 4]
    shr shr di, 1
    mov mov word ptr [esi], di
    mov mov dh, byte ptr [eax + 3]
    movzx movzx ecx, byte ptr [eax + 1]
    mov mov dl, byte ptr [eax + 2]
    shl shl edx, 8
    or or edx, ecx
    movzx movzx ecx, byte ptr [eax]
    shl shl edx, 8
    or or edx, ecx
    mov mov cl, byte ptr [esi + 2]
L10:
    shr shr edx, cl
    xor xor ecx, ecx
    mov mov cx, word ptr [esi + 2]
    shl shl edx, 15
    or or edx, edi
    mov mov word ptr [esi], dx
    inc inc ecx
    movzx movzx edx, cx
    shr shr edx, 3
    add add edx, eax
    and and ecx, 7
    mov mov eax, esi
    mov mov dword ptr [esi + 4], edx
    mov mov word ptr [esi + 2], cx
    call L5
    push push 01FEh
    mov mov edi, eax
    push push 10
    push push 010186988h
    mov mov eax, esi
    add add edi, ebx
    call L6
    mov mov ebx, eax
    mov mov eax, dword ptr [esp + 76]
    push push 01FEh
    add add ebx, eax
    push push 10
    push push 010186988h
    mov mov eax, esi
    call L8
    add add eax, dword ptr [esp + 92]
    mov mov ecx, dword ptr [esp + 088h]
    movzx movzx ecx, byte ptr [ecx + 1]
    shl shl ecx, 1
    lea lea edx, [eax + ebx]
    add add edx, edi
    add add edx, ecx
    sar sar edx, 1
    add add dl, byte ptr [esp + 56]
    mov mov dword ptr [esp + 64], ecx
    mov mov byte ptr [ebp + 1], dl
    mov mov edx, edi
    sub sub edx, eax
    sub sub edx, ebx
    add add edx, ecx
    mov mov ecx, dword ptr [esp + 52]
    sar sar edx, 1
    mov mov byte ptr [ecx + ebp + 1], dl
    mov mov ecx, dword ptr [esp + 64]
    mov mov edx, ebx
    sub sub edx, eax
    sub sub edx, edi
    add add edx, ecx
    mov mov ecx, dword ptr [esp + 60]
    sar sar edx, 1
    sub sub eax, ebx
    mov mov byte ptr [ecx + ebp + 1], dl
    mov mov edx, dword ptr [esp + 64]
    sub sub eax, edi
    add add eax, edx
    mov mov edx, dword ptr [esp + 72]
    sar sar eax, 1
    mov mov byte ptr [edx + ebp + 1], al
    xor xor edi, edi
    mov mov di, word ptr [esi]
    mov mov dx, word ptr [esi + 2]
    xor xor ebx, ebx
    push push 01FEh
    push push 10
    push push 010186988h
    mov mov eax, edi
    and and eax, 1
    mov mov dword ptr [esp + 68], eax
    mov mov eax, dword ptr [esi + 4]
    shr shr di, 1
    mov mov word ptr [esi], di
    mov mov bh, byte ptr [eax + 3]
    movzx movzx ecx, byte ptr [eax + 1]
    mov mov bl, byte ptr [eax + 2]
    shl shl ebx, 8
    or or ebx, ecx
    movzx movzx ecx, byte ptr [eax]
    shl shl ebx, 8
    or or ebx, ecx
    mov mov cl, dl
L12:
    shr shr ebx, cl
    lea lea ecx, [edx + 1]
    movzx movzx edx, cx
    shr shr edx, 3
    shl shl ebx, 15
    add add edx, eax
    and and ecx, 7
    or or ebx, edi
L13:
    mov mov eax, esi
    mov mov word ptr [esi], bx
    mov mov dword ptr [esi + 4], edx
    mov mov word ptr [esi + 2], cx
    call L9
    mov mov ecx, dword ptr [esp + 96]
    push push 01FEh
    mov mov edi, eax
    push push 10
    push push 010186988h
    mov mov eax, esi
    add add edi, ecx
    call L10
    mov mov ebx, eax
    mov mov eax, dword ptr [esp + 112]
    push push 01FEh
    add add ebx, eax
    push push 10
    push push 010186988h
    mov mov eax, esi
    call L11
    add add eax, dword ptr [esp + 080h]
    mov mov ecx, dword ptr [esp + 0ACh]
    movzx movzx ecx, byte ptr [ecx + 2]
    shl shl ecx, 1
    lea lea edx, [eax + ebx]
    add add edx, edi
    add add edx, ecx
    sar sar edx, 1
    add add dl, byte ptr [esp + 92]
    mov mov dword ptr [esp + 100], ecx
    mov mov byte ptr [ebp + 2], dl
    mov mov edx, edi
    sub sub edx, eax
    sub sub edx, ebx
    add add edx, ecx
    mov mov ecx, dword ptr [esp + 88]
    sar sar edx, 1
    mov mov byte ptr [ecx + ebp + 2], dl
    mov mov ecx, dword ptr [esp + 100]
    mov mov edx, ebx
    sub sub edx, eax
    sub sub edx, edi
    add add edx, ecx
    add add esp, 72
    sar sar edx, 1
    mov mov ecx, dword ptr [esp + 24]
    sub sub eax, ebx
    mov mov byte ptr [ecx + ebp + 2], dl
    mov mov edx, dword ptr [esp + 28]
    sub sub eax, edi
    add add eax, edx
    mov mov edx, dword ptr [esp + 36]
    sar sar eax, 1
    mov mov byte ptr [edx + ebp + 2], al
    mov mov ebx, dword ptr [esp + 16]
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, 3
    cmp cmp ecx, eax
    je sub_10011640
    xor xor edi, edi
    mov mov di, word ptr [esi]
    xor xor edx, edx
    push push 0FFh
    push push 9
    push push 01018A988h
    mov mov eax, edi
    and and eax, 1
    mov mov dword ptr [esp + 32], eax
    mov mov eax, dword ptr [esi + 4]
    shr shr di, 1
    mov mov word ptr [esi], di
    mov mov dh, byte ptr [eax + 3]
    movzx movzx ecx, byte ptr [eax + 1]
    mov mov dl, byte ptr [eax + 2]
    shl shl edx, 8
    or or edx, ecx
    movzx movzx ecx, byte ptr [eax]
    shl shl edx, 8
    or or edx, ecx
    mov mov cl, byte ptr [esi + 2]
    shr shr edx, cl
    xor xor ecx, ecx
    mov mov cx, word ptr [esi + 2]
    shl shl edx, 15
    or or edx, edi
    mov mov word ptr [esi], dx
    inc inc ecx
    movzx movzx edx, cx
    shr shr edx, 3
    add add edx, eax
    and and ecx, 7
    mov mov eax, esi
    mov mov dword ptr [esi + 4], edx
    mov mov word ptr [esi + 2], cx
    call L12
    push push 0FFh
    mov mov edi, eax
    push push 9
    push push 01018A988h
    mov mov eax, esi
    call L13
    push push 0FFh
    mov mov dword ptr [esp + 116], eax
    push push 9
    push push 01018A988h
    mov mov eax, esi
    call L14
    mov mov ecx, dword ptr [esp + 088h]
    movzx movzx ecx, byte ptr [ebx + ecx - 1]
    mov mov edx, dword ptr [esp + 124]
    mov mov dword ptr [esp + 080h], eax
    add add eax, edx
    mov mov dl, byte ptr [esp + 56]
    add add eax, edi
    shl shl ecx, 1
    add add eax, ecx
    sar sar eax, 1
    add add al, dl
    mov mov byte ptr [ebx + ebp - 1], al
    mov mov eax, dword ptr [esp + 080h]
    mov mov edx, edi
    sub sub edx, eax
    mov mov eax, dword ptr [esp + 124]
    sub sub edx, eax
    add add edx, ecx
    sar sar edx, 1
    mov mov byte ptr [ebp + ebx*2 - 1], dl
    sub sub eax, dword ptr [esp + 080h]
    mov mov edx, dword ptr [esp + 60]
    sub sub eax, edi
    add add eax, ecx
    sar sar eax, 1
    lea lea edx, [ebx + edx - 1]
    mov mov byte ptr [edx + ebp], al
    mov mov eax, dword ptr [esp + 080h]
    sub sub eax, dword ptr [esp + 124]
    add add esp, 36
    sub sub eax, edi
    add add eax, ecx
    mov mov ecx, dword ptr [esp + 24]
    sar sar eax, 1
    lea lea edx, [ecx + ebx*2 - 1]
    mov mov byte ptr [edx + ebp], al
    jmp sub_10011775
    cmp cmp dword ptr [esi + 20], eax
    je sub_1001177A
    mov mov eax, dword ptr [esp + 24]
    mov mov byte ptr [ebx + ebp - 1], 0FFh
    mov mov byte ptr [ebp + ebx*2 - 1], 0FFh
    lea lea ecx, [ebx + eax - 1]
    lea lea edx, [eax + ebx*2 - 1]
    mov mov byte ptr [ecx + ebp], 0FFh
    mov mov byte ptr [edx + ebp], 0FFh
    mov mov edx, dword ptr [esp + 100]
    lea lea eax, [ebx + ebx]
    add add ebp, eax
    mov mov eax, dword ptr [esp + 40]
    add add edx, ebx
    dec dec eax
    mov mov dword ptr [esp + 100], edx
    mov mov dword ptr [esp + 40], eax
    jne sub_1001135C
    mov mov ecx, dword ptr [esp + 32]
    mov mov eax, dword ptr [esp + 44]
    add add ebp, dword ptr [esp + 24]
    dec dec eax
    mov mov dword ptr [esp + 44], eax
    jne sub_10011361
    pop pop edi
    pop pop ebp
    pop pop ebx
    add add esp, 84
    ret ret
    cmp cmp eax, edi
    jge sub_1001181E
    mov mov dword ptr [esp + 32], edi
    mov mov eax, edi
    cmp cmp edx, edi
    jge sub_10011832
    mov mov dword ptr [esp + 28], edi
    mov mov edx, edi
    lea lea ecx, [edx + eax - 1]
    mov mov edx, dword ptr [esi + 16]
    xor xor eax, eax
    test test edx, edx
    jle sub_10011871
    lea lea esp, [esp]
    mov mov edx, dword ptr [esi + 4]
    mov mov dl, byte ptr [edx]
    mov mov byte ptr [ebp], dl
    mov mov ebx, dword ptr [esi + 4]
    inc inc ebp
L17:
    inc inc ebx
    mov mov dword ptr [esi + 4], ebx
    mov mov edx, dword ptr [esi + 16]
    inc inc eax
    cmp cmp eax, edx
    jl sub_10011878
    mov mov eax, dword ptr [esi + 20]
    cmp cmp eax, dword ptr [esi + 16]
    je sub_100118A5
    mov mov byte ptr [ebp], 0FFh
    inc inc ebp
    dec dec ecx
    jne sub_10011878
    pop pop edi
    pop pop ebp
    pop pop ebx
    add add esp, 84
    ret ret
FUN_10010d40 ENDP
END
