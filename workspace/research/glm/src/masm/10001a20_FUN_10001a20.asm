.686
.MODEL FLAT, C
EXTRN sub_10001968:PROC
EXTRN sub_1000198B:PROC
EXTRN sub_1001394B:PROC
EXTRN g_101AE288:DWORD
.CODE
FUN_10001a20 PROC
    sub esp, 000000090h
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 00000009Ch]
    push esi
    mov esi, dword ptr [ebp]
    push edi
    mov ebx, 16
    mov edx, 7
    mov eax, ebp
    add esi, 64
    call sub_10001968
    mov edx, dword ptr [ebp + 4]
    mov esi, dword ptr [esi + 4]
    mov edi, eax
    add esi, edx
    mov ebx, 000400000h
    mov edx, 1
    mov eax, ebp
    mov dword ptr [esp + 28], edi
    mov dword ptr [esp + 32], esi
    call sub_1000198B
    xor ebp, ebp
    test edi, edi
    mov dword ptr [esp + 24], ebp
    jle L2
    lea edx, [esi + 2]
L0:
    movsx ecx, word ptr [edx]
    cmp ecx, 31
    je L1
    cmp ebp, ecx
    jg L1
    lea ebp, [ecx + 1]
L1:
    add edx, 16
    dec edi
    jne L0
    mov dword ptr [esp + 24], ebp
L2:
    test eax, eax
    je L3
    cmp eax, ebp
    je L3
    mov eax, dword ptr [g_101AE288]
    push eax
    push 010191A80h
    push 1
    call sub_1001394B
    add esp, 12
L3:
    xor eax, eax
    mov ecx, 31
    lea edi, [esp + 36]
    rep stosd dword ptr es:[edi], eax
    mov edi, dword ptr [esp + 0000000A8h]
    mov ecx, 0000003C1h
    rep stosd dword ptr es:[edi], eax
    mov ecx, dword ptr [esp + 0000000A4h]
    mov eax, dword ptr [ecx + 16]
    xor edi, edi
    test eax, eax
    mov dword ptr [esp + 16], edi
    jle L15
L4:
    mov ecx, dword ptr [esp + 28]
    test ecx, ecx
    jle L7
    lea eax, [esi + 8]
    mov edx, ecx
    mov edi, edi
L5:
    movsx ecx, word ptr [eax - 8]
    cmp ecx, edi
    jne L6
    movsx ecx, word ptr [eax - 6]
    cmp ecx, 31
    je L6
    movsx ebx, word ptr [eax]
    add dword ptr [esp + ecx*4 + 36], ebx
    lea ecx, [esp + ecx*4 + 36]
L6:
    add eax, 16
    dec edx
    jne L5
L7:
    xor eax, eax
    test ebp, ebp
    mov dword ptr [esp + 20], eax
    jle L14
    xor edi, edi
    mov edi, edi
L8:
    mov ebx, dword ptr [esp + eax*4 + 36]
    test ebx, ebx
    je L13
    lea ecx, [eax + 1]
    cmp ecx, ebp
    jge L12
    mov esi, dword ptr [esp + 0000000A8h]
    lea edx, [edi + eax]
    lea esi, [esi + edx*4 + 124]
    lea ecx, [ecx]
L9:
    mov edx, dword ptr [esp + ecx*4 + 36]
    test edx, edx
    je L11
    mov ebp, dword ptr [esp + 0000000A8h]
    lea eax, [edi + ecx]
    lea eax, [ebp + eax*4]
    mov ebp, dword ptr [eax]
    add edx, ebx
    add ebp, edx
    mov dword ptr [eax], ebp
    jns L10
    mov dword ptr [eax], 07FFFFFFFh
L10:
    mov edx, dword ptr [eax]
    mov ebp, dword ptr [esp + 24]
    mov eax, dword ptr [esp + 20]
    mov dword ptr [esi], edx
L11:
    inc ecx
    add esi, 124
    cmp ecx, ebp
    jl L9
    mov esi, dword ptr [esp + 32]
L12:
    mov dword ptr [esp + eax*4 + 36], 0
L13:
    inc eax
    add edi, 31
    cmp eax, ebp
    mov dword ptr [esp + 20], eax
    jl L8
    mov edi, dword ptr [esp + 16]
L14:
    mov eax, dword ptr [esp + 0000000A4h]
    mov ecx, dword ptr [eax + 16]
    inc edi
    cmp edi, ecx
    mov dword ptr [esp + 16], edi
    jl L4
L15:
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    add esp, 000000090h
    ret
FUN_10001a20 ENDP
END
