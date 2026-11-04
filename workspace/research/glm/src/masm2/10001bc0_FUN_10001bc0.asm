.686
.MODEL FLAT, C
EXTRN sub_10001A34:PROC
EXTRN sub_10001E87:PROC
EXTRN sub_10001E93:PROC
EXTRN sub_10001E9E:PROC
EXTRN sub_10001EB9:PROC
EXTRN sub_10001EF6:PROC
EXTRN sub_10001F38:PROC
EXTRN sub_10001F3E:PROC
EXTRN sub_10001F40:PROC
EXTRN sub_10001F43:PROC
EXTRN sub_10001F45:PROC
EXTRN sub_10001F50:PROC
EXTRN sub_10001FCD:PROC
EXTRN sub_10001FD7:PROC
EXTRN sub_10001FDF:PROC
EXTRN sub_10001FF2:PROC
EXTRN sub_10061EDB:PROC
EXTRN EXTRN g_101CE6C4:DWORD:DWORD
EXTRN EXTRN g_101D4C84:DWORD:DWORD
.CODE
FUN_10001bc0 PROC
    sub sub esp, 0F40h
    push push ebx
    push push ebp
    push push esi
    lea lea eax, [esp + 72]
    push push eax
    push push ecx
    call sub_10001A34
    xor xor edx, edx
    mov mov dword ptr [esp + 48], edx
    mov mov dword ptr [esp + 52], edx
    mov mov dword ptr [esp + 56], edx
    mov mov dword ptr [esp + 60], edx
    mov mov dword ptr [esp + 64], edx
    mov mov ebx, eax
    mov mov eax, dword ptr [g_101CE6C4]
    mov mov cl, byte ptr [eax + 8]
    mov mov dword ptr [esp + 68], edx
    mov mov dword ptr [esp + 72], edx
    xor xor esi, esi
    add add esp, 8
    test test cl, cl
    mov mov word ptr [esp + 68], dx
    mov mov dword ptr [esp + 20], ebx
    mov mov byte ptr [esp + 70], dl
    mov mov dword ptr [esp + 36], esi
    je L0
    mov mov eax, dword ptr [g_101D4C84]
    cdq cdq
    and and edx, 03FFh
    add add eax, edx
    sar sar eax, 10
    jmp L1
    mov mov eax, 1
    xor xor ebp, ebp
    test test ebx, ebx
    mov mov dword ptr [esp + 28], eax
    mov mov dword ptr [esp + 24], eax
    mov mov dword ptr [esp + 12], ebp
    jle sub_10001E93
    push push edi
    mov mov edx, eax
    mov mov ecx, eax
    lea lea esp, [esp]
    mov mov esi, ecx
    imul imul esi, edx
    mov mov eax, ebx
    sub sub eax, ebp
    cmp cmp esi, eax
    jle L5
    lea lea ecx, [ecx]
    cmp cmp edx, ecx
    jl L2
    sar sar edx, 1
    jmp L3
    sar sar ecx, 1
    mov mov esi, ecx
    imul imul esi, edx
    cmp cmp esi, eax
    jg L4
    mov mov dword ptr [esp + 28], ecx
    mov mov dword ptr [esp + 32], edx
    imul imul ecx, edx
    cmp cmp ecx, 2
    mov mov dword ptr [esp + 20], ecx
    jl sub_10001E87
    lea lea ecx, [esp + 44]
    xor xor edi, edi
    mov mov edx, 31
    dec dec ecx
L1:
    mov mov eax, edx
    mov mov esi, 1
    mov mov dword ptr [esp + 36], ecx
    jmp L6
    mov mov ecx, dword ptr [esp + 36]
    cmp cmp byte ptr [ecx + esi], 0
    jne L7
    cmp cmp esi, ebx
    mov mov ecx, esi
    jge L11
    cmp cmp byte ptr [esp + ecx + 44], 0
    jne L10
    cmp cmp edx, 31
    je L10
    mov mov ebx, edx
    imul imul ebx, ebx, 31
    lea lea ebp, [edi + ecx]
    mov mov ebp, dword ptr [esp + ebp*4 + 76]
    add add ebx, eax
    cmp cmp ebp, dword ptr [esp + ebx*4 + 76]
    mov mov ebx, dword ptr [esp + 24]
    jle L12
    lea lea edx, [esi - 1]
    mov mov eax, ecx
    inc inc ecx
    cmp cmp ecx, ebx
    jl L9
    mov mov ebp, dword ptr [esp + 16]
    inc inc esi
    lea lea ecx, [esi - 1]
    add add edi, 31
    cmp cmp ecx, ebx
    jl L8
    mov mov ecx, dword ptr [esp + 0F58h]
    mov mov dword ptr [ecx + ebp*4], eax
    inc inc ebp
    mov mov dword ptr [ecx + ebp*4], edx
    mov mov ecx, dword ptr [esp + 20]
    inc inc ebp
    cmp cmp ecx, 2
    mov mov byte ptr [esp + eax + 44], 1
L2:
    mov mov dword ptr [esp + 16], ebp
    mov mov byte ptr [esp + edx + 44], 1
    jle sub_10001F3E
    mov mov ebx, edx
    imul imul ebx, ebx, 124
    lea lea ecx, [esp + edx*4 + 76]
    mov mov edx, dword ptr [esp + 20]
    add add edx, -2
    mov mov dword ptr [esp + 36], ecx
    lea lea ebp, [esp + ebx + 76]
    mov mov dword ptr [esp + 20], edx
    jmp sub_10001EB9
    lea lea esp, [esp]
    mov mov edx, dword ptr [esp + 36]
    imul imul eax, eax, 124
    mov mov edi, dword ptr [esp + 24]
    mov mov ecx, ebp
    lea lea eax, [esp + eax + 76]
    mov mov esi, dword ptr [eax]
    add add dword ptr [ecx], esi
    mov mov esi, dword ptr [ecx]
    mov mov dword ptr [edx], esi
    add add eax, 4
    add add ecx, 4
    add add edx, 124
    dec dec edi
    jne sub_10001EF6
    mov mov eax, 31
    xor xor ecx, ecx
    mov mov edx, ebp
    mov mov edi, edi
    cmp cmp byte ptr [esp + ecx + 44], 0
    jne sub_10001F40
    cmp cmp eax, 31
    je sub_10001F43
    mov mov edi, dword ptr [edx]
    lea lea esi, [ebx + eax*4]
    cmp cmp edi, dword ptr [esp + esi + 76]
    jle sub_10001F50
    mov mov eax, ecx
    mov mov esi, dword ptr [esp + 24]
    inc inc ecx
    add add edx, 4
    cmp cmp ecx, esi
    jl sub_10001F45
    mov mov ecx, dword ptr [esp + 16]
    mov mov edx, dword ptr [esp + 0F58h]
    mov mov dword ptr [edx + ecx*4], eax
    inc inc ecx
    mov mov dword ptr [esp + 16], ecx
    mov mov ecx, dword ptr [esp + 20]
    dec dec ecx
    mov mov byte ptr [esp + eax + 44], 1
    mov mov dword ptr [esp + 20], ecx
    jne sub_10001F38
    mov mov ebx, esi
    jmp sub_10001FDF
    xor xor eax, eax
    mov mov edi, edi
    mov mov cl, byte ptr [esp + eax + 44]
    test test cl, cl
    je sub_10001FD7
    inc inc eax
    cmp cmp eax, ebx
    jl sub_10001FCD
    jmp sub_10001FF2
    mov mov ecx, dword ptr [esp + 0F58h]
L9:
    mov mov dword ptr [ecx + ebp*4], eax
    inc inc ebp
L11:
    mov mov dword ptr [esp + 16], ebp
    mov mov byte ptr [esp + eax + 44], 1
    mov mov esi, dword ptr [esp + 40]
    mov mov eax, dword ptr [esp + 0F54h]
    mov mov edx, dword ptr [esp + 32]
    mov mov ecx, dword ptr [esp + 28]
    mov mov ebp, dword ptr [esp + 16]
    mov mov dword ptr [eax + esi*8], edx
    mov mov dword ptr [eax + esi*8 + 4], ecx
    inc inc esi
    cmp cmp ebp, ebx
    mov mov dword ptr [esp + 40], esi
    jl sub_10001E9E
    pop pop edi
    push push ebx
    push push esi
    push push 010191A50h
    call sub_10061EDB
    add add esp, 12
    pop pop esi
    pop pop ebp
    mov mov eax, ebx
    pop pop ebx
FUN_10001bc0 ENDP
END
