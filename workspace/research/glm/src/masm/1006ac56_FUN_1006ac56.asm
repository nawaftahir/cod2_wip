.686
.MODEL FLAT, C
EXTRN sub_100670C3:PROC
EXTRN sub_10068E79:PROC
.CODE
FUN_1006ac56 PROC
    mov edi, edi
    push ebx
    push esi
    mov ebx, ecx
    push edi
    lea esi, [ebx + 16]
    jmp L1
L0:
    mov eax, dword ptr [esi]
    cmp eax, 9
    jle L6
    sub eax, 10
    je L4
    dec eax
    dec eax
    jne L3
L1:
    mov ecx, dword ptr [ebx + 4]
    push esi
    call sub_100670C3
    test eax, eax
    jge L0
    xor ecx, ecx
    inc ecx
    mov dword ptr [ebx + 76], ecx
    mov dword ptr [ebx + 80], ecx
L2:
    or eax, 0FFFFFFFFh
    jmp L5
L3:
    dec eax
    je L2
L4:
    mov eax, 000000110h
L5:
    pop edi
    pop esi
    pop ebx
    ret
L6:
    je L9
    test eax, eax
    je L4
    xor ecx, ecx
    inc ecx
    cmp eax, ecx
    je L8
    jle L4
    cmp eax, 4
    jle L7
    cmp eax, 8
    jg L4
    mov eax, 00000010Fh
    jmp L5
L7:
    mov eax, 00000010Eh
    jmp L5
L8:
    cmp byte ptr [ebx + 25], 0
    jne L4
    movsx eax, byte ptr [ebx + 24]
    jmp L5
L9:
    mov eax, dword ptr [ebx + 24]
    mov edi, 01010F348h
    mov esi, eax
    push 11
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L10
    mov eax, 000000101h
    jmp L5
L10:
    push 5
    mov edi, 010198404h
    mov esi, eax
    pop ecx
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L11
    mov eax, 000000111h
    jmp L5
L11:
    mov esi, eax
    push 6
    mov edi, 0101983FCh
    pop ecx
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L12
    mov eax, 000000112h
    jmp L5
L12:
    cmp dword ptr [ebx + 56], -1
    je L13
    lea eax, [ebx + 16]
    push eax
    mov ecx, ebx
    call sub_10068E79
    jmp L5
L13:
    mov eax, 00000010Dh
    jmp L5
FUN_1006ac56 ENDP
END
