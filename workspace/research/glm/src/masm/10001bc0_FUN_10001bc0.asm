.686
.MODEL FLAT, C
EXTRN sub_10001A34:PROC
EXTRN sub_10061EDB:PROC
EXTRN g_101CE6C4:DWORD
EXTRN g_101D4C84:DWORD
.CODE
FUN_10001bc0 PROC
    sub esp, 000000F40h
    push ebx
    push ebp
    push esi
    lea eax, [esp + 72]
    push eax
    push ecx
    call sub_10001A34
    xor edx, edx
    mov dword ptr [esp + 48], edx
    mov dword ptr [esp + 52], edx
    mov dword ptr [esp + 56], edx
    mov dword ptr [esp + 60], edx
    mov dword ptr [esp + 64], edx
    mov ebx, eax
    mov eax, dword ptr [g_101CE6C4]
    mov cl, byte ptr [eax + 8]
    mov dword ptr [esp + 68], edx
    mov dword ptr [esp + 72], edx
    xor esi, esi
    add esp, 8
    test cl, cl
    mov word ptr [esp + 68], dx
    mov dword ptr [esp + 20], ebx
    mov byte ptr [esp + 70], dl
    mov dword ptr [esp + 36], esi
    je L0
    mov eax, dword ptr [g_101D4C84]
    cdq
    and edx, 0000003FFh
    add eax, edx
    sar eax, 10
    jmp L1
L0:
    mov eax, 1
L1:
    xor ebp, ebp
    test ebx, ebx
    mov dword ptr [esp + 28], eax
    mov dword ptr [esp + 24], eax
    mov dword ptr [esp + 12], ebp
    jle L22
    push edi
    mov edx, eax
    mov ecx, eax
    lea esp, [esp]
L2:
    mov esi, ecx
    imul esi, edx
    mov eax, ebx
    sub eax, ebp
    cmp esi, eax
    jle L6
    lea ecx, [ecx]
L3:
    cmp edx, ecx
    jl L4
    sar edx, 1
    jmp L5
L4:
    sar ecx, 1
L5:
    mov esi, ecx
    imul esi, edx
    cmp esi, eax
    jg L3
    mov dword ptr [esp + 28], ecx
    mov dword ptr [esp + 32], edx
L6:
    imul ecx, edx
    cmp ecx, 2
    mov dword ptr [esp + 20], ecx
    jl L18
    lea ecx, [esp + 44]
    xor edi, edi
    mov edx, 31
    dec ecx
    mov eax, edx
    mov esi, 1
    mov dword ptr [esp + 36], ecx
    jmp L8
L7:
    mov ecx, dword ptr [esp + 36]
L8:
    cmp byte ptr [ecx + esi], 0
    jne L12
    cmp esi, ebx
    mov ecx, esi
    jge L12
L9:
    cmp byte ptr [esp + ecx + 44], 0
    jne L11
    cmp edx, 31
    je L10
    mov ebx, edx
    imul ebx, ebx, 31
    lea ebp, [edi + ecx]
    mov ebp, dword ptr [esp + ebp*4 + 76]
    add ebx, eax
    cmp ebp, dword ptr [esp + ebx*4 + 76]
    mov ebx, dword ptr [esp + 24]
    jle L11
L10:
    lea edx, [esi - 1]
    mov eax, ecx
L11:
    inc ecx
    cmp ecx, ebx
    jl L9
    mov ebp, dword ptr [esp + 16]
L12:
    inc esi
    lea ecx, [esi - 1]
    add edi, 31
    cmp ecx, ebx
    jl L7
    mov ecx, dword ptr [esp + 000000F58h]
    mov dword ptr [ecx + ebp*4], eax
    inc ebp
    mov dword ptr [ecx + ebp*4], edx
    mov ecx, dword ptr [esp + 20]
    inc ebp
    cmp ecx, 2
    mov byte ptr [esp + eax + 44], 1
    mov dword ptr [esp + 16], ebp
    mov byte ptr [esp + edx + 44], 1
    jle L21
    mov ebx, edx
    imul ebx, ebx, 124
    lea ecx, [esp + edx*4 + 76]
    mov edx, dword ptr [esp + 20]
    add edx, -2
    mov dword ptr [esp + 36], ecx
    lea ebp, [esp + ebx + 76]
    mov dword ptr [esp + 20], edx
    jmp L13
    lea esp, [esp]
L13:
    mov edx, dword ptr [esp + 36]
    imul eax, eax, 124
    mov edi, dword ptr [esp + 24]
    mov ecx, ebp
    lea eax, [esp + eax + 76]
L14:
    mov esi, dword ptr [eax]
    add dword ptr [ecx], esi
    mov esi, dword ptr [ecx]
    mov dword ptr [edx], esi
    add eax, 4
    add ecx, 4
    add edx, 124
    dec edi
    jne L14
    mov eax, 31
    xor ecx, ecx
    mov edx, ebp
    mov edi, edi
L15:
    cmp byte ptr [esp + ecx + 44], 0
    jne L17
    cmp eax, 31
    je L16
    mov edi, dword ptr [edx]
    lea esi, [ebx + eax*4]
    cmp edi, dword ptr [esp + esi + 76]
    jle L17
L16:
    mov eax, ecx
L17:
    mov esi, dword ptr [esp + 24]
    inc ecx
    add edx, 4
    cmp ecx, esi
    jl L15
    mov ecx, dword ptr [esp + 16]
    mov edx, dword ptr [esp + 000000F58h]
    mov dword ptr [edx + ecx*4], eax
    inc ecx
    mov dword ptr [esp + 16], ecx
    mov ecx, dword ptr [esp + 20]
    dec ecx
    mov byte ptr [esp + eax + 44], 1
    mov dword ptr [esp + 20], ecx
    jne L13
    mov ebx, esi
    jmp L21
L18:
    xor eax, eax
    mov edi, edi
L19:
    mov cl, byte ptr [esp + eax + 44]
    test cl, cl
    je L20
    inc eax
    cmp eax, ebx
    jl L19
    jmp L21
L20:
    mov ecx, dword ptr [esp + 000000F58h]
    mov dword ptr [ecx + ebp*4], eax
    inc ebp
    mov dword ptr [esp + 16], ebp
    mov byte ptr [esp + eax + 44], 1
L21:
    mov esi, dword ptr [esp + 40]
    mov eax, dword ptr [esp + 000000F54h]
    mov edx, dword ptr [esp + 32]
    mov ecx, dword ptr [esp + 28]
    mov ebp, dword ptr [esp + 16]
    mov dword ptr [eax + esi*8], edx
    mov dword ptr [eax + esi*8 + 4], ecx
    inc esi
    cmp ebp, ebx
    mov dword ptr [esp + 40], esi
    jl L2
    pop edi
L22:
    push ebx
    push esi
    push 010191A50h
    call sub_10061EDB
    add esp, 12
    pop esi
    pop ebp
    mov eax, ebx
    pop ebx
FUN_10001bc0 ENDP
END
