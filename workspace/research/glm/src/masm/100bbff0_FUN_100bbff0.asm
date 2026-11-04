.686
.MODEL FLAT, C
EXTRN sub_1006C601:PROC
EXTRN sub_1008557F:PROC
EXTRN sub_10085616:PROC
EXTRN sub_10085A0D:PROC
EXTRN sub_10085AB1:PROC
EXTRN sub_10085E16:PROC
EXTRN sub_100B9A22:PROC
EXTRN sub_100B9A57:PROC
EXTRN g_1011A0B8:DWORD
.CODE
FUN_100bbff0 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000134h
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov ebx, dword ptr [eax]
    push edi
    xor ecx, ecx
    xor edi, edi
    and ebx, 0000FFFFFh
    cmp dword ptr [ebp + 8], edi
    mov dword ptr [ebp - 40], edi
    sete cl
    mov dword ptr [ebp - 84], edi
    mov dword ptr [ebp - 4], edi
    mov dword ptr [ebp - 32], edi
    mov dword ptr [ebp - 16], esi
    mov dword ptr [ebp - 80], 1
    mov dword ptr [ebp - 76], 2
    mov edi, ecx
    push edi
    push ebx
    lea ecx, [ebp - 84]
    push ecx
    lea ecx, [ebp - 0000000F4h]
    push ecx
    lea ecx, [ebp - 40]
    push ecx
    lea ecx, [ebp - 000000134h]
    push ecx
    push 010118958h
    push eax
    mov ecx, esi
    mov dword ptr [ebp - 72], 3
    call sub_100B9A22
    test eax, eax
    je L0
    push edi
    push ebx
    lea eax, [ebp - 84]
    push eax
    lea eax, [ebp - 0000000F4h]
    push eax
    lea eax, [ebp - 40]
    push eax
    lea eax, [ebp - 000000134h]
    push eax
    push 0101189D8h
    push dword ptr [esi + 000000100h]
    mov ecx, esi
    mov dword ptr [ebp - 32], 1
    call sub_100B9A57
    test eax, eax
    jne L8
L0:
    and dword ptr [ebp - 8], 0
    lea eax, [ebp - 0000000E4h]
    mov dword ptr [ebp - 56], eax
    lea eax, [ebp - 0000000D4h]
    mov dword ptr [ebp - 60], eax
L1:
    and dword ptr [ebp - 20], 0
    lea eax, [ebp - 0000000C4h]
    mov dword ptr [ebp - 52], eax
    lea eax, [ebp - 0000000B4h]
    mov dword ptr [ebp - 36], eax
L2:
    and dword ptr [ebp - 12], 0
    test ebx, ebx
    jbe L4
    mov eax, dword ptr [ebp - 60]
    mov ecx, dword ptr [esi + 20]
    mov dword ptr [ebp - 48], eax
    mov eax, dword ptr [ebp - 36]
    mov dword ptr [ebp - 28], eax
    mov eax, dword ptr [ebp - 52]
    mov dword ptr [ebp - 24], eax
    mov eax, dword ptr [ebp - 56]
    mov dword ptr [ebp - 44], eax
L3:
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [ebp + eax*4 - 0000000F4h]
    mov edx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ebp - 44]
    mov edi, dword ptr [ebp - 24]
    mov eax, dword ptr [eax]
    mov edi, dword ptr [edi]
    mov eax, dword ptr [ecx + eax*4]
    cmp dword ptr [eax + 8], -1
    mov edi, dword ptr [ecx + edi*4]
    mov dword ptr [ebp - 68], edx
    mov dword ptr [ebp - 64], edi
    jne L4
    cmp dword ptr [edx + 8], -1
    jne L4
    cmp dword ptr [edi + 8], -1
    jne L4
    mov edx, dword ptr [esi + 16]
    mov edi, dword ptr [eax + 4]
    mov edi, dword ptr [edx + edi*4]
    test byte ptr [edi + 5], 1
    je L4
    mov edi, dword ptr [ebp - 64]
    mov edi, dword ptr [edi + 4]
    mov edi, dword ptr [edx + edi*4]
    test byte ptr [edi + 5], 1
    je L4
    mov edi, dword ptr [ebp - 68]
    mov edi, dword ptr [edi + 4]
    mov edx, dword ptr [edx + edi*4]
    test byte ptr [edx + 5], 1
    je L4
    mov edx, dword ptr [ebp - 64]
    fld qword ptr [edx + 32]
    fsub qword ptr [eax + 32]
    mov eax, dword ptr [ebp - 68]
    fsub qword ptr [eax + 32]
    fabs
    fcomp qword ptr [g_1011A0B8]
    fnstsw ax
    test ah, 65
    je L4
    mov eax, dword ptr [ebp - 48]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [ebp - 28]
    cmp eax, dword ptr [edx]
    jne L4
    inc dword ptr [ebp - 12]
    push 4
    pop eax
    add dword ptr [ebp - 44], eax
    add dword ptr [ebp - 24], eax
    add dword ptr [ebp - 28], eax
    add dword ptr [ebp - 48], eax
    cmp dword ptr [ebp - 12], ebx
    jb L3
L4:
    cmp dword ptr [ebp - 12], ebx
    je L9
    inc dword ptr [ebp - 20]
    push 16
    pop eax
    sub dword ptr [ebp - 36], eax
    add dword ptr [ebp - 52], eax
    cmp dword ptr [ebp - 20], 2
    jb L2
    inc dword ptr [ebp - 8]
    sub dword ptr [ebp - 60], eax
    add dword ptr [ebp - 56], eax
    cmp dword ptr [ebp - 8], 2
    jb L1
L5:
    xor edi, edi
    inc edi
L6:
    mov ecx, dword ptr [ebp - 4]
    test ecx, ecx
    je L7
    push 1
    call sub_1006C601
L7:
    mov eax, edi
L8:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
L9:
    push 116
    call sub_10085A0D
    xor edi, edi
    cmp eax, edi
    je L10
    mov ecx, eax
    call sub_1008557F
    mov dword ptr [ebp - 4], eax
    jmp L11
L10:
    mov dword ptr [ebp - 4], edi
L11:
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, edi
    jne L12
    mov edi, 08007000Eh
    jmp L7
L12:
    cmp dword ptr [ebp - 32], edi
    je L13
    cmp dword ptr [ebp + 8], edi
    jne L5
    push edi
    lea eax, [ebx + ebx]
    push ebx
    push eax
    mov eax, ebx
    and eax, 0000FFFFFh
    or eax, 070C00000h
    jmp L14
L13:
    push edi
    lea eax, [ebx + ebx]
    push ebx
    push eax
    mov eax, ebx
    and eax, 0000FFFFFh
    or eax, 070B00000h
L14:
    push eax
    call sub_10085AB1
    mov edi, eax
    test edi, edi
    jl L6
    push dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ebp - 4]
    call sub_10085616
    mov edi, eax
    test edi, edi
    jl L6
    mov eax, dword ptr [esi + 000000100h]
    mov esi, dword ptr [eax + 16]
    mov eax, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + 16]
    mov ecx, ebx
    shl ecx, 2
    mov dword ptr [ebp - 8], ecx
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [eax + 8]
    mov ecx, edx
    shr ecx, 2
    lea esi, [ebp - 0000000F4h]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [eax + 8]
    mov esi, dword ptr [ebp - 16]
    mov esi, dword ptr [esi + 000000100h]
    mov esi, dword ptr [esi + 8]
    add edi, edx
    cmp dword ptr [ebp - 32], 0
    mov ecx, edx
    je L15
    add esi, edx
    jmp L16
L15:
    lea esi, [esi + ebx*8]
L16:
    mov ebx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov esi, dword ptr [eax + 8]
    mov edx, dword ptr [esi + edx]
    mov ecx, dword ptr [ebp - 16]
    mov ecx, dword ptr [ecx + 20]
    mov edi, dword ptr [esi]
    mov esi, dword ptr [ecx + edx*4]
    mov edx, dword ptr [eax + 16]
    mov edx, dword ptr [edx]
    mov edi, dword ptr [ecx + edi*4]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [ecx + 4]
    cmp edx, dword ptr [edi + 4]
    jne L17
    mov ebx, dword ptr [ecx + 12]
    cmp ebx, dword ptr [edi + 12]
    je L5
L17:
    cmp edx, dword ptr [esi + 4]
    jne L18
    mov ecx, dword ptr [ecx + 12]
    cmp ecx, dword ptr [esi + 12]
    je L5
L18:
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    je L20
    and dword ptr [ebp - 4], 0
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebp - 40]
    test eax, eax
    jbe L19
    mov edi, dword ptr [ebp + 12]
    mov ecx, eax
    lea esi, [ebp - 000000134h]
    rep movsd dword ptr es:[edi], dword ptr [esi]
L19:
    mov ecx, dword ptr [ebp + 16]
    mov dword ptr [ecx], eax
    jmp L21
L20:
    push eax
    mov eax, dword ptr [ebp - 16]
    mov ecx, dword ptr [eax + 0000000FCh]
    mov eax, dword ptr [eax + 24]
    mov ecx, dword ptr [eax + ecx*4]
    call sub_10085E16
L21:
    xor edi, edi
    jmp L6
FUN_100bbff0 ENDP
END
