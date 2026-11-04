.686
.MODEL FLAT, C
EXTRN sub_10086250:PROC
EXTRN sub_1008634F:PROC
EXTRN sub_100BAF31:PROC
EXTRN sub_100BAF34:PROC
EXTRN sub_100BAF71:PROC
EXTRN sub_100BAF81:PROC
EXTRN sub_100BAFC5:PROC
EXTRN sub_100BB03F:PROC
EXTRN sub_100BB053:PROC
EXTRN sub_100BB059:PROC
EXTRN sub_100BB065:PROC
EXTRN sub_100BB07C:PROC
EXTRN sub_100BB0F6:PROC
.CODE
FUN_100bad10 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax]
    push push edi
    mov mov edi, eax
    and and edi, 0FFFFFh
    and and eax, 0FFF00000h
    cmp cmp eax, 020800000h
    mov mov dword ptr [ebp - 20], edi
    je L0
    xor xor eax, eax
    inc inc eax
    jmp sub_100BAF31
    xor xor eax, eax
    mov mov dword ptr [ebp - 24], eax
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 12], eax
    push push ebx
    and and dword ptr [ebp - 4], 0
    test test edi, edi
    jbe L1
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax + 8]
    add add eax, dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 8], ecx
    mov mov ecx, dword ptr [ebp - 8]
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx]
    mov mov ebx, dword ptr [eax]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov edx, dword ptr [edx + ebx*4]
    mov mov ebx, dword ptr [edx + 4]
    cmp cmp ebx, dword ptr [ecx + 4]
    jne L3
    mov mov ebx, dword ptr [edx + 8]
    cmp cmp ebx, dword ptr [ecx + 8]
    jne L4
    mov mov ebx, dword ptr [edx + 12]
    cmp cmp ebx, dword ptr [ecx + 12]
    jne L5
    mov mov edx, dword ptr [edx + 16]
    cmp cmp edx, dword ptr [ecx + 16]
    jne L6
    inc inc dword ptr [ebp - 4]
    add add dword ptr [ebp - 8], 4
    add add eax, 4
    cmp cmp dword ptr [ebp - 4], edi
    jb L2
    cmp cmp dword ptr [ebp - 4], edi
    je sub_100BAF81
    push push edi
    mov mov eax, edi
    and and eax, 0FFFFFh
    push push edi
    or or eax, 010000000h
    push push eax
    mov mov ecx, esi
    call sub_10086250
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 24], eax
    je sub_100BAFC5
    mov mov ecx, dword ptr [esi + 24]
    and and dword ptr [ebp - 8], 0
    test test edi, edi
    mov mov ebx, dword ptr [ecx + eax*4]
    jbe sub_100BAF71
    mov mov eax, dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [edx + eax]
    mov mov edi, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebx + 8]
    shl shl edi, 2
    mov mov dword ptr [edi + ecx], eax
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 16]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edi + eax]
    push push dword ptr [ecx + eax*4]
    mov mov ecx, esi
    call sub_1008634F
    mov mov ecx, dword ptr [esi + 0100h]
    mov mov edx, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + edx], eax
    mov mov eax, dword ptr [esi + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [ecx + eax]
    mov mov edx, dword ptr [ebx + 16]
    mov mov dword ptr [edi + edx], eax
    mov mov eax, dword ptr [ebx + 16]
    cmp cmp dword ptr [edi + eax], -1
    je sub_100BB03F
    mov mov ecx, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [edi + ecx]
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ebx + 16]
    mov mov edx, dword ptr [edi + edx]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ecx + 20]
    inc inc dword ptr [ebp - 8]
    add add dword ptr [ebp - 4], 4
    mov mov dword ptr [eax + 20], ecx
    mov mov ecx, dword ptr [ebx + 8]
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edi + ecx]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ebx + 16]
    mov mov edx, dword ptr [edi + edx]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov dword ptr [eax + 24], ecx
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp - 20]
    jb sub_100BAF71
    mov mov eax, dword ptr [ebp - 24]
    mov mov edi, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [esi + 0FCh]
    ja sub_100BB053
    test test eax, eax
    jbe sub_100BB065
    mov mov ecx, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ecx + eax*4 - 4]
    mov mov ecx, dword ptr [ecx]
    and and ecx, 0FFF00000h
    cmp cmp ecx, 020800000h
    jne sub_100BB07C
    mov mov ecx, dword ptr [esi + 24]
    lea lea ecx, [ecx + eax*4]
    mov mov edx, dword ptr [ecx - 4]
    mov mov dword ptr [ecx], edx
    dec dec eax
    jmp sub_100BB059
    mov mov ecx, dword ptr [esi + 24]
    mov mov dword ptr [ecx + eax*4], ebx
    inc inc dword ptr [esi + 0FCh]
    mov mov dword ptr [ebp - 24], 1
    inc inc dword ptr [ebp - 16]
    mov mov eax, edi
    shl shl eax, 2
    add add dword ptr [ebp - 12], eax
    cmp cmp dword ptr [ebp - 16], 2
    jb sub_100BAF34
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 24], eax
    sete sete al
    pop pop ebx
    pop pop edi
    pop pop esi
    leave leave
    ret ret
    mov mov eax, 08007000Eh
    jmp sub_100BB0F6
FUN_100bad10 ENDP
END
