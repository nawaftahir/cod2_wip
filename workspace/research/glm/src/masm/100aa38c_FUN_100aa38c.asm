.686
.MODEL FLAT, C
EXTRN sub_1006C71D:PROC
EXTRN sub_100854D7:PROC
EXTRN sub_10085967:PROC
EXTRN sub_100859E4:PROC
EXTRN sub_10085A1F:PROC
EXTRN sub_10085EA9:PROC
EXTRN sub_10085F94:PROC
EXTRN sub_1008610F:PROC
EXTRN sub_10086287:PROC
EXTRN sub_100862AA:PROC
EXTRN sub_100862E4:PROC
EXTRN sub_10086377:PROC
EXTRN sub_100865B5:PROC
EXTRN sub_1008672D:PROC
EXTRN sub_10086764:PROC
EXTRN sub_1008B3A8:PROC
EXTRN sub_1008B782:PROC
EXTRN sub_1008B7CD:PROC
EXTRN sub_100AA11F:PROC
EXTRN sub_100AA295:PROC
.CODE
FUN_100aa38c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 72
    mov edx, dword ptr [ebp + 20]
    push ebx
    push esi
    push edi
    xor eax, eax
    and dword ptr [ebp - 4], eax
    mov ebx, ecx
    push 6
    pop ecx
    lea edi, [ebp - 72]
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebp + 28]
    lea esi, [edx + eax]
    test esi, esi
    jbe L10
    mov edi, dword ptr [ebp + 24]
    mov eax, edx
    shl eax, 2
    sub edi, eax
    mov dword ptr [ebp - 12], edi
L0:
    mov eax, dword ptr [ebp - 4]
    cmp eax, edx
    jae L1
    mov ecx, dword ptr [ebp + 16]
    mov eax, dword ptr [ecx + eax*4]
    jmp L2
L1:
    mov eax, dword ptr [edi]
L2:
    test eax, eax
    je L9
    mov ecx, dword ptr [eax]
    and ecx, 0FFF00000h
    je L9
    cmp dword ptr [eax + 36], 1
    je L9
    cmp ecx, 060000000h
    je L3
    cmp ecx, 060500000h
    je L3
    cmp ecx, 060A00000h
    je L3
    cmp ecx, 060F00000h
    je L3
    cmp ecx, 011000000h
    je L3
    cmp ecx, 072C00000h
    je L3
    cmp ecx, 072D00000h
    jne L4
L3:
    cmp dword ptr [ebp - 4], edx
    jb L9
L4:
    mov ecx, dword ptr [eax + 4]
    and dword ptr [ebp - 8], 0
    test ecx, ecx
    mov dword ptr [ebp - 16], ecx
    jbe L9
    mov edi, dword ptr [eax + 8]
L5:
    mov ecx, dword ptr [edi]
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebx + 000000080h]
    cmp dword ptr [eax + 4], ecx
    jne L7
    movzx ecx, byte ptr [eax + 109]
    cmp ecx, 5
    ja L8
    cmp byte ptr [eax + 108], 3
    jne L7
    mov edx, dword ptr [ebp + 20]
    cmp dword ptr [ebp - 4], edx
    lea ecx, [ebp + ecx*4 - 72]
    jb L6
    mov edx, dword ptr [eax + 16]
    inc edx
    cmp edx, dword ptr [ecx]
    jbe L7
    cmp dword ptr [eax + 60], 0
    je L7
    mov dword ptr [ecx], edx
    jmp L7
L6:
    mov eax, dword ptr [eax + 16]
    inc eax
    cmp eax, dword ptr [ecx]
    jbe L7
    mov dword ptr [ecx], eax
L7:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    add edi, 4
    cmp eax, dword ptr [ebp - 16]
    jb L5
L8:
    mov edx, dword ptr [ebp + 20]
    mov edi, dword ptr [ebp - 12]
L9:
    inc dword ptr [ebp - 4]
    add edi, 4
    cmp dword ptr [ebp - 4], esi
    mov dword ptr [ebp - 12], edi
    jb L0
L10:
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebx + 60], 0
    jbe L19
    mov eax, dword ptr [ebp + 8]
    lea edi, [ebp - 72]
    mov ecx, edi
    sub eax, ecx
    mov dword ptr [ebp - 16], eax
L11:
    mov esi, dword ptr [edi]
    test esi, esi
    je L18
    push 116
    call sub_10085967
    test eax, eax
    je L12
    mov ecx, eax
    call sub_100854D7
    jmp L13
L12:
    xor eax, eax
L13:
    test eax, eax
    mov dword ptr [ebp - 8], eax
    je L74
    push 0
    push esi
    push esi
    and esi, 0000FFFFFh
    or esi, 072100000h
    push esi
    mov ecx, eax
    call sub_100859E4
    test eax, eax
    jl L21
    xor esi, esi
    cmp dword ptr [edi], esi
    jbe L15
L14:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push esi
    push dword ptr [ebp - 4]
    mov ecx, ebx
    push dword ptr [ebx + 000000088h]
    call sub_100862E4
    cmp eax, -1
    mov dword ptr [ebp + esi*4 - 32], eax
    je L22
    mov ecx, dword ptr [ebp - 8]
    mov ecx, dword ptr [ecx + 16]
    mov dword ptr [ecx + esi*4], eax
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp - 4]
    and dword ptr [eax + 60], 0
    or dword ptr [eax + 56], 0FFFFFFFFh
    shl ecx, 8
    or ecx, 3
    inc esi
    cmp esi, dword ptr [edi]
    mov dword ptr [eax + 108], ecx
    jb L14
L15:
    mov esi, dword ptr [edi]
    lea eax, [ebp - 32]
    push eax
    push esi
    push dword ptr [ebp - 4]
    mov ecx, ebx
    push 3
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    call sub_100AA11F
    test eax, eax
    jl L21
    lea eax, [ebp - 32]
    push eax
    push esi
    push dword ptr [ebp - 4]
    mov ecx, ebx
    push 3
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    call sub_100AA295
    test eax, eax
    jl L21
    xor esi, esi
    cmp dword ptr [edi], esi
    jbe L17
L16:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push esi
    push dword ptr [ebp - 4]
    mov ecx, ebx
    push dword ptr [ebx + 000000080h]
    call sub_10086377
    cmp eax, -1
    mov dword ptr [ebp + esi*4 - 48], eax
    je L22
    mov ecx, dword ptr [ebx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [ebp - 4]
    and dword ptr [ecx + 60], 0
    shl edx, 8
    or edx, 3
    mov dword ptr [ecx + 108], edx
    mov ecx, dword ptr [ebp - 8]
    mov ecx, dword ptr [ecx + 8]
    mov dword ptr [ecx + esi*4], eax
    inc esi
    cmp esi, dword ptr [edi]
    jb L16
L17:
    mov eax, dword ptr [ebp - 16]
    lea esi, [eax + edi]
    cmp dword ptr [esi], 0
    jne L23
    push dword ptr [ebp - 8]
    mov ecx, ebx
    call sub_100862AA
    test eax, eax
    jl L73
    mov eax, dword ptr [ebp - 8]
    mov dword ptr [esi], eax
L18:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add edi, 4
    cmp eax, dword ptr [ebx + 60]
    jb L11
L19:
    mov dword ptr [ebp + 24], 1
L20:
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp + 20], 0
    jbe L52
    mov eax, dword ptr [ebp + 20]
    shl eax, 2
    mov ecx, eax
    mov eax, dword ptr [ebp + 16]
    sub eax, ecx
    mov dword ptr [ebp - 8], eax
    jmp L26
L21:
    mov esi, eax
    jmp L24
L22:
    mov esi, 08007000Eh
    jmp L24
L23:
    mov eax, dword ptr [ebx + 0000000C8h]
    and eax, 0000000FFh
    push eax
    push 010117078h
    push 0000011A4h
    push 0
    push ebx
    call sub_1008B3A8
    add esp, 20
    mov esi, 080004005h
L24:
    mov ecx, dword ptr [ebp - 8]
    push 1
    call sub_1006C71D
    mov eax, esi
    jmp L73
L25:
    mov eax, dword ptr [ebp - 8]
L26:
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, 000000200h
    jae L54
    cmp ecx, dword ptr [ebp + 20]
    jae L27
    mov eax, dword ptr [ebp + 16]
    mov edi, dword ptr [eax + ecx*4]
    jmp L28
L27:
    mov edi, dword ptr [eax]
L28:
    test edi, edi
    je L51
    cmp dword ptr [edi + 36], 1
    je L51
    mov eax, dword ptr [edi]
    mov ecx, eax
    and ecx, 0FFF00000h
    cmp ecx, 060000000h
    je L29
    cmp ecx, 060500000h
    je L29
    cmp ecx, 060A00000h
    je L29
    cmp ecx, 060F00000h
    je L29
    cmp ecx, 011000000h
    je L29
    cmp ecx, 072C00000h
    je L29
    cmp ecx, 072D00000h
    jne L51
L29:
    and eax, 0000FFFFFh
    cmp ecx, 011000000h
    mov esi, eax
    jne L30
    xor esi, esi
L30:
    test esi, esi
    mov ecx, dword ptr [edi + 8]
    mov eax, dword ptr [ebx + 20]
    mov edx, dword ptr [ecx + esi*4]
    mov edx, dword ptr [eax + edx*4]
    je L31
    mov ecx, dword ptr [ecx]
    mov esi, dword ptr [eax + ecx*4]
L31:
    mov eax, dword ptr [edx + 4]
    cmp eax, dword ptr [ebx + 000000080h]
    mov dword ptr [ebp - 16], eax
    jne L37
    mov eax, dword ptr [ebx + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    je L37
    cmp dword ptr [ebp + 24], 1
    jne L37
    movzx ecx, byte ptr [edx + 109]
    cmp ecx, 6
    mov dword ptr [ebp + 28], ecx
    jae L52
    test esi, esi
    je L33
    mov eax, dword ptr [esi + 4]
    mov edx, dword ptr [ebx + 16]
    mov eax, dword ptr [edx + eax*4]
    test word ptr [eax + 4], 000000840h
    je L32
    cmp ecx, dword ptr [esi + 12]
    je L33
    test byte ptr [eax + 5], 8
    mov eax, dword ptr [ebx + 0000000C8h]
    je L55
    and eax, 0000000FFh
    push eax
    push 010117000h
    jmp L56
L32:
    mov dword ptr [esi + 12], ecx
L33:
    lea eax, [ebx + ecx*4 + 000000424h]
    cmp dword ptr [eax], -1
    jne L59
    mov edx, dword ptr [ebp + 8]
    lea ecx, [edx + ecx*4]
    cmp dword ptr [ecx], 0
    mov dword ptr [ebp - 12], ecx
    jne L59
    test esi, esi
    je L36
    mov ecx, dword ptr [esi + 4]
    mov edx, dword ptr [ebp + 28]
    mov dword ptr [ebx + edx*4 + 00000040Ch], ecx
    mov ecx, dword ptr [edi + 8]
    mov ecx, dword ptr [ecx]
    push ecx
    mov dword ptr [eax], ecx
    fld qword ptr [esi + 32]
    push ecx
    fstp qword ptr [esp]
    push dword ptr [esi + 16]
    mov ecx, ebx
    push dword ptr [esi + 12]
    push dword ptr [esi + 4]
    call sub_100865B5
    xor ecx, ecx
    test dword ptr [edi], 0000FFFFFh
    jbe L35
L34:
    mov edx, dword ptr [edi + 8]
    mov dword ptr [edx + ecx*4], eax
    mov edx, dword ptr [edi]
    inc ecx
    and edx, 0000FFFFFh
    cmp ecx, edx
    jb L34
L35:
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    push esi
    mov ecx, eax
    mov dword ptr [ebp - 16], eax
    call sub_1008610F
    mov ecx, dword ptr [ebp + 28]
    mov eax, dword ptr [ebp - 16]
    mov dword ptr [eax + 12], ecx
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [esi + 64], 1
    and dword ptr [eax + 64], 0
L36:
    mov dword ptr [ecx], edi
    jmp L50
L37:
    cmp dword ptr [ebp + 24], 2
    jne L51
    test esi, esi
    je L40
    mov eax, dword ptr [ebx + 16]
    mov edx, dword ptr [esi + 4]
    mov ecx, dword ptr [eax + edx*4]
    mov eax, dword ptr [esi + 12]
    cmp eax, 6
    mov dword ptr [ebp - 12], ecx
    jae L52
    test word ptr [ecx + 4], 000000840h
    je L40
    lea ecx, [ebx + eax*4 + 000000424h]
    mov esi, dword ptr [ecx]
    cmp esi, -1
    mov dword ptr [ebp + 28], esi
    jne L39
    mov esi, dword ptr [ebp + 8]
    cmp dword ptr [esi + eax*4], 0
    jne L38
    mov dword ptr [ebx + eax*4 + 00000040Ch], edx
    mov edx, dword ptr [edi + 8]
    mov edx, dword ptr [edx]
    mov dword ptr [ecx], edx
    jmp L49
L38:
    mov esi, dword ptr [ebp + 28]
L39:
    mov ecx, dword ptr [edi + 8]
    cmp esi, dword ptr [ecx]
    jne L60
    mov ecx, dword ptr [ebp + 8]
    cmp dword ptr [ecx + eax*4], 0
    je L49
    mov eax, dword ptr [ebx + 0000000C8h]
    and eax, 0000000FFh
    push eax
    push 010116F98h
    push 0000011A6h
    push 0
    jmp L58
L40:
    xor eax, eax
    cmp eax, dword ptr [ebx + 76]
    jae L44
    lea ecx, [ebx + 000000424h]
    mov dword ptr [ebp + 28], ecx
L41:
    mov ecx, dword ptr [ebp + 8]
    cmp dword ptr [ecx + eax*4], 0
    jne L42
    mov ecx, dword ptr [ebp + 28]
    mov edx, dword ptr [ecx]
    mov ecx, dword ptr [edi + 8]
    cmp edx, dword ptr [ecx]
    je L43
    cmp edx, -1
    je L43
L42:
    add dword ptr [ebp + 28], 4
    inc eax
    cmp eax, dword ptr [ebx + 76]
    jb L41
L43:
    cmp eax, dword ptr [ebx + 76]
L44:
    je L63
    test esi, esi
    mov dword ptr [ebp + 28], eax
    je L49
    mov ecx, dword ptr [ebx + 0000000C8h]
    and ecx, 00000FFFFh
    cmp ecx, 000000104h
    je L45
    mov ecx, dword ptr [ebp - 16]
    cmp ecx, dword ptr [ebx + 000000080h]
    jne L46
L45:
    mov ecx, dword ptr [esi + 4]
    mov dword ptr [ebx + eax*4 + 00000040Ch], ecx
    mov ecx, dword ptr [edi + 8]
    mov ecx, dword ptr [ecx]
    mov dword ptr [ebx + eax*4 + 000000424h], ecx
L46:
    fld qword ptr [esi + 32]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push dword ptr [esi + 16]
    mov ecx, ebx
    push dword ptr [esi + 12]
    push dword ptr [esi + 4]
    call sub_1008672D
    xor ecx, ecx
    test dword ptr [edi], 0000FFFFFh
    jbe L48
L47:
    mov edx, dword ptr [edi + 8]
    mov dword ptr [edx + ecx*4], eax
    mov edx, dword ptr [edi]
    inc ecx
    and edx, 0000FFFFFh
    cmp ecx, edx
    jb L47
L48:
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    push esi
    mov ecx, eax
    mov dword ptr [ebp - 16], eax
    call sub_10086287
    mov eax, dword ptr [ebp - 16]
    mov ecx, dword ptr [ebp + 28]
    mov dword ptr [eax + 12], ecx
    mov dword ptr [esi + 64], 1
    and dword ptr [eax + 64], 0
    mov eax, ecx
L49:
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ecx + eax*4], edi
L50:
    mov eax, dword ptr [ebp + 16]
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [eax + 36], 1
L51:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add dword ptr [ebp - 8], 4
    cmp eax, dword ptr [ebp + 20]
    jb L25
L52:
    inc dword ptr [ebp + 24]
    cmp dword ptr [ebp + 24], 3
    jb L20
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebx + 60], 0
    jbe L69
L53:
    mov eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp - 4]
    lea esi, [eax + ecx*4]
    cmp dword ptr [esi], 0
    jne L68
    push 116
    call sub_10085EA9
    xor edi, edi
    cmp eax, edi
    je L66
    mov ecx, eax
    call sub_10085A1F
    jmp L67
L54:
    push 010116F88h
    push 0000011A2h
    jmp L64
L55:
    and eax, 0000000FFh
    push eax
    push 010116F18h
L56:
    push 0000011A3h
L57:
    push dword ptr [edi + 60]
L58:
    push ebx
    call sub_1008B782
    add esp, 20
    jmp L65
L59:
    mov eax, dword ptr [ebx + 0000000C8h]
    and eax, 0000000FFh
    push eax
    push 010116EC0h
    push 0000011A4h
    jmp L57
L60:
    mov eax, dword ptr [ebp - 12]
    test byte ptr [eax + 5], 8
    je L61
    push 010116E38h
    jmp L62
L61:
    push 010116E10h
L62:
    push 0000011A5h
    jmp L64
L63:
    push 010116DE0h
    push 0000011A7h
L64:
    push 0
    push ebx
    call sub_1008B7CD
    add esp, 16
L65:
    mov eax, 080004005h
    jmp L73
L66:
    xor eax, eax
L67:
    cmp eax, edi
    mov dword ptr [esi], eax
    je L74
    push edi
    push edi
    push edi
    push edi
    mov ecx, eax
    call sub_10085F94
    push dword ptr [esi]
    mov ecx, ebx
    call sub_10086764
L68:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebx + 60]
    jb L53
L69:
    mov eax, dword ptr [ebx + 60]
    mov ecx, dword ptr [ebp + 12]
    xor esi, esi
    cmp dword ptr [ebp + 20], esi
    mov dword ptr [ecx], eax
    jbe L72
L70:
    mov eax, dword ptr [ebp + 16]
    lea eax, [eax + esi*4]
    mov edx, dword ptr [eax]
    test edx, edx
    je L71
    cmp dword ptr [edx + 36], 1
    je L71
    cmp dword ptr [edx], 0
    je L71
    mov edi, dword ptr [eax]
    mov edx, dword ptr [ecx]
    mov ebx, dword ptr [ebp + 8]
    mov dword ptr [ebx + edx*4], edi
    inc dword ptr [ecx]
    mov eax, dword ptr [eax]
    mov dword ptr [eax + 36], 1
L71:
    inc esi
    cmp esi, dword ptr [ebp + 20]
    jb L70
L72:
    xor eax, eax
L73:
    pop edi
    pop esi
    pop ebx
    leave
    ret 24
L74:
    mov eax, 08007000Eh
    jmp L73
FUN_100aa38c ENDP
END
