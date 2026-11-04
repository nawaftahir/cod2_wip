.686
.MODEL FLAT, C
EXTRN sub_1008556F:PROC
EXTRN sub_10085780:PROC
EXTRN sub_10086341:PROC
EXTRN sub_10086408:PROC
EXTRN sub_10086489:PROC
EXTRN sub_10086552:PROC
EXTRN sub_1008657C:PROC
EXTRN sub_10088DCE:PROC
EXTRN sub_10088DD6:PROC
EXTRN sub_10088DDE:PROC
EXTRN sub_10088DE6:PROC
EXTRN sub_10088DF1:PROC
EXTRN sub_10088DF2:PROC
EXTRN sub_10088DF9:PROC
EXTRN sub_10088E01:PROC
EXTRN sub_10088E09:PROC
EXTRN sub_10088ED0:PROC
EXTRN sub_10088F37:PROC
EXTRN sub_10088F71:PROC
EXTRN sub_10089016:PROC
EXTRN sub_10089034:PROC
EXTRN sub_1008904C:PROC
EXTRN sub_10089052:PROC
EXTRN sub_1008905E:PROC
EXTRN sub_100890A0:PROC
EXTRN sub_10089106:PROC
EXTRN sub_10089115:PROC
EXTRN sub_10089117:PROC
EXTRN sub_1008911B:PROC
EXTRN sub_1008911C:PROC
EXTRN sub_1008911F:PROC
EXTRN sub_10089122:PROC
EXTRN sub_10089182:PROC
EXTRN sub_100891B4:PROC
EXTRN sub_10089210:PROC
EXTRN sub_10089217:PROC
.CODE
FUN_10088905 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 76
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [esi]
    and and eax, 0FFFFFh
    push push edi
    mov mov edi, ecx
    mov mov dword ptr [ebp - 8], eax
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp + 8], 0
    ja L0
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 16]
    and and dword ptr [ebp - 4], 0
    cmp cmp ecx, 4
    jbe L3
    test test eax, eax
    jbe L5
    and and dword ptr [ebp - 28], 0
    mov mov ecx, eax
    shl shl ecx, 2
    mov mov dword ptr [ebp - 36], 1
    mov mov dword ptr [ebp - 32], ecx
    mov mov ecx, dword ptr [esi + 8]
    mov mov edx, dword ptr [ebp - 28]
    cmp cmp dword ptr [ecx + edx], -1
    je L6
    mov mov eax, dword ptr [ebp - 28]
    mov mov eax, dword ptr [ecx + eax]
    mov mov edx, dword ptr [edi + 20]
    mov mov ebx, dword ptr [ebp - 32]
    mov mov ecx, dword ptr [ecx + ebx]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov edx, dword ptr [ebp - 36]
    cmp cmp edx, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 24], 1
    mov mov dword ptr [ebp - 20], edx
    jae L1
    mov mov edx, ebx
    add add edx, 4
    mov mov dword ptr [ebp - 12], edx
    mov mov edx, dword ptr [esi + 8]
    mov mov ebx, dword ptr [ebp - 12]
    cmp cmp dword ptr [edx + ebx], -1
    je L2
    mov mov ebx, dword ptr [ebp - 20]
    mov mov ebx, dword ptr [edx + ebx*4]
    mov mov edx, dword ptr [edi + 20]
    mov mov edx, dword ptr [edx + ebx*4]
    mov mov ebx, dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 40], edx
    mov mov edx, dword ptr [esi + 8]
    mov mov ebx, dword ptr [edx + ebx]
    mov mov edx, dword ptr [edi + 20]
    mov mov edx, dword ptr [edx + ebx*4]
    mov mov ebx, dword ptr [eax + 4]
    mov mov dword ptr [ebp - 44], edx
    mov mov edx, dword ptr [ebp - 40]
    cmp cmp ebx, dword ptr [edx + 4]
    jne L8
    mov mov ebx, dword ptr [eax + 8]
    cmp cmp ebx, dword ptr [edx + 8]
    jne L9
    mov mov ebx, dword ptr [eax + 12]
    cmp cmp ebx, dword ptr [edx + 12]
    jne L10
    mov mov ebx, dword ptr [eax + 72]
    cmp cmp ebx, dword ptr [edx + 72]
    jne L11
    mov mov ebx, dword ptr [ecx + 4]
    mov mov edx, dword ptr [ebp - 44]
    cmp cmp ebx, dword ptr [edx + 4]
    jne L12
    mov mov ebx, dword ptr [ecx + 8]
    cmp cmp ebx, dword ptr [edx + 8]
    jne L13
    mov mov ebx, dword ptr [ecx + 12]
    cmp cmp ebx, dword ptr [edx + 12]
    jne L14
    mov mov ebx, dword ptr [ecx + 72]
    cmp cmp ebx, dword ptr [edx + 72]
    jne L15
    inc inc dword ptr [ebp - 24]
    cmp cmp dword ptr [ebp - 24], 4
    je L16
    inc inc dword ptr [ebp - 20]
    mov mov edx, dword ptr [ebp - 20]
    add add dword ptr [ebp - 12], 4
    cmp cmp edx, dword ptr [ebp - 8]
    jb L4
    mov mov edx, dword ptr [ebp - 24]
    cmp cmp edx, dword ptr [ebp - 4]
    jbe L17
    mov mov dword ptr [ebp - 4], edx
    mov mov edx, dword ptr [eax + 4]
    mov mov dword ptr [ebp - 48], edx
    mov mov edx, dword ptr [ecx + 4]
    mov mov dword ptr [ebp - 64], edx
    mov mov edx, dword ptr [eax + 8]
    mov mov dword ptr [ebp - 52], edx
    mov mov edx, dword ptr [ecx + 8]
    mov mov dword ptr [ebp - 68], edx
    mov mov edx, dword ptr [eax + 12]
    mov mov eax, dword ptr [eax + 72]
    mov mov dword ptr [ebp - 56], edx
    mov mov edx, dword ptr [ecx + 12]
    mov mov dword ptr [ebp - 60], eax
    mov mov eax, dword ptr [ecx + 72]
    mov mov dword ptr [ebp - 72], edx
    mov mov dword ptr [ebp - 76], eax
    cmp cmp dword ptr [ebp - 4], 4
    je L18
    mov mov eax, dword ptr [ebp - 8]
    add add dword ptr [ebp - 28], 4
    add add dword ptr [ebp - 32], 4
    inc inc dword ptr [ebp - 36]
    mov mov ecx, dword ptr [ebp - 36]
    dec dec ecx
    cmp cmp ecx, eax
    jb L7
    jmp L19
    mov mov dword ptr [ebp - 4], ecx
    mov mov eax, dword ptr [ebp - 4]
    push push -1
    and and eax, 0FFFFFh
    push push -1
    or or eax, 050000000h
    push push eax
    mov mov ecx, edi
    call sub_10086341
    cmp cmp eax, -1
    je sub_10088F71
    mov mov ecx, dword ptr [edi + 24]
    mov mov ebx, dword ptr [ecx + eax*4]
    push push esi
    mov mov ecx, ebx
    call sub_1008556F
    mov mov ecx, dword ptr [ebp - 8]
    xor xor eax, eax
    cmp cmp ecx, eax
    mov mov dword ptr [ebp - 36], eax
    mov mov dword ptr [ebp - 28], eax
    jbe L23
    shl shl ecx, 2
    mov mov dword ptr [ebp - 12], ecx
    mov mov ecx, dword ptr [ebp - 4]
    shl shl ecx, 2
    mov mov dword ptr [ebp - 32], ecx
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 36], ecx
L7:
    jae L26
    mov mov ecx, dword ptr [esi + 8]
    cmp cmp dword ptr [ecx + eax*4], -1
L8:
    je L25
    cmp cmp dword ptr [ebp - 16], 4
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [edi + 20]
L10:
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov edx, dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 44], ecx
    mov mov ecx, dword ptr [esi + 8]
    mov mov edx, dword ptr [ecx + edx]
    mov mov ecx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov dword ptr [ebp - 40], ecx
    jbe L22
    mov mov edx, dword ptr [ebp - 48]
    mov mov ecx, dword ptr [ebp - 44]
    cmp cmp edx, dword ptr [ecx + 4]
L14:
    jne sub_10088DCE
    mov mov edx, dword ptr [ebp - 52]
    cmp cmp edx, dword ptr [ecx + 8]
L15:
    jne sub_10088DD6
    mov mov edx, dword ptr [ebp - 56]
    cmp cmp edx, dword ptr [ecx + 12]
    jne sub_10088DDE
    mov mov edx, dword ptr [ebp - 60]
    cmp cmp edx, dword ptr [ecx + 72]
    jne sub_10088DE6
    mov mov edx, dword ptr [ebp - 64]
    mov mov ecx, dword ptr [ebp - 40]
    cmp cmp edx, dword ptr [ecx + 4]
    jne sub_10088DF1
    mov mov edx, dword ptr [ebp - 68]
    cmp cmp edx, dword ptr [ecx + 8]
    jne sub_10088DF9
    mov mov edx, dword ptr [ebp - 72]
    cmp cmp edx, dword ptr [ecx + 12]
    jne sub_10088E01
    mov mov edx, dword ptr [ebp - 76]
    cmp cmp edx, dword ptr [ecx + 72]
    jne sub_10088E09
    mov mov ecx, dword ptr [esi + 8]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [ebp - 36]
    mov mov dword ptr [edx + ecx*4], eax
    mov mov eax, dword ptr [esi + 8]
    mov mov edx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [edx + eax]
    mov mov ecx, dword ptr [ebx + 8]
    mov mov edx, dword ptr [ebp - 32]
    mov mov dword ptr [edx + ecx], eax
    mov mov ecx, dword ptr [esi + 8]
    mov mov eax, dword ptr [ebp - 28]
    or or dword ptr [ecx + eax*4], -1
    mov mov ecx, dword ptr [esi + 8]
    mov mov edx, dword ptr [ebp - 12]
    or or dword ptr [edx + ecx], -1
    inc inc dword ptr [ebp - 36]
    add add dword ptr [ebp - 32], 4
    add add dword ptr [ebp - 12], 4
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 28], eax
    jb L24
    cmp cmp dword ptr [ebp - 8], 4
    jbe sub_10088ED0
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push -1
    push push -1
    push push dword ptr [edi + 088h]
    mov mov ecx, edi
    call sub_10086408
    mov mov ecx, dword ptr [ebx + 16]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebx + 16]
    cmp cmp dword ptr [eax], -1
    je sub_100890A0
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov eax, dword ptr [edi + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ebx + 16]
    mov mov edx, dword ptr [edx]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov dword ptr [eax + 20], ecx
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [edi + 20]
L18:
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edx]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov dword ptr [eax + 24], ecx
    jmp sub_10088F37
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebp - 4]
    sub sub dword ptr [ebp - 16], eax
    inc inc dword ptr [ebp + 8]
    cmp cmp dword ptr [ebp - 16], 0
    ja L20
    cmp cmp dword ptr [ebp + 8], 1
    jbe L21
    push push ecx
    fld1 fld1
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push -1
    push push dword ptr [edi + 120]
    mov mov ecx, edi
    call sub_10086489
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 76], eax
    je sub_1008911C
    mov mov eax, dword ptr [edi + 12]
    sub sub eax, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 24], eax
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 8], eax
    mov mov dword ptr [ebp - 20], eax
    jbe sub_1008911F
    mov mov dword ptr [ebp - 36], eax
    mov mov eax, dword ptr [ebp + 8]
    sub sub eax, dword ptr [ebp - 36]
    push push 4
    pop pop ecx
    cmp cmp eax, ecx
    mov mov dword ptr [ebp - 8], eax
    jbe sub_10089016
    mov mov dword ptr [ebp - 8], ecx
    mov mov eax, ecx
    cmp cmp eax, 1
    push push -1
    push push -1
    jne sub_10089034
    push push 010000001h
    jmp sub_10089052
    cmp cmp eax, 2
    jne sub_1008904C
    push push 020400001h
    jmp sub_1008905E
    and and eax, 0FFFFFh
    or or eax, 050000000h
    push push eax
    mov mov ecx, edi
    call sub_10086552
    cmp cmp eax, -1
    je sub_10089182
    mov mov ecx, dword ptr [edi + 24]
    mov mov ebx, dword ptr [ecx + eax*4]
    push push esi
    mov mov ecx, ebx
    call sub_10085780
    mov mov ecx, dword ptr [ebp - 8]
    xor xor eax, eax
    test test ecx, ecx
    mov mov dword ptr [ebp - 16], eax
    jbe sub_10089106
    shl shl ecx, 2
    mov mov dword ptr [ebp - 28], ecx
    mov mov ecx, dword ptr [ebp - 24]
    shl shl ecx, 2
    mov mov dword ptr [ebp - 32], ecx
    cmp cmp dword ptr [ebp - 8], 2
    mov mov ecx, dword ptr [edi + 24]
    mov mov edx, dword ptr [ebp - 32]
    mov mov ecx, dword ptr [edx + ecx]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov edx, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [edx + eax*4], ecx
    jbe sub_1008911B
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [ebp - 76]
    mov mov edx, dword ptr [ebp - 28]
    mov mov dword ptr [edx + eax], ecx
    mov mov eax, dword ptr [ebp - 16]
    add add dword ptr [ebp - 32], 4
    add add dword ptr [ebp - 28], 4
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 16], eax
    jb sub_10089115
    cmp cmp dword ptr [ebp + 8], 4
    jbe sub_100891B4
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push -1
    push push -1
    push push dword ptr [edi + 088h]
    mov mov ecx, edi
    call sub_1008657C
    mov mov ecx, dword ptr [ebx + 16]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebx + 16]
    cmp cmp dword ptr [eax], -1
    je sub_10089210
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov eax, dword ptr [edi + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ebx + 16]
    mov mov edx, dword ptr [edx]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov dword ptr [eax + 20], ecx
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edx]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov dword ptr [eax + 24], ecx
L22:
    jmp sub_10089217
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebp - 8]
    add add dword ptr [ebp - 24], eax
    add add dword ptr [ebp - 36], 4
    mov mov eax, dword ptr [ebp - 36]
    inc inc dword ptr [ebp - 20]
L26:
    cmp cmp eax, dword ptr [ebp + 8]
    jb sub_10089122
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, 1
    mov mov dword ptr [ebp + 8], eax
    ja sub_10089117
    jmp sub_10088DE6
    mov mov eax, 08007000Eh
    jmp sub_10088DF2
FUN_10088905 ENDP
END
