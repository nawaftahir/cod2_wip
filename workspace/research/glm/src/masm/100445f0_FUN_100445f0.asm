.686
.MODEL FLAT, C
EXTRN sub_100447AD:PROC
.CODE
FUN_100445f0 PROC
    push ebp
    mov ebp, dword ptr [esp + 16]
    push edi
    mov edi, eax
    mov eax, dword ptr [esp + 16]
    movsx eax, word ptr [eax]
    sub eax, ecx
    jns L0
    neg eax
L0:
    push ebx
    push esi
    xor esi, esi
    test eax, eax
    je L2
    lea ecx, [ecx]
L1:
    sar eax, 1
    inc esi
    test eax, eax
    jne L1
    cmp esi, 11
    jle L2
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [eax]
    mov dword ptr [ecx + 20], 6
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx]
    add esp, 4
L2:
    inc dword ptr [edi + esi*4]
    xor edi, edi
    mov ebx, 010191204h
    jmp L3
    lea ecx, [ecx]
L3:
    mov eax, dword ptr [ebx]
    mov ecx, dword ptr [esp + 24]
    movsx eax, word ptr [ecx + eax*2]
    test eax, eax
    jne L4
    inc edi
    jmp L9
L4:
    cmp edi, 15
    jle L5
    mov edx, dword ptr [ebp + 0000003C0h]
    lea ecx, [edi - 16]
    shr ecx, 4
    inc ecx
    mov esi, ecx
    neg esi
    shl esi, 4
    add edi, esi
    add ecx, edx
    mov dword ptr [ebp + 0000003C0h], ecx
L5:
    test eax, eax
    jge L6
    neg eax
L6:
    sar eax, 1
    test eax, eax
    mov esi, 1
    je L8
L7:
    sar eax, 1
    inc esi
    test eax, eax
    jne L7
    cmp esi, 10
    jle L8
    mov eax, dword ptr [esp + 20]
    mov edx, dword ptr [eax]
    mov dword ptr [edx + 20], 6
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx]
    add esp, 4
L8:
    shl edi, 4
    add edi, esi
    mov ecx, dword ptr [ebp + edi*4]
    lea eax, [ebp + edi*4]
    inc ecx
    mov dword ptr [eax], ecx
    xor edi, edi
L9:
    add ebx, 4
    cmp ebx, 010191300h
    jl L3
    test edi, edi
    pop esi
    pop ebx
    jle sub_100447AD
    inc dword ptr [ebp]
FUN_100445f0 ENDP
END
