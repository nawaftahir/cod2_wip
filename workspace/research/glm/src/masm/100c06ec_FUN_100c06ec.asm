.686
.MODEL FLAT, C
EXTRN sub_1006C93A:PROC
EXTRN sub_1006CA0E:PROC
EXTRN sub_1008583E:PROC
EXTRN sub_100858C3:PROC
EXTRN sub_10085CCE:PROC
EXTRN sub_10085D5F:PROC
EXTRN sub_100860A7:PROC
EXTRN sub_100B98D6:PROC
EXTRN sub_100B9AF7:PROC
.CODE
FUN_100c06ec PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000278h
    and dword ptr [ebp - 72], 0
    push ebx
    push esi
    push edi
    mov ebx, ecx
    push 40
    or eax, 0FFFFFFFFh
    pop ecx
    lea edi, [ebp - 000000138h]
    rep stosd dword ptr es:[edi], eax
    mov eax, dword ptr [ebx + 000000100h]
    mov esi, dword ptr [eax]
    mov edi, dword ptr [eax]
    mov ecx, 0000FFFFFh
    xor edx, edx
    mov dword ptr [ebp - 36], esi
    and dword ptr [ebp - 36], ecx
    and edi, ecx
    inc edx
    cmp dword ptr [ebp - 36], edi
    mov dword ptr [ebp - 68], edx
    mov dword ptr [ebp - 64], 2
    mov dword ptr [ebp - 60], 3
    mov dword ptr [ebp - 32], eax
    mov dword ptr [ebp - 24], edi
    ja L0
    and esi, 0FFF00000h
    cmp esi, 020500000h
    je L1
L0:
    mov dword ptr [ebp - 12], edx
    jmp L51
L1:
    and dword ptr [ebp - 48], 0
L2:
    and dword ptr [ebp - 12], 0
L3:
    xor ecx, ecx
    push 40
    pop ecx
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 000000088h]
    lea edi, [ebp - 0000001D8h]
    rep stosd dword ptr es:[edi], eax
    push 40
    pop ecx
    lea edi, [ebp - 000000278h]
    rep stosd dword ptr es:[edi], eax
    xor eax, eax
    lea esi, [ebp - 000000088h]
    mov dword ptr [ebp - 40], eax
    mov dword ptr [ebp - 28], eax
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 8], eax
L4:
    cmp dword ptr [ebp - 12], 0
    je L5
    xor ecx, ecx
    inc ecx
    sub ecx, dword ptr [ebp - 4]
    jmp L6
L5:
    mov ecx, dword ptr [ebp - 4]
L6:
    mov edx, dword ptr [ebp - 32]
    mov edi, dword ptr [edx + 8]
    mov ecx, dword ptr [ecx*4 + 010118A64h]
    cmp ecx, 16
    mov edx, dword ptr [ebx + 20]
    lea esi, [edi + eax*4]
    mov eax, dword ptr [esi]
    mov eax, dword ptr [edx + eax*4]
    jae L7
    mov eax, dword ptr [eax + 72]
    cmp eax, -1
    je L12
    shl ecx, 5
    mov edi, ecx
    mov ecx, dword ptr [ebx + 24]
    mov eax, dword ptr [ecx + eax*4]
    push 0
    push dword ptr [edi + 010118A70h]
    lea ecx, [ebp - 000000098h]
    push ecx
    lea ecx, [ebp - 72]
    push ecx
    push dword ptr [ebp - 36]
    mov ecx, ebx
    push esi
    push eax
    mov dword ptr [ebp - 20], eax
    call sub_100B98D6
    test eax, eax
    jne L12
    push eax
    push dword ptr [ebp - 24]
    lea eax, [ebp - 000000098h]
    push eax
    lea eax, [ebp - 000000278h]
    push eax
    lea eax, [ebp - 40]
    push eax
    lea eax, [ebp - 000000088h]
    push eax
    lea eax, [edi + 010118A58h]
    push eax
    push dword ptr [ebp - 20]
    mov ecx, ebx
    call sub_100B9AF7
    mov dword ptr [ebp - 28], eax
    jmp L11
L7:
    sub ecx, 16
    xor edx, edx
    shl ecx, 4
    lea ecx, [ebp + ecx - 0000001D8h]
L8:
    mov eax, dword ptr [ebp + edx*4 - 72]
    cmp eax, dword ptr [ebp - 36]
    jae L9
    mov esi, dword ptr [ebp - 8]
    add eax, esi
    mov eax, dword ptr [edi + eax*4]
    mov dword ptr [ecx], eax
    jmp L10
L9:
    or dword ptr [ecx], 0FFFFFFFFh
L10:
    inc edx
    add ecx, 4
    cmp edx, 4
    jb L8
L11:
    cmp dword ptr [ebp - 28], 1
    je L13
    mov eax, dword ptr [ebp - 8]
    add eax, dword ptr [ebp - 36]
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], 2
    mov dword ptr [ebp - 8], eax
    jb L4
    jmp L13
L12:
    mov dword ptr [ebp - 28], 1
L13:
    xor esi, esi
    mov dword ptr [ebp - 4], esi
    mov dword ptr [ebp - 44], esi
L14:
    cmp dword ptr [ebp - 12], esi
    je L15
    xor ecx, ecx
    inc ecx
    sub ecx, dword ptr [ebp - 4]
    jmp L16
L15:
    mov ecx, dword ptr [ebp - 4]
L16:
    cmp dword ptr [ecx*4 + 010118A64h], 16
    jb L23
    cmp dword ptr [ebp - 40], esi
    mov dword ptr [ebp - 16], esi
    jbe L23
L17:
    cmp dword ptr [ebp - 36], esi
    jbe L22
    mov eax, dword ptr [ebp - 16]
    mov ecx, dword ptr [ebp + eax*4 - 000000088h]
    mov edi, dword ptr [ecx + 12]
L18:
    and dword ptr [ebp - 8], 0
    test edi, edi
    jbe L20
    mov eax, dword ptr [ebp - 44]
    mov edx, dword ptr [ebp - 32]
    mov edx, dword ptr [edx + 8]
    add eax, esi
    mov edx, dword ptr [edx + eax*4]
    mov eax, dword ptr [ecx + 16]
L19:
    cmp edx, dword ptr [eax]
    je L21
    inc dword ptr [ebp - 8]
    mov edi, dword ptr [ecx + 12]
    add eax, 4
    cmp dword ptr [ebp - 8], edi
    jb L19
L20:
    inc esi
    cmp esi, dword ptr [ebp - 36]
    jb L18
    jmp L22
L21:
    mov dword ptr [ebp - 28], 1
L22:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    xor esi, esi
    cmp eax, dword ptr [ebp - 40]
    jb L17
L23:
    mov eax, dword ptr [ebp - 36]
    inc dword ptr [ebp - 4]
    add dword ptr [ebp - 44], eax
    cmp dword ptr [ebp - 4], 2
    jb L14
    cmp dword ptr [ebp - 28], esi
    jne L45
    cmp dword ptr [ebp - 48], 0
    jne L46
    and dword ptr [ebp - 16], 0
    cmp dword ptr [ebp - 40], 0
    jbe L37
L24:
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [ebp + eax*4 - 000000088h]
    mov eax, dword ptr [eax + 12]
    and dword ptr [ebp - 8], 0
    test eax, eax
    mov dword ptr [ebp - 52], eax
    jbe L36
L25:
    mov eax, dword ptr [ebx + 12]
    test eax, eax
    jbe L35
    mov ecx, dword ptr [ebx + 24]
    mov dword ptr [ebp - 44], ecx
    mov dword ptr [ebp - 20], eax
L26:
    mov eax, dword ptr [ebp - 44]
    mov ecx, dword ptr [eax]
    test ecx, ecx
    je L34
    cmp dword ptr [ecx], 0
    je L34
    mov edx, dword ptr [ecx + 4]
    and dword ptr [ebp - 4], 0
    test edx, edx
    jbe L30
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [ebp + eax*4 - 000000088h]
    mov esi, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + 16]
    mov edi, dword ptr [eax + esi*4]
    mov esi, dword ptr [ecx + 8]
    mov dword ptr [ebp - 56], edx
L27:
    mov eax, dword ptr [esi]
    cmp eax, edi
    je L28
    mov edx, dword ptr [ebx + 20]
    mov eax, dword ptr [edx + eax*4]
    cmp dword ptr [eax + 56], edi
    jne L29
L28:
    mov dword ptr [ebp - 4], 1
L29:
    add esi, 4
    dec dword ptr [ebp - 56]
    jne L27
L30:
    cmp ecx, dword ptr [ebp - 32]
    jne L31
    and dword ptr [ebp - 4], 0
L31:
    cmp dword ptr [ebp - 4], 0
    je L34
    xor eax, eax
L32:
    cmp ecx, dword ptr [ebp + eax*4 - 000000088h]
    jne L33
    and dword ptr [ebp - 4], 0
L33:
    inc eax
    cmp eax, dword ptr [ebp - 40]
    jb L32
    cmp dword ptr [ebp - 4], 0
    je L34
    mov dword ptr [ebp - 28], 1
L34:
    add dword ptr [ebp - 44], 4
    dec dword ptr [ebp - 20]
    jne L26
L35:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 52]
    jb L25
L36:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    cmp eax, dword ptr [ebp - 40]
    jb L24
L37:
    and dword ptr [ebp - 8], 0
L38:
    mov eax, dword ptr [ebp - 8]
    mov esi, dword ptr [ebp + eax*4 - 0000001D8h]
    cmp esi, -1
    je L44
    xor edi, edi
    cmp dword ptr [ebp - 40], edi
    jbe L44
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + esi*4]
    mov dword ptr [ebp - 52], eax
L39:
    mov ecx, dword ptr [ebp + edi*4 - 000000088h]
    mov eax, dword ptr [ecx + 12]
    test eax, eax
    jbe L43
    mov ecx, dword ptr [ecx + 16]
    mov dword ptr [ebp - 20], eax
L40:
    mov edx, dword ptr [ecx]
    cmp esi, edx
    je L41
    mov eax, dword ptr [ebp - 52]
    cmp dword ptr [eax + 56], edx
    jne L42
L41:
    mov dword ptr [ebp - 28], 1
L42:
    add ecx, 4
    dec dword ptr [ebp - 20]
    jne L40
L43:
    inc edi
    cmp edi, dword ptr [ebp - 40]
    jb L39
L44:
    inc dword ptr [ebp - 8]
    cmp dword ptr [ebp - 8], 40
    jb L38
    cmp dword ptr [ebp - 28], 0
    je L46
L45:
    inc dword ptr [ebp - 12]
    cmp dword ptr [ebp - 12], 2
    jb L3
    mov eax, dword ptr [ebp - 28]
    test eax, eax
    je L46
    inc dword ptr [ebp - 48]
    cmp dword ptr [ebp - 48], 1
    jb L2
    jmp L50
L46:
    mov eax, dword ptr [ebp - 32]
    mov ecx, dword ptr [ebp - 40]
    mov dword ptr [ebp + ecx*4 - 000000088h], eax
    xor eax, eax
L47:
    mov ecx, dword ptr [ebp + eax - 0000001D8h]
    cmp ecx, -1
    jne L48
    mov ecx, dword ptr [ebp + eax - 000000278h]
    cmp ecx, -1
    je L49
L48:
    mov dword ptr [ebp + eax - 000000138h], ecx
L49:
    add eax, 4
    cmp eax, 0000000A0h
    jb L47
    xor eax, eax
L50:
    xor edx, edx
    mov dword ptr [ebp - 12], eax
    inc edx
L51:
    cmp dword ptr [ebp - 24], 3
    jb L56
    and dword ptr [ebp - 20], 0
    cmp dword ptr [ebp - 24], 0
    jbe L53
    mov eax, dword ptr [ebx + 000000100h]
    mov esi, dword ptr [ebx + 16]
    mov ecx, dword ptr [eax + 16]
L52:
    mov edi, dword ptr [ecx]
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + edi*4]
    mov edi, dword ptr [eax + 4]
    mov edi, dword ptr [esi + edi*4]
    test byte ptr [edi + 4], 32
    jne L56
    mov edi, dword ptr [ebp - 20]
    cmp dword ptr [eax + 16], edi
    jne L56
    inc edi
    add ecx, 4
    cmp edi, dword ptr [ebp - 24]
    mov dword ptr [ebp - 20], edi
    jb L52
L53:
    cmp dword ptr [ebp - 12], 0
    jne L65
    xor edx, edx
L54:
    mov eax, dword ptr [ebp + edx*4 - 000000138h]
    lea ecx, [ebp + edx*4 - 000000118h]
    cmp eax, dword ptr [ecx - 16]
    jne L67
    cmp eax, dword ptr [ecx]
    jne L67
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax*4]
    cmp dword ptr [eax + 16], edx
    je L55
    test byte ptr [ebx + 108], 2
    jne L67
L55:
    inc edx
    cmp edx, 3
    jb L54
    cmp dword ptr [ebp - 00000011Ch], -1
    jne L67
    cmp dword ptr [ebp - 00000010Ch], -1
    jne L67
    push 116
    call sub_10085CCE
    test eax, eax
    je L57
    mov ecx, eax
    call sub_1008583E
    mov esi, eax
    jmp L58
L56:
    mov eax, edx
    jmp L66
L57:
    xor esi, esi
L58:
    test esi, esi
    mov dword ptr [ebp - 32], esi
    jne L59
    mov eax, 08007000Eh
    jmp L66
L59:
    mov eax, dword ptr [ebp - 24]
    push 0
    push dword ptr [ebp - 24]
    and eax, 0000FFFFFh
    push dword ptr [ebp - 24]
    or eax, 070200000h
    push eax
    mov ecx, esi
    call sub_10085D5F
    mov edi, eax
    test edi, edi
    mov ecx, esi
    jl L60
    push dword ptr [ebx + 000000100h]
    call sub_100858C3
    mov edi, eax
    test edi, edi
    jge L61
    mov ecx, esi
L60:
    push 1
    call sub_1006C93A
    mov eax, edi
    jmp L66
L61:
    mov eax, dword ptr [ebx + 000000100h]
    mov esi, dword ptr [eax + 16]
    mov ecx, dword ptr [ebp - 24]
    mov eax, dword ptr [ebp - 32]
    mov edi, dword ptr [eax + 16]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    mov edx, dword ptr [ebp - 24]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [eax + 8]
    mov ecx, edx
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    lea esi, [ebp - 000000138h]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    xor esi, esi
    test edx, edx
    jbe L64
    mov eax, 080000000h
L62:
    test byte ptr [ebx + 108], 2
    je L63
    mov ecx, dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx + esi*4]
    mov edx, dword ptr [ebx + 20]
    mov ecx, dword ptr [edx + ecx*4]
    or dword ptr [ecx], eax
    mov ecx, dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx + esi*4]
    mov edx, dword ptr [ebx + 20]
    mov ecx, dword ptr [edx + ecx*4]
    cmp dword ptr [ecx + 56], -1
    je L63
    mov ecx, edx
    mov edx, dword ptr [ebx + 000000100h]
    mov edx, dword ptr [edx + 8]
    mov edx, dword ptr [edx + esi*4]
    mov edx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edx + 56]
    mov ecx, dword ptr [ecx + edx*4]
    or dword ptr [ecx], eax
L63:
    mov ecx, dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx + esi*4]
    mov edx, dword ptr [ebx + 20]
    mov ecx, dword ptr [edx + ecx*4]
    or dword ptr [ecx], eax
    inc esi
    cmp esi, dword ptr [ebp - 24]
    jb L62
L64:
    push dword ptr [ebp - 32]
    mov ecx, dword ptr [ebx + 000000100h]
    call sub_100860A7
    mov ecx, dword ptr [ebp - 32]
    push 1
    mov dword ptr [ebp - 12], eax
    call sub_1006CA0E
L65:
    mov eax, dword ptr [ebp - 12]
L66:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L67:
    xor eax, eax
    inc eax
    jmp L66
FUN_100c06ec ENDP
END
