.686
.MODEL FLAT, C
EXTRN sub_1006CC0C:PROC
EXTRN sub_10085607:PROC
EXTRN sub_1008593E:PROC
EXTRN sub_10085956:PROC
EXTRN sub_10085A97:PROC
EXTRN sub_10085B1E:PROC
EXTRN sub_10085DCE:PROC
EXTRN sub_10085DE6:PROC
EXTRN sub_10085F20:PROC
EXTRN sub_10085F3E:PROC
.CODE
FUN_100ac03e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0000000CCh
    push ebx
    push esi
    mov esi, ecx
    xor ecx, ecx
    push edi
    mov dword ptr [ebp - 48], ecx
    mov dword ptr [ebp - 28], ecx
    mov dword ptr [ebp - 40], ecx
    jmp L1
L0:
    xor ecx, ecx
L1:
    mov eax, dword ptr [esi + 00000022Ch]
    mov edx, dword ptr [ebp - 40]
    mov eax, dword ptr [eax + edx*4]
    cmp eax, ecx
    je L11
    cmp dword ptr [eax + 12], ecx
    je L11
    cmp dword ptr [esi + 000000224h], ecx
    mov dword ptr [ebp - 12], ecx
    jbe L11
L2:
    mov eax, dword ptr [esi + 000000230h]
    mov ecx, dword ptr [ebp - 12]
    mov ebx, dword ptr [eax + ecx*4]
    test ebx, ebx
    mov dword ptr [ebp - 20], ebx
    je L10
    mov eax, dword ptr [ebx]
    test eax, eax
    je L10
    and dword ptr [ebp - 36], 0
    cmp ecx, 6
    sbb ecx, ecx
    neg ecx
    and eax, 0000FFFFFh
    mov dword ptr [ebp - 60], ecx
    mov dword ptr [ebp - 8], eax
    je L10
    mov eax, dword ptr [ebx + 4]
    xor edx, edx
    div dword ptr [ebp - 8]
    mov edx, dword ptr [esi + 00000022Ch]
    mov edi, dword ptr [ebp - 40]
    mov edi, dword ptr [edx + edi*4]
    mov dword ptr [ebp - 56], eax
    xor eax, eax
    cmp dword ptr [edi + 12], eax
    mov dword ptr [ebp - 32], eax
    mov dword ptr [ebp - 24], eax
    jbe L10
    mov eax, edx
    mov edx, dword ptr [ebp - 40]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + 12]
    mov dword ptr [ebp - 44], eax
L3:
    mov eax, dword ptr [ebp - 56]
    cmp ecx, eax
    jae L9
    mov edx, dword ptr [ebp - 8]
    imul edx, ecx
    shl edx, 2
    sub eax, ecx
    mov dword ptr [ebp - 52], eax
L4:
    cmp dword ptr [ebp - 8], 0
    jbe L8
    mov ecx, dword ptr [ebp - 24]
    mov eax, dword ptr [edi + 16]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebx + 8]
    mov dword ptr [ebp - 16], eax
    mov eax, dword ptr [ebp - 8]
    add ecx, edx
    mov dword ptr [ebp - 4], eax
L5:
    mov eax, dword ptr [ecx]
    cmp eax, dword ptr [ebp - 16]
    je L6
    mov ebx, dword ptr [esi + 20]
    mov eax, dword ptr [ebx + eax*4]
    mov ebx, dword ptr [ebp - 16]
    cmp dword ptr [eax + 56], ebx
    jne L7
L6:
    mov ebx, dword ptr [ebp - 40]
    cmp dword ptr [ebp - 12], ebx
    jbe L7
    mov eax, dword ptr [esi + 000000230h]
    mov eax, dword ptr [eax + ebx*4]
    test eax, eax
    je L7
    mov eax, dword ptr [eax]
    test eax, eax
    je L7
    and eax, 0FFF00000h
    cmp eax, 011000000h
    je L7
    mov dword ptr [ebp - 32], 1
    mov dword ptr [ebp - 36], edi
L7:
    add ecx, 4
    dec dword ptr [ebp - 4]
    jne L5
    mov ebx, dword ptr [ebp - 20]
    mov ecx, dword ptr [ebp - 60]
L8:
    mov eax, dword ptr [ebp - 8]
    shl eax, 2
    add edx, eax
    dec dword ptr [ebp - 52]
    jne L4
L9:
    inc dword ptr [ebp - 24]
    mov eax, dword ptr [ebp - 24]
    cmp eax, dword ptr [ebp - 44]
    jb L3
    cmp dword ptr [ebp - 32], 0
    je L10
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L14
    inc dword ptr [eax]
    mov ecx, dword ptr [eax]
    inc ecx
    mov dword ptr [eax], ecx
L10:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [esi + 000000224h]
    jb L2
L11:
    inc dword ptr [ebp - 40]
    cmp dword ptr [ebp - 40], 6
    jb L0
    and dword ptr [ebp - 36], 0
    cmp dword ptr [esi + 000000220h], 0
    jbe L62
L12:
    mov eax, dword ptr [esi + 00000022Ch]
    mov ecx, dword ptr [ebp - 36]
    mov eax, dword ptr [eax + ecx*4]
    test eax, eax
    je L61
    cmp dword ptr [eax], 0
    je L61
    mov ecx, dword ptr [eax + 12]
    and dword ptr [ebp - 32], 0
    test ecx, ecx
    jbe L61
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [eax + 16]
    mov edi, ecx
L13:
    mov ecx, dword ptr [eax]
    mov ebx, dword ptr [edx + ecx*4]
    cmp dword ptr [ebx + 16], 3
    jne L36
    mov ebx, ecx
    mov dword ptr [ebp - 32], 1
    mov dword ptr [ebp - 40], ebx
    jmp L37
L14:
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 76]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor ecx, ecx
    cmp dword ptr [ebx + 4], ecx
    stosd dword ptr es:[edi], eax
    mov dword ptr [ebp - 4], ecx
    stosd dword ptr es:[edi], eax
    mov dword ptr [ebp - 8], ecx
    jbe L23
L15:
    mov ecx, dword ptr [ebp - 36]
    mov eax, dword ptr [ecx + 12]
    test eax, eax
    jbe L22
    mov edx, dword ptr [ebx + 8]
    mov edi, dword ptr [ebp - 8]
    mov edx, dword ptr [edx + edi*4]
    mov ecx, dword ptr [ecx + 16]
    mov dword ptr [ebp - 44], edx
    mov dword ptr [ebp - 32], eax
    jmp L17
L16:
    mov edx, dword ptr [ebp - 44]
L17:
    mov eax, dword ptr [ecx]
    cmp eax, edx
    je L18
    mov edi, dword ptr [esi + 20]
    mov edx, dword ptr [edi + edx*4]
    cmp eax, dword ptr [edx + 56]
    jne L21
L18:
    mov edi, dword ptr [ebp - 4]
    xor edx, edx
    test edi, edi
    jbe L20
L19:
    cmp dword ptr [ebp + edx*4 - 76], eax
    je L20
    inc edx
    cmp edx, edi
    jb L19
L20:
    cmp edx, edi
    jne L21
    mov dword ptr [ebp + edi*4 - 76], eax
    inc edi
    mov dword ptr [ebp - 4], edi
L21:
    add ecx, 4
    dec dword ptr [ebp - 32]
    jne L16
L22:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebx + 4]
    jb L15
L23:
    push 116
    call sub_10085A97
    test eax, eax
    je L24
    mov ecx, eax
    call sub_10085607
    mov dword ptr [ebp - 28], eax
    jmp L25
L24:
    and dword ptr [ebp - 28], 0
L25:
    cmp dword ptr [ebp - 28], 0
    je L35
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 28]
    push 0
    push dword ptr [ebp - 4]
    and eax, 0000FFFFFh
    push dword ptr [ebp - 4]
    or eax, 010000000h
    push eax
    call sub_10085B1E
    mov edi, eax
    test edi, edi
    mov dword ptr [ebp - 16], edi
    jl L71
    mov edx, dword ptr [ebp - 28]
    mov ecx, dword ptr [ebp - 4]
    mov edi, dword ptr [edx + 16]
    or eax, 0FFFFFFFFh
    rep stosd dword ptr es:[edi], eax
    xor edi, edi
    cmp dword ptr [ebx + 4], edi
    mov dword ptr [ebp - 24], edi
    jbe L34
    mov eax, dword ptr [ebp - 36]
L26:
    cmp dword ptr [eax + 12], edi
    mov dword ptr [ebp - 8], edi
    jbe L33
L27:
    mov edx, dword ptr [ebp - 24]
    mov ecx, dword ptr [ebx + 8]
    mov ecx, dword ptr [ecx + edx*4]
    mov edi, dword ptr [esi + 20]
    mov edx, dword ptr [edi + ecx*4]
    mov eax, dword ptr [eax + 16]
    mov dword ptr [ebp - 16], edx
    mov edx, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + edx*4]
    cmp eax, ecx
    je L28
    mov ecx, dword ptr [ebp - 16]
    cmp eax, dword ptr [ecx + 56]
    jne L32
L28:
    mov ebx, dword ptr [edi + eax*4]
    mov eax, dword ptr [ebp - 24]
    xor edx, edx
    div dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 28]
    mov eax, dword ptr [eax + 16]
    mov dword ptr [ebp - 44], ebx
    shl edx, 2
    mov ecx, dword ptr [edx + eax]
    cmp ecx, -1
    jne L29
    lea ebx, [esi + 000000408h]
    mov eax, dword ptr [ebx]
    cmp eax, 64
    jae L35
    mov ecx, dword ptr [esi + eax*4 + 000000304h]
    inc eax
    mov dword ptr [ebx], eax
    mov eax, dword ptr [edi + ecx*4]
    mov edi, dword ptr [esi + 000000088h]
    and dword ptr [eax + 60], 0
    or dword ptr [eax + 56], 0FFFFFFFFh
    cmp ecx, -1
    mov ebx, dword ptr [ebp - 44]
    mov dword ptr [eax + 4], edi
    mov edi, dword ptr [ebx + 16]
    mov dword ptr [eax + 16], edi
    je L35
L29:
    mov eax, dword ptr [ebp - 36]
    mov edi, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax + edi*4]
    mov edi, dword ptr [ebp - 16]
    cmp eax, dword ptr [edi + 56]
    jne L30
    mov eax, dword ptr [esi + 000000408h]
    cmp eax, 64
    jae L35
    mov edi, dword ptr [esi + eax*4 + 000000304h]
    inc eax
    mov dword ptr [esi + 000000408h], eax
    mov ebx, dword ptr [ebx + 16]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + edi*4]
    mov dword ptr [eax + 16], ebx
    mov ebx, dword ptr [ebp - 16]
    mov ebx, dword ptr [ebx + 60]
    mov dword ptr [eax + 60], ebx
    mov dword ptr [eax + 56], ecx
    mov ebx, dword ptr [esi + 000000088h]
    mov dword ptr [eax + 4], ebx
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax + 8]
    mov ebx, dword ptr [ebp - 24]
    mov dword ptr [ebp - 44], edi
    mov dword ptr [eax + ebx*4], edi
    jmp L31
L30:
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax + 8]
    mov edi, dword ptr [ebp - 24]
    mov dword ptr [eax + edi*4], ecx
L31:
    mov eax, dword ptr [ebp - 36]
    mov eax, dword ptr [eax + 16]
    mov ebx, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + ebx*4]
    mov edi, dword ptr [ebp - 28]
    mov edi, dword ptr [edi + 8]
    mov ebx, dword ptr [ebp - 20]
    mov dword ptr [edx + edi], eax
    mov eax, dword ptr [ebp - 28]
    mov eax, dword ptr [eax + 16]
    mov dword ptr [edx + eax], ecx
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    and dword ptr [eax + 60], 0
L32:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 36]
    mov ecx, dword ptr [ebp - 8]
    cmp ecx, dword ptr [eax + 12]
    jb L27
    mov edx, dword ptr [ebp - 28]
    xor edi, edi
L33:
    inc dword ptr [ebp - 24]
    mov ecx, dword ptr [ebp - 24]
    cmp ecx, dword ptr [ebx + 4]
    jb L26
L34:
    mov ebx, dword ptr [esi + 00000022Ch]
    lea eax, [esi + 000000220h]
    mov ecx, dword ptr [eax]
    mov dword ptr [ebx + ecx*4], edx
    inc dword ptr [eax]
    lea eax, [esi + 000000404h]
    mov ecx, dword ptr [eax]
    cmp ecx, 12
    jae L35
    mov dword ptr [esi + ecx*4 + 0000002C4h], edx
    inc dword ptr [eax]
    mov dword ptr [ebp - 28], edi
    jmp L10
L35:
    mov edi, 08007000Eh
    jmp L71
L36:
    mov ebx, dword ptr [ebp - 40]
L37:
    add eax, 4
    dec edi
    jne L13
    cmp dword ptr [ebp - 32], 0
    je L61
    and dword ptr [ebp - 4], 0
    push 6
    pop eax
    cmp dword ptr [esi + 000000224h], eax
    mov dword ptr [ebp - 12], eax
    jbe L43
    mov edx, dword ptr [esi + 000000230h]
    add edx, 24
L38:
    mov eax, dword ptr [edx]
    xor ecx, ecx
    cmp eax, ecx
    je L42
    cmp dword ptr [eax], ecx
    je L42
    cmp dword ptr [eax + 4], ecx
    mov dword ptr [ebp - 20], ecx
    jbe L42
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [ebp - 16], ecx
L39:
    mov ecx, dword ptr [ebp - 16]
    mov ecx, dword ptr [ecx]
    mov edi, dword ptr [esi + 20]
    mov edi, dword ptr [edi + ecx*4]
    cmp dword ptr [edi + 56], ebx
    je L40
    cmp ecx, ebx
    jne L41
L40:
    cmp dword ptr [ebp - 4], 16
    jae L63
    mov ecx, dword ptr [ebp - 4]
    inc dword ptr [ebp - 4]
    mov dword ptr [ebp + ecx*4 - 00000008Ch], eax
L41:
    inc dword ptr [ebp - 20]
    mov ecx, dword ptr [ebp - 20]
    add dword ptr [ebp - 16], 4
    cmp ecx, dword ptr [eax + 4]
    jb L39
L42:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    add edx, 4
    cmp eax, dword ptr [esi + 000000224h]
    jb L38
L43:
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L50
    and dword ptr [ebp - 12], 0
    cmp dword ptr [esi + 12], 0
    jbe L49
    mov eax, dword ptr [esi + 24]
    mov dword ptr [ebp - 20], eax
L44:
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax]
    test eax, eax
    je L48
    cmp dword ptr [eax], 0
    je L48
    cmp dword ptr [eax + 40], 1
    je L48
    mov edi, dword ptr [eax + 4]
    and dword ptr [ebp - 16], 0
    test edi, edi
    jbe L48
    mov eax, dword ptr [eax + 8]
L45:
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [esi + 20]
    mov edx, dword ptr [edx + ecx*4]
    cmp dword ptr [edx + 56], ebx
    je L46
    cmp ecx, ebx
    jne L47
L46:
    cmp dword ptr [ebp - 4], 16
    jae L63
    inc dword ptr [ebp - 4]
L47:
    inc dword ptr [ebp - 16]
    add eax, 4
    cmp dword ptr [ebp - 16], edi
    jb L45
L48:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    add dword ptr [ebp - 20], 4
    cmp eax, dword ptr [esi + 12]
    jb L44
    mov eax, dword ptr [ebp + 8]
L49:
    cmp dword ptr [ebp - 4], 0
    je L61
    inc dword ptr [eax]
L50:
    cmp dword ptr [ebp - 4], 0
    je L61
    test eax, eax
    jne L61
    cmp dword ptr [esi + 000000404h], 12
    jae L64
    push 116
    call sub_10085DCE
    test eax, eax
    je L51
    mov ecx, eax
    call sub_1008593E
    mov edi, eax
    jmp L52
L51:
    xor edi, edi
L52:
    push 116
    call sub_10085DE6
    test eax, eax
    je L53
    mov ecx, eax
    call sub_10085956
    mov dword ptr [ebp - 8], eax
    jmp L54
L53:
    and dword ptr [ebp - 8], 0
L54:
    test edi, edi
    je L65
    cmp dword ptr [ebp - 8], 0
    je L65
    mov eax, dword ptr [esi + 000000408h]
    cmp eax, 64
    ja L65
    mov ecx, dword ptr [esi + eax*4 + 000000308h]
    mov ebx, dword ptr [esi + eax*4 + 000000304h]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    or dword ptr [eax + 56], 0FFFFFFFFh
    mov dword ptr [eax + 16], 3
    xor edx, edx
    mov dword ptr [eax + 60], edx
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ebx*4]
    or dword ptr [eax + 56], 0FFFFFFFFh
    mov dword ptr [eax + 16], 4
    mov dword ptr [eax + 60], edx
    add dword ptr [esi + 000000408h], 2
    cmp dword ptr [ebp - 4], edx
    mov dword ptr [ebp - 44], ecx
    mov dword ptr [ebp - 12], edx
    jbe L60
L55:
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [ebp + eax*4 - 00000008Ch]
    and dword ptr [ebp - 20], 0
    cmp dword ptr [eax + 4], 0
    jbe L59
L56:
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [ebp - 20]
    lea eax, [eax + edx*4]
    mov edx, dword ptr [esi + 20]
    mov dword ptr [ebp - 32], eax
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [ebp - 40]
    cmp dword ptr [eax + 56], edx
    jne L57
    mov dword ptr [eax + 56], ecx
    jmp L58
L57:
    mov eax, dword ptr [ebp - 32]
    cmp dword ptr [eax], edx
    jne L58
    mov dword ptr [eax], ecx
L58:
    inc dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [ebp + eax*4 - 00000008Ch]
    mov edx, dword ptr [ebp - 20]
    cmp edx, dword ptr [eax + 4]
    jb L56
L59:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebp - 4]
    jb L55
L60:
    push 0
    push 1
    push 1
    push 010000001h
    mov ecx, edi
    call sub_10085F20
    test eax, eax
    mov dword ptr [ebp - 16], eax
    jl L72
    mov ecx, dword ptr [ebp - 8]
    push 0
    push 1
    push 1
    push 010000001h
    call sub_10085F3E
    test eax, eax
    mov dword ptr [ebp - 16], eax
    jl L72
    mov eax, dword ptr [edi + 16]
    mov ecx, dword ptr [ebp - 40]
    mov edx, dword ptr [ebp - 44]
    mov dword ptr [eax], ebx
    mov eax, dword ptr [edi + 8]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [edi + 40], 1
    mov ecx, dword ptr [eax + 16]
    mov dword ptr [ecx], edx
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [ecx], ebx
    push 2
    pop ecx
    mov dword ptr [edi + 40], ecx
    mov edx, dword ptr [esi + 000000404h]
    mov dword ptr [esi + edx*4 + 0000002C4h], edi
    mov edx, dword ptr [esi + 000000404h]
    mov dword ptr [esi + edx*4 + 0000002C8h], eax
    add dword ptr [esi + 000000404h], ecx
    mov ecx, dword ptr [esi + 000000220h]
    mov edx, dword ptr [esi + 00000022Ch]
    mov dword ptr [edx + ecx*4], edi
    mov ecx, dword ptr [ebp - 48]
    inc dword ptr [esi + 000000220h]
    inc dword ptr [ebp - 48]
    mov dword ptr [ebp + ecx*4 - 0000000CCh], eax
L61:
    inc dword ptr [ebp - 36]
    mov eax, dword ptr [ebp - 36]
    cmp eax, dword ptr [esi + 000000220h]
    jb L12
L62:
    mov edx, dword ptr [esi + 000000224h]
    mov edi, dword ptr [ebp - 48]
    lea eax, [edx + edi]
    cmp eax, 000000200h
    jbe L66
    mov eax, 080004005h
    jmp L74
L63:
    mov edi, 080004005h
    jmp L73
L64:
    xor eax, eax
    inc eax
    jmp L74
L65:
    mov edi, 08007000Eh
    jmp L73
L66:
    cmp edx, 6
    jb L68
    lea ecx, [edx + edi]
    shl ecx, 2
L67:
    mov eax, dword ptr [esi + 000000230h]
    mov ebx, dword ptr [eax + edx*4]
    mov dword ptr [eax + ecx], ebx
    dec edx
    sub ecx, 4
    cmp edx, 6
    jae L67
L68:
    test edi, edi
    jbe L70
    mov edx, dword ptr [ebp - 48]
    push 24
    pop eax
    lea ecx, [ebp - 0000000CCh]
    sub ecx, eax
L69:
    mov ebx, dword ptr [ecx + eax]
    mov edi, dword ptr [esi + 000000230h]
    mov dword ptr [eax + edi], ebx
    add eax, 4
    dec edx
    jne L69
L70:
    mov eax, dword ptr [ebp - 48]
    add dword ptr [esi + 000000224h], eax
    xor edi, edi
L71:
    cmp dword ptr [ebp - 28], 0
    je L73
    mov ecx, dword ptr [ebp - 28]
    push 1
    call sub_1006CC0C
    jmp L73
L72:
    mov edi, dword ptr [ebp - 16]
L73:
    mov eax, edi
L74:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_100ac03e ENDP
END
