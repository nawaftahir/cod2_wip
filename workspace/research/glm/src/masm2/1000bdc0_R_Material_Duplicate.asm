.686
.MODEL FLAT, C
EXTRN sub_1000BF68:PROC
EXTRN sub_1000BFEF:PROC
EXTRN sub_1000C02A:PROC
EXTRN sub_100139A2:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN g_1076A82C:DWORD:DWORD
.CODE
R_Material_Duplicate PROC
    push push ecx
    mov mov eax, dword ptr [g_1076A82C]
    push push ebx
    mov mov ebx, dword ptr [esp + 16]
    push push ebp
    xor xor ebp, ebp
    test test eax, eax
    push push esi
    push push edi
    mov mov dword ptr [esp + 16], ebp
    jle L6
    lea lea esp, [esp]
    mov mov ebp, dword ptr [ebp*4 + 0101CE840h]
    mov mov edx, dword ptr [ebp]
    mov mov edi, ebx
    mov mov esi, 07FFFFFFFh
    sub sub edi, edx
    movsx movsx eax, byte ptr [edi + edx]
    movsx movsx ecx, byte ptr [edx]
    inc inc edx
    mov mov ebx, esi
    dec dec esi
    test test ebx, ebx
    je L3
    cmp cmp eax, ecx
    je L3
    cmp cmp eax, 97
    jl L1
    cmp cmp eax, 122
    jg L2
    sub sub eax, 32
    cmp cmp ecx, 97
    jl L4
    cmp cmp ecx, 122
    jg L5
    sub sub ecx, 32
    cmp cmp eax, ecx
    jne L8
    test test eax, eax
    jne L0
    mov mov eax, dword ptr [ebp]
    mov mov ecx, dword ptr [esp + 24]
    mov mov esi, dword ptr [ecx]
    mov mov edx, ebp
    mov mov dword ptr [edx], esi
    mov mov esi, dword ptr [ecx + 4]
    mov mov dword ptr [edx + 4], esi
    mov mov esi, dword ptr [ecx + 8]
    mov mov dword ptr [edx + 8], esi
    mov mov esi, dword ptr [ecx + 12]
    mov mov dword ptr [edx + 12], esi
    mov mov ecx, dword ptr [ecx + 16]
    pop pop edi
    pop pop esi
    mov mov dword ptr [edx + 16], ecx
    mov mov dword ptr [ebp], eax
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
    xor xor edx, edx
    cmp cmp eax, ecx
    setge setge dl
    lea lea edx, [edx + edx - 1]
    mov mov eax, edx
L2:
    test test eax, eax
    je L9
    mov mov ebp, dword ptr [esp + 16]
    mov mov eax, dword ptr [g_1076A82C]
    mov mov ebx, dword ptr [esp + 28]
    inc inc ebp
    cmp cmp ebp, eax
    mov mov dword ptr [esp + 16], ebp
    jl L7
    cmp cmp eax, 16
    jl sub_1000BF68
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 4
    mov mov dword ptr [esp + 8], 0101930ACh
    mov mov dword ptr [esp + 4], 1
L6:
    jmp sub_100139A2
    push push 20
    call dword ptr [fp_101D49D4]
    mov mov edx, dword ptr [esp + 28]
    mov mov ecx, dword ptr [edx]
    mov mov edi, eax
    mov mov dword ptr [eax], ecx
    mov mov ecx, dword ptr [edx + 4]
    mov mov dword ptr [eax + 4], ecx
L8:
    mov mov ecx, dword ptr [edx + 8]
    mov mov dword ptr [eax + 8], ecx
    mov mov ecx, dword ptr [edx + 12]
    mov mov dword ptr [eax + 12], ecx
    mov mov edx, dword ptr [edx + 16]
    mov mov dword ptr [eax + 16], edx
    mov mov eax, ebx
    add add esp, 4
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_1000BFEF
    sub sub eax, edx
    inc inc eax
    push push eax
    call dword ptr [fp_101D49D4]
    mov mov esi, eax
    add add esp, 4
    mov mov ecx, ebx
    sub sub esi, ebx
    mov mov edi, edi
    mov mov dl, byte ptr [ecx]
    mov mov byte ptr [esi + ecx], dl
    inc inc ecx
    test test dl, dl
    jne sub_1000C02A
    mov mov dword ptr [edi], eax
    mov mov eax, dword ptr [g_1076A82C]
    mov mov dword ptr [ebp*4 + 0101CE840h], edi
    pop pop edi
    pop pop esi
    inc inc eax
    pop pop ebp
    mov mov dword ptr [g_1076A82C], eax
    pop pop ebx
    pop pop ecx
    ret ret
R_Material_Duplicate ENDP
END
