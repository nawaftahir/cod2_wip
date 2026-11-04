.686
.MODEL FLAT, C
EXTRN sub_10085413:PROC
EXTRN sub_10085469:PROC
EXTRN sub_10085500:PROC
EXTRN sub_100856CB:PROC
EXTRN sub_100857FC:PROC
EXTRN sub_100861E5:PROC
EXTRN sub_100862D2:PROC
EXTRN sub_1008649D:PROC
EXTRN sub_100884DE:PROC
EXTRN sub_10088950:PROC
EXTRN sub_10088960:PROC
EXTRN sub_10088961:PROC
EXTRN sub_10088967:PROC
EXTRN sub_10088969:PROC
EXTRN sub_10088985:PROC
EXTRN sub_10088998:PROC
EXTRN sub_1008899A:PROC
EXTRN sub_100889A6:PROC
EXTRN sub_100889B6:PROC
EXTRN sub_100889D2:PROC
EXTRN sub_100889D9:PROC
EXTRN sub_10088A3D:PROC
EXTRN sub_10088A58:PROC
EXTRN sub_10088A65:PROC
EXTRN sub_10088A6B:PROC
EXTRN sub_10088A6E:PROC
EXTRN sub_10088A82:PROC
EXTRN sub_10088A85:PROC
EXTRN sub_10088A98:PROC
EXTRN sub_10088AC3:PROC
EXTRN sub_10088B44:PROC
EXTRN sub_10088BC3:PROC
EXTRN sub_10088BF0:PROC
EXTRN sub_10088C08:PROC
EXTRN sub_10088C1B:PROC
EXTRN sub_10088C25:PROC
EXTRN sub_10088C27:PROC
EXTRN sub_10088C3D:PROC
EXTRN sub_10088C42:PROC
EXTRN sub_10088C54:PROC
.CODE
FUN_10088517 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 44
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov eax, dword ptr [esi + 4]
    push push edi
    mov mov edi, dword ptr [esi + 12]
    xor xor edx, edx
    div div edi
    mov mov ebx, ecx
    mov mov ecx, esi
    mov mov dword ptr [ebp - 8], ebx
    mov mov dword ptr [ebp + 8], edi
    mov mov dword ptr [ebp - 16], eax
    call sub_10085469
    test test eax, eax
    je L2
    and and dword ptr [ebp - 24], 0
    test test edi, edi
    jbe L1
    mov mov eax, dword ptr [esi]
    push push -1
L0:
    and and eax, 0FFF00001h
    push push -1
    or or eax, 1
    push push eax
    mov mov ecx, ebx
    call sub_100861E5
    cmp cmp eax, -1
    je sub_10088950
    mov mov ecx, dword ptr [ebx + 24]
    mov mov edi, dword ptr [ecx + eax*4]
    push push esi
    mov mov ecx, edi
    call sub_10085413
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 16], eax
    jbe L4
    mov mov ecx, dword ptr [esi + 12]
    mov mov edx, dword ptr [esi + 8]
    imul imul ecx, eax
    add add ecx, dword ptr [ebp - 24]
    mov mov ebx, dword ptr [edi + 8]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov dword ptr [ebx + eax*4], ecx
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 16]
    jb L3
    mov mov ebx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [edi + 16]
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 8]
    mov mov dword ptr [edx], ecx
    mov mov dword ptr [ebp - 24], eax
    jb L1
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
    xor xor edx, edx
    test test edi, edi
    mov mov dword ptr [ebp - 12], edi
    mov mov dword ptr [ebp - 24], edx
    jbe L14
    mov mov edi, dword ptr [esi + 16]
    mov mov eax, dword ptr [edi + edx*4]
    cmp cmp eax, -1
    je L13
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [ecx + eax*4]
L2:
    test test byte ptr [eax + 4], 64
    je L15
    and and dword ptr [ebp - 4], 0
    cmp cmp edx, dword ptr [ebp + 8]
    mov mov eax, edx
    mov mov dword ptr [ebp - 36], eax
    jae L7
    jmp L6
    mov mov edx, dword ptr [ebp - 24]
    mov mov ecx, eax
    shl shl ecx, 2
    cmp cmp dword ptr [ecx + edi], -1
    je L9
    mov mov eax, dword ptr [esi + 16]
    push push dword ptr [eax + ecx]
    mov mov ecx, ebx
    push push dword ptr [eax + edx*4]
    call sub_100884DE
    test test eax, eax
    je L11
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 36]
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 36], eax
    jb L8
    mov mov eax, dword ptr [esi]
    xor xor eax, dword ptr [ebp - 4]
    push push -1
    and and eax, 0FFFFFh
    xor xor eax, dword ptr [esi]
    push push -1
    push push eax
    mov mov ecx, ebx
    call sub_100862D2
    cmp cmp eax, -1
    je sub_10088A3D
    mov mov ecx, dword ptr [ebx + 24]
    mov mov edi, dword ptr [ecx + eax*4]
    push push esi
    mov mov ecx, edi
    call sub_10085500
    mov mov ebx, dword ptr [ebp - 24]
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ebx*4]
    and and dword ptr [ebp - 4], 0
    mov mov dword ptr [ebp - 44], eax
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp ebx, eax
    mov mov dword ptr [ebp - 28], ebx
    jae L20
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ebx*4]
    cmp cmp eax, -1
    je L22
    mov mov ecx, dword ptr [ebp - 8]
    push push eax
    push push dword ptr [ebp - 44]
    call L0
    test test eax, eax
    je L23
    and and dword ptr [ebp - 20], 0
    cmp cmp dword ptr [ebp - 16], 0
    jbe L21
    mov mov eax, dword ptr [esi + 12]
    imul imul eax, dword ptr [ebp - 20]
    mov mov edx, dword ptr [edi + 12]
    imul imul edx, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [esi + 8]
    add add edx, dword ptr [ebp - 4]
    add add eax, ebx
    mov mov ebx, dword ptr [edi + 8]
    mov mov eax, dword ptr [ecx + eax*4]
    inc inc dword ptr [ebp - 20]
    mov mov dword ptr [ebx + edx*4], eax
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [ebp - 16]
    mov mov ebx, dword ptr [ebp - 28]
    jb L21
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov ecx, dword ptr [edi + 16]
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + edx*4], eax
    mov mov eax, dword ptr [esi + 16]
    or or dword ptr [eax + ebx*4], -1
    dec dec dword ptr [ebp - 12]
    inc inc dword ptr [ebp - 4]
    inc inc ebx
    cmp cmp ebx, dword ptr [ebp + 8]
    jmp L19
    mov mov ebx, dword ptr [ebp - 8]
    mov mov edx, dword ptr [ebp - 24]
    inc inc edx
    cmp cmp edx, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 24], edx
    jb L14
    mov mov ecx, esi
    call sub_100857FC
    xor xor edx, edx
    inc inc edx
    test test eax, eax
    mov mov dword ptr [ebp - 40], eax
    mov mov dword ptr [ebp - 32], edx
    mov mov dword ptr [ebp - 36], edx
    jne sub_10088961
    and and dword ptr [ebp - 28], eax
    cmp cmp dword ptr [ebp + 8], eax
    jbe sub_10088969
    mov mov ecx, dword ptr [esi + 16]
L9:
    mov mov eax, dword ptr [ecx]
    cmp cmp eax, -1
    je sub_10088960
    mov mov edi, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov eax, dword ptr [eax + 4]
    mov mov edi, dword ptr [ebx + 16]
    mov mov eax, dword ptr [edi + eax*4]
    test test byte ptr [eax + 5], 16
    jne sub_10088985
    inc inc dword ptr [ebp - 28]
    mov mov eax, dword ptr [ebp - 28]
    add add ecx, 4
    cmp cmp eax, dword ptr [ebp + 8]
    jb sub_10088967
    jmp sub_10088998
    mov mov dword ptr [ebp - 40], edx
    cmp cmp dword ptr [ebp - 12], 0
    je L17
    jmp sub_100889B6
    mov mov ebx, dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 12], 4
    ja sub_100889D2
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 40], eax
    jne sub_100889D9
    mov mov dword ptr [ebp - 32], eax
    mov mov dword ptr [ebp - 36], eax
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + 8], ecx
    mov mov dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 20], ecx
    jbe L18
    mov mov eax, dword ptr [esi + 16]
    cmp cmp dword ptr [eax + ecx*4], -1
    je sub_10088A6E
    xor xor edi, edi
    mov mov dword ptr [ebp - 24], edi
    cmp cmp dword ptr [ebp - 24], 4
    jae sub_10088A6B
    mov mov eax, dword ptr [esi + 16]
    cmp cmp dword ptr [eax + edi*4], -1
    je sub_10088A6B
    cmp cmp dword ptr [ebp - 32], 0
    je sub_10088A58
    push push dword ptr [eax + edi*4]
    push push dword ptr [eax + ecx*4]
    mov mov ecx, ebx
    call L5
    test test eax, eax
    je sub_10088A82
L14:
    cmp cmp dword ptr [ebp - 36], 0
    je sub_10088A85
    push push edi
    push push dword ptr [ebp - 20]
    mov mov ecx, ebx
    push push esi
    call L10
    test test eax, eax
    jne sub_10088A98
    inc inc dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebp - 20]
    inc inc edi
    cmp cmp edi, dword ptr [ebp + 8]
    jb sub_10088A65
    mov mov eax, dword ptr [ebp - 24]
    cmp cmp dword ptr [ebp - 4], eax
    jae sub_10088AC3
    mov mov dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp - 44], ecx
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 20], ecx
    jb sub_10088A6E
    cmp cmp dword ptr [ebp - 4], 0
    je L24
    mov mov eax, dword ptr [esi]
    xor xor eax, dword ptr [ebp - 4]
    push push -1
    and and eax, 0FFFFFh
    xor xor eax, dword ptr [esi]
    push push -1
    push push eax
    mov mov ecx, ebx
    call sub_1008649D
    cmp cmp eax, -1
    je sub_10088C08
    mov mov ecx, dword ptr [ebx + 24]
    mov mov edi, dword ptr [ecx + eax*4]
    push push esi
L18:
    mov mov ecx, edi
    call sub_100856CB
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ebp - 44]
    mov mov eax, dword ptr [eax + ecx*4]
    xor xor ebx, ebx
    mov mov dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp - 20], ebx
    mov mov dword ptr [ebp - 28], ebx
    cmp cmp dword ptr [ebp - 20], 4
    jae sub_10088C25
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ebx*4]
    cmp cmp eax, -1
    je sub_10088C27
L20:
    cmp cmp dword ptr [ebp - 32], 0
    je sub_10088BC3
    mov mov ecx, dword ptr [ebp - 8]
    push push eax
    push push dword ptr [ebp - 4]
    call L12
    test test eax, eax
    je sub_10088C3D
    cmp cmp dword ptr [ebp - 36], 0
    je sub_10088BF0
    mov mov ecx, dword ptr [ebp - 8]
    push push ebx
    push push dword ptr [ebp - 44]
    push push esi
    call L16
    test test eax, eax
    jne sub_10088C54
    and and dword ptr [ebp - 24], 0
    cmp cmp dword ptr [ebp - 16], 0
    jbe sub_10088C42
    mov mov eax, dword ptr [esi + 12]
    imul imul eax, dword ptr [ebp - 24]
    mov mov edx, dword ptr [edi + 12]
    imul imul edx, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [esi + 8]
    add add edx, dword ptr [ebp - 20]
    add add eax, ebx
    mov mov ebx, dword ptr [edi + 8]
    mov mov eax, dword ptr [ecx + eax*4]
    inc inc dword ptr [ebp - 24]
    mov mov dword ptr [ebx + edx*4], eax
    mov mov eax, dword ptr [ebp - 24]
    cmp cmp eax, dword ptr [ebp - 16]
    mov mov ebx, dword ptr [ebp - 28]
    jb sub_10088C42
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov ecx, dword ptr [edi + 16]
    mov mov edx, dword ptr [ebp - 20]
    mov mov dword ptr [ecx + edx*4], eax
    mov mov eax, dword ptr [esi + 16]
    or or dword ptr [eax + ebx*4], -1
    dec dec dword ptr [ebp - 12]
    inc inc dword ptr [ebp - 20]
    inc inc ebx
    cmp cmp ebx, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 28], ebx
    jb sub_10088C1B
    cmp cmp dword ptr [ebp - 12], 0
    jne sub_10088B44
    jmp sub_1008899A
    mov mov eax, 08007000Eh
    jmp sub_100889A6
FUN_10088517 ENDP
END
