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
EXTRN sub_100BC391:PROC
EXTRN sub_100BC3BB:PROC
EXTRN sub_100BC3EE:PROC
EXTRN sub_100BC3F5:PROC
EXTRN sub_100BC3FA:PROC
EXTRN sub_100BC409:PROC
EXTRN sub_100BC421:PROC
EXTRN sub_100BC423:PROC
EXTRN sub_100BC43B:PROC
EXTRN sub_100BC44B:PROC
EXTRN sub_100BC476:PROC
EXTRN sub_100BC4D2:PROC
EXTRN sub_100BC4E3:PROC
EXTRN sub_100BC52A:PROC
EXTRN sub_100BC57E:PROC
EXTRN sub_100BC585:PROC
EXTRN sub_100BC5F8:PROC
EXTRN sub_100BC61A:PROC
EXTRN sub_100BC655:PROC
EXTRN sub_100BC65B:PROC
EXTRN sub_100BC68B:PROC
EXTRN EXTRN g_1011A0B8:DWORD:DWORD
.CODE
FUN_100bbff0 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0134h
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ebx, dword ptr [eax]
    push push edi
    xor xor ecx, ecx
    xor xor edi, edi
    and and ebx, 0FFFFFh
    cmp cmp dword ptr [ebp + 8], edi
    mov mov dword ptr [ebp - 40], edi
    sete sete cl
    mov mov dword ptr [ebp - 84], edi
    mov mov dword ptr [ebp - 4], edi
    mov mov dword ptr [ebp - 32], edi
    mov mov dword ptr [ebp - 16], esi
    mov mov dword ptr [ebp - 80], 1
    mov mov dword ptr [ebp - 76], 2
    mov mov edi, ecx
    push push edi
    push push ebx
    lea lea ecx, [ebp - 84]
    push push ecx
    lea lea ecx, [ebp - 0F4h]
    push push ecx
    lea lea ecx, [ebp - 40]
    push push ecx
    lea lea ecx, [ebp - 0134h]
    push push ecx
    push push 010118958h
    push push eax
    mov mov ecx, esi
    mov mov dword ptr [ebp - 72], 3
    call sub_100B9A22
    test test eax, eax
    je L0
    push push edi
    push push ebx
    lea lea eax, [ebp - 84]
    push push eax
    lea lea eax, [ebp - 0F4h]
    push push eax
    lea lea eax, [ebp - 40]
    push push eax
    lea lea eax, [ebp - 0134h]
    push push eax
    push push 0101189D8h
    push push dword ptr [esi + 0100h]
    mov mov ecx, esi
    mov mov dword ptr [ebp - 32], 1
    call sub_100B9A57
    test test eax, eax
    jne L2
    and and dword ptr [ebp - 8], 0
    lea lea eax, [ebp - 0E4h]
    mov mov dword ptr [ebp - 56], eax
    lea lea eax, [ebp - 0D4h]
    mov mov dword ptr [ebp - 60], eax
    and and dword ptr [ebp - 20], 0
    lea lea eax, [ebp - 0C4h]
    mov mov dword ptr [ebp - 52], eax
    lea lea eax, [ebp - 0B4h]
    mov mov dword ptr [ebp - 36], eax
    and and dword ptr [ebp - 12], 0
    test test ebx, ebx
    jbe L1
    mov mov eax, dword ptr [ebp - 60]
    mov mov ecx, dword ptr [esi + 20]
    mov mov dword ptr [ebp - 48], eax
    mov mov eax, dword ptr [ebp - 36]
    mov mov dword ptr [ebp - 28], eax
    mov mov eax, dword ptr [ebp - 52]
    mov mov dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [ebp - 56]
    mov mov dword ptr [ebp - 44], eax
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp + eax*4 - 0F4h]
    mov mov edx, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [ebp - 44]
    mov mov edi, dword ptr [ebp - 24]
    mov mov eax, dword ptr [eax]
    mov mov edi, dword ptr [edi]
    mov mov eax, dword ptr [ecx + eax*4]
    cmp cmp dword ptr [eax + 8], -1
    mov mov edi, dword ptr [ecx + edi*4]
    mov mov dword ptr [ebp - 68], edx
L0:
    mov mov dword ptr [ebp - 64], edi
    jne L6
    cmp cmp dword ptr [edx + 8], -1
    jne L7
    cmp cmp dword ptr [edi + 8], -1
    jne L8
    mov mov edx, dword ptr [esi + 16]
    mov mov edi, dword ptr [eax + 4]
    mov mov edi, dword ptr [edx + edi*4]
    test test byte ptr [edi + 5], 1
    je L9
    mov mov edi, dword ptr [ebp - 64]
    mov mov edi, dword ptr [edi + 4]
    mov mov edi, dword ptr [edx + edi*4]
    test test byte ptr [edi + 5], 1
    je L10
    mov mov edi, dword ptr [ebp - 68]
    mov mov edi, dword ptr [edi + 4]
    mov mov edx, dword ptr [edx + edi*4]
    test test byte ptr [edx + 5], 1
    je L11
    mov mov edx, dword ptr [ebp - 64]
    fld fld qword ptr [edx + 32]
    fsub fsub qword ptr [eax + 32]
    mov mov eax, dword ptr [ebp - 68]
    fsub fsub qword ptr [eax + 32]
    fabs fabs
    fcomp fcomp qword ptr [g_1011A0B8]
    fnstsw fnstsw ax
    test test ah, 65
    je L12
    mov mov eax, dword ptr [ebp - 48]
    mov mov eax, dword ptr [eax]
    mov mov edx, dword ptr [ebp - 28]
    cmp cmp eax, dword ptr [edx]
    jne L13
    inc inc dword ptr [ebp - 12]
    push push 4
    pop pop eax
    add add dword ptr [ebp - 44], eax
    add add dword ptr [ebp - 24], eax
    add add dword ptr [ebp - 28], eax
    add add dword ptr [ebp - 48], eax
    cmp cmp dword ptr [ebp - 12], ebx
    jb L5
    cmp cmp dword ptr [ebp - 12], ebx
    je sub_100BC391
    inc inc dword ptr [ebp - 20]
    push push 16
    pop pop eax
    sub sub dword ptr [ebp - 36], eax
    add add dword ptr [ebp - 52], eax
    cmp cmp dword ptr [ebp - 20], 2
    jb L4
    inc inc dword ptr [ebp - 8]
    sub sub dword ptr [ebp - 60], eax
    add add dword ptr [ebp - 56], eax
    cmp cmp dword ptr [ebp - 8], 2
    jb L3
    xor xor edi, edi
    inc inc edi
    mov mov ecx, dword ptr [ebp - 4]
    test test ecx, ecx
    je sub_100BC3BB
    push push 1
    call sub_1006C601
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 12
    push push 116
    call sub_10085A0D
    xor xor edi, edi
    cmp cmp eax, edi
    je sub_100BC3FA
    mov mov ecx, eax
    call sub_1008557F
    mov mov dword ptr [ebp - 4], eax
    jmp sub_100BC409
    mov mov dword ptr [ebp - 4], edi
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp ecx, edi
    jne sub_100BC421
    mov mov edi, 08007000Eh
    jmp sub_100BC3F5
    cmp cmp dword ptr [ebp - 32], edi
    je sub_100BC44B
    cmp cmp dword ptr [ebp + 8], edi
    jne sub_100BC3EE
    push push edi
    lea lea eax, [ebx + ebx]
    push push ebx
    push push eax
    mov mov eax, ebx
    and and eax, 0FFFFFh
    or or eax, 070C00000h
    jmp sub_100BC476
    push push edi
    lea lea eax, [ebx + ebx]
    push push ebx
    push push eax
    mov mov eax, ebx
    and and eax, 0FFFFFh
    or or eax, 070B00000h
    push push eax
    call sub_10085AB1
    mov mov edi, eax
    test test edi, edi
    jl sub_100BC423
    push push dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [ebp - 4]
    call sub_10085616
    mov mov edi, eax
    test test edi, edi
    jl sub_100BC43B
    mov mov eax, dword ptr [esi + 0100h]
    mov mov esi, dword ptr [eax + 16]
    mov mov eax, dword ptr [ebp - 4]
    mov mov edi, dword ptr [eax + 16]
    mov mov ecx, ebx
    shl shl ecx, 2
    mov mov dword ptr [ebp - 8], ecx
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [eax + 8]
    mov mov ecx, edx
    shr shr ecx, 2
    lea lea esi, [ebp - 0F4h]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [eax + 8]
    mov mov esi, dword ptr [ebp - 16]
    mov mov esi, dword ptr [esi + 0100h]
    mov mov esi, dword ptr [esi + 8]
    add add edi, edx
    cmp cmp dword ptr [ebp - 32], 0
    mov mov ecx, edx
    je sub_100BC57E
    add add esi, edx
    jmp sub_100BC585
    lea lea esi, [esi + ebx*8]
    mov mov ebx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, ebx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov esi, dword ptr [eax + 8]
    mov mov edx, dword ptr [esi + edx]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov edi, dword ptr [esi]
    mov mov esi, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [eax + 16]
    mov mov edx, dword ptr [edx]
    mov mov edi, dword ptr [ecx + edi*4]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [ecx + 4]
    cmp cmp edx, dword ptr [edi + 4]
    jne sub_100BC5F8
    mov mov ebx, dword ptr [ecx + 12]
    cmp cmp ebx, dword ptr [edi + 12]
    je sub_100BC4D2
    cmp cmp edx, dword ptr [esi + 4]
    jne sub_100BC61A
L11:
    mov mov ecx, dword ptr [ecx + 12]
    cmp cmp ecx, dword ptr [esi + 12]
    je sub_100BC4E3
    mov mov ecx, dword ptr [ebp + 8]
    test test ecx, ecx
    je sub_100BC655
    and and dword ptr [ebp - 4], 0
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebp - 40]
    test test eax, eax
L12:
    jbe sub_100BC65B
    mov mov edi, dword ptr [ebp + 12]
    mov mov ecx, eax
    lea lea esi, [ebp - 0134h]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [ebp + 16]
    mov mov dword ptr [ecx], eax
    jmp sub_100BC68B
    push push eax
    mov mov eax, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [eax + 0FCh]
    mov mov eax, dword ptr [eax + 24]
    mov mov ecx, dword ptr [eax + ecx*4]
    call sub_10085E16
    xor xor edi, edi
    jmp sub_100BC52A
FUN_100bbff0 ENDP
END
