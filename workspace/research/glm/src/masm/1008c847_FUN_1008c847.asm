.686
.MODEL FLAT, C
EXTRN sub_1008A9CE:PROC
EXTRN sub_1008B069:PROC
EXTRN sub_1008B221:PROC
EXTRN sub_1008B258:PROC
EXTRN sub_100F9261:PROC
EXTRN sub_100F93AB:PROC
EXTRN sub_100F93E2:PROC
EXTRN g_1019BEB0:DWORD
.CODE
FUN_1008c847 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 36
    push ebx
    xor eax, eax
    push esi
    mov esi, ecx
    cmp dword ptr [esi + 8], eax
    push edi
    mov dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 20], eax
    mov dword ptr [ebp - 8], eax
    jbe L28
    jmp L1
L0:
    xor eax, eax
L1:
    mov ecx, dword ptr [esi + 20]
    mov edx, dword ptr [ebp - 8]
    mov ebx, dword ptr [ecx + edx*4]
    mov ecx, dword ptr [esi + 116]
    cmp ecx, dword ptr [ebx + 4]
    je L27
    lea edi, [ebx + 8]
    cmp dword ptr [edi], -1
    je L27
    cmp dword ptr [ebp - 20], eax
    jne L2
    mov ecx, esi
    call sub_1008A9CE
    mov dword ptr [ebp - 20], 1
L2:
    mov ecx, dword ptr [edi]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + 72]
    cmp eax, -1
    mov dword ptr [ebp - 28], ecx
    je L5
    mov edx, dword ptr [esi + 24]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [eax]
    and edx, 0FFF00000h
    cmp edx, 010000000h
    jne L5
    and dword ptr [ebp - 4], 0
    cmp dword ptr [eax + 12], 0
    jbe L4
    mov edx, dword ptr [eax + 16]
L3:
    cmp dword ptr [edx], ecx
    je L4
    inc dword ptr [ebp - 4]
    mov edi, dword ptr [eax + 12]
    add edx, 4
    cmp dword ptr [ebp - 4], edi
    jb L3
L4:
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 4]
    lea edi, [eax + ecx*4]
L5:
    test byte ptr [esi + 111], 1
    mov edx, dword ptr [edi]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + edx*4]
    mov dword ptr [ebp - 4], edi
    je L6
    fldz
    jmp L7
L6:
    fld qword ptr [g_1019BEB0]
L7:
    mov ecx, dword ptr [esi + 16]
    fstp qword ptr [ebp - 36]
    mov edi, dword ptr [eax + 4]
    mov ecx, dword ptr [ecx + edi*4]
    mov ecx, dword ptr [ecx + 4]
    test ch, 1
    je L13
    cmp dword ptr [eax + 8], -1
    jne L13
    fld qword ptr [ebp - 36]
    fadd qword ptr [eax + 32]
    call sub_100F9261
    mov ecx, dword ptr [esi + 8]
    and dword ptr [ebp - 4], 0
    mov edi, eax
    add edi, dword ptr [ebx + 12]
    test ecx, ecx
    jbe L12
    mov eax, dword ptr [esi + 20]
    mov dword ptr [ebp - 12], eax
L8:
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 8]
    je L9
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    cmp edx, dword ptr [ebx + 4]
    jne L9
    cmp dword ptr [eax + 8], -1
    jne L9
    cmp dword ptr [eax + 12], edi
    jne L9
    mov edx, dword ptr [eax + 16]
    cmp edx, dword ptr [ebx + 16]
    jne L9
    mov edx, dword ptr [eax + 20]
    cmp edx, dword ptr [ebx + 20]
    jne L9
    mov eax, dword ptr [eax + 24]
    cmp eax, dword ptr [ebx + 24]
    je L10
L9:
    inc dword ptr [ebp - 4]
    add dword ptr [ebp - 12], 4
    cmp dword ptr [ebp - 4], ecx
    jb L8
    jmp L12
L10:
    cmp dword ptr [ebp - 16], 0
    jne L11
    mov ecx, esi
    call sub_1008B069
    mov dword ptr [ebp - 16], 1
L11:
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebx + 48], eax
L12:
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 8]
    jne L26
    or dword ptr [ebx + 8], 0FFFFFFFFh
    mov eax, dword ptr [ebx + 4]
    mov dword ptr [ebx + 12], edi
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx + eax*4]
    cmp edi, dword ptr [eax + 8]
    jb L26
    push 01010FA70h
    push 000000FA7h
    push dword ptr [ebx + 96]
    push esi
    call sub_1008B258
    add esp, 16
    mov eax, 080004005h
    jmp L31
L13:
    test cl, 2
    je L27
    mov eax, dword ptr [eax + 72]
    cmp eax, -1
    je L27
    mov ecx, dword ptr [esi + 24]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax]
    and ecx, 0FFF00000h
    cmp ecx, 020400000h
    jne L27
    mov ebx, dword ptr [eax + 12]
    xor edi, edi
    test ebx, ebx
    jbe L15
    mov ecx, dword ptr [eax + 16]
L14:
    cmp dword ptr [ecx], edx
    je L15
    inc edi
    add ecx, 4
    cmp edi, ebx
    jb L14
L15:
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [eax + edi*4]
    mov ecx, dword ptr [esi + 20]
    add ebx, edi
    mov edi, dword ptr [eax + ebx*4]
    mov eax, dword ptr [esi + 16]
    mov dword ptr [ebp - 24], edx
    mov edx, dword ptr [ecx + edx*4]
    mov ebx, dword ptr [edx + 4]
    mov ebx, dword ptr [eax + ebx*4]
    test byte ptr [ebx + 5], 1
    mov ecx, dword ptr [ecx + edi*4]
    je L17
    cmp dword ptr [edx + 8], -1
    jne L17
    mov ebx, dword ptr [edx]
    test bl, 4
    je L17
    test bl, 2
    jne L16
    test byte ptr [ecx], 2
    je L17
L16:
    fld qword ptr [ebp - 36]
    fadd qword ptr [edx + 32]
    call sub_100F93AB
    mov dword ptr [ebp - 12], eax
    mov eax, edi
    jmp L19
L17:
    mov edi, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + edi*4]
    test byte ptr [eax + 5], 1
    je L27
    cmp dword ptr [ecx + 8], -1
    jne L27
    mov eax, dword ptr [ecx]
    test al, 4
    je L27
    test byte ptr [edx], 2
    jne L18
    test al, 2
    je L27
L18:
    fld qword ptr [ebp - 36]
    fadd qword ptr [ecx + 32]
    call sub_100F93E2
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [ebp - 24]
L19:
    mov edi, dword ptr [ebp - 4]
    mov ecx, dword ptr [edi]
    mov ebx, dword ptr [ebp - 28]
    xor edx, edx
    cmp ecx, ebx
    mov dword ptr [ebp - 24], eax
    jne L22
    cmp dword ptr [esi + 8], edx
    jbe L26
L20:
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + edx*4]
    cmp ebx, dword ptr [ecx + 8]
    jne L21
    mov edi, dword ptr [ebp - 12]
    add dword ptr [ecx + 12], edi
    mov dword ptr [ecx + 8], eax
L21:
    inc edx
    cmp edx, dword ptr [esi + 8]
    jb L20
    jmp L26
L22:
    cmp dword ptr [esi + 8], edx
    jbe L25
L23:
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + edx*4]
    cmp ebx, dword ptr [ecx + 8]
    jne L24
    mov eax, dword ptr [ebp - 12]
    add dword ptr [ecx + 12], eax
    mov eax, dword ptr [ebp - 24]
L24:
    inc edx
    cmp edx, dword ptr [esi + 8]
    jb L23
L25:
    mov dword ptr [edi], eax
L26:
    mov dword ptr [ebp - 12], 1
L27:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 8]
    jb L0
    cmp dword ptr [ebp - 12], 0
    jne L29
L28:
    xor eax, eax
    inc eax
    jmp L31
L29:
    cmp dword ptr [ebp - 16], 0
    je L30
    mov ecx, esi
    call sub_1008B221
L30:
    xor eax, eax
L31:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_1008c847 ENDP
END
