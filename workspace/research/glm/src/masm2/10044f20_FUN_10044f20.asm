.686
.MODEL FLAT, C
EXTRN sub_1004514A:PROC
EXTRN sub_10045155:PROC
EXTRN sub_100451A4:PROC
EXTRN sub_100451AF:PROC
EXTRN sub_100451B8:PROC
EXTRN sub_10045218:PROC
EXTRN sub_10045223:PROC
EXTRN sub_10045296:PROC
EXTRN sub_100452B0:PROC
EXTRN sub_100452BB:PROC
EXTRN sub_100452BC:PROC
EXTRN sub_1004530A:PROC
EXTRN sub_10045315:PROC
.CODE
FUN_10044f20 PROC
    sub sub esp, 8
    mov mov eax, dword ptr [esp + 12]
    push push ebx
    mov mov ebx, dword ptr [esi + eax*4 + 80]
    test test ebx, ebx
    push push edi
    mov mov dword ptr [esp + 12], ebx
    jne L0
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 52
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 24], eax
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov dword ptr [esp + 8], 0
    lea lea eax, [ebx + 4]
    mov mov edi, 16
    mov mov edx, 0FFh
L0:
    cmp cmp word ptr [eax - 4], dx
    mov mov ecx, 1
    jbe L1
    mov mov dword ptr [esp + 8], ecx
    cmp cmp word ptr [eax - 2], dx
    jbe L2
    mov mov dword ptr [esp + 8], ecx
    cmp cmp word ptr [eax], dx
    jbe L4
    mov mov dword ptr [esp + 8], ecx
    cmp cmp word ptr [eax + 2], dx
    jbe L5
    mov mov dword ptr [esp + 8], ecx
    add add eax, 8
    dec dec edi
    jne L3
    mov mov al, byte ptr [ebx + 080h]
    test test al, al
    jne sub_100451B8
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], dl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    push push ebp
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    mov mov ebp, 24
    jne L6
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne L7
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], ebp
    mov mov eax, dword ptr [esi]
    push push esi
L2:
    call call dword ptr [eax]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    mov mov byte ptr [ecx], 0DBh
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
L4:
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne L8
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne L9
L5:
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], ebp
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov ebx, dword ptr [esp + 12]
    mov mov eax, dword ptr [esi + 32]
    mov mov edx, dword ptr [eax]
    neg neg ebx
    sbb sbb ebx, ebx
    and and ebx, 64
    add add ebx, 67
    mov mov ecx, ebx
    sar sar ecx, 8
    mov mov byte ptr [edx], cl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_1004514A
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_10045155
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], ebp
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov edx, dword ptr [eax]
    mov mov byte ptr [edx], bl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_100451A4
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_100451AF
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], ebp
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
L6:
    mov mov eax, dword ptr [esi + 32]
    mov mov dl, byte ptr [esp + 12]
    mov mov bl, byte ptr [esp + 24]
L7:
    mov mov ecx, dword ptr [eax]
    shl shl dl, 4
    add add dl, bl
    mov mov byte ptr [ecx], dl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_10045218
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_10045223
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], ebp
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov edi, 010191200h
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esp + 12]
    test test eax, eax
    mov mov ecx, dword ptr [edi]
    mov mov edx, dword ptr [esp + 16]
    movzx movzx ebx, word ptr [edx + ecx*2]
    je sub_10045296
    mov mov eax, dword ptr [esi + 32]
    mov mov edx, dword ptr [eax]
    mov mov ecx, ebx
    shr shr ecx, 8
    mov mov byte ptr [edx], cl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
L9:
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_100452B0
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_100452BB
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], ebp
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov eax, dword ptr [esi + 32]
    mov mov edx, dword ptr [eax]
    mov mov byte ptr [edx], bl
    mov mov edx, dword ptr [eax]
    mov mov ecx, dword ptr [eax + 4]
    inc inc edx
    dec dec ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], ecx
    jne sub_1004530A
    push push esi
    call call dword ptr [eax + 12]
    add add esp, 4
    test test al, al
    jne sub_10045315
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], ebp
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    add add edi, 4
    cmp cmp edi, 010191300h
    jl sub_100452BC
    mov mov edx, dword ptr [esp + 16]
    mov mov byte ptr [edx + 080h], 1
    pop pop ebp
    mov mov eax, dword ptr [esp + 8]
    pop pop edi
    pop pop ebx
    add add esp, 8
    ret ret
FUN_10044f20 ENDP
END
