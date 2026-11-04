.686
.MODEL FLAT, C
EXTRN sub_100139A2:PROC
EXTRN fp_101D49D4:DWORD
EXTRN g_1076A82C:DWORD
.CODE
R_Material_Duplicate PROC
    push ecx
    mov eax, dword ptr [g_1076A82C]
    push ebx
    mov ebx, dword ptr [esp + 16]
    push ebp
    xor ebp, ebp
    test eax, eax
    push esi
    push edi
    mov dword ptr [esp + 16], ebp
    jle L7
    lea esp, [esp]
L0:
    mov ebp, dword ptr [ebp*4 + 0101CE840h]
    mov edx, dword ptr [ebp]
    mov edi, ebx
    mov esi, 07FFFFFFFh
    sub edi, edx
L1:
    movsx eax, byte ptr [edi + edx]
    movsx ecx, byte ptr [edx]
    inc edx
    mov ebx, esi
    dec esi
    test ebx, ebx
    je L5
    cmp eax, ecx
    je L4
    cmp eax, 97
    jl L2
    cmp eax, 122
    jg L2
    sub eax, 32
L2:
    cmp ecx, 97
    jl L3
    cmp ecx, 122
    jg L3
    sub ecx, 32
L3:
    cmp eax, ecx
    jne L6
L4:
    test eax, eax
    jne L1
L5:
    mov eax, dword ptr [ebp]
    mov ecx, dword ptr [esp + 24]
    mov esi, dword ptr [ecx]
    mov edx, ebp
    mov dword ptr [edx], esi
    mov esi, dword ptr [ecx + 4]
    mov dword ptr [edx + 4], esi
    mov esi, dword ptr [ecx + 8]
    mov dword ptr [edx + 8], esi
    mov esi, dword ptr [ecx + 12]
    mov dword ptr [edx + 12], esi
    mov ecx, dword ptr [ecx + 16]
    pop edi
    pop esi
    mov dword ptr [edx + 16], ecx
    mov dword ptr [ebp], eax
    pop ebp
    pop ebx
    pop ecx
    ret
L6:
    xor edx, edx
    cmp eax, ecx
    setge dl
    lea edx, [edx + edx - 1]
    mov eax, edx
    test eax, eax
    je L5
    mov ebp, dword ptr [esp + 16]
    mov eax, dword ptr [g_1076A82C]
    mov ebx, dword ptr [esp + 28]
    inc ebp
    cmp ebp, eax
    mov dword ptr [esp + 16], ebp
    jl L0
L7:
    cmp eax, 16
    jl L8
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 4
    mov dword ptr [esp + 8], 0101930ACh
    mov dword ptr [esp + 4], 1
    jmp sub_100139A2
L8:
    push 20
    call dword ptr [fp_101D49D4]
    mov edx, dword ptr [esp + 28]
    mov ecx, dword ptr [edx]
    mov edi, eax
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [edx + 4]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [edx + 8]
    mov dword ptr [eax + 8], ecx
    mov ecx, dword ptr [edx + 12]
    mov dword ptr [eax + 12], ecx
    mov edx, dword ptr [edx + 16]
    mov dword ptr [eax + 16], edx
    mov eax, ebx
    add esp, 4
    lea edx, [eax + 1]
L9:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L9
    sub eax, edx
    inc eax
    push eax
    call dword ptr [fp_101D49D4]
    mov esi, eax
    add esp, 4
    mov ecx, ebx
    sub esi, ebx
    mov edi, edi
L10:
    mov dl, byte ptr [ecx]
    mov byte ptr [esi + ecx], dl
    inc ecx
    test dl, dl
    jne L10
    mov dword ptr [edi], eax
    mov eax, dword ptr [g_1076A82C]
    mov dword ptr [ebp*4 + 0101CE840h], edi
    pop edi
    pop esi
    inc eax
    pop ebp
    mov dword ptr [g_1076A82C], eax
    pop ebx
    pop ecx
    ret
R_Material_Duplicate ENDP
END
