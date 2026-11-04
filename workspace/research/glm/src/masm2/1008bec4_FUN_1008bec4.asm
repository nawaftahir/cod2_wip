.686
.MODEL FLAT, C
EXTRN sub_1008A990:PROC
EXTRN sub_1008C37E:PROC
EXTRN sub_1008C380:PROC
EXTRN sub_1008C38D:PROC
EXTRN sub_1008C38F:PROC
EXTRN sub_1008C39C:PROC
EXTRN sub_1008C3A0:PROC
EXTRN sub_1008C3A5:PROC
EXTRN sub_1008C3AF:PROC
EXTRN sub_1008C3E9:PROC
EXTRN sub_1008C3F4:PROC
EXTRN sub_1008C419:PROC
EXTRN sub_1008C57A:PROC
EXTRN sub_1008C57D:PROC
EXTRN sub_1008C584:PROC
EXTRN sub_1008C590:PROC
EXTRN sub_1008C5CD:PROC
EXTRN sub_1008C5D8:PROC
EXTRN sub_1008C5EA:PROC
EXTRN sub_1008C5F1:PROC
EXTRN sub_1008C5F2:PROC
EXTRN sub_1008C600:PROC
EXTRN sub_1008C65D:PROC
EXTRN sub_1008C660:PROC
EXTRN sub_1008C668:PROC
EXTRN sub_1008C682:PROC
EXTRN sub_1008C6E5:PROC
EXTRN sub_1008C6E7:PROC
EXTRN sub_1008C6E8:PROC
EXTRN sub_1008C6F3:PROC
EXTRN sub_1008C717:PROC
EXTRN sub_1008C772:PROC
EXTRN sub_1008C77C:PROC
EXTRN sub_1008C7B1:PROC
EXTRN sub_1008C7BC:PROC
EXTRN sub_1008C7C9:PROC
EXTRN sub_1008C7D3:PROC
EXTRN sub_1008C7E5:PROC
EXTRN sub_1008C7E9:PROC
EXTRN sub_1008C7F8:PROC
.CODE
FUN_1008bec4 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    push push ebx
    push push esi
    push push edi
    xor xor esi, esi
    mov mov edi, ecx
    mov mov dword ptr [ebp - 20], esi
    call sub_1008A990
    xor xor ecx, ecx
    cmp cmp dword ptr [edi + 8], esi
    jbe L0
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edi + 16]
    mov mov ebx, dword ptr [eax + 4]
    mov mov edx, dword ptr [edx + ebx*4]
    mov mov edx, dword ptr [edx + 4]
    and and edx, 010020h
    neg neg edx
    sbb sbb edx, edx
    and and edx, 2
    inc inc ecx
    mov mov dword ptr [eax + 84], edx
    cmp cmp ecx, dword ptr [edi + 8]
    jb L0
    mov mov edx, dword ptr [edi + 12]
    jmp L2
    mov mov eax, dword ptr [edi + 24]
    dec dec edx
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [eax]
    and and ecx, 0FFF00000h
    cmp cmp ecx, 020900000h
    jne L5
    cmp cmp dword ptr [eax + 12], esi
    jbe L6
    mov mov ecx, dword ptr [eax + 16]
    mov mov ecx, dword ptr [ecx + esi*4]
    mov mov ebx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ebx + ecx*4]
    cmp cmp dword ptr [ecx + 84], 2
    je L7
    mov mov dword ptr [ecx + 84], 1
    inc inc esi
    cmp cmp esi, dword ptr [eax + 12]
    jb L6
    xor xor esi, esi
    cmp cmp edx, esi
    ja L3
    mov mov eax, dword ptr [edi + 12]
    and and dword ptr [ebp - 16], 0
    test test eax, eax
    mov mov dword ptr [ebp - 12], eax
    jbe L26
    dec dec dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [edi + 24]
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [esi]
    test test ecx, 0FFF00000h
    je L16
    mov mov eax, ecx
    and and eax, 0F0000000h
    cmp cmp eax, 010000000h
    jb L11
    cmp cmp eax, 040000000h
    ja L12
    mov mov eax, dword ptr [esi + 4]
    and and ecx, 0FFFFFh
    xor xor edx, edx
    div div ecx
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [esi + 12], 0
    mov mov dword ptr [ebp - 24], eax
    jbe L17
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov ebx, dword ptr [ecx + 84]
    xor xor ecx, ecx
    inc inc ecx
    cmp cmp ebx, ecx
    jne L10
    mov mov dword ptr [ebp - 16], ecx
    push push ebx
    push push eax
    mov mov ecx, edi
    call L1
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp - 24], 0
    jbe L14
    mov mov eax, dword ptr [esi + 12]
    imul imul eax, dword ptr [ebp - 8]
    add add eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi + 8]
    push push ebx
    push push dword ptr [ecx + eax*4]
    mov mov ecx, edi
    call L4
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp - 24]
    jb L14
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 12]
    jb L13
    jmp L22
    mov mov edx, dword ptr [esi + 12]
    and and dword ptr [ebp - 4], 0
    test test edx, edx
    jbe L19
    mov mov ecx, dword ptr [edi + 20]
    mov mov eax, dword ptr [esi + 16]
    mov mov dword ptr [ebp - 24], edx
    mov mov ebx, dword ptr [eax]
    mov mov ebx, dword ptr [ecx + ebx*4]
    mov mov ebx, dword ptr [ebx + 84]
    cmp cmp dword ptr [ebp - 4], ebx
    jae L20
    mov mov dword ptr [ebp - 4], ebx
    add add eax, 4
    dec dec dword ptr [ebp - 24]
    jne L18
    xor xor eax, eax
    inc inc eax
    cmp cmp dword ptr [ebp - 4], eax
    jne L21
    mov mov dword ptr [ebp - 16], eax
    xor xor ebx, ebx
    test test edx, edx
    jbe L23
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi + 16]
    push push dword ptr [eax + ebx*4]
    mov mov ecx, edi
    call L8
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 12]
    jb L23
    xor xor ebx, ebx
    cmp cmp dword ptr [esi + 4], ebx
    jbe L25
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi + 8]
    push push dword ptr [eax + ebx*4]
    mov mov ecx, edi
    call L9
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 4]
    jb L25
    cmp cmp dword ptr [ebp - 12], 0
    ja L15
    cmp cmp dword ptr [ebp - 16], 0
    je L29
    xor xor eax, eax
    cmp cmp dword ptr [edi + 12], eax
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 8], eax
    jbe sub_1008C37E
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov edx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [edx]
    and and eax, 0FFF00000h
    cmp cmp eax, 020900000h
    jne sub_1008C380
    mov mov ecx, dword ptr [edx + 12]
    and and dword ptr [ebp - 4], 0
    test test ecx, ecx
    jbe sub_1008C38F
    mov mov esi, dword ptr [edx + 16]
    mov mov ebx, dword ptr [ebp - 4]
L10:
    mov mov eax, dword ptr [edi + 20]
    mov mov esi, dword ptr [esi + ebx*4]
    mov mov esi, dword ptr [eax + esi*4]
    cmp cmp dword ptr [esi + 84], 1
    mov mov dword ptr [ebp - 32], esi
    jne sub_1008C39C
    mov mov esi, ebx
    add add ecx, esi
    mov mov esi, dword ptr [edx + 8]
    mov mov ecx, dword ptr [esi + ecx*4]
    cmp cmp ecx, -1
    je L27
    mov mov esi, dword ptr [eax + ecx*4]
L13:
    mov mov esi, dword ptr [esi + 56]
    cmp cmp esi, -1
    je L28
    mov mov ecx, esi
    mov mov esi, dword ptr [edi + 24]
    and and dword ptr [ebp - 12], 0
    mov mov dword ptr [ebp - 24], ecx
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ecx + 72]
    mov mov ecx, dword ptr [esi + ecx*4]
    cmp cmp dword ptr [ecx + 12], 0
    jbe sub_1008C3A0
    mov mov esi, dword ptr [ecx + 16]
    jmp sub_1008C38D
    mov mov esi, dword ptr [ebp - 28]
L15:
    mov mov ebx, dword ptr [ebp - 24]
    cmp cmp dword ptr [esi], ebx
    je sub_1008C3AF
    inc inc dword ptr [ebp - 12]
    add add esi, 4
    mov mov dword ptr [ebp - 28], esi
L16:
    mov mov esi, dword ptr [ebp - 12]
    cmp cmp esi, dword ptr [ecx + 12]
    jb sub_1008C3A5
    mov mov ecx, dword ptr [ecx + 8]
    mov mov esi, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [ecx + esi*4]
    cmp cmp ecx, -1
    je sub_1008C3E9
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov esi, dword ptr [esi + 56]
    cmp cmp esi, -1
    je sub_1008C3F4
    mov mov ecx, esi
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax + 84]
    xor xor ecx, ecx
    inc inc ecx
    cmp cmp eax, ecx
    je sub_1008C419
    mov mov esi, dword ptr [ebp - 32]
    mov mov dword ptr [esi + 84], eax
    mov mov dword ptr [ebp - 16], ecx
    inc inc dword ptr [ebp - 4]
    mov mov ecx, dword ptr [edx + 12]
    cmp cmp dword ptr [ebp - 4], ecx
    jb sub_1008C38F
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [edi + 12]
    jb L30
    cmp cmp dword ptr [ebp - 16], 0
    jne L24
    and and dword ptr [ebp - 16], 0
    cmp cmp dword ptr [edi + 12], 0
    jbe sub_1008C5EA
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov esi, dword ptr [ecx]
    test test esi, 0FFF00000h
    je sub_1008C5F2
    mov mov eax, esi
    and and eax, 0F0000000h
    cmp cmp eax, 010000000h
    jb sub_1008C5CD
    cmp cmp eax, 040000000h
    ja sub_1008C5D8
    mov mov eax, dword ptr [ecx + 4]
    and and esi, 0FFFFFh
    xor xor edx, edx
    div div esi
    xor xor esi, esi
    cmp cmp esi, dword ptr [ecx + 12]
    mov mov dword ptr [ebp - 4], esi
    mov mov dword ptr [ebp - 8], eax
    jae sub_1008C57D
    mov mov eax, dword ptr [ecx + 16]
    mov mov edx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov ebx, dword ptr [edi + 20]
    mov mov ebx, dword ptr [ebx + edx*4]
    cmp cmp dword ptr [ebx + 84], 2
    jne sub_1008C584
    and and dword ptr [ebp - 12], 0
    cmp cmp dword ptr [ebp - 8], 0
    mov mov dword ptr [eax + esi*4], edx
    jbe sub_1008C590
    mov mov edx, dword ptr [ecx + 12]
    imul imul edx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ecx + 8]
    mov mov ebx, dword ptr [ebp - 4]
    add add ebx, edx
    mov mov ebx, dword ptr [eax + ebx*4]
    add add edx, esi
    inc inc dword ptr [ebp - 12]
    mov mov dword ptr [eax + edx*4], ebx
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [ebp - 8]
L26:
    jb sub_1008C590
    inc inc esi
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ecx + 12]
    jb sub_1008C57A
    cmp cmp esi, dword ptr [ecx + 12]
    je sub_1008C682
    test test esi, esi
    je sub_1008C5F1
    mov mov eax, dword ptr [ecx]
    xor xor eax, esi
    and and eax, 0FFFFFh
    xor xor eax, dword ptr [ecx]
    jmp sub_1008C600
    xor xor eax, eax
    mov mov dword ptr [ecx], eax
    xor xor eax, eax
    inc inc eax
    cmp cmp dword ptr [ebp - 8], eax
    mov mov dword ptr [ebp - 4], eax
    jbe sub_1008C660
    mov mov eax, esi
    shl shl eax, 2
    mov mov dword ptr [ebp - 20], eax
    and and dword ptr [ebp - 12], 0
    test test esi, esi
    jbe sub_1008C65D
    mov mov edx, dword ptr [ebp - 20]
    mov mov ebx, dword ptr [ecx + 12]
    imul imul ebx, dword ptr [ebp - 4]
    add add ebx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ecx + 8]
    mov mov ebx, dword ptr [eax + ebx*4]
    inc inc dword ptr [ebp - 12]
    mov mov dword ptr [edx + eax], ebx
    add add edx, 4
    cmp cmp dword ptr [ebp - 12], esi
    jb sub_1008C660
    inc inc dword ptr [ebp - 4]
    mov mov eax, esi
    shl shl eax, 2
    add add dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 8]
    jb sub_1008C668
    mov mov eax, esi
    imul imul eax, dword ptr [ebp - 8]
    mov mov dword ptr [ecx + 12], esi
    jmp sub_1008C6E7
    xor xor esi, esi
    cmp cmp esi, dword ptr [ecx + 12]
    jae sub_1008C6E5
    mov mov edx, dword ptr [edi + 20]
    mov mov eax, dword ptr [ecx + 16]
    mov mov ebx, dword ptr [eax]
    mov mov ebx, dword ptr [edx + ebx*4]
    cmp cmp dword ptr [ebx + 84], 2
    je sub_1008C6F3
    inc inc esi
    add add eax, 4
    cmp cmp esi, dword ptr [ecx + 12]
    jb sub_1008C6E8
    cmp cmp esi, dword ptr [ecx + 12]
    jne sub_1008C717
    xor xor eax, eax
    mov mov dword ptr [ecx], eax
    mov mov dword ptr [ecx + 12], eax
    mov mov dword ptr [ecx + 4], eax
    mov mov dword ptr [ebp - 20], 1
    inc inc dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_1008C5EA
    xor xor esi, esi
    cmp cmp dword ptr [edi + 8], esi
    jbe sub_1008C7B1
    cmp cmp esi, -1
    mov mov ecx, dword ptr [edi + 20]
    mov mov eax, dword ptr [ecx + esi*4]
    je sub_1008C772
    mov mov edx, dword ptr [eax + 56]
    cmp cmp edx, -1
    jne sub_1008C77C
    mov mov edx, esi
    mov mov ecx, dword ptr [ecx + edx*4]
    cmp cmp dword ptr [ecx + 84], 2
    je sub_1008C7C9
    mov mov edx, dword ptr [edi + 116]
    mov mov ecx, dword ptr [eax + 4]
    cmp cmp edx, ecx
    je sub_1008C7D3
    cmp cmp dword ptr [eax + 8], -1
    jne sub_1008C7BC
    mov mov ebx, dword ptr [edi + 16]
    mov mov ebx, dword ptr [ebx + ecx*4]
    test test byte ptr [ebx + 5], 4
    jne sub_1008C7E5
    mov mov ebx, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebx + ecx*4]
L28:
    mov mov ecx, dword ptr [ecx + 4]
    test test ch, 1
    je sub_1008C7E9
    test test ch, 8
    jne sub_1008C7F8
    mov mov dword ptr [eax + 4], edx
    mov mov dword ptr [ebp - 20], 1
    inc inc esi
    cmp cmp esi, dword ptr [edi + 8]
    jb sub_1008C7B1
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 20], eax
    pop pop edi
    pop pop esi
    sete sete al
    pop pop ebx
L30:
    leave leave
    ret ret
FUN_1008bec4 ENDP
END
