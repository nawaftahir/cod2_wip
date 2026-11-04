.686
.MODEL FLAT, C
EXTRN sub_1006CA0C:PROC
EXTRN sub_1006CA8D:PROC
EXTRN sub_10085769:PROC
EXTRN sub_100857E4:PROC
EXTRN sub_10085BF9:PROC
EXTRN sub_10085C7B:PROC
EXTRN sub_1008B53E:PROC
EXTRN sub_1008B698:PROC
EXTRN g_1019BC88:DWORD
.CODE
FUN_100b75db PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 96
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [eax]
    and ecx, 0000FFFFFh
    mov dword ptr [ebp - 32], ebx
    mov dword ptr [ebp - 16], ecx
    jne L0
    xor eax, eax
    inc eax
    jmp L44
L0:
    mov eax, dword ptr [eax + 4]
    xor edx, edx
    div ecx
    and dword ptr [ebp - 60], 0
    push esi
    push edi
    test eax, eax
    mov dword ptr [ebp - 64], eax
    jbe L42
    and dword ptr [ebp - 48], 0
L1:
    or esi, 0FFFFFFFFh
    mov eax, esi
    lea edi, [ebp - 80]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor ecx, ecx
    cmp dword ptr [ebp - 16], ecx
    stosd dword ptr es:[edi], eax
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 28], ecx
    mov dword ptr [ebp - 24], ecx
    mov dword ptr [ebp - 36], ecx
    mov dword ptr [ebp - 40], ecx
    stosd dword ptr es:[edi], eax
    mov dword ptr [ebp - 12], esi
    mov dword ptr [ebp - 8], esi
    jbe L16
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 8]
    add eax, dword ptr [ebp - 48]
    mov dword ptr [ebp - 44], eax
    mov eax, dword ptr [ebp - 16]
    mov dword ptr [ebp - 56], eax
L2:
    mov eax, dword ptr [ebp - 44]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [eax + 16]
    xor edi, edi
    sub edx, edi
    je L12
    dec edx
    je L11
    dec edx
    je L7
    dec edx
    jne L15
    cmp dword ptr [ebp - 8], -1
    jne L15
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 72]
    shl edx, 2
    or dword ptr [ebp + edx - 80], 0FFFFFFFFh
    cmp eax, -1
    mov dword ptr [ebp - 8], ecx
    mov dword ptr [ebp + edx - 96], ecx
    je L14
    mov ecx, dword ptr [ebx + 24]
    mov edi, dword ptr [ecx + eax*4]
    mov eax, dword ptr [edi]
    mov ecx, eax
    and ecx, 0FFF00000h
    cmp ecx, 010000000h
    mov dword ptr [ebp - 40], edi
    jne L6
    xor ecx, ecx
    and eax, 0000FFFFFh
    jbe L14
    mov edx, dword ptr [edi + 16]
L3:
    mov esi, dword ptr [edx]
    cmp esi, dword ptr [ebp - 8]
    je L5
    inc ecx
    add edx, 4
    cmp ecx, eax
    jb L3
L4:
    mov esi, dword ptr [ebp - 12]
    jmp L14
L5:
    mov eax, dword ptr [edi + 8]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [ebp - 8], eax
    jmp L4
L6:
    and dword ptr [ebp - 40], 0
    jmp L14
L7:
    cmp esi, -1
    jne L15
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 72]
    shl edx, 2
    or dword ptr [ebp + edx - 80], 0FFFFFFFFh
    cmp eax, -1
    mov esi, ecx
    mov dword ptr [ebp - 12], esi
    mov dword ptr [ebp + edx - 96], ecx
    je L14
    mov ecx, dword ptr [ebx + 24]
    mov edi, dword ptr [ecx + eax*4]
    mov eax, dword ptr [edi]
    mov ecx, eax
    and ecx, 0FFF00000h
    cmp ecx, 010000000h
    mov dword ptr [ebp - 36], edi
    jne L10
    xor ecx, ecx
    and eax, 0000FFFFFh
    jbe L14
    mov edx, dword ptr [edi + 16]
L8:
    cmp dword ptr [edx], esi
    je L9
    inc ecx
    add edx, 4
    cmp ecx, eax
    jb L8
    jmp L14
L9:
    mov eax, dword ptr [edi + 8]
    mov esi, dword ptr [eax + ecx*4]
    mov dword ptr [ebp - 12], esi
    jmp L14
L10:
    and dword ptr [ebp - 36], 0
    jmp L14
L11:
    cmp dword ptr [eax + 72], -1
    je L15
    cmp dword ptr [ebp - 24], edi
    jne L15
    mov eax, dword ptr [eax + 72]
    mov edx, dword ptr [ebx + 24]
    mov edx, dword ptr [edx + eax*4]
    mov dword ptr [ebp - 24], edx
    jmp L13
L12:
    cmp dword ptr [eax + 72], -1
    je L15
    cmp dword ptr [ebp - 28], edi
    jne L15
    mov eax, dword ptr [eax + 72]
    mov edx, dword ptr [ebx + 24]
    mov edx, dword ptr [edx + eax*4]
    mov dword ptr [ebp - 28], edx
L13:
    mov edx, dword ptr [ebp - 4]
    shl edx, 2
    mov dword ptr [ebp + edx - 80], eax
    mov dword ptr [ebp + edx - 96], ecx
L14:
    inc dword ptr [ebp - 4]
L15:
    add dword ptr [ebp - 44], 4
    dec dword ptr [ebp - 56]
    jne L2
L16:
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 16]
    jne L41
    cmp eax, 1
    jbe L41
    mov edx, dword ptr [ebp - 24]
    xor ecx, ecx
    test edx, edx
    je L21
    cmp dword ptr [edx], 020500001h
    jne L20
    cmp esi, -1
    je L17
    mov eax, dword ptr [edx + 8]
    cmp esi, dword ptr [eax]
    je L17
    cmp esi, dword ptr [eax + 4]
    je L17
    inc ecx
L17:
    mov edi, dword ptr [ebp - 8]
    cmp edi, -1
    je L21
    mov eax, dword ptr [edx + 8]
    cmp edi, dword ptr [eax]
    je L18
    cmp edi, dword ptr [eax + 4]
    je L18
    xor ecx, ecx
    inc ecx
L18:
    cmp esi, -1
    je L21
    cmp edi, esi
    mov eax, dword ptr [edx + 8]
    mov edx, dword ptr [eax]
    je L19
    cmp edx, dword ptr [eax + 4]
    jne L21
    jmp L20
L19:
    cmp edx, dword ptr [eax + 4]
    je L21
L20:
    xor ecx, ecx
    inc ecx
L21:
    mov eax, dword ptr [ebp - 28]
    xor edx, edx
    cmp eax, edx
    je L23
    cmp dword ptr [eax], 010000001h
    jne L41
    mov eax, dword ptr [eax + 8]
    mov esi, dword ptr [ebx + 20]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [esi + eax*4]
    mov esi, dword ptr [eax + 4]
    mov edi, dword ptr [ebx + 16]
    mov esi, dword ptr [edi + esi*4]
    test byte ptr [esi + 5], 1
    je L22
    fld qword ptr [g_1019BC88]
    fld qword ptr [eax + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L23
L22:
    xor ecx, ecx
    inc ecx
L23:
    cmp ecx, edx
    jne L41
    cmp dword ptr [ebp - 4], edx
    mov dword ptr [ebp - 56], edx
    jbe L41
L24:
    mov eax, dword ptr [ebp + edx*4 - 80]
    cmp eax, -1
    mov dword ptr [ebp - 52], eax
    je L39
    mov eax, dword ptr [ebp - 16]
    test eax, eax
    mov dword ptr [ebp - 20], 1
    mov dword ptr [ebp - 28], eax
    jbe L32
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebp - 16]
    mov edx, dword ptr [ebx + 20]
    mov esi, dword ptr [ebx + 0000000FCh]
    add eax, dword ptr [ebp - 48]
    mov dword ptr [ebp - 44], ecx
L25:
    mov ecx, dword ptr [eax]
    mov ecx, dword ptr [edx + ecx*4]
    cmp dword ptr [ecx + 80], esi
    jae L26
    and dword ptr [ebp - 20], 0
L26:
    mov edi, dword ptr [ebp - 52]
    cmp dword ptr [ecx + 76], edi
    jbe L27
    and dword ptr [ebp - 20], 0
L27:
    cmp dword ptr [ebp - 36], 0
    jne L28
    cmp dword ptr [ecx + 16], 2
    je L29
L28:
    cmp dword ptr [ebp - 40], 0
    jne L30
    cmp dword ptr [ecx + 16], 3
    jne L30
L29:
    dec dword ptr [ebp - 28]
    jmp L31
L30:
    mov ecx, dword ptr [ecx + 84]
    cmp ecx, dword ptr [ebp - 52]
    jae L31
    and dword ptr [ebp - 20], 0
L31:
    add eax, 4
    dec dword ptr [ebp - 44]
    jne L25
    mov edx, dword ptr [ebp - 56]
L32:
    and dword ptr [ebp - 44], 0
L33:
    mov eax, dword ptr [ebp - 44]
    mov eax, dword ptr [ebp + eax*4 - 80]
    cmp eax, -1
    je L38
    mov ecx, dword ptr [ebx + 24]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 4]
    test ecx, ecx
    jbe L38
    mov edx, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + 8]
    mov ebx, dword ptr [ebp - 52]
    mov edi, ecx
L34:
    mov ecx, dword ptr [eax]
    mov ecx, dword ptr [edx + ecx*4]
    mov esi, dword ptr [ecx + 72]
    cmp esi, ebx
    jbe L35
    cmp esi, -1
    jne L36
L35:
    cmp dword ptr [ecx + 80], ebx
    jae L37
L36:
    and dword ptr [ebp - 20], 0
L37:
    add eax, 4
    dec edi
    jne L34
    mov edx, dword ptr [ebp - 56]
    mov ebx, dword ptr [ebp - 32]
L38:
    inc dword ptr [ebp - 44]
    mov eax, dword ptr [ebp - 44]
    cmp eax, dword ptr [ebp - 4]
    jb L33
    cmp dword ptr [ebp - 20], 0
    jne L40
L39:
    inc edx
    cmp edx, dword ptr [ebp - 4]
    mov dword ptr [ebp - 56], edx
    jb L24
    jmp L41
L40:
    mov eax, dword ptr [ebp + edx*4 - 80]
    cmp eax, -1
    mov dword ptr [ebp - 56], eax
    je L41
    mov edi, dword ptr [ebp - 28]
    cmp edi, 2
    jae L45
L41:
    mov eax, dword ptr [ebp - 16]
    inc dword ptr [ebp - 60]
    shl eax, 2
    add dword ptr [ebp - 48], eax
    mov eax, dword ptr [ebp - 60]
    cmp eax, dword ptr [ebp - 64]
    jb L1
L42:
    xor eax, eax
    inc eax
L43:
    pop edi
    pop esi
L44:
    pop ebx
    leave
    ret
L45:
    push 116
    call sub_10085BF9
    test eax, eax
    je L46
    mov ecx, eax
    call sub_10085769
    mov esi, eax
    jmp L47
L46:
    xor esi, esi
L47:
    test esi, esi
    jne L48
    mov eax, 08007000Eh
    jmp L43
L48:
    push 0
    push edi
    lea eax, [edi + edi]
    push eax
    mov eax, edi
    and eax, 0000FFFFFh
    or eax, 070900000h
    push eax
    mov ecx, esi
    call sub_10085C7B
    test eax, eax
    jge L50
L49:
    mov edi, eax
    jmp L74
L50:
    push dword ptr [ebx + 000000100h]
    mov ecx, esi
    call sub_100857E4
    test eax, eax
    jl L49
    xor ecx, ecx
    test edi, edi
    jbe L58
    mov eax, edi
    shl eax, 2
L51:
    mov edx, dword ptr [ebp - 24]
    test edx, edx
    je L52
    mov edx, dword ptr [edx + 8]
    mov edx, dword ptr [edx]
    mov edi, dword ptr [esi + 8]
    mov dword ptr [edi + ecx*4], edx
    mov edx, dword ptr [ebp - 24]
    mov edx, dword ptr [edx + 8]
    mov edx, dword ptr [edx + 4]
    jmp L57
L52:
    mov edx, dword ptr [ebp - 8]
    cmp edx, -1
    jne L55
    mov edx, dword ptr [ebp - 12]
    cmp edx, -1
    jne L56
L53:
    mov eax, dword ptr [ebx + 000000100h]
    push 010117D9Ch
    push 0000012D9h
    push dword ptr [eax + 60]
    push ebx
L54:
    call sub_1008B53E
    xor edi, edi
    add esp, 16
    inc edi
    jmp L74
L55:
    cmp dword ptr [ebp - 12], -1
    jne L53
L56:
    mov edi, dword ptr [esi + 8]
    mov dword ptr [edi + ecx*4], edx
L57:
    mov edi, dword ptr [esi + 8]
    mov dword ptr [eax + edi], edx
    inc ecx
    add eax, 4
    cmp ecx, dword ptr [ebp - 28]
    jb L51
L58:
    xor edx, edx
    xor edi, edi
    cmp dword ptr [ebp - 4], edx
    jbe L63
L59:
    cmp dword ptr [ebp - 36], 0
    mov eax, dword ptr [ebp + edx*4 - 96]
    mov ecx, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    jne L60
    cmp dword ptr [ecx + 16], 2
    je L62
L60:
    cmp dword ptr [ebp - 40], 0
    jne L61
    cmp dword ptr [ecx + 16], 3
    je L62
L61:
    mov ecx, dword ptr [esi + 16]
    mov dword ptr [ecx + edi*4], eax
    inc edi
L62:
    cmp edi, dword ptr [ebp - 28]
    ja L72
    mov ebx, dword ptr [ebp - 32]
    inc edx
    cmp edx, dword ptr [ebp - 4]
    jb L59
L63:
    mov eax, dword ptr [esi + 12]
    and dword ptr [ebp - 16], 0
    test eax, eax
    jbe L68
    mov dword ptr [ebp - 60], 1
L64:
    mov ecx, dword ptr [ebp - 60]
    cmp ecx, eax
    mov dword ptr [ebp - 48], ecx
    jae L67
L65:
    mov eax, dword ptr [esi + 16]
    mov edx, dword ptr [ebp - 16]
    mov edx, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ebx + 20]
    mov edi, dword ptr [ecx + edx*4]
    mov edx, dword ptr [ebp - 48]
    shl edx, 2
    mov eax, dword ptr [edx + eax]
    mov ecx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [edi + 16]
    cmp eax, dword ptr [ecx + 16]
    jbe L66
    mov eax, dword ptr [esi + 16]
    add edx, eax
    mov ebx, dword ptr [edx]
    mov dword ptr [ebp - 64], ebx
    mov ebx, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [edx], eax
    mov eax, dword ptr [esi + 16]
    mov edx, dword ptr [ebp - 64]
    mov dword ptr [eax + ebx*4], edx
    mov ebx, dword ptr [ebp - 32]
L66:
    mov eax, dword ptr [edi + 16]
    cmp eax, dword ptr [ecx + 16]
    je L73
    inc dword ptr [ebp - 48]
    mov eax, dword ptr [ebp - 48]
    cmp eax, dword ptr [esi + 12]
    jb L65
L67:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [esi + 12]
    inc dword ptr [ebp - 60]
    cmp dword ptr [ebp - 16], eax
    jb L64
L68:
    xor edx, edx
    xor ecx, ecx
    cmp dword ptr [ebp - 4], edx
    jbe L71
L69:
    mov eax, dword ptr [ebp + ecx*4 - 80]
    cmp eax, -1
    je L70
    mov edi, dword ptr [ebx + 24]
    mov eax, dword ptr [edi + eax*4]
    mov dword ptr [eax], edx
L70:
    inc ecx
    cmp ecx, dword ptr [ebp - 4]
    jb L69
L71:
    mov ecx, dword ptr [ebp - 36]
    cmp ecx, edx
    mov edi, 010000002h
    je L77
    mov eax, dword ptr [ecx]
    cmp eax, 010000001h
    jne L75
    mov dword ptr [ecx], edx
    jmp L77
L72:
    mov eax, dword ptr [ebp - 32]
    mov ecx, dword ptr [eax + 000000100h]
    push 010117D9Ch
    push 0000012DAh
    push dword ptr [ecx + 60]
    push eax
    jmp L54
L73:
    mov eax, dword ptr [ebx + 000000100h]
    push 010117D6Ch
    push 0000012DBh
    push dword ptr [eax + 60]
    push ebx
    call sub_1008B698
    add esp, 16
    mov edi, 080004005h
L74:
    push 1
    mov ecx, esi
    call sub_1006CA0C
    mov eax, edi
    jmp L43
L75:
    cmp eax, edi
    jne L77
    mov eax, dword ptr [ecx + 8]
    mov edx, dword ptr [eax]
    cmp edx, dword ptr [ebp - 12]
    jne L76
    mov edx, dword ptr [eax + 4]
    cmp edx, dword ptr [ebp - 8]
    jne L76
    and dword ptr [ecx], 0
L76:
    mov edx, dword ptr [ebp - 12]
    cmp dword ptr [eax + 4], edx
    jne L77
    mov eax, dword ptr [eax]
    cmp eax, dword ptr [ebp - 8]
    jne L77
    and dword ptr [ecx], 0
L77:
    mov ecx, dword ptr [ebp - 40]
    test ecx, ecx
    je L80
    mov eax, dword ptr [ecx]
    cmp eax, 010000001h
    je L79
    cmp eax, edi
    jne L80
    mov eax, dword ptr [ecx + 8]
    mov edx, dword ptr [ebp - 12]
    cmp dword ptr [eax], edx
    jne L78
    mov edi, dword ptr [eax + 4]
    cmp edi, dword ptr [ebp - 8]
    jne L78
    and dword ptr [ecx], 0
L78:
    cmp dword ptr [eax + 4], edx
    jne L80
    mov edx, dword ptr [ebp - 8]
    cmp dword ptr [eax], edx
    jne L80
L79:
    and dword ptr [ecx], 0
L80:
    mov edi, dword ptr [ebp - 56]
    mov eax, dword ptr [ebx + 24]
    shl edi, 2
    mov ecx, dword ptr [edi + eax]
    test ecx, ecx
    je L81
    push 1
    call sub_1006CA8D
L81:
    mov eax, dword ptr [ebx + 24]
    mov dword ptr [edi + eax], esi
    xor eax, eax
    jmp L43
FUN_100b75db ENDP
END
