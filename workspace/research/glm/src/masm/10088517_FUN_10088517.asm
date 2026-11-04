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
EXTRN sub_10088551:PROC
EXTRN sub_100886EA:PROC
EXTRN sub_1008872D:PROC
EXTRN sub_1008879F:PROC
EXTRN sub_100887E3:PROC
.CODE
FUN_10088517 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 44
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi + 4]
    push edi
    mov edi, dword ptr [esi + 12]
    xor edx, edx
    div edi
    mov ebx, ecx
    mov ecx, esi
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp + 8], edi
    mov dword ptr [ebp - 16], eax
    call sub_10085469
    test eax, eax
    je L5
    and dword ptr [ebp - 24], 0
    test edi, edi
    jbe L3
L0:
    mov eax, dword ptr [esi]
    push -1
    and eax, 0FFF00001h
    push -1
    or eax, 1
    push eax
    mov ecx, ebx
    call sub_100861E5
    cmp eax, -1
    je L39
    mov ecx, dword ptr [ebx + 24]
    mov edi, dword ptr [ecx + eax*4]
    push esi
    mov ecx, edi
    call sub_10085413
    xor eax, eax
    cmp dword ptr [ebp - 16], eax
    jbe L2
L1:
    mov ecx, dword ptr [esi + 12]
    mov edx, dword ptr [esi + 8]
    imul ecx, eax
    add ecx, dword ptr [ebp - 24]
    mov ebx, dword ptr [edi + 8]
    mov ecx, dword ptr [edx + ecx*4]
    mov dword ptr [ebx + eax*4], ecx
    inc eax
    cmp eax, dword ptr [ebp - 16]
    jb L1
    mov ebx, dword ptr [ebp - 8]
L2:
    mov eax, dword ptr [ebp - 24]
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edi + 16]
    inc eax
    cmp eax, dword ptr [ebp + 8]
    mov dword ptr [edx], ecx
    mov dword ptr [ebp - 24], eax
    jb L0
L3:
    xor eax, eax
L4:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
L5:
    xor edx, edx
    test edi, edi
    mov dword ptr [ebp - 12], edi
    mov dword ptr [ebp - 24], edx
    jbe L17
L6:
    mov edi, dword ptr [esi + 16]
    mov eax, dword ptr [edi + edx*4]
    cmp eax, -1
    je L16
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov ecx, dword ptr [ebx + 16]
    mov eax, dword ptr [ecx + eax*4]
    test byte ptr [eax + 4], 64
    je L16
    and dword ptr [ebp - 4], 0
    cmp edx, dword ptr [ebp + 8]
    mov eax, edx
    mov dword ptr [ebp - 36], eax
    jae L10
    jmp L8
L7:
    mov edx, dword ptr [ebp - 24]
L8:
    mov ecx, eax
    shl ecx, 2
    cmp dword ptr [ecx + edi], -1
    je L9
    mov eax, dword ptr [esi + 16]
    push dword ptr [eax + ecx]
    mov ecx, ebx
    push dword ptr [eax + edx*4]
    call sub_100884DE
    test eax, eax
    je L9
    inc dword ptr [ebp - 4]
L9:
    mov eax, dword ptr [ebp - 36]
    inc eax
    cmp eax, dword ptr [ebp + 8]
    mov dword ptr [ebp - 36], eax
    jb L7
L10:
    mov eax, dword ptr [esi]
    xor eax, dword ptr [ebp - 4]
    push -1
    and eax, 0000FFFFFh
    xor eax, dword ptr [esi]
    push -1
    push eax
    mov ecx, ebx
    call sub_100862D2
    cmp eax, -1
    je L39
    mov ecx, dword ptr [ebx + 24]
    mov edi, dword ptr [ecx + eax*4]
    push esi
    mov ecx, edi
    call sub_10085500
    mov ebx, dword ptr [ebp - 24]
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ebx*4]
    and dword ptr [ebp - 4], 0
    mov dword ptr [ebp - 44], eax
    mov eax, dword ptr [ebp + 8]
    cmp ebx, eax
L11:
    mov dword ptr [ebp - 28], ebx
    jae L15
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ebx*4]
    cmp eax, -1
    je L14
    mov ecx, dword ptr [ebp - 8]
    push eax
    push dword ptr [ebp - 44]
    call sub_10088551
    test eax, eax
    je L14
    and dword ptr [ebp - 20], 0
    cmp dword ptr [ebp - 16], 0
    jbe L13
L12:
    mov eax, dword ptr [esi + 12]
    imul eax, dword ptr [ebp - 20]
    mov edx, dword ptr [edi + 12]
    imul edx, dword ptr [ebp - 20]
    mov ecx, dword ptr [esi + 8]
    add edx, dword ptr [ebp - 4]
    add eax, ebx
    mov ebx, dword ptr [edi + 8]
    mov eax, dword ptr [ecx + eax*4]
    inc dword ptr [ebp - 20]
    mov dword ptr [ebx + edx*4], eax
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebp - 16]
    mov ebx, dword ptr [ebp - 28]
    jb L12
L13:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ebx*4]
    mov ecx, dword ptr [edi + 16]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ecx + edx*4], eax
    mov eax, dword ptr [esi + 16]
    or dword ptr [eax + ebx*4], 0FFFFFFFFh
    dec dword ptr [ebp - 12]
    inc dword ptr [ebp - 4]
L14:
    inc ebx
    cmp ebx, dword ptr [ebp + 8]
    jmp L11
L15:
    mov ebx, dword ptr [ebp - 8]
L16:
    mov edx, dword ptr [ebp - 24]
    inc edx
    cmp edx, dword ptr [ebp + 8]
    mov dword ptr [ebp - 24], edx
    jb L6
L17:
    mov ecx, esi
    call sub_100857FC
    xor edx, edx
    inc edx
    test eax, eax
    mov dword ptr [ebp - 40], eax
    mov dword ptr [ebp - 32], edx
    mov dword ptr [ebp - 36], edx
    jne L21
    and dword ptr [ebp - 28], eax
    cmp dword ptr [ebp + 8], eax
    jbe L21
    mov ecx, dword ptr [esi + 16]
L18:
    mov eax, dword ptr [ecx]
    cmp eax, -1
    je L19
    mov edi, dword ptr [ebx + 20]
    mov eax, dword ptr [edi + eax*4]
    mov eax, dword ptr [eax + 4]
    mov edi, dword ptr [ebx + 16]
    mov eax, dword ptr [edi + eax*4]
    test byte ptr [eax + 5], 16
    jne L20
L19:
    inc dword ptr [ebp - 28]
    mov eax, dword ptr [ebp - 28]
    add ecx, 4
    cmp eax, dword ptr [ebp + 8]
    jb L18
    jmp L21
L20:
    mov dword ptr [ebp - 40], edx
L21:
    cmp dword ptr [ebp - 12], 0
    je L3
    jmp L23
L22:
    mov ebx, dword ptr [ebp - 8]
L23:
    cmp dword ptr [ebp - 12], 4
    ja L24
    xor eax, eax
    cmp dword ptr [ebp - 40], eax
    jne L24
    mov dword ptr [ebp - 32], eax
    mov dword ptr [ebp - 36], eax
L24:
    xor ecx, ecx
    cmp dword ptr [ebp + 8], ecx
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 20], ecx
    jbe L3
L25:
    mov eax, dword ptr [esi + 16]
    cmp dword ptr [eax + ecx*4], -1
    je L31
    xor edi, edi
    mov dword ptr [ebp - 24], edi
L26:
    cmp dword ptr [ebp - 24], 4
    jae L30
    mov eax, dword ptr [esi + 16]
    cmp dword ptr [eax + edi*4], -1
    je L29
    cmp dword ptr [ebp - 32], 0
    je L27
    push dword ptr [eax + edi*4]
    push dword ptr [eax + ecx*4]
    mov ecx, ebx
    call sub_100886EA
    test eax, eax
    je L29
L27:
    cmp dword ptr [ebp - 36], 0
    je L28
    push edi
    push dword ptr [ebp - 20]
    mov ecx, ebx
    push esi
    call sub_1008872D
    test eax, eax
    jne L29
L28:
    inc dword ptr [ebp - 24]
L29:
    mov ecx, dword ptr [ebp - 20]
    inc edi
    cmp edi, dword ptr [ebp + 8]
    jb L26
L30:
    mov eax, dword ptr [ebp - 24]
    cmp dword ptr [ebp - 4], eax
    jae L31
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 44], ecx
L31:
    inc ecx
    cmp ecx, dword ptr [ebp + 8]
    mov dword ptr [ebp - 20], ecx
    jb L25
    cmp dword ptr [ebp - 4], 0
    je L3
    mov eax, dword ptr [esi]
    xor eax, dword ptr [ebp - 4]
    push -1
    and eax, 0000FFFFFh
    xor eax, dword ptr [esi]
    push -1
    push eax
    mov ecx, ebx
    call sub_1008649D
    cmp eax, -1
    je L39
    mov ecx, dword ptr [ebx + 24]
    mov edi, dword ptr [ecx + eax*4]
    push esi
    mov ecx, edi
    call sub_100856CB
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [ebp - 44]
    mov eax, dword ptr [eax + ecx*4]
    xor ebx, ebx
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 20], ebx
    mov dword ptr [ebp - 28], ebx
L32:
    cmp dword ptr [ebp - 20], 4
    jae L38
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ebx*4]
    cmp eax, -1
    je L37
    cmp dword ptr [ebp - 32], 0
    je L33
    mov ecx, dword ptr [ebp - 8]
    push eax
    push dword ptr [ebp - 4]
    call sub_1008879F
    test eax, eax
    je L37
L33:
    cmp dword ptr [ebp - 36], 0
    je L34
    mov ecx, dword ptr [ebp - 8]
    push ebx
    push dword ptr [ebp - 44]
    push esi
    call sub_100887E3
    test eax, eax
    jne L37
L34:
    and dword ptr [ebp - 24], 0
    cmp dword ptr [ebp - 16], 0
    jbe L36
L35:
    mov eax, dword ptr [esi + 12]
    imul eax, dword ptr [ebp - 24]
    mov edx, dword ptr [edi + 12]
    imul edx, dword ptr [ebp - 24]
    mov ecx, dword ptr [esi + 8]
    add edx, dword ptr [ebp - 20]
    add eax, ebx
    mov ebx, dword ptr [edi + 8]
    mov eax, dword ptr [ecx + eax*4]
    inc dword ptr [ebp - 24]
    mov dword ptr [ebx + edx*4], eax
    mov eax, dword ptr [ebp - 24]
    cmp eax, dword ptr [ebp - 16]
    mov ebx, dword ptr [ebp - 28]
    jb L35
L36:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ebx*4]
    mov ecx, dword ptr [edi + 16]
    mov edx, dword ptr [ebp - 20]
    mov dword ptr [ecx + edx*4], eax
    mov eax, dword ptr [esi + 16]
    or dword ptr [eax + ebx*4], 0FFFFFFFFh
    dec dword ptr [ebp - 12]
    inc dword ptr [ebp - 20]
L37:
    inc ebx
    cmp ebx, dword ptr [ebp + 8]
    mov dword ptr [ebp - 28], ebx
    jb L32
L38:
    cmp dword ptr [ebp - 12], 0
    jne L22
    jmp L3
L39:
    mov eax, 08007000Eh
    jmp L4
FUN_10088517 ENDP
END
