.686
.MODEL FLAT, C
EXTRN sub_10086213:PROC
EXTRN sub_1008B202:PROC
EXTRN sub_100A6E5F:PROC
EXTRN sub_100AA092:PROC
EXTRN sub_100AA0A2:PROC
EXTRN sub_100AA0A3:PROC
EXTRN sub_100AA0B2:PROC
EXTRN sub_100AA0C0:PROC
EXTRN sub_100AA0C9:PROC
EXTRN sub_100AA0CF:PROC
EXTRN sub_100AA0D3:PROC
EXTRN sub_100AA0E8:PROC
EXTRN sub_100AA137:PROC
EXTRN sub_100AA164:PROC
EXTRN sub_100AA18A:PROC
EXTRN sub_100AA1A8:PROC
.CODE
FUN_100a9f26 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    push push ebx
    xor xor ebx, ebx
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 12], ebx
    push push esi
    mov mov edx, ecx
    push push edi
    mov mov dword ptr [ebp - 8], edx
    mov mov dword ptr [ebp - 16], eax
    jbe L3
    mov mov ecx, dword ptr [ebp + 8]
    mov mov edi, dword ptr [ecx + eax*4]
    cmp cmp edi, ebx
    je L2
    mov mov eax, dword ptr [edi]
    cmp cmp eax, ebx
    je L4
    mov mov ecx, eax
    and and ecx, 0FFF00000h
    push push ecx
    call sub_100A6E5F
    cmp cmp ecx, 011000000h
    mov mov dword ptr [ebp - 12], eax
    jne L0
    mov mov dword ptr [ebp - 12], 1
    cmp cmp dword ptr [edi + 4], ebx
    mov mov dword ptr [ebp - 4], ebx
    jbe sub_100AA0A3
    mov mov esi, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ecx + esi*4]
    mov mov eax, dword ptr [edx + 20]
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [esi + 4]
    cmp cmp ecx, dword ptr [edx + 080h]
    jne sub_100AA0B2
    mov mov ecx, dword ptr [esi + 108]
    and and ecx, 0FFh
    cmp cmp ecx, dword ptr [ebp + 16]
    jne sub_100AA0C0
    movzx movzx ecx, byte ptr [esi + 109]
    cmp cmp dword ptr [ebp + 20], ecx
    jne sub_100AA0C9
    cmp cmp dword ptr [ebp - 12], ebx
    je L1
    cmp cmp dword ptr [esi + 60], ebx
    je sub_100AA0D3
    cmp cmp dword ptr [ebp + 24], 0
    jbe sub_100AA0CF
L0:
    mov mov ecx, dword ptr [esi + 16]
    mov mov edx, dword ptr [ebp + 28]
    mov mov edx, dword ptr [edx + ebx*4]
    mov mov edx, dword ptr [eax + edx*4]
    cmp cmp ecx, dword ptr [edx + 16]
    je sub_100AA0A2
    inc inc ebx
    cmp cmp ebx, dword ptr [ebp + 24]
    jb sub_100AA092
    jmp sub_100AA0E8
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push ecx
    mov mov ecx, dword ptr [ebp - 8]
    push push 0
    push push dword ptr [ecx + 088h]
    call sub_10086213
    cmp cmp eax, -1
    je sub_100AA137
    mov mov ecx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [esi + 60]
    mov mov dword ptr [ecx + 60], edx
    mov mov edx, dword ptr [ebp + 28]
    mov mov edx, dword ptr [edx + ebx*4]
    mov mov dword ptr [ecx + 56], edx
    mov mov ecx, dword ptr [edi + 8]
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + edx*4], eax
    cmp cmp ebx, dword ptr [ebp + 24]
    je sub_100AA164
    mov mov edx, dword ptr [ebp - 8]
    xor xor ebx, ebx
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [edi + 4]
    jb sub_100AA0A3
    mov mov eax, dword ptr [ebp - 16]
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 16], eax
    jb L3
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 24
    mov mov eax, 08007000Eh
    jmp sub_100AA18A
    push push 010116D20h
    push push 012C1h
    push push 0
    push push dword ptr [ebp - 8]
    call sub_1008B202
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100AA1A8
FUN_100a9f26 ENDP
END
