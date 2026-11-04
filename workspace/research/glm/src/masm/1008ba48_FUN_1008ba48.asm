.686
.MODEL FLAT, C
EXTRN sub_1008546F:PROC
EXTRN sub_10086238:PROC
EXTRN sub_1008623E:PROC
EXTRN sub_1008AAD8:PROC
.CODE
FUN_1008ba48 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 8]
    xor ebx, ebx
    cmp eax, ebx
    push edi
    mov dword ptr [ebp - 4], ebx
    jbe L2
    mov ecx, dword ptr [esi + 20]
L0:
    mov edx, dword ptr [ecx]
    mov edx, dword ptr [edx + 12]
    cmp edx, dword ptr [ebp - 4]
    jbe L1
    cmp edx, -1
    je L1
    mov dword ptr [ebp - 4], edx
L1:
    add ecx, 4
    dec eax
    jne L0
L2:
    inc dword ptr [ebp - 4]
    cmp dword ptr [esi + 12], ebx
    mov dword ptr [ebp - 12], ebx
    jbe L13
L3:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 12]
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi + 12]
    cmp eax, ebx
    jbe L6
    mov edx, dword ptr [edi + 16]
    mov dword ptr [ebp - 16], eax
L4:
    mov ebx, dword ptr [edx]
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + ebx*4]
    cmp dword ptr [ecx + 68], -1
    jne L5
    mov ecx, dword ptr [ecx + 4]
    mov ebx, dword ptr [esi + 16]
    mov ecx, dword ptr [ebx + ecx*4]
    test byte ptr [ecx + 4], 32
    je L5
    dec eax
L5:
    add edx, 4
    dec dword ptr [ebp - 16]
    jne L4
    xor ebx, ebx
L6:
    cmp eax, dword ptr [edi + 12]
    je L12
    cmp eax, ebx
    mov dword ptr [ebp - 16], ebx
    je L7
    push eax
    push eax
    and eax, 0000FFFFFh
    or eax, 010000000h
    push eax
    mov ecx, esi
    call sub_1008623E
    cmp eax, -1
    je L18
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [ecx + eax*4]
    push edi
    mov ecx, eax
    mov dword ptr [ebp - 16], eax
    call sub_1008546F
L7:
    cmp dword ptr [edi + 12], ebx
    mov dword ptr [ebp - 8], ebx
    jbe L11
    mov dword ptr [ebp - 20], ebx
L8:
    mov eax, dword ptr [edi + 16]
    fldz
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [esi + 20]
    mov ebx, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ebx + 4]
    mov eax, dword ptr [ecx + eax*4]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push dword ptr [ebx + 16]
    mov ecx, esi
    push dword ptr [ebp - 4]
    mov dword ptr [ebp - 24], eax
    push dword ptr [esi + 000000088h]
    call sub_10086238
    cmp dword ptr [ebx + 68], -1
    jne L9
    mov ecx, dword ptr [ebp - 24]
    test byte ptr [ecx + 4], 32
    jne L10
L9:
    mov ecx, dword ptr [edi + 16]
    mov ebx, dword ptr [ebp - 8]
    mov ebx, dword ptr [ecx + ebx*4]
    mov ecx, dword ptr [ebp - 20]
    mov edx, dword ptr [ebp - 16]
    mov edx, dword ptr [edx + 16]
    mov dword ptr [ecx + edx], ebx
    mov edx, dword ptr [ebp - 16]
    mov edx, dword ptr [edx + 8]
    mov dword ptr [ecx + edx], eax
    add ecx, 4
    mov dword ptr [ebp - 20], ecx
L10:
    mov ecx, dword ptr [ebp - 8]
    mov edx, dword ptr [edi + 16]
    mov dword ptr [edx + ecx*4], eax
    inc ecx
    cmp ecx, dword ptr [edi + 12]
    mov dword ptr [ebp - 8], ecx
    jb L8
    xor ebx, ebx
L11:
    inc dword ptr [ebp - 4]
L12:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [esi + 12]
    jb L3
L13:
    mov ecx, esi
    call sub_1008AAD8
    cmp eax, ebx
    jl L17
    xor ecx, ecx
    cmp dword ptr [esi + 8], ebx
    jbe L16
L14:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    cmp dword ptr [eax + 72], -1
    jne L15
    cmp dword ptr [eax + 84], -1
    jne L15
    mov edx, dword ptr [esi + 116]
    mov dword ptr [eax + 4], edx
L15:
    inc ecx
    cmp ecx, dword ptr [esi + 8]
    jb L14
L16:
    xor eax, eax
L17:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L18:
    mov eax, 08007000Eh
    jmp L17
FUN_1008ba48 ENDP
END
