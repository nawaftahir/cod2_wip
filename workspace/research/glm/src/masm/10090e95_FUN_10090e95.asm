.686
.MODEL FLAT, C
EXTRN sub_1008546A:PROC
EXTRN sub_1008A9BE:PROC
.CODE
FUN_10090e95 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 36
    and dword ptr [ebp - 32], 0
    and dword ptr [ebp - 4], 0
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 8]
    test eax, eax
    push edi
    jbe L2
    mov edi, dword ptr [esi + 000000088h]
    mov edx, dword ptr [esi + 20]
L0:
    mov ecx, dword ptr [edx]
    cmp edi, dword ptr [ecx + 4]
    jne L1
    mov ecx, dword ptr [ecx + 12]
    cmp dword ptr [ebp - 4], ecx
    ja L1
    inc ecx
    mov dword ptr [ebp - 4], ecx
L1:
    add edx, 4
    dec eax
    jne L0
L2:
    mov ecx, esi
    call sub_1008A9BE
    and dword ptr [ebp - 20], 0
    cmp dword ptr [esi + 12], 0
    jbe L13
L3:
    mov ecx, dword ptr [ebp - 20]
    mov eax, dword ptr [esi + 24]
    mov ebx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebx]
    test ecx, 0FFF00000h
    mov dword ptr [ebp - 28], ebx
    je L12
    mov eax, dword ptr [ebx + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    and dword ptr [ebx + 36], 0
    and dword ptr [ebp - 16], 0
    test eax, eax
    mov dword ptr [ebp - 36], eax
    jbe L12
L4:
    lea eax, [ebp - 24]
    push eax
    push dword ptr [ebp - 16]
    mov ecx, ebx
    call sub_1008546A
    mov ecx, dword ptr [esi + 20]
    mov edx, dword ptr [esi + 000000088h]
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [ebp - 24]
    mov eax, dword ptr [eax]
    mov edi, dword ptr [ecx + eax*4]
    cmp edx, dword ptr [edi + 4]
    jne L11
    cmp dword ptr [ebp - 12], 1
    mov dword ptr [ebp - 8], 1
    jbe L8
L5:
    mov eax, dword ptr [ebp - 24]
    mov ebx, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + ebx*4]
    mov eax, dword ptr [ecx + eax*4]
    cmp edx, dword ptr [eax + 4]
    jne L6
    mov eax, dword ptr [eax + 72]
    cmp eax, dword ptr [edi + 72]
    jne L7
L6:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 12]
    jb L5
L7:
    mov ebx, dword ptr [ebp - 28]
L8:
    mov eax, dword ptr [ebp - 12]
    cmp dword ptr [ebp - 8], eax
    je L11
    xor ecx, ecx
    test eax, eax
    jbe L11
L9:
    mov eax, dword ptr [ebp - 24]
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [esi + 000000088h]
    cmp edx, dword ptr [eax + 4]
    jne L10
    mov eax, dword ptr [eax + 72]
    mov edx, dword ptr [esi + 24]
    mov eax, dword ptr [edx + eax*4]
    mov dword ptr [eax + 36], 1
L10:
    inc ecx
    cmp ecx, dword ptr [ebp - 12]
    jb L9
L11:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    cmp eax, dword ptr [ebp - 36]
    jb L4
L12:
    inc dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [esi + 12]
    jb L3
L13:
    and dword ptr [ebp - 16], 0
    cmp dword ptr [esi + 12], 0
    jbe L24
L14:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + ecx*4]
    test word ptr [eax + 2], 00000FFF0h
    je L23
    cmp dword ptr [eax + 36], 0
    jne L23
    mov ebx, dword ptr [eax + 16]
    mov edi, dword ptr [esi + 20]
    mov ecx, dword ptr [ebx]
    mov ecx, dword ptr [edi + ecx*4]
    mov edx, dword ptr [esi + 000000088h]
    cmp edx, dword ptr [ecx + 4]
    jne L23
    mov edx, dword ptr [eax + 12]
    xor ecx, ecx
    cmp dword ptr [ebp + 8], ecx
    je L18
    test edx, edx
    jbe L16
    mov dword ptr [ebp - 24], ebx
L15:
    mov ebx, dword ptr [ebp - 24]
    mov ebx, dword ptr [ebx]
    mov ebx, dword ptr [edi + ebx*4]
    cmp ecx, dword ptr [ebx + 16]
    jne L16
    add dword ptr [ebp - 24], 4
    inc ecx
    cmp ecx, edx
    jb L15
L16:
    cmp ecx, edx
    je L23
    xor ecx, ecx
    test edx, edx
    jbe L22
L17:
    mov edx, dword ptr [eax + 16]
    mov edx, dword ptr [edx + ecx*4]
    mov edi, dword ptr [esi + 20]
    mov edx, dword ptr [edi + edx*4]
    mov edi, dword ptr [ebp - 4]
    mov dword ptr [edx + 12], edi
    mov edx, dword ptr [eax + 16]
    mov edx, dword ptr [edx + ecx*4]
    mov edi, dword ptr [esi + 20]
    mov edx, dword ptr [edi + edx*4]
    mov dword ptr [edx + 16], ecx
    inc ecx
    cmp ecx, dword ptr [eax + 12]
    jb L17
    jmp L22
L18:
    cmp edx, ecx
    mov dword ptr [ebp - 20], ecx
    jbe L20
L19:
    mov ecx, dword ptr [ebx]
    mov ecx, dword ptr [edi + ecx*4]
    cmp dword ptr [ecx + 16], 0
    je L20
    inc dword ptr [ebp - 20]
    add ebx, 4
    cmp dword ptr [ebp - 20], edx
    jb L19
L20:
    cmp dword ptr [ebp - 20], edx
    jb L23
    xor ecx, ecx
    test edx, edx
    jbe L22
L21:
    mov edx, dword ptr [eax + 16]
    mov edx, dword ptr [edx + ecx*4]
    mov edi, dword ptr [esi + 20]
    mov edx, dword ptr [edi + edx*4]
    mov edi, dword ptr [ebp - 4]
    inc ecx
    mov dword ptr [edx + 12], edi
    cmp ecx, dword ptr [eax + 12]
    jb L21
L22:
    inc dword ptr [ebp - 4]
    mov dword ptr [ebp - 32], 1
L23:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    cmp eax, dword ptr [esi + 12]
    jb L14
L24:
    xor eax, eax
    cmp dword ptr [ebp - 32], eax
    pop edi
    pop esi
    sete al
    pop ebx
    leave
    ret 4
FUN_10090e95 ENDP
END
