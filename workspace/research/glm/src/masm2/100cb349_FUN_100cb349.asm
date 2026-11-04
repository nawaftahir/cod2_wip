.686
.MODEL FLAT, C
EXTRN sub_100C9C45:PROC
EXTRN sub_100C9C71:PROC
EXTRN sub_100CB2A6:PROC
EXTRN sub_100CB569:PROC
EXTRN sub_100CB57E:PROC
EXTRN sub_100CB5AA:PROC
EXTRN sub_100CB5B4:PROC
EXTRN sub_100CB648:PROC
EXTRN sub_100CB65A:PROC
EXTRN sub_100CB65F:PROC
EXTRN sub_100CB66C:PROC
EXTRN sub_100CB66E:PROC
EXTRN sub_100CB70B:PROC
EXTRN sub_100CB718:PROC
EXTRN sub_100CB737:PROC
.CODE
FUN_100cb349 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 48
    mov mov eax, dword ptr [ebp + 24]
    cmp cmp dword ptr [ebp + 20], eax
    push push esi
    mov mov esi, ecx
    jbe L0
    cmp cmp eax, 1
    jne L1
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [ebp + 16]
    cmp cmp eax, dword ptr [ecx]
    jne L2
    push push 0
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_100CB2A6
    jmp sub_100CB57E
    mov mov ecx, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [esi + 20]
    push push ebx
    mov mov ebx, dword ptr [ebp + 12]
    mov mov eax, dword ptr [ebx]
    shl shl ecx, 2
    shl shl eax, 2
    push push edi
    mov mov edi, dword ptr [ecx + edx]
L1:
    mov mov edx, dword ptr [edx + eax]
    mov mov edx, dword ptr [edx + 4]
    cmp cmp edx, dword ptr [edi + 4]
    jne L3
    mov mov edx, dword ptr [esi + 20]
    mov mov edi, dword ptr [edx + ecx]
    mov mov edx, dword ptr [edx + eax]
    mov mov edx, dword ptr [edx + 8]
    cmp cmp edx, dword ptr [edi + 8]
    jne L4
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edx + eax]
    mov mov ecx, dword ptr [edx + ecx]
    mov mov eax, dword ptr [eax + 12]
    cmp cmp eax, dword ptr [ecx + 12]
    je L5
    and and dword ptr [ebp - 8], 0
    jmp L13
    xor xor ecx, ecx
    cmp cmp ecx, dword ptr [ebp + 20]
    jae L8
    and and dword ptr [ebp + 24], 0
    test test ecx, ecx
    jbe L7
    mov mov edx, dword ptr [ebp + 16]
    mov mov edx, dword ptr [edx + ecx*4]
    mov mov eax, dword ptr [esi + 20]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [edx + 16]
    mov mov edi, dword ptr [ebp + 24]
    mov mov edi, dword ptr [ebx + edi*4]
    mov mov edi, dword ptr [eax + edi*4]
    cmp cmp edx, dword ptr [edi + 16]
    je L10
    inc inc dword ptr [ebp + 24]
    cmp cmp dword ptr [ebp + 24], ecx
    jb L9
    cmp cmp dword ptr [ebp + 24], ecx
    jb L11
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp + 20]
    jb L6
    cmp cmp ecx, dword ptr [ebp + 20]
    sbb sbb eax, eax
    neg neg eax
    mov mov dword ptr [ebp - 8], eax
    je sub_100CB569
    xor xor ecx, ecx
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 20], ecx
    jbe L12
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ebx + ecx*4]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 16]
    cmp cmp edi, eax
    ja L15
    lea lea edi, [eax + 1]
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp + 20]
    jb L14
    mov mov eax, dword ptr [esi]
    push push 0
    push push 0
    push push edi
    lea lea ecx, [ebp - 48]
    push push ecx
    push push dword ptr [esi + 0FCh]
    mov mov ecx, esi
L5:
    call call dword ptr [eax + 080h]
    xor xor ecx, ecx
    cmp cmp eax, ecx
    jl sub_100CB65A
    cmp cmp dword ptr [ebp + 20], ecx
    jbe sub_100CB5AA
    mov mov eax, dword ptr [esi + 20]
    mov mov edx, ebx
    lea lea edi, [ebp - 32]
    sub sub edx, edi
    lea lea edi, [edx + ecx*4]
    mov mov edi, dword ptr [ebp + edi - 32]
    mov mov edi, dword ptr [eax + edi*4]
    mov mov edi, dword ptr [edi + 16]
    mov mov edi, dword ptr [ebp + edi*4 - 48]
    mov mov dword ptr [ebp + ecx*4 - 32], edi
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp + 20]
    jb sub_100CB5B4
    mov mov dword ptr [ebp - 16], ebx
    lea lea ebx, [ebp - 32]
    mov mov dword ptr [ebp + 12], ebx
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 20], edi
    jbe sub_100CB66E
    lea lea edx, [edi + 1]
    cmp cmp edx, dword ptr [ebp + 20]
    mov mov dword ptr [ebp + 24], 1
    jae sub_100CB648
    mov mov eax, dword ptr [ebp + 16]
    lea lea ecx, [eax + edi*4]
    mov mov ebx, dword ptr [ecx]
    mov mov eax, dword ptr [esi + 20]
    mov mov ebx, dword ptr [eax + ebx*4]
    mov mov ebx, dword ptr [ebx + 16]
    mov mov dword ptr [ebp - 12], ebx
    mov mov dword ptr [ebp - 4], edx
    add add ecx, 4
    mov mov edx, dword ptr [ecx]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov ebx, dword ptr [ebp - 12]
    cmp cmp dword ptr [edx + 16], ebx
    jne sub_100CB66C
    inc inc dword ptr [ebp + 24]
    inc inc dword ptr [ebp - 4]
    mov mov edx, dword ptr [ebp - 4]
    add add ecx, 4
    cmp cmp edx, dword ptr [ebp + 20]
    jb sub_100CB65F
    mov mov ebx, dword ptr [ebp + 12]
    xor xor eax, eax
    push push eax
    push push dword ptr [ebp + 28]
    mov mov ecx, esi
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    push push eax
    push push eax
    mov mov eax, dword ptr [ebp + 16]
    lea lea eax, [eax + edi*4]
    push push eax
    push push dword ptr [ebp + 24]
    lea lea eax, [ebx + edi*4]
    push push eax
    push push dword ptr [ebp + 8]
    call sub_100C9C45
    test test eax, eax
    jl sub_100CB70B
    add add edi, dword ptr [ebp + 24]
    cmp cmp edi, dword ptr [ebp + 20]
    jb sub_100CB66E
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 8], eax
    je sub_100CB718
    push push eax
    push push eax
    push push eax
    push push eax
L15:
    push push dword ptr [ebp + 20]
    mov mov ecx, esi
    push push eax
    push push eax
    push push ebx
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp - 16]
    push push 1
    call sub_100C9C71
    test test eax, eax
    jl sub_100CB737
    xor xor eax, eax
    pop pop edi
    pop pop ebx
    pop pop esi
    leave leave
    ret ret 28
FUN_100cb349 ENDP
END
