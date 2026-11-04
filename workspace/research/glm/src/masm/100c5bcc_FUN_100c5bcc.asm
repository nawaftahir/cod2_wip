.686
.MODEL FLAT, C
EXTRN sub_10086247:PROC
EXTRN sub_100C1BAF:PROC
.CODE
FUN_100c5bcc PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000A4h
    push ebx
    mov ebx, dword ptr [ebp + 24]
    test ebx, ebx
    push esi
    push edi
    mov esi, ecx
    jne L0
    mov ebx, dword ptr [esi + 000000100h]
    mov dword ptr [ebp + 24], ebx
L0:
    mov edi, dword ptr [ebx + 16]
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [edi]
    mov eax, dword ptr [edx + eax*4]
    mov ecx, dword ptr [esi + 000000088h]
    cmp ecx, dword ptr [eax + 4]
    jne L34
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [eax + 12]
    and dword ptr [ebp - 12], 0
    mov dword ptr [ebp - 20], ecx
    and ecx, 0000FFFFFh
    cmp ecx, eax
    jne L34
    and dword ptr [ebp - 4], 0
    test eax, eax
    jbe L6
    mov ecx, dword ptr [esi + 108]
    mov eax, dword ptr [ebp + 16]
    shl ecx, 14
    sar ecx, 31
    sub eax, edi
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 16], eax
    jmp L2
L1:
    mov eax, dword ptr [ebp - 16]
L2:
    test ecx, ecx
    mov edi, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + edi]
    mov eax, dword ptr [edx + eax*4]
    mov edi, dword ptr [eax + 4]
    mov edx, dword ptr [esi + 16]
    mov edx, dword ptr [edx + edi*4]
    mov dword ptr [ebp - 32], edx
    je L3
    test byte ptr [eax + 61], 2
    je L3
    cmp dword ptr [ebp + 8], 000080000h
    jne L3
    mov dword ptr [ebp - 12], 1
L3:
    mov eax, dword ptr [eax + 60]
    mov edx, 0001F0000h
    test edx, eax
    je L4
    mov edi, dword ptr [ebp + 12]
    not edi
    and edi, eax
    test edx, edi
    je L4
    cmp dword ptr [ebp + 8], 000080000h
    jne L34
    mov dword ptr [ebp - 12], 1
L4:
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 61], 0000000FEh
    jne L34
    test byte ptr [esi + 108], 16
    je L5
    mov eax, dword ptr [ebp - 32]
    test byte ptr [eax + 5], 2
    je L5
    mov eax, dword ptr [ebp - 20]
    and eax, 0FFF00000h
    cmp eax, 010100000h
    jne L34
    mov dword ptr [ebp - 12], 1
L5:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 000000100h]
    mov edi, dword ptr [ebp - 4]
    add dword ptr [ebp - 8], 4
    cmp edi, dword ptr [eax + 12]
    jb L1
L6:
    and dword ptr [ebp + 8], 0
    cmp dword ptr [ebx + 12], 0
    jbe L10
    mov eax, dword ptr [ebp + 20]
    not eax
    mov dword ptr [ebp + 12], eax
    mov eax, dword ptr [ebp + 16]
    lea ecx, [ebp - 52]
    sub eax, ecx
    mov dword ptr [ebp - 20], eax
L7:
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [ebp + 8]
    mov edx, dword ptr [esi + 20]
    mov ebx, dword ptr [ebp - 20]
    shl ecx, 2
    cmp dword ptr [ebp - 12], 0
    mov eax, dword ptr [ecx + eax]
    mov eax, dword ptr [edx + eax*4]
    lea edi, [ebp + ecx - 52]
    mov ebx, dword ptr [edi + ebx]
    mov edx, dword ptr [edx + ebx*4]
    mov ebx, dword ptr [eax + 8]
    mov dword ptr [edi], ebx
    mov edi, dword ptr [eax + 12]
    mov ebx, dword ptr [eax + 72]
    mov dword ptr [ebp + ecx - 84], edi
    mov edi, dword ptr [eax + 16]
    mov dword ptr [ebp + ecx - 68], edi
    mov edi, dword ptr [eax + 20]
    mov dword ptr [ebp + ecx - 000000094h], edi
    mov edi, dword ptr [eax + 24]
    mov dword ptr [ebp + ecx - 100], edi
    mov edi, dword ptr [eax + 60]
    mov dword ptr [ebp + ecx - 000000084h], ebx
    mov ebx, dword ptr [eax + 104]
    mov dword ptr [ebp + ecx - 116], edi
    mov dword ptr [ebp + ecx - 0000000A4h], ebx
    jne L8
    mov ecx, dword ptr [edx + 4]
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [edx + 8]
    mov dword ptr [eax + 8], ecx
    mov ecx, dword ptr [edx + 12]
    mov dword ptr [eax + 12], ecx
    mov ecx, dword ptr [edx + 16]
    mov dword ptr [eax + 16], ecx
    mov ecx, dword ptr [edx + 20]
    mov dword ptr [eax + 20], ecx
    mov ecx, dword ptr [edx + 24]
    mov dword ptr [eax + 24], ecx
    mov ecx, dword ptr [edx + 72]
    mov dword ptr [eax + 72], ecx
    mov ecx, dword ptr [edx + 104]
    mov dword ptr [eax + 104], ecx
    mov edx, dword ptr [edx + 60]
    mov ecx, edx
    xor ecx, dword ptr [ebp + 20]
    and edx, dword ptr [ebp + 12]
    or ecx, edx
    or ecx, edi
    jmp L9
L8:
    mov edx, dword ptr [ebp + 12]
    mov ecx, edi
    xor ecx, dword ptr [ebp + 20]
    and edx, edi
    or ecx, edx
L9:
    inc dword ptr [ebp + 8]
    mov ebx, dword ptr [ebp + 24]
    mov dword ptr [eax + 60], ecx
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ebx + 12]
    jb L7
L10:
    mov edi, dword ptr [ebx + 12]
    and dword ptr [ebp + 12], 0
    test edi, edi
    mov dword ptr [ebp - 20], edi
    jbe L12
    mov eax, dword ptr [ebx + 16]
    mov dword ptr [ebp + 8], eax
L11:
    mov eax, dword ptr [ebp + 8]
    push dword ptr [eax]
    mov ecx, esi
    call sub_100C1BAF
    cmp eax, 1
    je L32
    inc dword ptr [ebp + 12]
    add dword ptr [ebp + 8], 4
    cmp dword ptr [ebp + 12], edi
    jb L11
L12:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    and dword ptr [ebp + 12], 0
    or dword ptr [ebp + 8], 0FFFFFFFFh
    test edi, edi
    jbe L19
    mov eax, dword ptr [ebp + 16]
    mov ebx, dword ptr [ebx + 16]
    mov edx, dword ptr [esi + 20]
    lea ecx, [ebp - 52]
    sub ecx, eax
    mov dword ptr [ebp - 36], ecx
    lea ecx, [ebp - 84]
    sub ecx, eax
    mov dword ptr [ebp - 28], ecx
    sub ebx, eax
    lea ecx, [ebp - 68]
    sub ecx, eax
    mov dword ptr [ebp - 24], ecx
    mov ecx, dword ptr [ebp - 20]
    mov dword ptr [ebp - 32], ebx
    mov dword ptr [ebp - 16], ecx
    jmp L14
L13:
    mov ebx, dword ptr [ebp - 32]
L14:
    mov ecx, dword ptr [ebx + eax]
    mov edi, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [eax]
    mov ecx, dword ptr [edx + ecx*4]
    mov dword ptr [ebp - 8], edi
    mov edi, dword ptr [edi + 84]
    cmp edi, dword ptr [ebp - 4]
    jae L15
    mov dword ptr [ebp - 4], edi
L15:
    mov edi, dword ptr [ebp - 8]
    mov edi, dword ptr [edi + 88]
    cmp edi, dword ptr [ebp + 12]
    jbe L16
    mov dword ptr [ebp + 12], edi
L16:
    mov edi, dword ptr [esi + 000000088h]
    cmp edi, dword ptr [ecx + 4]
    jne L17
    mov edi, dword ptr [ebp - 36]
    mov edi, dword ptr [edi + eax]
    cmp edi, dword ptr [ecx + 8]
    jne L17
    mov edi, dword ptr [ebp - 28]
    mov edi, dword ptr [edi + eax]
    cmp edi, dword ptr [ecx + 12]
    jne L17
    mov edi, dword ptr [ebp - 24]
    mov edi, dword ptr [edi + eax]
    cmp edi, dword ptr [ecx + 16]
    jne L17
    mov ecx, dword ptr [ebp - 8]
L17:
    mov ecx, dword ptr [ecx + 80]
    cmp ecx, dword ptr [ebp + 8]
    jae L18
    mov dword ptr [ebp + 8], ecx
L18:
    add eax, 4
    dec dword ptr [ebp - 16]
    jne L13
    mov ebx, dword ptr [ebp + 24]
L19:
    xor ecx, ecx
    cmp dword ptr [ebp + 28], ecx
    mov eax, 010000000h
    jne L20
    mov edx, dword ptr [ebp + 8]
    cmp edx, dword ptr [ebp + 12]
    jae L20
    test dword ptr [esi + 108], eax
    je L32
L20:
    cmp dword ptr [ebp - 12], ecx
    jne L42
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp + 12]
    mov dword ptr [ebp - 8], eax
    ja L31
    mov ecx, dword ptr [esi + 24]
    lea eax, [ecx + eax*4]
    mov dword ptr [ebp - 4], eax
L21:
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax]
    mov edi, dword ptr [eax]
    test edi, edi
    mov dword ptr [ebp - 12], edi
    je L30
    mov ecx, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 4]
    and dword ptr [ebp - 16], 0
    lea edx, [ecx + eax*4]
    mov eax, edi
    and eax, 0000FFFFFh
    cmp ecx, edx
    mov dword ptr [ebp - 28], edx
    jae L30
L22:
    and dword ptr [ebp + 8], 0
    and dword ptr [ebp + 24], 0
    test eax, eax
    jbe L28
L23:
    and dword ptr [ebp + 28], 0
    cmp dword ptr [ebx + 12], 0
    jbe L27
    mov edx, dword ptr [ebx + 16]
    jmp L25
L24:
    mov edx, dword ptr [ebp - 24]
L25:
    mov edi, dword ptr [ebp + 24]
    mov edi, dword ptr [ecx + edi*4]
    cmp dword ptr [edx], edi
    je L26
    inc dword ptr [ebp + 28]
    add edx, 4
    mov dword ptr [ebp - 24], edx
    mov edx, dword ptr [ebp + 28]
    cmp edx, dword ptr [ebx + 12]
    jb L24
    jmp L27
L26:
    inc dword ptr [ebp + 8]
L27:
    inc dword ptr [ebp + 24]
    cmp dword ptr [ebp + 24], eax
    jb L23
    cmp dword ptr [ebp + 8], 0
    je L28
    cmp dword ptr [ebp + 8], eax
    jne L32
    mov edx, dword ptr [ebp - 12]
    and edx, 0FFF00000h
    cmp edx, 070500000h
    je L32
    cmp edx, 070600000h
    je L32
    cmp edx, 070700000h
    je L32
    mov dword ptr [ebp - 16], 1
L28:
    lea ecx, [ecx + eax*4]
    cmp ecx, dword ptr [ebp - 28]
    jb L22
    cmp dword ptr [ebp - 16], 0
    je L30
    mov eax, dword ptr [ebp - 12]
    mov ecx, eax
    and ecx, 0F0000000h
    cmp ecx, 060000000h
    je L29
    and eax, 0FFF00000h
    cmp eax, 010D00000h
    je L29
    cmp eax, 010E00000h
    je L29
    cmp eax, 011000000h
    jne L30
L29:
    test byte ptr [esi + 110], 000000080h
    je L32
L30:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    add dword ptr [ebp - 4], 4
    cmp eax, dword ptr [ebp + 12]
    jbe L21
    xor ecx, ecx
L31:
    lea eax, [esi + 00000015Ch]
    cmp dword ptr [eax], ecx
    je L35
    mov dword ptr [eax], 2
L32:
    xor edx, edx
    cmp dword ptr [ebx + 12], edx
    jbe L34
L33:
    mov ecx, dword ptr [ebx + 16]
    mov edi, dword ptr [esi + 20]
    mov eax, edx
    shl eax, 2
    mov ecx, dword ptr [eax + ecx]
    mov ecx, dword ptr [edi + ecx*4]
    mov edi, dword ptr [esi + 000000088h]
    mov dword ptr [ecx + 4], edi
    mov edi, dword ptr [ebp + eax - 52]
    mov dword ptr [ecx + 8], edi
    mov edi, dword ptr [ebp + eax - 84]
    mov dword ptr [ecx + 12], edi
    mov edi, dword ptr [ebp + eax - 68]
    mov dword ptr [ecx + 16], edi
    mov edi, dword ptr [ebp + eax - 000000094h]
    mov dword ptr [ecx + 20], edi
    mov edi, dword ptr [ebp + eax - 100]
    mov dword ptr [ecx + 24], edi
    mov edi, dword ptr [ebp + eax - 116]
    mov dword ptr [ecx + 60], edi
    mov edi, dword ptr [ebp + eax - 000000084h]
    mov eax, dword ptr [ebp + eax - 0000000A4h]
    inc edx
    mov dword ptr [ecx + 72], edi
    mov dword ptr [ecx + 104], eax
    cmp edx, dword ptr [ebx + 12]
    jb L33
L34:
    xor eax, eax
    inc eax
    jmp L44
L35:
    cmp dword ptr [ebx + 12], ecx
    mov dword ptr [ebp + 24], ecx
    jbe L41
L36:
    mov edx, dword ptr [ebp + 24]
    mov ecx, dword ptr [ebx + 16]
    mov edi, dword ptr [ebp + 16]
    mov eax, dword ptr [esi + 20]
    shl edx, 2
    mov ecx, dword ptr [edx + ecx]
    mov edx, dword ptr [edx + edi]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + edx*4]
    mov edi, dword ptr [eax + 56]
    cmp edi, -1
    jne L37
    mov dword ptr [ecx + 56], edx
    jmp L38
L37:
    mov dword ptr [ecx + 56], edi
L38:
    cmp dword ptr [ebp + 20], 000080000h
    mov edx, dword ptr [eax]
    mov dword ptr [ecx], edx
    jne L39
    test dl, 4
    je L40
    and edx, 0FFFFFFFBh
    or edx, 8
    mov dword ptr [ecx], edx
L39:
    cmp dword ptr [ebp + 20], 000100000h
    jne L40
    or dword ptr [ecx], 4
L40:
    push eax
    call sub_10086247
    inc dword ptr [ebp + 24]
    mov eax, dword ptr [ebp + 24]
    cmp eax, dword ptr [ebx + 12]
    jb L36
L41:
    mov eax, dword ptr [esi + 000000100h]
    and dword ptr [eax], 0
    jmp L43
L42:
    mov esi, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [esi]
    and ecx, 0000FFFFFh
    or ecx, eax
    mov dword ptr [esi], ecx
L43:
    xor eax, eax
L44:
    pop edi
    pop esi
    pop ebx
    leave
    ret 24
FUN_100c5bcc ENDP
END
