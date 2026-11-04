.686
.MODEL FLAT, C
EXTRN sub_10044077:PROC
EXTRN sub_1004408E:PROC
EXTRN sub_100440D7:PROC
EXTRN sub_10044145:PROC
EXTRN sub_10044158:PROC
EXTRN sub_1004418E:PROC
.CODE
FUN_10044140 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 20]
    push esi
    mov esi, eax
    mov eax, dword ptr [esp + 16]
    push edi
    movsx edi, word ptr [eax]
    sub edi, dword ptr [esp + 24]
    mov eax, edi
    jns L0
    neg eax
    dec edi
L0:
    xor ebx, ebx
    test eax, eax
    je L2
L1:
    sar eax, 1
    inc ebx
    test eax, eax
    jne L1
    cmp ebx, 11
    jle L2
    mov ecx, dword ptr [esi + 32]
    mov edx, dword ptr [ecx]
    mov dword ptr [edx + 20], 6
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx]
    add esp, 4
L2:
    mov edx, dword ptr [ebp + ebx*4]
    movsx eax, byte ptr [ebx + ebp + 000000400h]
    push edx
    call sub_10044077
    add esp, 4
    test al, al
    je L12
    test ebx, ebx
    je L3
    push edi
    mov eax, ebx
    call sub_1004408E
    add esp, 4
    test al, al
    je L12
L3:
    mov eax, 010191204h
    xor ebx, ebx
    mov dword ptr [esp + 24], eax
L4:
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [esp + 20]
    movsx edi, word ptr [edx + ecx*2]
    test edi, edi
    jne L5
    inc ebx
    jmp L11
L5:
    cmp ebx, 15
    jle L7
    lea ecx, [ecx]
L6:
    mov ecx, dword ptr [esp + 32]
    movsx eax, byte ptr [ecx + 0000004F0h]
    mov ecx, dword ptr [ecx + 0000003C0h]
    push ecx
    call sub_100440D7
    add esp, 4
    test al, al
    je L12
    sub ebx, 16
    cmp ebx, 15
    jg L6
L7:
    test edi, edi
    mov dword ptr [esp + 28], edi
    jge L8
    mov eax, dword ptr [esp + 28]
    neg edi
    dec eax
    mov dword ptr [esp + 28], eax
L8:
    sar edi, 1
    test edi, edi
    mov ebp, 1
    je L10
L9:
    sar edi, 1
    inc ebp
    test edi, edi
    jne L9
    cmp ebp, 10
    jle L10
    mov edx, dword ptr [esi + 32]
    mov eax, dword ptr [edx]
    mov dword ptr [eax + 20], 6
    mov eax, dword ptr [esi + 32]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx]
    add esp, 4
L10:
    mov ecx, dword ptr [esp + 32]
    shl ebx, 4
    add ebx, ebp
    mov edx, dword ptr [ecx + ebx*4]
    movsx eax, byte ptr [ebx + ecx + 000000400h]
    push edx
    call sub_10044145
    add esp, 4
    test al, al
    je L12
    mov eax, dword ptr [esp + 28]
    push eax
    mov eax, ebp
    call sub_10044158
    add esp, 4
    test al, al
    je L12
    mov eax, dword ptr [esp + 24]
    xor ebx, ebx
L11:
    add eax, 4
    cmp eax, 010191300h
    mov dword ptr [esp + 24], eax
    jl L4
    test ebx, ebx
    jle L13
    mov ecx, dword ptr [esp + 32]
    movsx eax, byte ptr [ecx + 000000400h]
    mov ecx, dword ptr [ecx]
    push ecx
    call sub_1004418E
    add esp, 4
    test al, al
    jne L13
L12:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
L13:
    pop edi
    pop esi
    pop ebp
    mov al, 1
    pop ebx
    ret
FUN_10044140 ENDP
END
