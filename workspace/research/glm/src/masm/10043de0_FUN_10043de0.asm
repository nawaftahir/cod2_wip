.686
.MODEL FLAT, C
.CODE
FUN_10043de0 PROC
    sub esp, 000000514h
    push ebx
    push ebp
    push esi
    mov esi, ecx
    test esi, esi
    push edi
    mov ebx, eax
    mov ebp, 50
    jl L0
    cmp esi, 4
    jl L1
L0:
    mov edi, dword ptr [esp + 000000528h]
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 20], ebp
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 24], esi
    mov edx, dword ptr [edi]
    push edi
    call dword ptr [edx]
    add esp, 4
    jmp L2
L1:
    mov edi, dword ptr [esp + 000000528h]
L2:
    mov al, byte ptr [esp + 00000052Ch]
    test al, al
    je L3
    mov eax, dword ptr [edi + esi*4 + 96]
    mov dword ptr [esp + 20], eax
    jmp L4
L3:
    mov ecx, dword ptr [edi + esi*4 + 112]
    mov dword ptr [esp + 20], ecx
L4:
    mov eax, dword ptr [esp + 20]
    test eax, eax
    jne L5
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 20], ebp
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 24], esi
    mov ecx, dword ptr [edi]
    push edi
    call dword ptr [ecx]
    add esp, 4
L5:
    cmp dword ptr [ebx], 0
    jne L6
    mov edx, dword ptr [edi + 4]
    push 000000500h
    push 1
    push edi
    call dword ptr [edx]
    add esp, 12
    mov dword ptr [ebx], eax
L6:
    mov eax, dword ptr [ebx]
    mov ebx, 1
    mov dword ptr [esp + 24], eax
    xor ebp, ebp
    mov dword ptr [esp + 16], ebx
    lea ecx, [ecx]
L7:
    mov ecx, dword ptr [esp + 20]
    movzx esi, byte ptr [ebx + ecx]
    test esi, esi
    jl L8
    lea edx, [esi + ebp]
    cmp edx, 000000100h
    jle L9
L8:
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 20], 8
    mov ecx, dword ptr [edi]
    push edi
    call dword ptr [ecx]
    add esp, 4
L9:
    test esi, esi
    je L10
    mov bh, bl
    mov al, bl
    mov ecx, esi
    mov edx, ecx
    shr ecx, 2
    lea edi, [esp + ebp + 28]
    mov eax, ebx
    shl eax, 16
    mov ax, bx
    mov ebx, dword ptr [esp + 16]
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov edi, dword ptr [esp + 000000528h]
    add ebp, esi
L10:
    inc ebx
    cmp ebx, 16
    mov dword ptr [esp + 16], ebx
    jle L7
    mov byte ptr [esp + ebp + 28], 0
    mov al, byte ptr [esp + 28]
    xor edi, edi
    xor esi, esi
    test al, al
    mov dword ptr [esp + 16], ebp
    movsx ebp, al
    je L15
    lea eax, [esp + 28]
    nop
L11:
    movsx eax, byte ptr [eax]
    cmp eax, ebp
    jne L13
    jmp L12
    lea esp, [esp]
L12:
    movsx ecx, byte ptr [esp + esi + 29]
    mov dword ptr [esp + esi*4 + 000000120h], edi
    inc esi
    inc edi
    cmp ecx, ebp
    je L12
L13:
    mov edx, 1
    mov ecx, ebp
    shl edx, cl
    cmp edi, edx
    jl L14
    mov eax, dword ptr [esp + 000000528h]
    mov ecx, dword ptr [eax]
    mov dword ptr [ecx + 20], 8
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx]
    add esp, 4
L14:
    mov cl, byte ptr [esp + esi + 28]
    lea eax, [esp + esi + 28]
    shl edi, 1
    inc ebp
    test cl, cl
    jne L11
L15:
    mov ebx, dword ptr [esp + 24]
    xor eax, eax
    lea ebp, [ebx + 000000400h]
    mov ecx, 64
    mov edi, ebp
    rep stosd dword ptr es:[edi], eax
    mov al, byte ptr [esp + 00000052Ch]
    neg al
    sbb eax, eax
    and eax, 0FFFFFF10h
    add eax, 0000000FFh
    mov dword ptr [esp + 24], eax
    mov eax, dword ptr [esp + 16]
    xor esi, esi
    test eax, eax
    jle L19
    mov edi, edi
L16:
    mov eax, dword ptr [esp + 20]
    movzx edi, byte ptr [eax + esi + 17]
    test edi, edi
    jl L17
    cmp edi, dword ptr [esp + 24]
    jg L17
    cmp byte ptr [edi + ebp], 0
    je L18
L17:
    mov eax, dword ptr [esp + 000000528h]
    mov ecx, dword ptr [eax]
    mov dword ptr [ecx + 20], 8
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx]
    add esp, 4
L18:
    mov eax, dword ptr [esp + esi*4 + 000000120h]
    mov cl, byte ptr [esp + esi + 28]
    mov dword ptr [ebx + edi*4], eax
    mov eax, dword ptr [esp + 16]
    inc esi
    cmp esi, eax
    mov byte ptr [edi + ebp], cl
    jl L16
L19:
    pop edi
    pop esi
    pop ebp
    pop ebx
FUN_10043de0 ENDP
END
