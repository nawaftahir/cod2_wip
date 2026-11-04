.686
.MODEL FLAT, C
EXTRN sub_100C9C45:PROC
EXTRN sub_100C9C71:PROC
EXTRN sub_100CB2A6:PROC
.CODE
FUN_100cb349 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 48
    mov eax, dword ptr [ebp + 24]
    cmp dword ptr [ebp + 20], eax
    push esi
    mov esi, ecx
    jbe L0
    cmp eax, 1
    jne L0
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ebp + 16]
    cmp eax, dword ptr [ecx]
    jne L0
    push 0
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_100CB2A6
    jmp L22
L0:
    mov ecx, dword ptr [ebp + 16]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [esi + 20]
    push ebx
    mov ebx, dword ptr [ebp + 12]
    mov eax, dword ptr [ebx]
    shl ecx, 2
    shl eax, 2
    push edi
    mov edi, dword ptr [ecx + edx]
    mov edx, dword ptr [edx + eax]
    mov edx, dword ptr [edx + 4]
    cmp edx, dword ptr [edi + 4]
    jne L1
    mov edx, dword ptr [esi + 20]
    mov edi, dword ptr [edx + ecx]
    mov edx, dword ptr [edx + eax]
    mov edx, dword ptr [edx + 8]
    cmp edx, dword ptr [edi + 8]
    jne L1
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [edx + eax]
    mov ecx, dword ptr [edx + ecx]
    mov eax, dword ptr [eax + 12]
    cmp eax, dword ptr [ecx + 12]
    je L2
L1:
    and dword ptr [ebp - 8], 0
    jmp L14
L2:
    xor ecx, ecx
    cmp ecx, dword ptr [ebp + 20]
    jae L8
L3:
    and dword ptr [ebp + 24], 0
    test ecx, ecx
    jbe L6
    mov edx, dword ptr [ebp + 16]
    mov edx, dword ptr [edx + ecx*4]
    mov eax, dword ptr [esi + 20]
    mov edx, dword ptr [eax + edx*4]
    mov edx, dword ptr [edx + 16]
L4:
    mov edi, dword ptr [ebp + 24]
    mov edi, dword ptr [ebx + edi*4]
    mov edi, dword ptr [eax + edi*4]
    cmp edx, dword ptr [edi + 16]
    je L5
    inc dword ptr [ebp + 24]
    cmp dword ptr [ebp + 24], ecx
    jb L4
L5:
    cmp dword ptr [ebp + 24], ecx
    jb L7
L6:
    inc ecx
    cmp ecx, dword ptr [ebp + 20]
    jb L3
L7:
    cmp ecx, dword ptr [ebp + 20]
L8:
    sbb eax, eax
    neg eax
    mov dword ptr [ebp - 8], eax
    je L14
    xor ecx, ecx
    xor edi, edi
    cmp dword ptr [ebp + 20], ecx
    jbe L11
    mov edx, dword ptr [esi + 20]
L9:
    mov eax, dword ptr [ebx + ecx*4]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 16]
    cmp edi, eax
    ja L10
    lea edi, [eax + 1]
L10:
    inc ecx
    cmp ecx, dword ptr [ebp + 20]
    jb L9
L11:
    mov eax, dword ptr [esi]
    push 0
    push 0
    push edi
    lea ecx, [ebp - 48]
    push ecx
    push dword ptr [esi + 0000000FCh]
    mov ecx, esi
    call dword ptr [eax + 0x80]
    xor ecx, ecx
    cmp eax, ecx
    jl L21
    cmp dword ptr [ebp + 20], ecx
    jbe L13
    mov eax, dword ptr [esi + 20]
    mov edx, ebx
    lea edi, [ebp - 32]
    sub edx, edi
L12:
    lea edi, [edx + ecx*4]
    mov edi, dword ptr [ebp + edi - 32]
    mov edi, dword ptr [eax + edi*4]
    mov edi, dword ptr [edi + 16]
    mov edi, dword ptr [ebp + edi*4 - 48]
    mov dword ptr [ebp + ecx*4 - 32], edi
    inc ecx
    cmp ecx, dword ptr [ebp + 20]
    jb L12
L13:
    mov dword ptr [ebp - 16], ebx
    lea ebx, [ebp - 32]
    mov dword ptr [ebp + 12], ebx
L14:
    xor edi, edi
    cmp dword ptr [ebp + 20], edi
    jbe L19
L15:
    lea edx, [edi + 1]
    cmp edx, dword ptr [ebp + 20]
    mov dword ptr [ebp + 24], 1
    jae L18
    mov eax, dword ptr [ebp + 16]
    lea ecx, [eax + edi*4]
    mov ebx, dword ptr [ecx]
    mov eax, dword ptr [esi + 20]
    mov ebx, dword ptr [eax + ebx*4]
    mov ebx, dword ptr [ebx + 16]
    mov dword ptr [ebp - 12], ebx
    mov dword ptr [ebp - 4], edx
    add ecx, 4
L16:
    mov edx, dword ptr [ecx]
    mov edx, dword ptr [eax + edx*4]
    mov ebx, dword ptr [ebp - 12]
    cmp dword ptr [edx + 16], ebx
    jne L17
    inc dword ptr [ebp + 24]
    inc dword ptr [ebp - 4]
    mov edx, dword ptr [ebp - 4]
    add ecx, 4
    cmp edx, dword ptr [ebp + 20]
    jb L16
L17:
    mov ebx, dword ptr [ebp + 12]
L18:
    xor eax, eax
    push eax
    push dword ptr [ebp + 28]
    mov ecx, esi
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    push eax
    push eax
    mov eax, dword ptr [ebp + 16]
    lea eax, [eax + edi*4]
    push eax
    push dword ptr [ebp + 24]
    lea eax, [ebx + edi*4]
    push eax
    push dword ptr [ebp + 8]
    call sub_100C9C45
    test eax, eax
    jl L21
    add edi, dword ptr [ebp + 24]
    cmp edi, dword ptr [ebp + 20]
    jb L15
L19:
    xor eax, eax
    cmp dword ptr [ebp - 8], eax
    je L20
    push eax
    push eax
    push eax
    push eax
    push dword ptr [ebp + 20]
    mov ecx, esi
    push eax
    push eax
    push ebx
    push dword ptr [ebp + 20]
    push dword ptr [ebp - 16]
    push 1
    call sub_100C9C71
    test eax, eax
    jl L21
L20:
    xor eax, eax
L21:
    pop edi
    pop ebx
L22:
    pop esi
    leave
    ret 28
FUN_100cb349 ENDP
END
