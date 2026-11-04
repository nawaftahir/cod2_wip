.686
.MODEL FLAT, C
EXTRN sub_1008B28B:PROC
.CODE
FUN_100aa1ac PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 28
    push ebx
    xor edx, edx
    mov ebx, ecx
    cmp dword ptr [ebx + 12], edx
    push esi
    push edi
    mov dword ptr [ebp - 4], edx
    jbe L14
L1:
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebp - 4]
    mov esi, dword ptr [eax + ecx*4]
    cmp esi, edx
    je L13
    cmp dword ptr [esi + 36], 1
    je L13
    cmp dword ptr [esi], edx
    je L13
    cmp dword ptr [esi + 12], edx
    mov dword ptr [ebp - 24], edx
    mov dword ptr [ebp - 12], edx
    jbe L13
L2:
    cmp dword ptr [ebp + 12], edx
    mov dword ptr [ebp - 8], edx
    jbe L9
L3:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp - 8]
    mov edx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [eax + 4]
    cmp ecx, dword ptr [ebx + 000000080h]
    jne L4
    cmp byte ptr [eax + 108], 3
    jne L16
L4:
    mov ecx, dword ptr [esi + 16]
    mov edi, dword ptr [ebp - 12]
    mov ecx, dword ptr [ecx + edi*4]
    cmp ecx, edx
    je L5
    cmp ecx, dword ptr [eax + 56]
    jne L7
L5:
    mov edi, dword ptr [esi]
    mov eax, dword ptr [esi + 4]
    xor edx, edx
    and edi, 0000FFFFFh
    div edi
    xor edx, edx
    mov dword ptr [ebp - 20], edx
    cmp eax, edx
    mov dword ptr [ebp - 28], eax
    jbe L8
    mov dword ptr [ebp - 16], edx
L6:
    push dword ptr [ebp + 20]
    mov eax, dword ptr [esi + 8]
    push dword ptr [ebp + 16]
    add eax, dword ptr [ebp - 16]
    push edi
    push eax
    mov ecx, ebx
    call L0
    test eax, eax
    jl L15
    inc dword ptr [ebp - 20]
    mov eax, edi
    shl eax, 2
    add dword ptr [ebp - 16], eax
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebp - 28]
    mov dword ptr [ebp - 24], 1
    jb L6
L7:
    xor edx, edx
L8:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp + 12]
    jb L3
L9:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [esi + 12]
    jb L2
    cmp dword ptr [ebp - 24], edx
    je L13
    mov eax, dword ptr [esi]
    mov ecx, eax
    and ecx, 0FFF00000h
    cmp ecx, 060000000h
    je L10
    cmp ecx, 060500000h
    je L10
    cmp ecx, 060A00000h
    je L10
    cmp ecx, 060F00000h
    je L10
    cmp ecx, 072C00000h
    je L10
    cmp ecx, 072D00000h
    je L10
    cmp ecx, 011000000h
    jne L12
L10:
    and eax, 0000FFFFFh
    lea ecx, [eax + eax]
    cmp eax, ecx
    mov dword ptr [ebp - 28], ecx
    jae L12
    mov ecx, dword ptr [esi + 8]
    lea ecx, [ecx + eax*4]
L11:
    mov edx, dword ptr [ebx + 20]
    mov edi, dword ptr [ecx]
    mov edi, dword ptr [edx + edi*4]
    mov edx, dword ptr [ebx + 000000088h]
    cmp dword ptr [edi + 4], edx
    je L17
    inc eax
    add ecx, 4
    cmp eax, dword ptr [ebp - 28]
    jb L11
    xor edx, edx
L12:
    mov eax, dword ptr [ebp + 20]
    mov ecx, dword ptr [eax]
    mov edi, dword ptr [ebp + 16]
    mov dword ptr [edi + ecx*4], esi
    mov ecx, dword ptr [ebx + 24]
    mov esi, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + esi*4]
    mov dword ptr [ecx + 36], 1
    inc dword ptr [eax]
L13:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebx + 12]
    jb L1
L14:
    xor eax, eax
L15:
    pop edi
    pop esi
    pop ebx
    leave
    ret 16
L16:
    push 010116D90h
    push 0000011A1h
    jmp L18
L17:
    push 010116D54h
    push 0000011B6h
L18:
    push dword ptr [esi + 60]
    push ebx
    call sub_1008B28B
    add esp, 16
    mov eax, 080004005h
    jmp L15
FUN_100aa1ac ENDP
END
