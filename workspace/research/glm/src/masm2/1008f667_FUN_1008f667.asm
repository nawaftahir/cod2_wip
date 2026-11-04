.686
.MODEL FLAT, C
EXTRN sub_1008704F:PROC
EXTRN sub_100885C7:PROC
EXTRN sub_100889C7:PROC
EXTRN sub_10088E93:PROC
EXTRN sub_1008905B:PROC
EXTRN sub_1008A98B:PROC
EXTRN sub_1008A9E0:PROC
EXTRN sub_1008F8A3:PROC
EXTRN sub_1008F934:PROC
EXTRN sub_1008F93C:PROC
EXTRN sub_1008F96C:PROC
EXTRN sub_1008F98D:PROC
EXTRN sub_1008F98E:PROC
EXTRN sub_1008F9DC:PROC
EXTRN sub_1008F9E2:PROC
EXTRN sub_1008FA07:PROC
EXTRN sub_1008FA44:PROC
EXTRN sub_1008FA66:PROC
EXTRN sub_1008FA68:PROC
EXTRN sub_1008FA70:PROC
EXTRN sub_1008FA77:PROC
EXTRN sub_1008FA91:PROC
EXTRN sub_1008FA94:PROC
.CODE
FUN_1008f667 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    call sub_1008A98B
    xor xor ebx, ebx
    xor xor edx, edx
    cmp cmp dword ptr [esi + 8], ebx
    jbe L0
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edi, dword ptr [esi + 16]
    mov mov ecx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [edi + ecx*4]
    mov mov dword ptr [eax + 64], ebx
    test test byte ptr [ecx + 4], 64
    jne L1
    or or dword ptr [eax + 12], -1
    or or dword ptr [eax + 16], -1
    inc inc edx
    cmp cmp edx, dword ptr [esi + 8]
    jb L0
    xor xor eax, eax
    cmp cmp dword ptr [esi + 12], ebx
    jbe L2
    mov mov ecx, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov dword ptr [ecx + 36], ebx
    mov mov ecx, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ecx + eax*4]
    inc inc eax
    mov mov dword ptr [ecx + 40], ebx
    cmp cmp eax, dword ptr [esi + 12]
    jb L2
    mov mov ecx, esi
    call sub_1008A9E0
    mov mov eax, dword ptr [esi + 12]
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 8], eax
    jbe L9
    mov mov ecx, dword ptr [esi + 24]
    dec dec eax
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax]
    mov mov edx, ecx
    and and edx, 0FFF00000h
    je L10
    mov mov edi, dword ptr [esi + 12]
    and and ecx, 0F0000000h
    cmp cmp ecx, 010000000h
    jb L3
    cmp cmp ecx, 040000000h
    ja L4
L2:
    push push eax
    mov mov ecx, esi
    call sub_100885C7
    jmp L5
    cmp cmp edx, 050000000h
    mov mov ecx, esi
    push push eax
    jne L6
    call sub_100889C7
    jmp L7
    call sub_10088E93
    cmp cmp eax, ebx
    jl sub_1008F96C
    mov mov ebx, dword ptr [esi + 12]
    cmp cmp edi, ebx
    mov mov dword ptr [ebp - 4], edi
    jae L11
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 4]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, esi
    call sub_1008905B
    test test eax, eax
    jl sub_1008F98E
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], ebx
    jb L11
    mov mov ecx, ebx
    sub sub ecx, edi
    shr shr ecx, 1
    je L12
    mov mov eax, ebx
    shl shl edi, 2
    shl shl eax, 2
    mov mov dword ptr [ebp - 4], ecx
    mov mov ecx, dword ptr [esi + 24]
    lea lea edx, [edi + ecx]
    mov mov ecx, dword ptr [eax + ecx - 4]
    mov mov ebx, dword ptr [edx]
    mov mov dword ptr [edx], ecx
    mov mov ecx, dword ptr [esi + 24]
    mov mov dword ptr [eax + ecx - 4], ebx
    add add edi, 4
    sub sub eax, 4
    dec dec dword ptr [ebp - 4]
    jne sub_1008F8A3
    mov mov eax, dword ptr [ebp - 12]
    xor xor ebx, ebx
    cmp cmp eax, ebx
    ja L8
    mov mov eax, dword ptr [ebp - 8]
    mov mov edx, dword ptr [esi + 12]
    sub sub edx, eax
    shr shr edx, 1
    mov mov dword ptr [ebp - 4], ebx
    je sub_1008F934
    mov mov ecx, eax
    shl shl ecx, 2
    mov mov dword ptr [ebp - 12], ecx
L3:
    mov mov ebx, dword ptr [esi + 12]
    mov mov eax, dword ptr [esi + 24]
    sub sub ebx, dword ptr [ebp - 4]
    add add ecx, eax
    mov mov edi, dword ptr [ecx]
    mov mov eax, dword ptr [eax + ebx*4 - 4]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esi + 12]
    sub sub eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi + 24]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [ecx + eax*4 - 4], edi
    mov mov ecx, dword ptr [ebp - 12]
    add add ecx, 4
L5:
    cmp cmp dword ptr [ebp - 4], edx
    mov mov dword ptr [ebp - 12], ecx
L6:
    jb sub_1008F93C
    xor xor edi, edi
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 8], edi
    jbe sub_1008F98D
    mov mov ecx, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ecx + eax*4]
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 8]
    mov mov dword ptr [ecx], edi
    jb sub_1008F98D
    mov mov ecx, esi
    call sub_1008704F
    cmp cmp eax, edi
    jl sub_1008FA44
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 4], edi
    jbe sub_1008F9DC
L8:
    mov mov eax, dword ptr [esi + 16]
L9:
    mov mov eax, dword ptr [eax + ecx*4]
    test test byte ptr [eax + 4], 64
    jne sub_1008F9E2
    mov mov dword ptr [eax + 16], edi
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 4]
    jb sub_1008F9DC
    cmp cmp dword ptr [esi + 12], edi
    mov mov dword ptr [ebp - 4], edi
    jbe sub_1008FA66
    jmp sub_1008FA07
    xor xor edi, edi
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + ecx*4]
    test test word ptr [eax + 2], 0FFF0h
    je sub_1008FA70
    mov mov edx, dword ptr [eax + 12]
    cmp cmp edx, edi
    je sub_1008FA77
    mov mov ecx, dword ptr [eax + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov edi, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edi + ecx*4]
    mov mov ecx, dword ptr [ecx + 4]
    mov mov edi, dword ptr [esi + 16]
    mov mov edi, dword ptr [edi + ecx*4]
    test test byte ptr [edi + 4], 64
    jne sub_1008FA91
    xor xor ecx, ecx
    test test edx, edx
    jbe sub_1008FA94
    mov mov edx, dword ptr [eax + 16]
    mov mov edx, dword ptr [edx + ecx*4]
    mov mov ebx, dword ptr [esi + 20]
    mov mov edx, dword ptr [ebx + edx*4]
    mov mov ebx, dword ptr [edi + 16]
    mov mov dword ptr [edx + 16], ecx
    inc inc ecx
    mov mov dword ptr [edx + 12], ebx
    cmp cmp ecx, dword ptr [eax + 12]
    jb sub_1008FA94
    inc inc dword ptr [edi + 16]
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_1008FA68
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_1008f667 ENDP
END
