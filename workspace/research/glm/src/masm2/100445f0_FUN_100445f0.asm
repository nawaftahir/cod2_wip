.686
.MODEL FLAT, C
EXTRN sub_100446DA:PROC
EXTRN sub_10044702:PROC
EXTRN sub_10044717:PROC
EXTRN sub_10044719:PROC
EXTRN sub_10044721:PROC
EXTRN sub_1004473B:PROC
EXTRN sub_10044747:PROC
EXTRN sub_100447AD:PROC
.CODE
FUN_100445f0 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 16]
    push push edi
    mov mov edi, eax
    mov mov eax, dword ptr [esp + 16]
    movsx movsx eax, word ptr [eax]
    sub sub eax, ecx
    jns L0
    neg neg eax
    push push ebx
    push push esi
    xor xor esi, esi
    test test eax, eax
    je L2
    lea lea ecx, [ecx]
    sar sar eax, 1
    inc inc esi
    test test eax, eax
    jne L1
    cmp cmp esi, 11
    jle L3
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [ecx + 20], 6
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx]
    add add esp, 4
    inc inc dword ptr [edi + esi*4]
    xor xor edi, edi
    mov mov ebx, 010191204h
    jmp L4
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [ebx]
    mov mov ecx, dword ptr [esp + 24]
    movsx movsx eax, word ptr [ecx + eax*2]
    test test eax, eax
    jne L5
L2:
    inc inc edi
    jmp sub_10044719
    cmp cmp edi, 15
    jle sub_100446DA
    mov mov edx, dword ptr [ebp + 03C0h]
    lea lea ecx, [edi - 16]
    shr shr ecx, 4
    inc inc ecx
    mov mov esi, ecx
    neg neg esi
    shl shl esi, 4
    add add edi, esi
    add add ecx, edx
    mov mov dword ptr [ebp + 03C0h], ecx
    test test eax, eax
    jge sub_10044702
    neg neg eax
    sar sar eax, 1
    test test eax, eax
    mov mov esi, 1
    je sub_1004473B
    sar sar eax, 1
    inc inc esi
    test test eax, eax
    jne sub_10044721
    cmp cmp esi, 10
    jle sub_10044747
    mov mov eax, dword ptr [esp + 20]
    mov mov edx, dword ptr [eax]
    mov mov dword ptr [edx + 20], 6
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx]
    add add esp, 4
    shl shl edi, 4
    add add edi, esi
    mov mov ecx, dword ptr [ebp + edi*4]
L5:
    lea lea eax, [ebp + edi*4]
    inc inc ecx
    mov mov dword ptr [eax], ecx
    xor xor edi, edi
    add add ebx, 4
    cmp cmp ebx, 010191300h
    jl sub_10044717
    test test edi, edi
    pop pop esi
    pop pop ebx
    jle sub_100447AD
    inc inc dword ptr [ebp]
FUN_100445f0 ENDP
END
