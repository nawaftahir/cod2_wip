.686
.MODEL FLAT, C
EXTRN sub_1006405B:PROC
EXTRN sub_100840B6:PROC
EXTRN sub_10084151:PROC
EXTRN sub_10084474:PROC
EXTRN sub_10084535:PROC
EXTRN sub_1008472F:PROC
EXTRN sub_100847F3:PROC
EXTRN sub_100848B8:PROC
EXTRN sub_1008493F:PROC
EXTRN sub_1008495E:PROC
EXTRN sub_10084A06:PROC
EXTRN sub_10084AA9:PROC
EXTRN sub_10084B05:PROC
EXTRN sub_1008B9D5:PROC
EXTRN sub_100C4354:PROC
EXTRN sub_100C49A6:PROC
EXTRN sub_100F706F:PROC
EXTRN sub_100F7994:PROC
EXTRN sub_100F79A6:PROC
EXTRN sub_100F7BD0:PROC
EXTRN sub_100F7CB4:PROC
EXTRN sub_100F7E16:PROC
EXTRN sub_100F7EEF:PROC
EXTRN sub_100F7FAF:PROC
EXTRN sub_100F8195:PROC
EXTRN sub_100F819D:PROC
EXTRN sub_100F81A5:PROC
EXTRN sub_100F81AD:PROC
EXTRN sub_100F81B5:PROC
EXTRN sub_100F81BD:PROC
EXTRN sub_100F9785:PROC
EXTRN g_1019BC80:DWORD
EXTRN g_1019BE20:DWORD
.CODE
FUN_100c7c92 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 00000017Ch
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000158h]
    neg eax
    sbb eax, eax
    and eax, 0040CF503h
    push edi
    add eax, 042415443h
    push eax
    lea ecx, [ebp - 80]
    mov dword ptr [ebp - 48], esi
    call sub_100840B6
    push 7
    pop ecx
    push 28
    xor ebx, ebx
    xor eax, eax
    lea edi, [ebp - 112]
    rep stosd dword ptr es:[edi], eax
    mov ecx, dword ptr [esi + 0000000C8h]
    pop eax
    push ebx
    push 1
    mov dword ptr [ebp - 104], ecx
    mov ecx, dword ptr [esi + 0000000CCh]
    push eax
    mov dword ptr [ebp - 112], eax
    lea eax, [ebp - 112]
    mov dword ptr [ebp - 92], ecx
    push eax
    lea ecx, [ebp - 80]
    mov dword ptr [ebp - 44], ebx
    mov dword ptr [ebp - 12], ebx
    mov dword ptr [ebp - 64], ebx
    mov dword ptr [ebp - 56], ebx
    mov dword ptr [ebp - 60], ebx
    mov dword ptr [ebp - 36], ebx
    call sub_10084151
    mov esi, eax
    cmp esi, ebx
    jl L76
    mov ebx, dword ptr [ebp - 48]
    xor edi, edi
    xor ecx, ecx
    cmp dword ptr [ebx + 8], edi
    mov dword ptr [ebp - 20], edi
    mov dword ptr [ebp - 4], edi
    jbe L5
    mov eax, dword ptr [ebx + 20]
    mov dword ptr [ebp - 16], eax
    mov eax, dword ptr [ebx + 8]
    mov dword ptr [ebp - 24], eax
L0:
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax]
    mov esi, dword ptr [eax + 4]
    mov edx, dword ptr [ebx + 16]
    mov esi, dword ptr [edx + esi*4]
    mov esi, dword ptr [esi + 4]
    test esi, 000000200h
    mov dword ptr [ebp - 8], esi
    je L4
    test byte ptr [ebp - 7], 1
    jne L4
    test byte ptr [ebp - 8], 000000080h
    mov eax, dword ptr [eax + 12]
    je L1
    cmp edi, eax
    ja L4
    lea edi, [eax + 1]
    jmp L4
L1:
    test byte ptr [ebp - 7], 32
    je L2
    cmp dword ptr [ebp - 20], eax
    ja L4
    inc eax
    mov dword ptr [ebp - 20], eax
    jmp L4
L2:
    test byte ptr [ebp - 6], 4
    je L3
    cmp dword ptr [ebp - 4], eax
    ja L4
    inc eax
    mov dword ptr [ebp - 4], eax
    jmp L4
L3:
    cmp ecx, eax
    ja L4
    lea ecx, [eax + 1]
L4:
    add dword ptr [ebp - 16], 4
    dec dword ptr [ebp - 24]
    jne L0
L5:
    mov edx, dword ptr [ebp - 20]
    lea eax, [ecx + edx]
    mov dword ptr [ebp - 32], eax
    lea eax, [edi + ecx]
    add eax, edx
    mov dword ptr [ebp - 16], eax
    mov eax, dword ptr [ebp - 4]
    lea esi, [eax + edi]
    add esi, ecx
    add esi, edx
    mov edi, esi
    shl edi, 2
    push edi
    call sub_100F7994
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 12], eax
    je L74
    push edi
    call sub_100F79A6
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 36], eax
    je L74
    and dword ptr [ebp - 8], 0
    mov ecx, edi
    mov edi, dword ptr [ebp - 12]
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    cmp dword ptr [ebx + 8], 0
    jbe L13
L6:
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebx + 20]
    mov eax, dword ptr [eax + ecx*4]
    cmp dword ptr [eax + 96], 0
    mov ecx, dword ptr [eax + 4]
    mov edx, dword ptr [ebx + 16]
    mov edi, dword ptr [edx + ecx*4]
    je L12
    cmp dword ptr [eax + 8], -1
    jne L12
    mov ecx, dword ptr [edi + 4]
    test ch, 2
    je L12
    test ch, 1
    jne L12
    test cl, cl
    jns L7
    mov edx, dword ptr [ebp - 32]
    jmp L9
L7:
    test ch, 32
    je L8
    xor edx, edx
    jmp L9
L8:
    test ecx, 000040000h
    mov edx, dword ptr [ebp - 16]
    jne L9
    mov edx, dword ptr [ebp - 20]
L9:
    mov ecx, dword ptr [eax + 12]
    mov edi, dword ptr [eax + 112]
    add ecx, edx
    shr edi, 2
    mov edx, ecx
    sub edx, edi
    inc ecx
    jmp L11
L10:
    mov edi, dword ptr [ebp - 12]
    dec ecx
    lea edi, [edi + ecx*4]
    cmp dword ptr [edi], 0
    jne L12
    mov dword ptr [edi], eax
L11:
    cmp ecx, edx
    ja L10
L12:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebx + 8]
    jb L6
L13:
    xor edx, edx
    xor ecx, ecx
    cmp esi, edx
    mov dword ptr [ebp - 24], edx
    jbe L16
L14:
    mov edi, dword ptr [ebp - 12]
    mov eax, dword ptr [edi + ecx*4]
    cmp eax, edx
    je L15
    mov ebx, dword ptr [ebp - 24]
    inc dword ptr [ebp - 24]
    mov dword ptr [edi + ebx*4], eax
L15:
    inc ecx
    cmp ecx, esi
    jb L14
    jmp L17
L16:
    mov edi, dword ptr [ebp - 12]
L17:
    xor eax, eax
    cmp dword ptr [ebp - 24], eax
    mov dword ptr [ebp - 28], edx
    jbe L21
L18:
    test eax, eax
    je L19
    mov ecx, dword ptr [edi + edx*4]
    mov esi, dword ptr [ecx + 4]
    cmp esi, dword ptr [eax + 4]
    jne L19
    mov ecx, dword ptr [ecx + 96]
    cmp ecx, dword ptr [eax + 96]
    jne L19
    mov ecx, dword ptr [edi + edx*4]
    mov esi, dword ptr [ecx + 112]
    mov ecx, dword ptr [ecx + 12]
    mov ebx, dword ptr [eax + 12]
    shr esi, 2
    sub ecx, esi
    mov esi, dword ptr [eax + 112]
    shr esi, 2
    sub ebx, esi
    cmp ecx, ebx
    je L20
L19:
    mov eax, dword ptr [edi + edx*4]
    test eax, eax
    je L20
    mov ecx, dword ptr [eax + 96]
    cmp dword ptr [ecx + 4], 6
    jne L20
    mov esi, dword ptr [ecx + 20]
    test esi, esi
    je L20
    cmp dword ptr [esi + 4], 3
    jne L20
    mov ecx, dword ptr [ecx + 24]
    test ecx, ecx
    je L20
    cmp dword ptr [ecx + 4], 11
    jne L20
    cmp dword ptr [esi + 16], 9
    jne L20
    cmp dword ptr [esi + 24], 0
    je L20
    mov esi, dword ptr [ebp - 28]
    mov ecx, dword ptr [ebp - 36]
    inc dword ptr [ebp - 28]
    mov dword ptr [ecx + esi*4], edx
L20:
    inc edx
    cmp edx, dword ptr [ebp - 24]
    jb L18
L21:
    xor ecx, ecx
    cmp dword ptr [ebp - 28], ecx
    mov dword ptr [ebp - 8], ecx
    jbe L34
L22:
    mov eax, dword ptr [ebp - 36]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [edi + eax*4]
    mov dword ptr [ebp - 16], eax
    mov eax, dword ptr [eax + 96]
    mov eax, dword ptr [eax + 20]
    mov eax, dword ptr [eax + 24]
    xor esi, esi
    test ecx, ecx
    mov dword ptr [ebp - 32], eax
    jbe L33
    jmp L24
L23:
    mov edi, dword ptr [ebp - 12]
L24:
    mov eax, dword ptr [ebp - 36]
    mov eax, dword ptr [eax + esi*4]
    mov ecx, dword ptr [edi + eax*4]
    mov eax, dword ptr [ecx + 96]
    mov eax, dword ptr [eax + 20]
    mov eax, dword ptr [eax + 24]
    mov edi, dword ptr [ebp - 32]
L25:
    mov bl, byte ptr [edi]
    mov dl, bl
    cmp bl, byte ptr [eax]
    jne L27
    test dl, dl
    je L26
    mov bl, byte ptr [edi + 1]
    mov dl, bl
    cmp bl, byte ptr [eax + 1]
    jne L27
    inc edi
    inc edi
    inc eax
    inc eax
    test dl, dl
    jne L25
L26:
    xor eax, eax
    jmp L28
L27:
    sbb eax, eax
    sbb eax, -1
L28:
    test eax, eax
    jl L30
    jg L29
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + 4]
    cmp eax, dword ptr [ecx + 4]
    jb L30
L29:
    inc esi
    cmp esi, dword ptr [ebp - 8]
    jb L23
L30:
    mov ecx, dword ptr [ebp - 8]
    cmp ecx, esi
    jbe L32
    mov eax, ecx
L31:
    mov edx, dword ptr [ebp - 36]
    mov edi, dword ptr [edx + eax*4 - 4]
    mov dword ptr [edx + eax*4], edi
    dec eax
    cmp eax, esi
    ja L31
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [edx + esi*4], eax
L32:
    mov edi, dword ptr [ebp - 12]
L33:
    inc ecx
    cmp ecx, dword ptr [ebp - 28]
    mov dword ptr [ebp - 8], ecx
    jb L22
L34:
    mov ecx, dword ptr [ebp - 48]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 0x8c]
    mov ebx, eax
    add ebx, dword ptr [ebp - 28]
    je L73
    lea esi, [ebx + ebx*4]
    shl esi, 2
    push esi
    call sub_100F7BD0
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 44], eax
    je L74
    mov edi, dword ptr [ebp - 44]
    mov ecx, esi
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    lea eax, [ebp - 96]
    push eax
    push 1
    push esi
    push dword ptr [ebp - 44]
    lea ecx, [ebp - 80]
    call sub_10084474
    mov esi, eax
    test esi, esi
    jl L76
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebp - 28], 0
    mov dword ptr [ebp - 100], ebx
    jbe L73
    mov ebx, dword ptr [ebp - 44]
    mov edi, dword ptr [ebp - 36]
    add ebx, 4
    mov dword ptr [ebp - 16], edi
    mov dword ptr [ebp - 20], ebx
L35:
    mov ecx, dword ptr [ebp - 12]
    mov eax, dword ptr [edi]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [eax + 96]
    mov edx, dword ptr [ecx + 24]
    mov ecx, dword ptr [ecx + 20]
    mov ecx, dword ptr [ecx + 24]
    mov dword ptr [ebp - 40], edx
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [ebp - 48]
    cmp dword ptr [eax + 000000158h], 0
    mov esi, dword ptr [eax + 16]
    mov edx, dword ptr [esi + edx*4]
    mov dword ptr [ebp - 52], edx
    jne L36
    lea eax, [ebx - 4]
    push eax
    push 7
    push -1
    push ecx
    jmp L40
L36:
    mov edx, dword ptr [edx + 4]
    test dh, 32
    mov eax, 01011A654h
    je L37
    mov eax, 01011A64Ch
    jmp L39
L37:
    test edx, 000040000h
    je L38
    mov eax, 01011A644h
    jmp L39
L38:
    test dl, dl
    jns L39
    mov eax, 01011A63Ch
L39:
    push ecx
    push eax
    lea eax, [ebp - 00000017Ch]
    push 0000000FFh
    push eax
    call sub_100F7CB4
    add esp, 16
    lea eax, [ebx - 4]
    push eax
    push 6
    push -1
    lea eax, [ebp - 00000017Ch]
    mov byte ptr [ebp - 126], 0
    push eax
L40:
    lea ecx, [ebp - 80]
    call sub_10084535
    mov esi, eax
    test esi, esi
    jl L76
    mov eax, dword ptr [edi]
    xor edx, edx
    lea ecx, [eax + 1]
    inc edx
    cmp ecx, dword ptr [ebp - 24]
    jae L42
    mov esi, dword ptr [ebp - 12]
    lea eax, [esi + eax*4]
    mov esi, dword ptr [eax]
    mov esi, dword ptr [esi + 4]
    add eax, 4
    mov dword ptr [ebp - 84], esi
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 32], eax
L41:
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ebp - 84]
    cmp ecx, dword ptr [eax + 4]
    jne L42
    mov eax, dword ptr [edi]
    mov esi, dword ptr [ebp - 12]
    lea ecx, [eax + edx]
    mov eax, dword ptr [esi + eax*4]
    mov ecx, dword ptr [esi + ecx*4]
    mov eax, dword ptr [eax + 96]
    cmp eax, dword ptr [ecx + 96]
    jne L42
    mov eax, dword ptr [edi]
    lea ecx, [eax + edx]
    mov eax, dword ptr [esi + eax*4]
    mov ecx, dword ptr [esi + ecx*4]
    mov esi, dword ptr [eax + 112]
    mov eax, dword ptr [eax + 12]
    shr esi, 2
    sub eax, esi
    mov esi, dword ptr [ecx + 112]
    mov ecx, dword ptr [ecx + 12]
    shr esi, 2
    sub ecx, esi
    cmp eax, ecx
    jne L42
    mov eax, dword ptr [ebp - 32]
    add eax, 4
    inc edx
    inc dword ptr [ebp - 4]
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, dword ptr [ebp - 24]
    mov dword ptr [ebp - 32], eax
    jb L41
L42:
    mov eax, dword ptr [ebp - 52]
    mov eax, dword ptr [eax + 4]
    test al, al
    jns L43
    push 3
    pop eax
    jmp L45
L43:
    test ah, 32
    je L44
    xor eax, eax
    jmp L45
L44:
    and eax, 000040000h
    neg eax
    sbb eax, eax
    inc eax
    inc eax
L45:
    mov ecx, dword ptr [ebp - 12]
    mov word ptr [ebx], ax
    mov eax, dword ptr [edi]
    mov eax, dword ptr [ecx + eax*4]
    mov esi, dword ptr [eax + 112]
    mov ax, word ptr [eax + 12]
    shr esi, 2
    sub ax, si
    mov word ptr [ebx + 2], ax
    mov eax, dword ptr [ebp - 40]
    mov word ptr [ebx + 4], dx
    mov eax, dword ptr [eax + 32]
    test eax, eax
    je L46
    lea edx, [ebx + 8]
    push edx
    mov edx, dword ptr [edi]
    mov ecx, dword ptr [ecx + edx*4]
    mov ecx, dword ptr [ecx + 60]
    and ecx, 000E00000h
    push ecx
    push 1
    push eax
    lea eax, [ebp - 80]
    push eax
    call sub_100C4354
    mov esi, eax
    test esi, esi
    jl L76
L46:
    mov eax, dword ptr [ebp - 40]
    cmp dword ptr [eax + 48], 0
    je L47
    mov ecx, dword ptr [ebp - 48]
    mov edx, dword ptr [ecx]
    lea eax, [ebx - 4]
    push eax
    push dword ptr [ebp - 40]
    call dword ptr [edx + 0x94]
    mov esi, eax
    test esi, esi
    jl L76
L47:
    mov ecx, dword ptr [ebp - 40]
    mov eax, dword ptr [ecx + 52]
    test eax, eax
    je L72
    mov dx, word ptr [ebx]
    cmp dx, 1
    jne L55
    lea esi, [eax + 3]
    and esi, 0FFFFFFFCh
    mov eax, esi
    shl eax, 2
    push eax
    mov dword ptr [ebp - 32], eax
    call sub_100F7E16
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 60], eax
    je L74
    mov ecx, dword ptr [ebp - 32]
    mov ebx, dword ptr [ebp - 60]
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    mov edi, ebx
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    shr esi, 2
    rep stosb byte ptr es:[edi], al
    je L49
    lea eax, [ebx + 8]
L48:
    mov dword ptr [eax], 1
    add eax, 16
    dec esi
    jne L48
L49:
    mov edi, dword ptr [ebp - 40]
    and dword ptr [ebp - 4], 0
    cmp dword ptr [edi + 52], 0
    jbe L54
L50:
    mov esi, dword ptr [ebp - 4]
    mov eax, dword ptr [edi + 56]
    shl esi, 2
    mov eax, dword ptr [esi + eax]
    test eax, eax
    je L53
    mov ecx, dword ptr [eax]
    sub ecx, 0
    je L52
    dec ecx
    je L51
    dec ecx
    je L51
    dec ecx
    jne L53
    fld qword ptr [eax + 8]
    call sub_100F9785
    mov edi, dword ptr [ebp - 40]
    mov dword ptr [esi + ebx], eax
    jmp L53
L51:
    mov eax, dword ptr [eax + 8]
    mov dword ptr [esi + ebx], eax
    jmp L53
L52:
    xor ecx, ecx
    cmp dword ptr [eax + 8], ecx
    setne cl
    mov dword ptr [esi + ebx], ecx
L53:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [edi + 52]
    jb L50
L54:
    mov eax, dword ptr [ebp - 20]
    add eax, 12
    push eax
    push 11
    push dword ptr [ebp - 32]
    lea ecx, [ebp - 80]
    push ebx
    call sub_1008472F
    mov esi, eax
    test esi, esi
    jl L76
    and dword ptr [ebp - 60], 0
    jmp L71
L55:
    cmp dx, 2
    jne L64
    add eax, 3
    and eax, 0FFFFFFFCh
    mov esi, eax
    shl esi, 2
    push esi
    mov dword ptr [ebp - 52], esi
    call sub_100F7EEF
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 64], eax
    je L74
    mov edx, dword ptr [ebp - 64]
    mov ecx, esi
    shr ecx, 2
    xor eax, eax
    mov edi, edx
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov edi, dword ptr [ebp - 40]
    xor ebx, ebx
    cmp dword ptr [edi + 52], ebx
    jbe L63
L56:
    mov eax, dword ptr [edi + 56]
    mov ecx, ebx
    shl ecx, 2
    mov eax, dword ptr [ecx + eax]
    test eax, eax
    je L62
    mov esi, dword ptr [eax]
    sub esi, 0
    je L59
    dec esi
    je L58
    dec esi
    je L57
    dec esi
    jne L62
    fld qword ptr [eax + 8]
    jmp L61
L57:
    mov eax, dword ptr [eax + 8]
    test eax, eax
    mov dword ptr [ebp - 84], eax
    fild dword ptr [ebp - 84]
    jge L61
    fadd dword ptr [g_1019BC80]
    jmp L61
L58:
    fild dword ptr [eax + 8]
    jmp L61
L59:
    cmp dword ptr [eax + 8], 0
    je L60
    fld1
    jmp L61
L60:
    fldz
L61:
    fstp dword ptr [ecx + edx]
L62:
    inc ebx
    cmp ebx, dword ptr [edi + 52]
    jb L56
L63:
    mov eax, dword ptr [ebp - 20]
    add eax, 12
    push eax
    push 11
    push dword ptr [ebp - 52]
    lea ecx, [ebp - 80]
    push edx
    call sub_100847F3
    mov esi, eax
    test esi, esi
    jl L76
    and dword ptr [ebp - 64], 0
    jmp L71
L64:
    test dx, dx
    jne L72
    mov eax, dword ptr [ecx + 20]
    mov esi, eax
    shl esi, 2
    push esi
    mov dword ptr [ebp - 52], esi
    call sub_100F7FAF
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 56], eax
    je L74
    mov ecx, esi
    mov esi, dword ptr [ebp - 56]
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    mov edi, esi
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov edi, dword ptr [ebp - 40]
    xor ebx, ebx
    cmp dword ptr [edi + 20], ebx
    mov dword ptr [ebp - 4], ebx
    jbe L70
L65:
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [edi + 60]
    shl ecx, 2
    mov eax, dword ptr [ecx + eax]
    cmp eax, ebx
    je L69
    mov edx, dword ptr [eax]
    sub edx, ebx
    je L68
    dec edx
    je L68
    dec edx
    je L68
    dec edx
    jne L69
    fld qword ptr [g_1019BE20]
    fld qword ptr [eax + 8]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L66
    xor eax, eax
    inc eax
    jmp L67
L66:
    xor eax, eax
L67:
    mov dword ptr [ecx + esi], eax
    jmp L69
L68:
    xor edx, edx
    cmp dword ptr [eax + 8], ebx
    setne dl
    mov dword ptr [ecx + esi], edx
L69:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [edi + 20]
    jb L65
L70:
    mov eax, dword ptr [ebp - 20]
    add eax, 12
    push eax
    push 11
    push dword ptr [ebp - 52]
    lea ecx, [ebp - 80]
    push esi
    call sub_100848B8
    mov esi, eax
    cmp esi, ebx
    jl L76
    and dword ptr [ebp - 56], 0
L71:
    mov ebx, dword ptr [ebp - 20]
    mov edi, dword ptr [ebp - 16]
L72:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    add edi, 4
    add ebx, 20
    cmp eax, dword ptr [ebp - 28]
    mov dword ptr [ebp - 16], edi
    mov dword ptr [ebp - 20], ebx
    jb L35
L73:
    push dword ptr [ebp - 28]
    mov ecx, dword ptr [ebp - 48]
    push dword ptr [ebp - 44]
    mov eax, dword ptr [ecx]
    lea edx, [ebp - 80]
    push edx
    call dword ptr [eax + 0x90]
    mov esi, eax
    test esi, esi
    jl L76
    mov ebx, dword ptr [ebp - 48]
    xor eax, eax
    lea edi, [ebp - 124]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    lea eax, [ebp - 124]
    push eax
    push 0
    push dword ptr [ebx + 000000108h]
    call sub_1006405B
    mov esi, eax
    test esi, esi
    jl L76
    lea eax, [ebp - 88]
    push eax
    push 5
    push -1
    push dword ptr [ebp - 124]
    lea ecx, [ebp - 80]
    call sub_1008493F
    mov esi, eax
    test esi, esi
    jl L76
    lea eax, [ebp - 108]
    push eax
    push 5
    push -1
    push 01011A608h
    lea ecx, [ebp - 80]
    call sub_1008495E
    mov esi, eax
    test esi, esi
    jl L76
    lea ecx, [ebp - 80]
    call sub_10084AA9
    mov edi, eax
    cmp edi, 000008000h
    ja L75
    push edi
    mov ecx, ebx
    call sub_100C49A6
    mov esi, eax
    test esi, esi
    jl L76
    mov ecx, dword ptr [ebx + 000000110h]
    mov eax, dword ptr [ebx + 00000010Ch]
    lea ecx, [ecx*4 - 4]
    push ecx
    lea ecx, [eax + 4]
    push ecx
    lea eax, [eax + edi*4 + 4]
    push eax
    call sub_100F706F
    mov eax, dword ptr [ebx + 00000010Ch]
    add esp, 12
    push edi
    add eax, 4
    push eax
    lea ecx, [ebp - 80]
    call sub_10084B05
    mov esi, eax
    test esi, esi
    jl L76
    add dword ptr [ebx + 000000110h], edi
    mov eax, dword ptr [ebx + 000000110h]
    add dword ptr [ebx + 000000120h], edi
    mov dword ptr [ebx + 00000011Ch], eax
    xor esi, esi
    jmp L76
L74:
    mov esi, 08007000Eh
    jmp L76
L75:
    push 01011A5D4h
    push 0000011C4h
    push 0
    push ebx
    call sub_1008B9D5
    add esp, 16
    mov esi, 080004005h
L76:
    push dword ptr [ebp - 44]
    call sub_100F8195
    push dword ptr [ebp - 12]
    call sub_100F819D
    push dword ptr [ebp - 64]
    call sub_100F81A5
    push dword ptr [ebp - 56]
    call sub_100F81AD
    push dword ptr [ebp - 60]
    call sub_100F81B5
    push dword ptr [ebp - 36]
    call sub_100F81BD
    add esp, 24
    lea ecx, [ebp - 80]
    call sub_10084A06
    pop edi
    mov eax, esi
    pop esi
    pop ebx
    leave
    ret
FUN_100c7c92 ENDP
END
