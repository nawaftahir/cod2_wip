.686
.MODEL FLAT, C
EXTRN sub_10087006:PROC
EXTRN sub_1008707D:PROC
EXTRN sub_100870CC:PROC
EXTRN sub_1008A98B:PROC
.CODE
FUN_1008d61e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    push esi
    push edi
    mov edi, ecx
    call sub_1008A98B
    xor ebx, ebx
    cmp dword ptr [edi + 8], ebx
    jbe L3
L0:
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + ebx*4]
    mov edx, dword ptr [edi + 16]
    mov ecx, dword ptr [eax + 4]
    mov esi, dword ptr [edx + ecx*4]
    and dword ptr [eax], 0FFFFFFDFh
    mov edx, dword ptr [esi + 4]
    test dl, 16
    mov ecx, dword ptr [eax]
    je L1
    test dh, 2
    jne L1
    or ecx, 32
    mov dword ptr [eax], ecx
L1:
    test byte ptr [esi + 5], 8
    je L2
    or dword ptr [eax], 32
L2:
    inc ebx
    cmp ebx, dword ptr [edi + 8]
    jb L0
L3:
    and dword ptr [ebp - 8], 0
    cmp dword ptr [edi + 12], 0
    jbe L21
L4:
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 8]
    mov esi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi]
    mov ecx, eax
    and ecx, 0FFF00000h
    je L20
    cmp ecx, 050100000h
    je L18
    cmp ecx, 011000000h
    je L18
    cmp ecx, 011200000h
    je L18
    and eax, 0F0000000h
    cmp eax, 060000000h
    je L18
    cmp ecx, 010F00000h
    je L16
    cmp ecx, 011100000h
    je L16
    cmp ecx, 011400000h
    je L16
    xor ebx, ebx
    cmp dword ptr [esi + 12], ebx
    jbe L7
L5:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [edi + 20]
    mov eax, dword ptr [eax + ebx*4]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 4]
    mov edx, dword ptr [edi + 16]
    mov ecx, dword ptr [edx + ecx*4]
    test byte ptr [ecx + 5], 16
    je L6
    push dword ptr [eax + 20]
    mov ecx, edi
    call sub_10087006
    test eax, eax
    je L6
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ebx*4]
    mov ecx, dword ptr [edi + 20]
    mov eax, dword ptr [ecx + eax*4]
    or dword ptr [eax], 32
L6:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L5
L7:
    mov ecx, dword ptr [esi]
    mov eax, ecx
    and eax, 0F0000000h
    cmp eax, 010000000h
    jb L12
    cmp eax, 040000000h
    ja L12
    mov eax, dword ptr [esi + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    and dword ptr [ebp - 4], 0
    mov dword ptr [ebp - 16], eax
    mov eax, dword ptr [esi + 12]
    test eax, eax
    jbe L20
L8:
    and dword ptr [ebp - 12], 0
    cmp dword ptr [ebp - 16], 0
    jbe L11
    mov ebx, dword ptr [esi + 8]
    shl eax, 2
    mov dword ptr [ebp - 20], eax
    mov eax, dword ptr [ebp - 4]
    shl eax, 2
    add ebx, eax
L9:
    push dword ptr [ebx]
    mov ecx, edi
    call sub_1008707D
    test eax, eax
    jne L10
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    add ebx, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebp - 16]
    jb L9
    jmp L11
L10:
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ebp - 4]
    shl eax, 2
    mov eax, dword ptr [eax + ecx]
    mov ecx, dword ptr [edi + 20]
    mov eax, dword ptr [ecx + eax*4]
    or dword ptr [eax], 32
L11:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 12]
    cmp dword ptr [ebp - 4], eax
    jb L8
    jmp L20
L12:
    and dword ptr [ebp - 12], 0
    cmp dword ptr [esi + 4], 0
    jbe L20
    mov ebx, dword ptr [esi + 8]
L13:
    push dword ptr [ebx]
    mov ecx, edi
    call sub_100870CC
    test eax, eax
    jne L14
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    add ebx, 4
    cmp eax, dword ptr [esi + 4]
    jb L13
    jmp L20
L14:
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    jbe L20
L15:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edi + 20]
    mov eax, dword ptr [edx + eax*4]
    or dword ptr [eax], 32
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    jb L15
    jmp L20
L16:
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    jbe L20
L17:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edi + 20]
    mov eax, dword ptr [edx + eax*4]
    or dword ptr [eax], 32
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    jb L17
    jmp L20
L18:
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    jbe L20
L19:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edi + 20]
    mov eax, dword ptr [edx + eax*4]
    or dword ptr [eax], 32
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    jb L19
L20:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [edi + 12]
    jb L4
L21:
    xor ecx, ecx
    cmp dword ptr [edi + 8], ecx
    jbe L24
L22:
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [eax + 4]
    mov esi, dword ptr [edi + 16]
    mov edx, dword ptr [esi + edx*4]
    test byte ptr [edx + 4], 32
    je L23
    or dword ptr [eax], 32
L23:
    inc ecx
    cmp ecx, dword ptr [edi + 8]
    jb L22
L24:
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    leave
    ret
FUN_1008d61e ENDP
END
