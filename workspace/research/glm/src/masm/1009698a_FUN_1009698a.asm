.686
.MODEL FLAT, C
EXTRN sub_10085F32:PROC
EXTRN sub_100861A3:PROC
EXTRN sub_1008727A:PROC
EXTRN sub_1008728B:PROC
EXTRN sub_100872BC:PROC
EXTRN sub_1008AEA3:PROC
EXTRN sub_1008AF17:PROC
EXTRN sub_1008D927:PROC
EXTRN sub_1008DA0A:PROC
EXTRN sub_1008DAA2:PROC
EXTRN sub_1008DB01:PROC
.CODE
FUN_1009698a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 00000009Ch
    push ebx
    push esi
    push edi
    xor esi, esi
    mov edi, ecx
    xor edx, edx
    cmp dword ptr [edi + 8], esi
    mov dword ptr [ebp - 24], esi
    jbe L4
L0:
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + edx*4]
    mov ebx, dword ptr [edi + 16]
    mov ecx, dword ptr [eax + 4]
    mov ecx, dword ptr [ebx + ecx*4]
    mov ebx, dword ptr [eax + 20]
    mov dword ptr [eax + 48], ebx
    mov ebx, dword ptr [eax + 24]
    mov dword ptr [eax + 64], ebx
    mov ecx, dword ptr [ecx + 4]
    test cl, 16
    je L1
    mov dword ptr [eax + 24], 1
    jmp L2
L1:
    test ecx, 000011028h
    jne L3
    mov dword ptr [eax + 24], esi
L2:
    or dword ptr [eax + 20], 0FFFFFFFFh
L3:
    inc edx
    cmp edx, dword ptr [edi + 8]
    jb L0
L4:
    mov eax, dword ptr [edi + 12]
    cmp eax, esi
    mov dword ptr [ebp - 12], eax
    jbe L30
L5:
    dec dword ptr [ebp - 12]
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 12]
    mov esi, dword ptr [eax + ecx*4]
    test word ptr [esi + 2], 00000FFF0h
    je L29
    xor ebx, ebx
    inc ebx
    cmp dword ptr [esi + 12], ebx
    jbe L7
L6:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [edi + 20]
    mov edx, dword ptr [eax + ebx*4]
    push dword ptr [ecx + edx*4]
    mov eax, dword ptr [eax]
    push dword ptr [ecx + eax*4]
    mov ecx, edi
    call sub_1008D927
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L6
L7:
    xor eax, eax
    inc eax
    cmp dword ptr [esi + 12], eax
    mov dword ptr [ebp - 4], eax
    jbe L9
L8:
    mov eax, dword ptr [esi + 16]
    mov ebx, dword ptr [eax]
    mov ecx, dword ptr [edi + 20]
    mov edx, dword ptr [ebp - 4]
    mov ebx, dword ptr [ecx + ebx*4]
    shl edx, 2
    mov eax, dword ptr [edx + eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebx + 20]
    inc dword ptr [ebp - 4]
    mov dword ptr [eax + 20], ecx
    mov eax, dword ptr [esi + 16]
    mov ebx, dword ptr [eax]
    mov ecx, dword ptr [edi + 20]
    mov eax, dword ptr [edx + eax]
    mov ebx, dword ptr [ecx + ebx*4]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebx + 24]
    mov dword ptr [eax + 24], ecx
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 12]
    jb L8
L9:
    mov ecx, dword ptr [esi]
    mov eax, ecx
    and eax, 0FFF00000h
    xor ebx, ebx
    cmp eax, 020700000h
    je L27
    cmp eax, 020800000h
    je L27
    cmp eax, 011500000h
    je L27
    cmp eax, 011200000h
    jne L15
    mov eax, dword ptr [esi + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    cmp dword ptr [esi + 12], ebx
    mov dword ptr [ebp - 4], ebx
    mov dword ptr [ebp - 16], eax
    jbe L29
L10:
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp - 16], 0
    jbe L14
L11:
    mov eax, dword ptr [esi + 12]
    imul eax, dword ptr [ebp - 8]
    add eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + 8]
    mov ecx, dword ptr [ecx + eax*4]
    jmp L13
L12:
    mov eax, dword ptr [edi + 20]
    mov edx, dword ptr [ebp - 4]
    mov ebx, ecx
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + edx*4]
    mov ecx, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ecx + 20]
    push dword ptr [eax + ecx*4]
    shl ebx, 2
    push dword ptr [ebx + eax]
    mov ecx, edi
    call sub_1008DA0A
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [ebx + eax]
    mov ecx, dword ptr [eax + 8]
L13:
    cmp ecx, -1
    jne L12
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 16]
    jb L11
L14:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 12]
    jb L10
    jmp L29
L15:
    mov eax, ecx
    and eax, 0F0000000h
    cmp eax, 010000000h
    jb L21
    cmp eax, 040000000h
    ja L21
    mov eax, dword ptr [esi + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    cmp dword ptr [esi + 12], ebx
    mov dword ptr [ebp - 4], ebx
    mov dword ptr [ebp - 16], eax
    jbe L29
L16:
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp - 16], 0
    jbe L20
L17:
    mov eax, dword ptr [esi + 12]
    imul eax, dword ptr [ebp - 8]
    add eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + 8]
    mov eax, dword ptr [ecx + eax*4]
    jmp L19
L18:
    mov ecx, dword ptr [edi + 20]
    mov edx, dword ptr [ebp - 4]
    mov ebx, eax
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + edx*4]
    push dword ptr [ecx + eax*4]
    shl ebx, 2
    push dword ptr [ebx + ecx]
    mov ecx, edi
    call sub_1008DAA2
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [ebx + eax]
    mov eax, dword ptr [eax + 8]
L19:
    cmp eax, -1
    jne L18
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 16]
    jb L17
L20:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 12]
    jb L16
    jmp L29
L21:
    cmp dword ptr [esi + 12], ebx
    je L25
    cmp dword ptr [esi + 4], ebx
    mov dword ptr [ebp - 8], ebx
    jbe L29
L22:
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + ecx*4]
    jmp L24
L23:
    mov ecx, dword ptr [edi + 20]
    mov ebx, eax
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax]
    push dword ptr [ecx + eax*4]
    shl ebx, 2
    push dword ptr [ebx + ecx]
    mov ecx, edi
    call sub_1008DB01
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + ebx]
    mov eax, dword ptr [eax + 8]
L24:
    cmp eax, -1
    jne L23
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 4]
    jb L22
    jmp L29
L25:
    xor eax, eax
    cmp dword ptr [esi + 4], ebx
    jbe L29
L26:
    mov ecx, dword ptr [esi + 8]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    or dword ptr [ecx + 20], 0FFFFFFFFh
    mov ecx, dword ptr [esi + 8]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    inc eax
    mov dword ptr [ecx + 24], 1
    cmp eax, dword ptr [esi + 4]
    jb L26
    jmp L29
L27:
    cmp dword ptr [esi + 12], ebx
    mov dword ptr [ebp - 8], ebx
    jbe L29
L28:
    mov eax, dword ptr [ebp - 8]
    mov ecx, dword ptr [edi + 20]
    mov edx, dword ptr [esi + 8]
    mov ebx, dword ptr [esi + 16]
    shl eax, 2
    mov edx, dword ptr [eax + edx]
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 20]
    mov edx, dword ptr [ecx + edx*4]
    mov ebx, dword ptr [eax + ebx]
    mov edx, dword ptr [edx + 20]
    mov ecx, dword ptr [ecx + ebx*4]
    inc dword ptr [ebp - 8]
    mov dword ptr [ecx + 20], edx
    mov ecx, dword ptr [edi + 20]
    mov edx, dword ptr [esi + 8]
    mov edx, dword ptr [eax + edx]
    mov edx, dword ptr [ecx + edx*4]
    mov ebx, dword ptr [esi + 16]
    mov edx, dword ptr [edx + 20]
    mov eax, dword ptr [eax + ebx]
    mov edx, dword ptr [ecx + edx*4]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [edx + 24]
    mov dword ptr [eax + 24], ecx
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 12]
    jb L28
L29:
    cmp dword ptr [ebp - 12], 0
    ja L5
L30:
    lea ecx, [ebp - 00000009Ch]
    call sub_10085F32
    and dword ptr [ebp - 8], 0
    cmp dword ptr [edi + 12], 0
    jbe L42
L31:
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 8]
    mov esi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi]
    and eax, 0FFF00000h
    je L41
    cmp eax, 010F00000h
    je L41
    cmp eax, 020700000h
    je L41
    cmp eax, 011100000h
    je L41
    cmp eax, 011200000h
    je L41
    cmp eax, 011300000h
    je L41
    cmp eax, 011400000h
    je L41
    cmp eax, 020800000h
    je L41
    cmp eax, 020900000h
    je L41
    cmp eax, 011500000h
    je L41
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edi + 16]
    mov dword ptr [ebp - 28], ecx
    mov ecx, dword ptr [ecx + 4]
    mov ecx, dword ptr [edx + ecx*4]
    test byte ptr [ecx + 5], 16
    jne L41
    and dword ptr [ebp - 20], 0
    and dword ptr [ebp - 12], 0
    lea ecx, [ebp - 20]
    push ecx
    push eax
    mov ecx, edi
    call sub_1008727A
    mov eax, dword ptr [ebp - 28]
    jmp L33
L32:
    lea eax, [ebp - 12]
    push eax
    push ebx
    mov ecx, edi
    call sub_1008728B
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + ebx*4]
L33:
    mov ebx, dword ptr [eax + 8]
    cmp ebx, -1
    jne L32
    mov eax, dword ptr [esi + 4]
    test eax, eax
    jbe L37
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 16], eax
L34:
    mov eax, dword ptr [ebp - 4]
    mov ebx, dword ptr [eax]
    jmp L36
L35:
    lea eax, [ebp - 12]
    push eax
    push ebx
    mov ecx, edi
    call sub_100872BC
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + ebx*4]
    mov ebx, dword ptr [eax + 8]
L36:
    cmp ebx, -1
    jne L35
    add dword ptr [ebp - 4], 4
    dec dword ptr [ebp - 16]
    jne L34
L37:
    mov ecx, dword ptr [ebp - 20]
    cmp ecx, dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 28]
    mov eax, dword ptr [eax + 20]
    jbe L41
    sub ecx, dword ptr [ebp - 12]
    mov dword ptr [ebp - 20], ecx
L38:
    mov ecx, dword ptr [edi + 20]
    mov edx, dword ptr [edi + 16]
    shl eax, 2
    mov ecx, dword ptr [ecx + eax]
    mov ecx, dword ptr [ecx + 4]
    mov ecx, dword ptr [edx + ecx*4]
    test byte ptr [ecx + 5], 000000080h
    je L40
    and dword ptr [ebp - 4], 0
    cmp dword ptr [esi + 12], 0
    jbe L40
L39:
    mov ecx, dword ptr [edi + 20]
    mov edx, dword ptr [ecx + eax]
    mov ecx, dword ptr [esi + 16]
    mov ebx, dword ptr [ebp - 4]
    mov ebx, dword ptr [ecx + ebx*4]
    mov ecx, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx + ebx*4]
    mov edx, dword ptr [edx + 24]
    mov ebx, dword ptr [ebp - 4]
    inc dword ptr [ebp - 4]
    mov dword ptr [ecx + 24], edx
    mov ecx, dword ptr [edi + 20]
    mov edx, dword ptr [ecx + eax]
    mov ecx, dword ptr [esi + 16]
    mov ebx, dword ptr [ecx + ebx*4]
    mov ecx, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx + ebx*4]
    mov edx, dword ptr [edx + 20]
    mov dword ptr [ecx + 20], edx
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, dword ptr [esi + 12]
    jb L39
L40:
    dec dword ptr [ebp - 20]
    mov ecx, dword ptr [edi + 20]
    mov eax, dword ptr [ecx + eax]
    mov eax, dword ptr [eax + 20]
    jne L38
L41:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [edi + 12]
    jb L31
L42:
    mov eax, dword ptr [edi + 8]
    test eax, eax
    jbe L46
    mov ecx, dword ptr [edi + 20]
    mov edx, eax
L43:
    mov eax, dword ptr [ecx]
    mov esi, dword ptr [eax + 48]
    cmp esi, dword ptr [eax + 20]
    jne L44
    mov esi, dword ptr [eax + 64]
    cmp esi, dword ptr [eax + 24]
    je L45
L44:
    mov dword ptr [ebp - 24], 1
L45:
    add ecx, 4
    dec edx
    jne L43
    cmp dword ptr [ebp - 24], 0
    jne L47
L46:
    xor esi, esi
    inc esi
    jmp L54
L47:
    mov ecx, edi
    call sub_1008AEA3
    mov ebx, dword ptr [edi + 12]
    jmp L53
L48:
    mov eax, dword ptr [edi + 24]
    dec ebx
    mov eax, dword ptr [eax + ebx*4]
    test word ptr [eax + 2], 00000FFF0h
    je L53
    mov edx, dword ptr [eax + 12]
    test edx, edx
    mov dword ptr [ebp - 4], ebx
    jbe L53
    mov ecx, dword ptr [edi + 20]
    mov esi, dword ptr [eax + 16]
    mov dword ptr [ebp - 24], edx
L49:
    mov edx, dword ptr [esi]
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 20]
    cmp edx, -1
    je L50
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 72]
    cmp dword ptr [ebp - 4], edx
    jae L50
    mov dword ptr [ebp - 4], edx
L50:
    add esi, 4
    dec dword ptr [ebp - 24]
    jne L49
    cmp ebx, dword ptr [ebp - 4]
    je L53
    mov edx, ebx
    jae L52
L51:
    mov ecx, dword ptr [edi + 24]
    lea ecx, [ecx + edx*4]
    mov esi, dword ptr [ecx + 4]
    inc edx
    cmp edx, dword ptr [ebp - 4]
    mov dword ptr [ecx], esi
    jb L51
L52:
    mov ecx, dword ptr [edi + 24]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ecx + edx*4], eax
    mov ecx, edi
    call sub_1008AF17
L53:
    test ebx, ebx
    ja L48
    xor esi, esi
L54:
    lea ecx, [ebp - 00000009Ch]
    call sub_100861A3
    pop edi
    mov eax, esi
    pop esi
    pop ebx
    leave
    ret
FUN_1009698a ENDP
END
