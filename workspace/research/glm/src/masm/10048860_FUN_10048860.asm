.686
.MODEL FLAT, C
EXTRN sub_10048AEF:PROC
EXTRN sub_10048C0A:PROC
.CODE
FUN_10048860 PROC
    sub esp, 24
    push ebx
    mov ebx, dword ptr [esp + 32]
    mov eax, dword ptr [ebx + 0000000E4h]
    push ebp
    mov ebp, dword ptr [esp + 56]
    mov ecx, dword ptr [ebp]
    lea eax, [eax + eax*2]
    mov dword ptr [esp + 28], eax
    cmp ecx, dword ptr [esp + 60]
    push esi
    mov esi, dword ptr [ebx + 00000014Ch]
    mov dword ptr [esp + 24], esi
    jae sub_10048AEF
    push edi
    mov edx, dword ptr [esp + 52]
    mov edx, dword ptr [edx]
    mov eax, dword ptr [esp + 56]
    cmp edx, eax
    jae L5
    mov ecx, dword ptr [esi + 52]
    mov edi, dword ptr [esi + 60]
    sub edi, ecx
    sub eax, edx
    cmp edi, eax
    mov dword ptr [esp + 20], edi
    jb L0
    mov dword ptr [esp + 20], eax
    mov edi, eax
L0:
    mov eax, dword ptr [ebx + 000000158h]
    push edi
    push ecx
    mov ecx, dword ptr [esp + 56]
    lea ebp, [esi + 8]
    push ebp
    lea edx, [ecx + edx*4]
    push edx
    push ebx
    call dword ptr [eax + 4]
    mov eax, dword ptr [esi + 48]
    mov ecx, dword ptr [ebx + 40]
    add esp, 20
    cmp eax, ecx
    jne L4
    mov eax, dword ptr [ebx + 68]
    test eax, eax
    mov dword ptr [esp + 44], 0
    jle L4
    mov dword ptr [esp + 24], ebp
    lea ecx, [ecx]
L1:
    mov eax, dword ptr [ebx + 0000000E4h]
    mov ebp, 1
    cmp eax, ebp
    jl L3
    mov dword ptr [esp + 16], 4
    jmp L2
    lea esp, [esp]
L2:
    mov ecx, dword ptr [esp + 24]
    mov edx, dword ptr [ecx]
    mov esi, dword ptr [esp + 16]
    mov ecx, dword ptr [ebx + 36]
    mov eax, edx
    mov edx, dword ptr [edx]
    sub eax, esi
    mov eax, dword ptr [eax]
    mov esi, edx
    mov edx, ecx
    shr ecx, 2
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [esp + 16]
    mov eax, dword ptr [ebx + 0000000E4h]
    inc ebp
    add ecx, 4
    cmp ebp, eax
    mov dword ptr [esp + 16], ecx
    jle L2
    mov edi, dword ptr [esp + 20]
    mov esi, dword ptr [esp + 28]
L3:
    mov eax, dword ptr [esp + 44]
    mov edx, dword ptr [esp + 24]
    mov ecx, dword ptr [ebx + 68]
    inc eax
    add edx, 4
    cmp eax, ecx
    mov dword ptr [esp + 44], eax
    mov dword ptr [esp + 24], edx
    jl L1
L4:
    mov eax, dword ptr [esp + 52]
    mov edx, dword ptr [eax]
    mov ebp, dword ptr [esp + 64]
    add edx, edi
    mov dword ptr [eax], edx
    mov ecx, dword ptr [esi + 52]
    mov eax, dword ptr [esi + 48]
    add ecx, edi
    sub eax, edi
    mov dword ptr [esi + 52], ecx
    mov dword ptr [esi + 48], eax
    jmp L11
L5:
    mov eax, dword ptr [esi + 48]
    test eax, eax
    jne sub_10048C0A
    mov eax, dword ptr [esi + 52]
    cmp eax, dword ptr [esi + 60]
    jge L11
    mov eax, dword ptr [ebx + 68]
    test eax, eax
    mov dword ptr [esp + 44], 0
    jle L10
    lea ecx, [esi + 8]
    mov dword ptr [esp + 24], ecx
L6:
    mov edi, dword ptr [esi + 60]
    mov edx, dword ptr [esi + 52]
    cmp edx, edi
    mov eax, dword ptr [ebx + 36]
    mov ecx, dword ptr [esp + 24]
    mov ecx, dword ptr [ecx]
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 32], edi
    mov dword ptr [esp + 20], ecx
    mov eax, edx
    jge L9
    jmp L8
L7:
    mov ecx, dword ptr [esp + 20]
    jmp L8
    lea esp, [esp]
L8:
    mov edi, dword ptr [ecx + eax*4]
    mov esi, dword ptr [ecx + edx*4 - 4]
    mov ecx, dword ptr [esp + 16]
    mov ebp, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebp
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [esp + 32]
    inc eax
    cmp eax, ecx
    jl L7
    mov esi, dword ptr [esp + 28]
    mov ebp, dword ptr [esp + 64]
L9:
    mov eax, dword ptr [esp + 44]
    mov edx, dword ptr [esp + 24]
    mov ecx, dword ptr [ebx + 68]
    inc eax
    add edx, 4
    cmp eax, ecx
    mov dword ptr [esp + 44], eax
    mov dword ptr [esp + 24], edx
    jl L6
L10:
    mov edx, dword ptr [esi + 60]
    mov dword ptr [esi + 52], edx
L11:
    mov eax, dword ptr [esi + 52]
    cmp eax, dword ptr [esi + 60]
    jne L14
    mov edx, dword ptr [ebp]
    mov eax, dword ptr [esp + 60]
    mov ecx, dword ptr [ebx + 00000015Ch]
    push edx
    mov edx, dword ptr [esi + 56]
    push eax
    push edx
    lea eax, [esi + 8]
    push eax
    push ebx
    call dword ptr [ecx + 4]
    mov edi, dword ptr [ebp]
    mov eax, dword ptr [esp + 56]
    add esp, 20
    inc edi
    mov dword ptr [ebp], edi
    mov ecx, dword ptr [ebx + 0000000E4h]
    mov edx, dword ptr [esi + 56]
    add edx, ecx
    mov ecx, edx
    cmp ecx, eax
    mov dword ptr [esi + 56], edx
    jl L12
    mov dword ptr [esi + 56], 0
L12:
    cmp dword ptr [esi + 52], eax
    jl L13
    mov dword ptr [esi + 52], 0
L13:
    mov edx, dword ptr [ebx + 0000000E4h]
    add edx, dword ptr [esi + 52]
    mov dword ptr [esi + 60], edx
L14:
    mov eax, dword ptr [esp + 68]
    cmp dword ptr [ebp], eax
FUN_10048860 ENDP
END
