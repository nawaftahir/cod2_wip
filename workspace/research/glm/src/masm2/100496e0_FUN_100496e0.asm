.686
.MODEL FLAT, C
EXTRN sub_10046E50:PROC
EXTRN sub_1004721A:PROC
EXTRN sub_10049988:PROC
EXTRN sub_1004998D:PROC
EXTRN sub_100499B5:PROC
EXTRN sub_10049A07:PROC
EXTRN sub_10049A3A:PROC
EXTRN sub_10049A3D:PROC
EXTRN sub_10049A42:PROC
EXTRN sub_10049B07:PROC
EXTRN sub_10049B26:PROC
.CODE
FUN_100496e0 PROC
    sub sub esp, 12
    push push ebp
    mov mov ebp, dword ptr [esp + 24]
    cmp cmp dword ptr [ebp + 20], 100
    push push edi
    je L0
    mov mov eax, dword ptr [ebp]
    mov mov dword ptr [eax + 20], 20
    mov mov ecx, dword ptr [ebp]
    mov mov edx, dword ptr [ebp + 20]
    mov mov dword ptr [ecx + 24], edx
    mov mov eax, dword ptr [ebp]
    push push ebp
    call call dword ptr [eax]
    add add esp, 4
    mov mov edi, dword ptr [esp + 24]
    mov mov ecx, dword ptr [edi + 36]
    mov mov dword ptr [ebp + 36], ecx
    mov mov edx, dword ptr [edi + 40]
    mov mov dword ptr [ebp + 40], edx
    mov mov eax, dword ptr [edi + 44]
    mov mov dword ptr [ebp + 44], eax
    mov mov ecx, dword ptr [edi + 48]
    push push ebx
    push push esi
    mov mov eax, ebp
    mov mov dword ptr [ebp + 48], ecx
    call sub_10046E50
    mov mov eax, dword ptr [edi + 48]
    mov mov ecx, ebp
    call sub_1004721A
    mov mov edx, dword ptr [edi + 0C8h]
    mov mov dword ptr [ebp + 64], edx
    mov mov al, byte ptr [edi + 0112h]
    lea lea esi, [edi + 098h]
    mov mov byte ptr [ebp + 0BBh], al
    mov mov dword ptr [esp + 36], esi
    lea lea ebx, [ebp + 80]
    mov mov dword ptr [esp + 16], 4
    cmp cmp dword ptr [esi], 0
    je L2
    cmp cmp dword ptr [ebx], 0
    jne L1
    mov mov ecx, dword ptr [ebp + 4]
    push push 082h
    push push 0
    push push ebp
    call call dword ptr [ecx]
    mov mov byte ptr [eax + 080h], 0
    add add esp, 12
    mov mov dword ptr [ebx], eax
    mov mov esi, dword ptr [esi]
    mov mov edi, dword ptr [ebx]
    mov mov ecx, 32
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov edx, dword ptr [ebx]
    mov mov edi, dword ptr [esp + 32]
    mov mov esi, dword ptr [esp + 36]
    mov mov byte ptr [edx + 080h], 0
    mov mov eax, dword ptr [esp + 16]
    add add esi, 4
    add add ebx, 4
    dec dec eax
    mov mov dword ptr [esp + 36], esi
    mov mov dword ptr [esp + 16], eax
    jne L3
    mov mov eax, dword ptr [edi + 44]
    cmp cmp eax, 1
    mov mov dword ptr [ebp + 68], eax
    jl L4
    cmp cmp eax, 10
    jle L5
    mov mov eax, dword ptr [ebp]
    mov mov dword ptr [eax + 20], 26
    mov mov ecx, dword ptr [ebp]
    mov mov edx, dword ptr [ebp + 68]
    mov mov dword ptr [ecx + 24], edx
    mov mov eax, dword ptr [ebp]
    mov mov dword ptr [eax + 28], 10
    mov mov ecx, dword ptr [ebp]
    push push ebp
    call call dword ptr [ecx]
    add add esp, 4
    mov mov eax, dword ptr [ebp + 68]
    test test eax, eax
    mov mov ebx, dword ptr [edi + 0CCh]
    mov mov edx, dword ptr [ebp + 76]
    mov mov dword ptr [esp + 16], 0
    mov mov dword ptr [esp + 20], ebx
    mov mov dword ptr [esp + 32], edx
    jle sub_10049A07
    mov mov eax, dword ptr [ebx]
    mov mov dword ptr [edx], eax
    mov mov ecx, dword ptr [ebx + 8]
    mov mov dword ptr [edx + 8], ecx
    mov mov eax, dword ptr [ebx + 12]
    mov mov dword ptr [edx + 12], eax
    mov mov esi, dword ptr [ebx + 16]
    test test esi, esi
    mov mov dword ptr [edx + 16], esi
    jl sub_10049988
L2:
    cmp cmp esi, 4
    jge sub_1004998D
    mov mov eax, dword ptr [edi + esi*4 + 098h]
    test test eax, eax
    jne sub_100499B5
L3:
    mov mov ecx, dword ptr [ebp]
    mov mov dword ptr [ecx + 20], 52
    mov mov edx, dword ptr [ebp]
    mov mov dword ptr [edx + 24], esi
    mov mov eax, dword ptr [ebp]
    push push ebp
    call call dword ptr [eax]
    mov mov edx, dword ptr [esp + 36]
    add add esp, 4
    mov mov ecx, dword ptr [ebx + 76]
    test test ecx, ecx
    mov mov eax, dword ptr [edi + esi*4 + 098h]
    je sub_10049A3A
    sub sub ecx, eax
    mov mov ebx, eax
    mov mov dword ptr [esp + 24], ecx
    mov mov dword ptr [esp + 36], 64
    mov mov dx, word ptr [ecx + ebx]
    cmp cmp dx, word ptr [ebx]
    je sub_10049A3D
    mov mov eax, dword ptr [ebp]
    mov mov dword ptr [eax + 20], 44
    mov mov ecx, dword ptr [ebp]
    mov mov dword ptr [ecx + 24], esi
    mov mov edx, dword ptr [ebp]
    push push ebp
    call call dword ptr [edx]
    mov mov ecx, dword ptr [esp + 28]
    add add esp, 4
    mov mov eax, dword ptr [esp + 36]
    add add ebx, 2
    dec dec eax
    mov mov dword ptr [esp + 36], eax
    jne sub_10049A42
L4:
    mov mov ebx, dword ptr [esp + 20]
    mov mov edx, dword ptr [esp + 32]
    mov mov eax, dword ptr [esp + 16]
    mov mov ecx, dword ptr [ebp + 68]
    inc inc eax
    add add ebx, 84
    add add edx, 84
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 16], eax
    mov mov dword ptr [esp + 20], ebx
    mov mov dword ptr [esp + 32], edx
    jl sub_10049A07
    mov mov al, byte ptr [edi + 0108h]
    test test al, al
    pop pop esi
    pop pop ebx
    je sub_10049B26
    cmp cmp byte ptr [edi + 0109h], 1
    jne sub_10049B07
    mov mov byte ptr [ebp + 0CDh], 1
    mov mov al, byte ptr [edi + 010Ah]
    mov mov byte ptr [ebp + 0CEh], al
    mov mov cl, byte ptr [edi + 010Bh]
    mov mov byte ptr [ebp + 0CFh], cl
    mov mov dx, word ptr [edi + 010Ch]
    mov mov word ptr [ebp + 0D0h], dx
    mov mov ax, word ptr [edi + 010Eh]
    mov mov word ptr [ebp + 0D2h], ax
    pop pop edi
    pop pop ebp
    add add esp, 12
    ret ret
FUN_100496e0 ENDP
END
