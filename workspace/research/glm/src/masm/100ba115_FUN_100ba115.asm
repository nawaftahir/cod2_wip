.686
.MODEL FLAT, C
EXTRN sub_1008B151:PROC
EXTRN sub_100F75DD:PROC
EXTRN sub_100F8705:PROC
EXTRN sub_100F8753:PROC
.CODE
FUN_100ba115 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [ebp + 12]
    and dword ptr [edi], 0
    mov ebx, ecx
    jmp L7
L0:
    movsx eax, al
    jmp L2
L1:
    inc esi
    movsx eax, byte ptr [esi]
L2:
    push eax
    call sub_100F8705
    test eax, eax
    pop ecx
    je L1
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F75DD
    pop ecx
    movsx ecx, byte ptr [ebp + 16]
    cmp eax, ecx
    jne L6
    xor edx, edx
    cmp dword ptr [edi], edx
    je L12
    mov ecx, dword ptr [ebx + 8]
    cmp ecx, edx
    jbe L10
    mov eax, dword ptr [ebx + 20]
    mov esi, ecx
L3:
    mov ecx, dword ptr [eax]
    mov edi, dword ptr [ecx + 4]
    cmp edi, dword ptr [ebp + 20]
    jne L4
    mov edx, ecx
L4:
    add eax, 4
    dec esi
    jne L3
    test edx, edx
    je L10
    mov eax, dword ptr [edx + 96]
    jmp L11
L5:
    inc esi
L6:
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F8753
    test eax, eax
    pop ecx
    jne L5
L7:
    mov al, byte ptr [esi]
    test al, al
    jne L0
L8:
    mov eax, 080004005h
L9:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 16
L10:
    xor eax, eax
L11:
    push 010119D48h
    push 00000119Dh
    push eax
    push ebx
    call sub_1008B151
    add esp, 16
    jmp L8
L12:
    mov dword ptr [edi], esi
    xor eax, eax
    jmp L9
FUN_100ba115 ENDP
END
