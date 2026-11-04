.686
.MODEL FLAT, C
EXTRN sub_1008704F:PROC
EXTRN sub_100885C7:PROC
EXTRN sub_100889C7:PROC
EXTRN sub_10088E93:PROC
EXTRN sub_1008905B:PROC
EXTRN sub_1008A98B:PROC
EXTRN sub_1008A9E0:PROC
.CODE
FUN_1008f667 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    push ebx
    push esi
    push edi
    mov esi, ecx
    call sub_1008A98B
    xor ebx, ebx
    xor edx, edx
    cmp dword ptr [esi + 8], ebx
    jbe L2
L0:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + edx*4]
    mov edi, dword ptr [esi + 16]
    mov ecx, dword ptr [eax + 4]
    mov ecx, dword ptr [edi + ecx*4]
    mov dword ptr [eax + 64], ebx
    test byte ptr [ecx + 4], 64
    jne L1
    or dword ptr [eax + 12], 0FFFFFFFFh
    or dword ptr [eax + 16], 0FFFFFFFFh
L1:
    inc edx
    cmp edx, dword ptr [esi + 8]
    jb L0
L2:
    xor eax, eax
    cmp dword ptr [esi + 12], ebx
    jbe L4
L3:
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + eax*4]
    mov dword ptr [ecx + 36], ebx
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + eax*4]
    inc eax
    mov dword ptr [ecx + 40], ebx
    cmp eax, dword ptr [esi + 12]
    jb L3
L4:
    mov ecx, esi
    call sub_1008A9E0
    mov eax, dword ptr [esi + 12]
    cmp eax, ebx
    mov dword ptr [ebp - 8], eax
    jbe L13
L5:
    mov ecx, dword ptr [esi + 24]
    dec eax
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax]
    mov edx, ecx
    and edx, 0FFF00000h
    je L12
    mov edi, dword ptr [esi + 12]
    and ecx, 0F0000000h
    cmp ecx, 010000000h
    jb L6
    cmp ecx, 040000000h
    ja L6
    push eax
    mov ecx, esi
    call sub_100885C7
    jmp L8
L6:
    cmp edx, 050000000h
    mov ecx, esi
    push eax
    jne L7
    call sub_100889C7
    jmp L8
L7:
    call sub_10088E93
L8:
    cmp eax, ebx
    jl L27
    mov ebx, dword ptr [esi + 12]
    cmp edi, ebx
    mov dword ptr [ebp - 4], edi
    jae L10
L9:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 4]
    push dword ptr [eax + ecx*4]
    mov ecx, esi
    call sub_1008905B
    test eax, eax
    jl L27
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], ebx
    jb L9
L10:
    mov ecx, ebx
    sub ecx, edi
    shr ecx, 1
    je L12
    mov eax, ebx
    shl edi, 2
    shl eax, 2
    mov dword ptr [ebp - 4], ecx
L11:
    mov ecx, dword ptr [esi + 24]
    lea edx, [edi + ecx]
    mov ecx, dword ptr [eax + ecx - 4]
    mov ebx, dword ptr [edx]
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [esi + 24]
    mov dword ptr [eax + ecx - 4], ebx
    add edi, 4
    sub eax, 4
    dec dword ptr [ebp - 4]
    jne L11
L12:
    mov eax, dword ptr [ebp - 12]
    xor ebx, ebx
    cmp eax, ebx
    ja L5
    mov eax, dword ptr [ebp - 8]
L13:
    mov edx, dword ptr [esi + 12]
    sub edx, eax
    shr edx, 1
    mov dword ptr [ebp - 4], ebx
    je L15
    mov ecx, eax
    shl ecx, 2
    mov dword ptr [ebp - 12], ecx
L14:
    mov ebx, dword ptr [esi + 12]
    mov eax, dword ptr [esi + 24]
    sub ebx, dword ptr [ebp - 4]
    add ecx, eax
    mov edi, dword ptr [ecx]
    mov eax, dword ptr [eax + ebx*4 - 4]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esi + 12]
    sub eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + 24]
    inc dword ptr [ebp - 4]
    mov dword ptr [ecx + eax*4 - 4], edi
    mov ecx, dword ptr [ebp - 12]
    add ecx, 4
    cmp dword ptr [ebp - 4], edx
    mov dword ptr [ebp - 12], ecx
    jb L14
L15:
    xor edi, edi
    xor eax, eax
    cmp dword ptr [ebp - 8], edi
    jbe L17
L16:
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + eax*4]
    inc eax
    cmp eax, dword ptr [ebp - 8]
    mov dword ptr [ecx], edi
    jb L16
L17:
    mov ecx, esi
    call sub_1008704F
    cmp eax, edi
    jl L27
    xor ecx, ecx
    cmp dword ptr [esi + 4], edi
    jbe L20
L18:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ecx*4]
    test byte ptr [eax + 4], 64
    jne L19
    mov dword ptr [eax + 16], edi
L19:
    inc ecx
    cmp ecx, dword ptr [esi + 4]
    jb L18
L20:
    cmp dword ptr [esi + 12], edi
    mov dword ptr [ebp - 4], edi
    jbe L26
    jmp L22
L21:
    xor edi, edi
L22:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + ecx*4]
    test word ptr [eax + 2], 00000FFF0h
    je L25
    mov edx, dword ptr [eax + 12]
    cmp edx, edi
    je L25
    mov ecx, dword ptr [eax + 16]
    mov ecx, dword ptr [ecx]
    mov edi, dword ptr [esi + 20]
    mov ecx, dword ptr [edi + ecx*4]
    mov ecx, dword ptr [ecx + 4]
    mov edi, dword ptr [esi + 16]
    mov edi, dword ptr [edi + ecx*4]
    test byte ptr [edi + 4], 64
    jne L25
    xor ecx, ecx
    test edx, edx
    jbe L24
L23:
    mov edx, dword ptr [eax + 16]
    mov edx, dword ptr [edx + ecx*4]
    mov ebx, dword ptr [esi + 20]
    mov edx, dword ptr [ebx + edx*4]
    mov ebx, dword ptr [edi + 16]
    mov dword ptr [edx + 16], ecx
    inc ecx
    mov dword ptr [edx + 12], ebx
    cmp ecx, dword ptr [eax + 12]
    jb L23
L24:
    inc dword ptr [edi + 16]
L25:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 12]
    jb L21
L26:
    xor eax, eax
L27:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_1008f667 ENDP
END
