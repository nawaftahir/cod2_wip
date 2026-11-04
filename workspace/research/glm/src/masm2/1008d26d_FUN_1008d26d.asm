.686
.MODEL FLAT, C
EXTRN sub_10085529:PROC
EXTRN sub_1008A997:PROC
EXTRN sub_1008D526:PROC
EXTRN sub_1008D530:PROC
EXTRN sub_1008D53E:PROC
EXTRN sub_1008D540:PROC
EXTRN sub_1008D544:PROC
EXTRN sub_1008D556:PROC
EXTRN sub_1008D56E:PROC
EXTRN sub_1008D594:PROC
EXTRN sub_1008D5AB:PROC
EXTRN sub_1008D5D2:PROC
EXTRN sub_1008D6AA:PROC
EXTRN sub_1008D6BD:PROC
EXTRN sub_1008D6C0:PROC
EXTRN sub_1008D6C5:PROC
EXTRN sub_1008D6CB:PROC
EXTRN sub_1008D703:PROC
EXTRN sub_1008D7CE:PROC
EXTRN sub_1008D7D5:PROC
.CODE
FUN_1008d26d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 44
    push push edi
    mov mov edi, ecx
    test test byte ptr [edi + 108], 1
    jne sub_1008D530
    and and dword ptr [ebp - 40], 0
    call sub_1008A997
    mov mov eax, dword ptr [edi + 12]
    test test eax, eax
    jbe sub_1008D544
    push push ebx
    push push esi
    mov mov ecx, dword ptr [edi + 24]
    dec dec eax
    mov mov esi, dword ptr [ecx + eax*4]
    mov mov dword ptr [ebp - 36], eax
    mov mov eax, dword ptr [esi]
    and and eax, 0FFF00000h
    cmp cmp eax, 010000000h
    je L0
    cmp cmp eax, 020700000h
    jne sub_1008D556
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [esi + 12], 0
    jbe L1
    mov mov ecx, dword ptr [edi + 20]
    mov mov edx, dword ptr [edi + 16]
    mov mov eax, dword ptr [esi + 16]
    mov mov ebx, dword ptr [eax]
    mov mov ebx, dword ptr [ecx + ebx*4]
    mov mov ebx, dword ptr [ebx + 4]
    mov mov ebx, dword ptr [edx + ebx*4]
    test test byte ptr [ebx + 4], 32
    je L3
    inc inc dword ptr [ebp - 8]
    mov mov ebx, dword ptr [ebp - 8]
    add add eax, 4
    cmp cmp ebx, dword ptr [esi + 12]
    jb L2
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_1008D594
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [esi + 4], 0
    jbe L4
    mov mov ebx, dword ptr [edi + 20]
    mov mov eax, dword ptr [edi + 16]
    mov mov edx, dword ptr [esi + 8]
    mov mov ecx, dword ptr [edx]
    mov mov ecx, dword ptr [ebx + ecx*4]
    mov mov ecx, dword ptr [ecx + 4]
    mov mov ecx, dword ptr [eax + ecx*4]
    test test byte ptr [ecx + 4], 2
    je L6
    inc inc dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 8]
    add add edx, 4
    cmp cmp ecx, dword ptr [esi + 4]
    jb L5
    mov mov eax, dword ptr [esi + 4]
    cmp cmp dword ptr [ebp - 8], eax
    jb sub_1008D5D2
    mov mov ecx, dword ptr [esi]
    and and ecx, 0FFFFFh
    xor xor edx, edx
    div div ecx
    and and dword ptr [ebp - 12], 0
    mov mov dword ptr [ebp - 16], ecx
    test test eax, eax
    mov mov dword ptr [ebp - 28], eax
    jbe L11
    and and dword ptr [ebp - 24], 0
    and and dword ptr [ebp - 8], 0
    test test ecx, ecx
L3:
    jbe L8
    mov mov eax, dword ptr [ebp - 24]
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [esi + 8]
    mov mov ecx, dword ptr [ebp - 20]
    mov mov eax, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [edi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [edi + 24]
    mov mov eax, dword ptr [eax + 72]
    mov mov ebx, dword ptr [ecx + eax*4]
    mov mov ecx, ebx
    call sub_10085529
    and and dword ptr [ebp - 4], 0
    mov mov dword ptr [ebp - 44], eax
    mov mov eax, dword ptr [ebx + 12]
    test test eax, eax
    jbe L10
    mov mov ebx, dword ptr [ebx + 16]
    mov mov edx, dword ptr [edi + 20]
    mov mov dword ptr [ebp - 32], ebx
    mov mov ecx, dword ptr [ebx]
    mov mov ecx, dword ptr [edx + ecx*4]
    cmp cmp dword ptr [ecx + 92], 1
    ja L14
    mov mov ebx, dword ptr [ebp - 36]
    cmp cmp dword ptr [ecx + 84], ebx
    jne sub_1008D526
    cmp cmp dword ptr [ebp - 44], 0
    je L13
    mov mov ebx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + ebx*4]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ebx, dword ptr [ebp - 4]
    cmp cmp ebx, dword ptr [ecx + 16]
    jne sub_1008D540
    mov mov ebx, dword ptr [ebp - 32]
    inc inc dword ptr [ebp - 4]
    add add ebx, 4
    cmp cmp dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp - 32], ebx
    jb L12
    cmp cmp dword ptr [ebp - 4], eax
    jb sub_1008D56E
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    add add dword ptr [ebp - 20], 4
    cmp cmp eax, dword ptr [ebp - 16]
    jb L7
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp - 16]
    jb sub_1008D5AB
    mov mov ecx, dword ptr [ebp - 16]
    inc inc dword ptr [ebp - 12]
    mov mov eax, ecx
    shl shl eax, 2
    add add dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [ebp - 28]
    jb L9
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [ebp - 28]
    jb sub_1008D6C0
    and and dword ptr [ebp - 12], 0
    cmp cmp dword ptr [esi + 12], 0
    jbe sub_1008D6BD
    mov mov eax, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [esi + 16]
    mov mov edx, dword ptr [edi + 20]
    shl shl eax, 2
    mov mov ecx, dword ptr [eax + ecx]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov edx, dword ptr [ebp - 28]
    test test edx, edx
    jbe sub_1008D6C5
    mov mov dword ptr [ebp - 24], eax
    mov mov dword ptr [ebp - 20], edx
    mov mov eax, dword ptr [esi + 8]
    mov mov edx, dword ptr [ebp - 24]
    mov mov eax, dword ptr [edx + eax]
    mov mov edx, dword ptr [edi + 20]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov ebx, dword ptr [eax]
    mov mov edx, dword ptr [ecx]
    and and ebx, 0E000000h
    mov mov dword ptr [ebp - 32], ebx
    mov mov ebx, dword ptr [eax]
    and and ebx, 0F1FFFFFFh
    and and edx, 0E000000h
    cmp cmp edx, dword ptr [ebp - 32]
    mov mov dword ptr [ebp - 44], ebx
    mov mov dword ptr [eax], ebx
    ja sub_1008D6AA
    mov mov edx, dword ptr [ebp - 32]
    mov mov ebx, dword ptr [ebp - 44]
    or or ebx, edx
    cmp cmp dword ptr [eax + 96], 0
    mov mov dword ptr [eax], ebx
    mov mov edx, dword ptr [ecx + 4]
    mov mov dword ptr [eax + 4], edx
    mov mov edx, dword ptr [ecx + 8]
    mov mov dword ptr [eax + 8], edx
    mov mov edx, dword ptr [ecx + 12]
    mov mov dword ptr [eax + 12], edx
    mov mov edx, dword ptr [ecx + 16]
    mov mov dword ptr [eax + 16], edx
    jne sub_1008D703
    mov mov edx, dword ptr [ecx + 96]
    mov mov dword ptr [eax + 96], edx
    mov mov edx, dword ptr [ecx + 100]
    mov mov dword ptr [eax + 100], edx
    mov mov edx, dword ptr [ecx + 104]
    mov mov dword ptr [eax + 104], edx
    mov mov edx, dword ptr [ecx + 108]
    mov mov dword ptr [eax + 108], edx
    mov mov edx, dword ptr [ecx + 112]
    mov mov dword ptr [eax + 112], edx
    mov mov eax, dword ptr [ebp - 16]
    shl shl eax, 2
    add add dword ptr [ebp - 24], eax
    dec dec dword ptr [ebp - 20]
    jne sub_1008D6CB
    mov mov eax, dword ptr [edi + 116]
    inc inc dword ptr [ebp - 12]
    mov mov dword ptr [ecx + 4], eax
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_1008D6BD
    xor xor eax, eax
    mov mov dword ptr [ebp - 40], 1
    mov mov dword ptr [esi], eax
    mov mov dword ptr [esi + 4], eax
L9:
    mov mov dword ptr [esi + 12], eax
    mov mov eax, dword ptr [ebp - 36]
    test test eax, eax
L11:
    ja sub_1008D53E
L12:
    cmp cmp dword ptr [ebp - 40], 0
    pop pop esi
    pop pop ebx
    jne sub_1008D7CE
L13:
    xor xor eax, eax
    inc inc eax
L14:
    jmp sub_1008D7D5
    xor xor eax, eax
    pop pop edi
    leave leave
    ret ret
FUN_1008d26d ENDP
END
