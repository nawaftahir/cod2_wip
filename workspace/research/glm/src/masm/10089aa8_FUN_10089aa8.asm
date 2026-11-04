.686
.MODEL FLAT, C
EXTRN sub_10089BE3:PROC
.CODE
FUN_10089aa8 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 40
    xor edx, edx
    mov dword ptr [ebp - 12], ecx
    mov dword ptr [ebp - 4], edx
    xor eax, eax
    push esi
L0:
    mov esi, dword ptr [ebp + 12]
    cmp dword ptr [esi + eax*4], -1
    je L1
    inc dword ptr [ebp - 4]
    inc eax
    cmp eax, 4
    jb L0
L1:
    cmp dword ptr [ebp - 4], edx
    jne L2
    xor eax, eax
    jmp L42
L2:
    mov eax, dword ptr [ecx + 108]
    test al, 6
    push ebx
    mov ebx, dword ptr [ebp + 16]
    push edi
    jne L7
    cmp dword ptr [ebp - 4], edx
    jbe L3
    mov ecx, dword ptr [ebp - 4]
    xor eax, eax
    mov edi, ebx
    rep stosd dword ptr es:[edi], eax
L3:
    mov eax, dword ptr [ebp + 8]
    and dword ptr [ebp - 24], 0
    mov dword ptr [ebp - 16], eax
L4:
    mov esi, dword ptr [ebp - 16]
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp - 4], 0
    lea edi, [ebp - 40]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    jbe L27
L5:
    mov edi, dword ptr [ebp - 8]
    xor ecx, ecx
    shl edi, 2
    mov esi, dword ptr [edi + ebx]
L6:
    xor eax, eax
    inc eax
    shl eax, cl
    test esi, eax
    je L24
    lea eax, [ebp + ecx*4 - 40]
    mov edx, dword ptr [eax]
    cmp edx, -1
    jne L23
    mov edx, dword ptr [ebp + 12]
    mov edx, dword ptr [edi + edx]
    mov dword ptr [eax], edx
    jmp L24
L7:
    xor edi, edi
    inc edi
    cmp dword ptr [ebp - 4], edi
    jbe L10
    mov ecx, dword ptr [ecx + 20]
    mov eax, dword ptr [esi]
    mov esi, dword ptr [ecx + eax*4]
L8:
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax + edi*4]
    mov eax, dword ptr [ecx + eax*4]
    fld qword ptr [eax + 32]
    fld qword ptr [esi + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L9
    inc edi
    cmp edi, dword ptr [ebp - 4]
    jb L8
L9:
    mov ecx, dword ptr [ebp - 12]
L10:
    cmp edi, dword ptr [ebp - 4]
    jne L11
    and dword ptr [ebx], 0
    mov dword ptr [ebp - 4], 1
L11:
    xor eax, eax
    cmp dword ptr [ebp - 4], eax
    jbe L13
L12:
    xor ecx, ecx
    cmp dword ptr [ebx + eax*4], ecx
    sete cl
    add edx, ecx
    inc eax
    cmp eax, dword ptr [ebp - 4]
    jb L12
    mov ecx, dword ptr [ebp - 12]
L13:
    test byte ptr [ecx + 108], 4
    je L17
    test edx, edx
    je L17
    cmp edx, 1
    ja L22
    xor ecx, ecx
    cmp dword ptr [ebp - 4], ecx
    jbe L16
    push 8
    pop edx
L14:
    mov eax, dword ptr [ebx + ecx*4]
    test dl, al
    jne L22
    test eax, eax
    jne L15
    mov dword ptr [ebx + ecx*4], edx
L15:
    inc ecx
    cmp ecx, dword ptr [ebp - 4]
    jb L14
L16:
    xor edx, edx
L17:
    xor eax, eax
    xor esi, esi
    cmp dword ptr [ebp - 4], eax
    jbe L19
L18:
    mov ecx, dword ptr [ebx + eax*4]
    test esi, ecx
    jne L22
    or esi, ecx
    inc eax
    cmp eax, dword ptr [ebp - 4]
    jb L18
L19:
    xor eax, eax
    xor ecx, ecx
L20:
    xor edi, edi
    inc edi
    shl edi, cl
    test esi, edi
    je L21
    inc eax
L21:
    inc ecx
    cmp ecx, 4
    jb L20
    add eax, edx
    cmp eax, 4
    jbe L3
L22:
    mov eax, 080004005h
    jmp L41
L23:
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + 20]
    mov ebx, dword ptr [ebp + 12]
    mov edx, dword ptr [eax + edx*4]
    mov ebx, dword ptr [edi + ebx]
    mov eax, dword ptr [eax + ebx*4]
    fld qword ptr [eax + 32]
    mov ebx, dword ptr [ebp + 16]
    fld qword ptr [edx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L25
L24:
    inc ecx
    cmp ecx, 4
    jb L6
L25:
    cmp ecx, 4
    jb L26
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 4]
    jb L5
L26:
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 4]
    jb L37
L27:
    xor eax, eax
    cmp dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 20], eax
    jbe L38
    mov edx, dword ptr [ebp + 12]
    mov dword ptr [ebp - 8], ebx
    sub dword ptr [ebp - 8], edx
L28:
    mov ecx, dword ptr [ebp - 8]
    xor esi, esi
    cmp dword ptr [ecx + edx], esi
    jne L35
    mov edi, eax
    shl edi, 2
L29:
    mov ecx, dword ptr [ebp + esi*4 - 40]
    cmp ecx, -1
    je L30
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + 20]
    mov ebx, dword ptr [ebp + 12]
    mov ecx, dword ptr [eax + ecx*4]
    mov ebx, dword ptr [edi + ebx]
    mov eax, dword ptr [eax + ebx*4]
    fld qword ptr [eax + 32]
    mov ebx, dword ptr [ebp + 16]
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L31
L30:
    inc esi
    cmp esi, 4
    jb L29
L31:
    cmp esi, 4
    jb L35
    xor eax, eax
L32:
    cmp dword ptr [ebp + eax*4 - 40], -1
    je L33
    inc eax
    cmp eax, 4
    jb L32
    jmp L34
L33:
    mov ecx, dword ptr [edx]
    mov dword ptr [ebp + eax*4 - 40], ecx
L34:
    cmp eax, 4
    je L36
L35:
    mov eax, dword ptr [ebp - 20]
    inc eax
    add edx, 4
    cmp eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 20], eax
    jb L28
L36:
    mov eax, dword ptr [ebp - 4]
    cmp dword ptr [ebp - 20], eax
    jae L38
L37:
    inc dword ptr [ebp - 24]
    add dword ptr [ebp - 16], 16
    jmp L4
L38:
    mov eax, dword ptr [ebp - 16]
    mov edi, dword ptr [ebp + 12]
    lea ecx, [ebp - 40]
    sub eax, ecx
    mov dword ptr [ebp + 16], eax
    mov eax, ecx
    xor ebx, ebx
    sub edi, eax
L39:
    mov ecx, dword ptr [ebp + 16]
    mov esi, ebx
    shl esi, 2
    mov eax, dword ptr [ebp + esi - 40]
    add ecx, esi
    cmp eax, dword ptr [ebp + ecx - 40]
    je L40
    mov ecx, dword ptr [ebp - 12]
    push eax
    push ebx
    push dword ptr [ebp - 24]
    push dword ptr [ebp + 8]
    call sub_10089BE3
L40:
    add esi, edi
    inc ebx
    cmp ebx, 4
    mov dword ptr [ebp + esi - 40], eax
    jb L39
    xor eax, eax
L41:
    pop edi
    pop ebx
L42:
    pop esi
    leave
    ret 12
FUN_10089aa8 ENDP
END
