.686
.MODEL FLAT, C
EXTRN sub_100670C3:PROC
EXTRN sub_10068E79:PROC
EXTRN sub_1006AD3C:PROC
EXTRN sub_1006AD53:PROC
EXTRN sub_1006AD69:PROC
EXTRN sub_1006AD6F:PROC
EXTRN sub_1006AD73:PROC
EXTRN sub_1006AD9D:PROC
EXTRN sub_1006ADCB:PROC
EXTRN sub_1006ADEE:PROC
.CODE
FUN_1006ac56 PROC
    mov mov edi, edi
    push push ebx
    push push esi
    mov mov ebx, ecx
    push push edi
    lea lea esi, [ebx + 16]
    jmp L0
    mov mov eax, dword ptr [esi]
    cmp cmp eax, 9
    jle L4
    sub sub eax, 10
    je L2
    dec dec eax
    dec dec eax
    jne L3
    mov mov ecx, dword ptr [ebx + 4]
    push push esi
    call sub_100670C3
    test test eax, eax
    jge L1
    xor xor ecx, ecx
    inc inc ecx
    mov mov dword ptr [ebx + 76], ecx
    mov mov dword ptr [ebx + 80], ecx
    or or eax, -1
L1:
    jmp L6
    dec dec eax
    je L5
    mov mov eax, 0110h
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    je L15
    test test eax, eax
    je L7
    xor xor ecx, ecx
    inc inc ecx
    cmp cmp eax, ecx
    je L14
    jle L8
L2:
    cmp cmp eax, 4
    jle L14
    cmp cmp eax, 8
    jg L9
    mov mov eax, 010Fh
    jmp L10
    mov mov eax, 010Eh
    jmp L11
    cmp cmp byte ptr [ebx + 25], 0
    jne L12
    movsx movsx eax, byte ptr [ebx + 24]
    jmp L13
L6:
    mov mov eax, dword ptr [ebx + 24]
    mov mov edi, 01010F348h
    mov mov esi, eax
    push push 11
    pop pop ecx
L7:
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1006AD6F
    mov mov eax, 0101h
    jmp L16
    push push 5
    mov mov edi, 010198404h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1006AD9D
    mov mov eax, 0111h
    jmp sub_1006AD3C
    mov mov esi, eax
L11:
    push push 6
    mov mov edi, 0101983FCh
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
L13:
    jne sub_1006ADCB
    mov mov eax, 0112h
    jmp sub_1006AD53
    cmp cmp dword ptr [ebx + 56], -1
    je sub_1006ADEE
    lea lea eax, [ebx + 16]
    push push eax
    mov mov ecx, ebx
    call sub_10068E79
L16:
    jmp sub_1006AD69
    mov mov eax, 010Dh
    jmp sub_1006AD73
FUN_1006ac56 ENDP
END
