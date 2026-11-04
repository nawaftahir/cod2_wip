.686
.MODEL FLAT, C
EXTRN sub_10063828:PROC
EXTRN sub_1006DFCC:PROC
EXTRN sub_10082897:PROC
EXTRN sub_10086312:PROC
.CODE
FUN_1006eb85 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 28
    push ebx
    push esi
    push edi
    xor edi, edi
    cmp dword ptr [ebp + 8], edi
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 12], edi
    mov dword ptr [ebp - 16], edi
    je L2
    cmp dword ptr [ebp + 20], edi
    jne L0
    mov eax, dword ptr [ebp + 36]
    cmp eax, edi
    je L0
    mov dword ptr [ebp + 28], eax
    lea eax, [ebp - 16]
    mov dword ptr [ebp + 32], eax
    mov dword ptr [ebp + 20], 1
L0:
    cmp dword ptr [ebp + 24], edi
    jne L1
    mov esi, dword ptr [ebp + 40]
    cmp esi, edi
    je L1
    cmp dword ptr [ecx + 000000084h], edi
    je L6
L1:
    mov ecx, dword ptr [ebp - 4]
    lea eax, [ebp - 12]
    push eax
    push dword ptr [ebp + 32]
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call sub_1006DFCC
    cmp eax, edi
    jl L4
L2:
    mov eax, dword ptr [ebp + 44]
    cmp eax, edi
    je L3
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [eax], ecx
L3:
    xor eax, eax
L4:
    pop edi
    pop esi
    pop ebx
    leave
    ret 40
L5:
    mov esi, dword ptr [ebp + 40]
L6:
    mov eax, dword ptr [esi + 8]
    cmp dword ptr [eax + 4], 17
    mov dword ptr [ebp + 36], edi
    mov dword ptr [ebp - 8], edi
    jne L9
    mov ecx, dword ptr [eax + 20]
    mov eax, dword ptr [eax + 16]
    test eax, eax
    mov ebx, dword ptr [ecx + 24]
    je L8
    lea ecx, [ebp - 28]
    push ecx
    push 0
    push dword ptr [eax + 24]
    call sub_10063828
    test eax, eax
    jl L9
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 16]
    cmp eax, dword ptr [ebp - 24]
    jne L7
    mov dword ptr [ebp + 36], ebx
    jmp L9
L7:
    and eax, 0FFFF0000h
    cmp eax, dword ptr [ebp - 24]
    jne L9
    mov edi, ebx
    jmp L9
L8:
    mov dword ptr [ebp - 8], ebx
L9:
    mov eax, dword ptr [esi + 12]
    xor ebx, ebx
    cmp dword ptr [ebp + 36], ebx
    mov dword ptr [ebp + 40], eax
    jne L12
    cmp edi, ebx
    je L10
    mov dword ptr [ebp + 36], edi
    jmp L11
L10:
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [ebp + 36], eax
L11:
    cmp dword ptr [ebp + 36], ebx
    je L21
L12:
    mov esi, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + 8]
    mov eax, dword ptr [ebp + 16]
    cmp eax, dword ptr [ecx + 4]
    jae L13
    mov edx, dword ptr [ecx + 16]
    mov eax, dword ptr [edx + eax*4]
    jmp L14
L13:
    xor eax, eax
L14:
    cmp eax, ebx
    je L22
    push eax
    call sub_10086312
    mov ecx, dword ptr [esi + 8]
    cmp eax, dword ptr [ecx + 4]
    mov dword ptr [ebp + 16], eax
    jae L15
    mov ecx, dword ptr [ecx + 16]
    mov ebx, dword ptr [ecx + eax*4]
L15:
    test ebx, ebx
    je L23
    mov eax, dword ptr [ebx + 4]
    test ah, 8
    jne L17
    mov ecx, dword ptr [ebp + 36]
    or eax, 000000840h
    test al, 16
    mov dword ptr [ebx], ecx
    mov dword ptr [ebx + 4], eax
    je L20
    test al, al
    js L20
    mov ecx, 000000200h
    test ecx, eax
    je L16
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [edx + 8]
    test dword ptr [edx + 112], ecx
    je L16
    or eax, 000000400h
    mov dword ptr [ebx + 4], eax
L16:
    mov eax, dword ptr [ebx + 4]
    test ecx, eax
    jne L20
    mov ecx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + 8]
    test byte ptr [ecx + 113], 4
    je L20
    or eax, 000100400h
    mov dword ptr [ebx + 4], eax
    jmp L20
L17:
    mov eax, dword ptr [ebx]
    lea edx, [eax + 1]
L18:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L18
    sub eax, edx
    mov esi, eax
    mov eax, dword ptr [ebp + 36]
    mov dword ptr [ebp - 8], esi
    lea edi, [eax + 1]
L19:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L19
    sub eax, edi
    mov dword ptr [ebp + 24], eax
    lea eax, [eax + esi + 3]
    push 4
    push eax
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    call sub_10082897
    test eax, eax
    je L23
    mov ecx, esi
    mov esi, dword ptr [ebx]
    mov edx, ecx
    shr ecx, 2
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebp - 8]
    mov esi, dword ptr [ebp + 36]
    lea edx, [eax + ecx]
    mov ecx, dword ptr [ebp + 24]
    mov byte ptr [edx], 59
    mov byte ptr [edx + 1], 32
    lea edi, [edx + 2]
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, edx
    mov edx, dword ptr [ebp - 8]
    add ecx, eax
    mov byte ptr [ecx + edx + 2], 0
    mov dword ptr [ebx], eax
L20:
    mov dword ptr [ebp + 24], 1
L21:
    xor edi, edi
    cmp dword ptr [ebp + 40], edi
    jne L5
    jmp L1
L22:
    mov eax, 080004005h
    jmp L4
L23:
    mov eax, 08007000Eh
    jmp L4
FUN_1006eb85 ENDP
END
