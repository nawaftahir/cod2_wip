.686
.MODEL FLAT, C
EXTRN sub_1004CB27:PROC
EXTRN sub_1004CB31:PROC
EXTRN sub_1004CB3A:PROC
.CODE
FUN_1004c5e0 PROC
    sub esp, 000000520h
    push ebx
    push esi
    mov esi, ecx
    test esi, esi
    push edi
    mov ebx, eax
    jl L0
    cmp esi, 4
    jl L1
L0:
    mov edi, dword ptr [esp + 000000530h]
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 20], 50
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 24], esi
    mov edx, dword ptr [edi]
    push edi
    call dword ptr [edx]
    add esp, 4
    jmp L2
L1:
    mov edi, dword ptr [esp + 000000530h]
L2:
    mov al, byte ptr [esp + 000000534h]
    test al, al
    push ebp
    je L3
    mov ebp, dword ptr [edi + esi*4 + 0000000A8h]
    mov dword ptr [esp + 20], ebp
    jmp L4
L3:
    mov eax, dword ptr [edi + esi*4 + 0000000B8h]
    mov dword ptr [esp + 20], eax
    mov ebp, eax
L4:
    test ebp, ebp
    jne L5
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 20], 50
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 24], esi
    mov eax, dword ptr [edi]
    push edi
    call dword ptr [eax]
    add esp, 4
L5:
    cmp dword ptr [ebx], 0
    jne L6
    mov ecx, dword ptr [edi + 4]
    push 000000590h
    push 1
    push edi
    call dword ptr [ecx]
    add esp, 12
    mov dword ptr [ebx], eax
L6:
    mov eax, dword ptr [ebx]
    mov ebx, 1
    mov dword ptr [esp + 24], eax
    mov dword ptr [eax + 00000008Ch], ebp
    xor esi, esi
    mov dword ptr [esp + 16], ebx
    jmp L8
L7:
    mov ebp, dword ptr [esp + 20]
L8:
    movzx ebp, byte ptr [ebx + ebp]
    test ebp, ebp
    jl L9
    lea edx, [esi + ebp]
    cmp edx, 000000100h
    jle L10
L9:
    mov eax, dword ptr [edi]
    mov dword ptr [eax + 20], 8
    mov ecx, dword ptr [edi]
    push edi
    call dword ptr [ecx]
    add esp, 4
L10:
    test ebp, ebp
    je L11
    mov bh, bl
    mov al, bl
    mov ecx, ebp
    mov edx, ecx
    shr ecx, 2
    lea edi, [esp + esi + 40]
    mov eax, ebx
    shl eax, 16
    mov ax, bx
    mov ebx, dword ptr [esp + 16]
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov edi, dword ptr [esp + 000000534h]
    add esi, ebp
L11:
    inc ebx
    cmp ebx, 16
    mov dword ptr [esp + 16], ebx
    jle L7
    mov byte ptr [esp + esi + 40], 0
    mov al, byte ptr [esp + 40]
    xor ebx, ebx
    xor edi, edi
    test al, al
    mov dword ptr [esp + 36], esi
    movsx ebp, al
    je L16
    lea eax, [esp + 40]
    jmp L12
    lea ecx, [ecx]
L12:
    movsx eax, byte ptr [eax]
    cmp eax, ebp
    jne L14
    jmp L13
    lea esp, [esp]
L13:
    movsx ecx, byte ptr [esp + edi + 41]
    mov dword ptr [esp + edi*4 + 00000012Ch], ebx
    inc edi
    inc ebx
    cmp ecx, ebp
    je L13
L14:
    mov edx, 1
    mov ecx, ebp
    shl edx, cl
    cmp ebx, edx
    jl L15
    mov eax, dword ptr [esp + 000000534h]
    mov ecx, dword ptr [eax]
    mov dword ptr [ecx + 20], 8
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx]
    add esp, 4
L15:
    mov cl, byte ptr [esp + edi + 40]
    lea eax, [esp + edi + 40]
    shl ebx, 1
    inc ebp
    test cl, cl
    jne L12
L16:
    xor ecx, ecx
    mov eax, 1
    lea ecx, [ecx]
L17:
    mov esi, dword ptr [esp + 20]
    cmp byte ptr [eax + esi], 0
    mov edx, dword ptr [esp + 24]
    je L18
    mov ebp, dword ptr [esp + ecx*4 + 00000012Ch]
    mov edi, ecx
    sub edi, ebp
    mov dword ptr [edx + eax*4 + 72], edi
    movzx edi, byte ptr [eax + esi]
    add ecx, edi
    mov edi, dword ptr [esp + ecx*4 + 000000128h]
    mov dword ptr [edx + eax*4], edi
    jmp L19
L18:
    mov dword ptr [edx + eax*4], 0FFFFFFFFh
L19:
    inc eax
    cmp eax, 16
    jle L17
    mov edx, dword ptr [esp + 24]
    xor eax, eax
    lea edi, [edx + 000000090h]
    mov dword ptr [edx + 68], 0000FFFFFh
    mov ecx, 000000100h
    rep stosd dword ptr es:[edi], eax
    xor edx, edx
    mov ecx, 7
    mov dword ptr [esp + 32], edx
    mov edi, 1
    mov dword ptr [esp + 16], ecx
    lea ebx, [ebx]
L20:
    mov al, byte ptr [edi + esi]
    mov ebx, 1
    cmp al, bl
    mov dword ptr [esp + 28], ebx
    jb L24
    shl ebx, cl
    lea ebp, [edx + esi + 17]
    jmp L21
    lea esp, [esp]
    nop
L21:
    mov eax, dword ptr [esp + edx*4 + 00000012Ch]
    mov ecx, dword ptr [esp + 16]
    shl eax, cl
    test ebx, ebx
    jle L23
    mov ecx, dword ptr [esp + 24]
    lea edx, [eax + ecx + 000000490h]
    lea eax, [ecx + eax*4 + 000000090h]
    mov esi, ebx
L22:
    mov dword ptr [eax], edi
    mov cl, byte ptr [ebp]
    add eax, 4
    mov byte ptr [edx], cl
    inc edx
    dec esi
    jne L22
    mov edx, dword ptr [esp + 32]
    mov esi, dword ptr [esp + 20]
L23:
    inc dword ptr [esp + 28]
    movzx eax, byte ptr [edi + esi]
    mov ecx, dword ptr [esp + 28]
    inc edx
    inc ebp
    cmp ecx, eax
    mov dword ptr [esp + 32], edx
    jle L21
L24:
    mov ecx, dword ptr [esp + 16]
    inc edi
    dec ecx
    mov dword ptr [esp + 16], ecx
    jns L20
    mov al, byte ptr [esp + 000000538h]
    test al, al
    pop ebp
    je sub_1004CB27
    mov ebx, dword ptr [esp + 32]
    xor edi, edi
    test ebx, ebx
    jle sub_1004CB31
    movzx eax, byte ptr [esi + edi + 17]
    test eax, eax
    jl L25
    cmp eax, 15
    jle sub_1004CB3A
L25:
    mov eax, dword ptr [esp + 000000530h]
    mov ecx, dword ptr [eax]
    mov dword ptr [ecx + 20], 8
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx]
FUN_1004c5e0 ENDP
END
