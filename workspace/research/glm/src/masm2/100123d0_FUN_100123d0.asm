.686
.MODEL FLAT, C
EXTRN sub_10012712:PROC
EXTRN sub_100127E5:PROC
EXTRN sub_100127E6:PROC
EXTRN sub_1001280B:PROC
EXTRN sub_1001281E:PROC
EXTRN sub_100128EE:PROC
EXTRN sub_100128F2:PROC
EXTRN sub_1001290C:PROC
EXTRN sub_100139F8:PROC
EXTRN sub_10060DFB:PROC
EXTRN sub_100F6116:PROC
EXTRN sub_100F619F:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4A1C:DWORD:DWORD
EXTRN EXTRN fp_101D4A3C:DWORD:DWORD
EXTRN EXTRN g_101CE688:DWORD:DWORD
EXTRN EXTRN g_101CE7FC:DWORD:DWORD
EXTRN EXTRN g_101D1BF4:DWORD:DWORD
EXTRN EXTRN g_101D1C04:DWORD:DWORD
.CODE
FUN_100123d0 PROC
    sub sub esp, 0C0Ch
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, eax
    mov mov eax, dword ptr [g_101D1BF4]
    mov mov ecx, dword ptr [eax]
    push push 22
    push push edi
    push push eax
    call call dword ptr [ecx + 24]
    mov mov ebx, eax
    xor xor ebp, ebp
    xor xor eax, eax
    xor xor esi, esi
    cmp cmp ebx, ebp
    mov mov dword ptr [g_101D1C04], eax
    jbe L1
    jmp L0
    lea lea ecx, [ecx]
    cmp cmp eax, 0100h
    jae L3
    mov mov ecx, dword ptr [g_101D1BF4]
    mov mov edx, dword ptr [ecx]
    shl shl eax, 4
    add add eax, 0101D1C08h
    push push eax
    push push esi
    push push 22
    push push edi
    push push ecx
    call call dword ptr [edx + 28]
    test test eax, eax
    mov mov eax, dword ptr [g_101D1C04]
    jl L4
    mov mov ecx, eax
    shl shl ecx, 4
    mov mov edx, dword ptr [ecx + 0101D1C10h]
    cmp cmp edx, ebp
    lea lea ecx, [ecx + 0101D1C10h]
    jne L5
    mov mov dword ptr [ecx], 60
    mov mov eax, dword ptr [g_101D1C04]
    inc inc eax
    mov mov dword ptr [g_101D1C04], eax
    inc inc esi
    cmp cmp esi, ebx
    jb L2
    shl shl eax, 4
    add add eax, 0101D1C08h
    mov mov edx, eax
    sub sub edx, 0101D1C08h
    push push 010012320h
    sar sar edx, 4
    push push edx
    push push eax
    push push 0101D1C08h
    call sub_100139F8
    mov mov eax, dword ptr [g_101D1C04]
    add add esp, 16
    test test eax, eax
    mov mov dword ptr [esp + 20], ebp
    mov mov dword ptr [esp + 24], ebp
    jbe L11
    lea lea edx, [esp + 28]
    sub sub edx, 4
    lea lea edi, [esp + 0420h]
    mov mov ebx, 0101D1C08h
    mov mov dword ptr [esp + 24], edx
    sub sub edi, 8
    mov mov dword ptr [esp + 16], eax
    mov mov edi, edi
    mov mov esi, dword ptr [esp + 20]
    test test esi, esi
    mov mov eax, dword ptr [ebx + 4]
    mov mov ecx, dword ptr [ebx]
    jle L6
    cmp cmp dword ptr [edi - 4], ecx
    jne L7
    cmp cmp dword ptr [edi], eax
    je L8
    cmp cmp ecx, 0280h
    jl L9
    cmp cmp eax, 01E0h
    jl L10
    mov mov dword ptr [edi + 4], ecx
    mov mov ecx, dword ptr [esp + 20]
    inc inc ecx
    mov mov dword ptr [edi + 8], eax
    mov mov dword ptr [esp + 20], ecx
    add add edi, 8
    mov mov esi, dword ptr [ebx + 8]
    xor xor eax, eax
    test test ebp, ebp
    jle L13
    cmp cmp dword ptr [esp + eax*4 + 28], esi
    je L16
    inc inc eax
    cmp cmp eax, ebp
    jl L13
    test test ebp, ebp
    mov mov ecx, ebp
    jle L15
    mov mov eax, edx
    mov mov edx, dword ptr [eax]
    cmp cmp edx, esi
    jle L17
    mov mov dword ptr [eax + 4], edx
    dec dec ecx
    sub sub eax, 4
    test test ecx, ecx
    jg L14
    mov mov edx, dword ptr [esp + 24]
    inc inc ebp
    add add edx, 4
    mov mov dword ptr [esp + ecx*4 + 28], esi
    mov mov dword ptr [esp + 24], edx
    mov mov eax, dword ptr [esp + 16]
    add add ebx, 16
    dec dec eax
    mov mov dword ptr [esp + 16], eax
    jne L12
    mov mov dword ptr [esp + 24], ebp
    mov mov eax, dword ptr [esp + 20]
    test test eax, eax
    mov mov esi, 0101D3410h
    jne sub_10012712
    push push 01E0h
    push push 0280h
    push push 010193C8Ch
    call sub_10060DFB
    push push 010194150h
    push push 0
    mov mov edi, eax
    call dword ptr [fp_101D49C8]
    push push 0101940F0h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 010194090h
    push push 0
    call dword ptr [fp_101D49C8]
    push push edi
    push push 010194088h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 48
    call dword ptr [fp_101D4A1C]
    mov mov eax, dword ptr [esp + 20]
    xor xor ebx, ebx
    xor xor edi, edi
    cmp cmp eax, ebx
    mov mov dword ptr [esp + 16], ebx
    jle sub_100127E5
    xor xor ebp, ebp
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esp + ebx + 0420h]
    mov mov ecx, dword ptr [esp + ebx + 041Ch]
    push push eax
    push push ecx
    push push 010193C84h
    push push esi
    mov mov dword ptr [edi*4 + 0101D2C08h], esi
    call sub_100F6116
    lea lea esi, [esi + eax + 1]
    mov mov eax, dword ptr [esp + ebp + 042Ch]
L8:
    add add esp, 16
    cmp cmp eax, 0280h
L9:
    jl sub_1001280B
    cmp cmp dword ptr [esp + ebp + 0420h], 01E0h
    jge sub_1001281E
    mov mov dword ptr [esp + 16], edi
    mov mov ebp, ebx
L11:
    mov mov eax, dword ptr [esp + 20]
    inc inc edi
    add add ebx, 8
    cmp cmp edi, eax
    jl sub_100127E6
    mov mov ebp, dword ptr [esp + 24]
    mov mov edx, dword ptr [esp + 16]
    push push 02021h
    push push edx
    push push 0101D2C08h
    push push 010193C7Ch
    mov mov dword ptr [edi*4 + 0101D2C08h], 0
    call dword ptr [fp_101D4A3C]
    xor xor ebx, ebx
    add add esp, 16
    test test ebp, ebp
    mov mov dword ptr [g_101CE688], eax
    mov mov dword ptr [esp + 16], ebx
    jle sub_100128EE
    xor xor ebp, ebp
    xor xor edi, edi
    mov mov eax, dword ptr [esp + edi + 28]
L15:
    push push eax
L16:
    push push 010193C74h
    push push esi
    mov mov dword ptr [edi + 0101D300Ch], esi
    call sub_100F619F
    lea lea esi, [esi + eax + 1]
    mov mov eax, dword ptr [esp + ebp + 40]
    add add esp, 12
    cmp cmp eax, 60
    jge sub_1001290C
    mov mov dword ptr [esp + 16], ebx
    mov mov ebp, edi
    mov mov eax, dword ptr [esp + 24]
    inc inc ebx
    add add edi, 4
    cmp cmp ebx, eax
    jl sub_100128F2
    mov mov ecx, dword ptr [esp + 16]
    push push 02021h
    push push ecx
    push push 0101D300Ch
    push push 010193C60h
    mov mov dword ptr [ebx*4 + 0101D300Ch], 0
    call dword ptr [fp_101D4A3C]
    add add esp, 16
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov dword ptr [g_101CE7FC], eax
    pop pop ebx
FUN_100123d0 ENDP
END
