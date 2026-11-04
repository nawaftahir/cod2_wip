.686
.MODEL FLAT, C
EXTRN sub_1006C782:PROC
EXTRN sub_1006C795:PROC
EXTRN sub_1006CD6A:PROC
EXTRN sub_1006E118:PROC
EXTRN sub_1006E2A5:PROC
EXTRN sub_1006E652:PROC
EXTRN sub_100856E4:PROC
EXTRN sub_10085ABB:PROC
EXTRN sub_10085E7B:PROC
EXTRN sub_10086467:PROC
EXTRN sub_10086501:PROC
EXTRN sub_1008666D:PROC
EXTRN sub_100F79E4:PROC
EXTRN sub_100F7B1D:PROC
.CODE
FUN_1006e308 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    mov edx, dword ptr [ebp + 12]
    push ebx
    mov eax, edx
    and eax, 0FFF00000h
    cmp eax, 020500000h
    push esi
    mov ebx, ecx
    push edi
    mov dword ptr [ebp - 8], ebx
    jne L4
    test byte ptr [ebp + 28], 4
    je L4
    mov eax, edx
    and eax, 0000FFFFFh
    mov dword ptr [ebp + 12], 0
    jbe L3
    mov esi, dword ptr [ebp + 20]
    mov edi, dword ptr [ebp + 24]
    sub edi, esi
    mov dword ptr [ebp - 4], edi
    jmp L2
L1:
    mov edi, dword ptr [ebp - 4]
L2:
    mov ecx, dword ptr [esi]
    cmp ecx, dword ptr [edi + esi]
    jne L3
    mov edi, dword ptr [ebx + 8]
    mov edi, dword ptr [edi + 20]
    mov ecx, dword ptr [edi + ecx*4]
    test byte ptr [ecx], 1
    je L3
    inc dword ptr [ebp + 12]
    add esi, 4
    cmp dword ptr [ebp + 12], eax
    jb L1
L3:
    cmp dword ptr [ebp + 12], eax
    jne L4
    and eax, 0000FFFFFh
    or eax, 010000000h
    mov edx, eax
L4:
    cmp edx, 050000001h
    jne L5
    push dword ptr [ebp + 28]
    push dword ptr [ebp + 24]
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 16]
    push 020500001h
    jmp L6
L5:
    cmp edx, 050000002h
    jne L7
    mov eax, dword ptr [ebx + 8]
    test byte ptr [eax + 108], 32
    jne L7
    mov esi, dword ptr [ebp + 28]
    or eax, 0FFFFFFFFh
    and esi, 64
    push esi
    push dword ptr [ebp + 24]
    lea edi, [ebp - 16]
    push dword ptr [ebp + 20]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    lea eax, [ebp - 16]
    push eax
    mov edi, 020500001h
    push edi
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call L0
    test eax, eax
    jl L66
    mov eax, dword ptr [ebp + 24]
    push esi
    add eax, 4
    push eax
    mov eax, dword ptr [ebp + 20]
    add eax, 4
    push eax
    lea eax, [ebp - 12]
    push eax
    push edi
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call L0
    test eax, eax
    jl L66
    push dword ptr [ebp + 28]
    lea eax, [ebp - 12]
    push eax
    lea eax, [ebp - 16]
    push eax
    push dword ptr [ebp + 16]
    push 020400001h
L6:
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call L0
    test eax, eax
    jl L66
    jmp L65
L7:
    mov ecx, dword ptr [ebx + 8]
    test byte ptr [ecx + 108], 000000080h
    je L19
    mov eax, edx
    and eax, 0FFF00000h
    cmp eax, 020000000h
    mov dword ptr [ebp - 12], eax
    je L8
    cmp eax, 020100000h
    je L8
    cmp eax, 020200000h
    je L8
    cmp eax, 020300000h
    jne L19
L8:
    and edx, 0000FFFFFh
    mov esi, edx
    mov eax, esi
    shl eax, 4
    push eax
    call sub_100F79E4
    pop ecx
    mov ecx, eax
    test ecx, ecx
    mov dword ptr [ebp - 8], ecx
    je L48
    mov edx, esi
    xor eax, eax
    shl edx, 2
L9:
    mov dword ptr [ebp + eax*4 - 32], ecx
    inc eax
    add ecx, edx
    cmp eax, 4
    jb L9
    test esi, esi
    jbe L16
    mov eax, dword ptr [ebp - 24]
    mov ecx, dword ptr [ebp + 20]
    mov edx, dword ptr [ebp + 24]
    sub ecx, eax
    mov dword ptr [ebp + 12], ecx
    mov ecx, dword ptr [ebp - 20]
    sub edx, eax
    sub ecx, eax
    mov dword ptr [ebp - 4], esi
L10:
    mov edi, dword ptr [ebp - 12]
    cmp edi, 020000000h
    je L13
    cmp edi, 020100000h
    je L12
    cmp edi, 020200000h
    je L11
    cmp edi, 020300000h
    jne L15
    mov edi, dword ptr [ebx + 32]
    mov dword ptr [eax], edi
    mov edi, dword ptr [ebx + 36]
    jmp L14
L11:
    mov edi, dword ptr [ebx + 36]
    mov dword ptr [eax], edi
    mov edi, dword ptr [ebx + 32]
    jmp L14
L12:
    mov edi, dword ptr [ebp + 12]
    mov edi, dword ptr [edi + eax]
    mov dword ptr [eax], edi
    mov edi, dword ptr [edx + eax]
    jmp L14
L13:
    mov edi, dword ptr [edx + eax]
    mov dword ptr [eax], edi
    mov edi, dword ptr [ebp + 12]
    mov edi, dword ptr [edi + eax]
L14:
    mov dword ptr [ecx + eax], edi
L15:
    add eax, 4
    dec dword ptr [ebp - 4]
    jne L10
L16:
    push esi
    push dword ptr [ebp - 32]
    mov ecx, ebx
    call sub_1006C782
    test eax, eax
    jl L18
    push esi
    push dword ptr [ebp - 28]
    mov ecx, ebx
    call sub_1006C795
    test eax, eax
    jl L18
    mov eax, dword ptr [ebp + 28]
    and eax, 64
    push eax
    push 0
    push dword ptr [ebp + 24]
    mov edi, esi
    push dword ptr [ebp - 32]
    mov dword ptr [ebp + 12], eax
    and edi, 0000FFFFFh
    mov eax, edi
    or eax, 010100000h
    push eax
    push dword ptr [ebp + 8]
    mov ecx, ebx
    call L0
    test eax, eax
    jl L18
    push dword ptr [ebp + 12]
    mov eax, edi
    push dword ptr [ebp - 32]
    or eax, 020400000h
    push dword ptr [ebp + 20]
    mov ecx, ebx
    push dword ptr [ebp - 28]
    push eax
    push dword ptr [ebp + 8]
    call L0
    test eax, eax
    jl L18
    push dword ptr [ebp + 28]
    mov eax, dword ptr [ebp - 8]
    lea eax, [eax + esi*8]
    push eax
    push dword ptr [ebp - 28]
    or edi, 030000000h
    push dword ptr [ebp + 16]
    mov ecx, ebx
    push edi
    push dword ptr [ebp + 8]
    call L0
    test eax, eax
    jl L18
    xor esi, esi
L17:
    push dword ptr [ebp - 8]
    call sub_100F7B1D
    pop ecx
    mov eax, esi
    jmp L66
L18:
    mov esi, eax
    jmp L17
L19:
    push -1
    push -1
    push edx
    call sub_10086467
    mov ebx, dword ptr [ebx + 8]
    cmp eax, dword ptr [ebx + 12]
    mov dword ptr [ebp - 4], eax
    jae L20
    mov ecx, dword ptr [ebx + 24]
    mov ebx, dword ptr [ecx + eax*4]
    jmp L21
L20:
    xor ebx, ebx
L21:
    xor eax, eax
    cmp ebx, eax
    je L48
    cmp dword ptr [ebx + 12], eax
    jne L22
    cmp dword ptr [ebx + 4], eax
    jne L22
    mov dword ptr [ebx], eax
    jmp L65
L22:
    xor esi, esi
    push esi
    push esi
    mov ecx, ebx
    call sub_10085E7B
    push esi
    push esi
    mov ecx, ebx
    mov dword ptr [ebp + 12], eax
    call sub_100856E4
    mov edx, dword ptr [ebx + 4]
    mov edi, dword ptr [ebx + 8]
    mov esi, dword ptr [ebp + 20]
    mov ecx, eax
    shl ecx, 2
    mov dword ptr [ebp - 12], ecx
    sub edx, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebx + 8]
    mov esi, dword ptr [ebp + 24]
    mov ecx, edx
    add edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov esi, dword ptr [ebp - 8]
    xor edx, edx
    cmp dword ptr [ebx + 4], edx
    jbe L27
L23:
    mov eax, dword ptr [ebx + 8]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [esi + 8]
    cmp eax, dword ptr [ecx + 8]
    jae L24
    mov ecx, dword ptr [ecx + 20]
    mov eax, dword ptr [ecx + eax*4]
    jmp L25
L24:
    xor eax, eax
L25:
    test eax, eax
    je L26
    inc dword ptr [eax + 92]
L26:
    inc edx
    cmp edx, dword ptr [ebx + 4]
    jb L23
L27:
    xor edi, edi
    cmp dword ptr [ebp + 12], edi
    mov dword ptr [ebp + 24], edi
    jbe L38
L28:
    mov eax, dword ptr [ebp + 16]
    and dword ptr [ebp + 20], 0
    test eax, eax
    je L31
    mov eax, dword ptr [eax + edi*4]
    cmp eax, -1
    je L31
    mov ecx, dword ptr [esi + 8]
    cmp eax, dword ptr [ecx + 8]
    jae L29
    mov ecx, dword ptr [ecx + 20]
    mov eax, dword ptr [ecx + eax*4]
    jmp L30
L29:
    xor eax, eax
L30:
    test eax, eax
    mov dword ptr [ebp + 20], eax
    je L47
L31:
    mov ecx, dword ptr [esi + 8]
    fldz
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push dword ptr [ecx + 000000088h]
    call sub_10086501
    cmp eax, -1
    mov dword ptr [ebp - 12], eax
    je L48
    mov ecx, dword ptr [esi + 8]
    cmp eax, dword ptr [ecx + 8]
    jae L32
    mov ecx, dword ptr [ecx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    jmp L33
L32:
    xor ecx, ecx
L33:
    test ecx, ecx
    je L48
    test byte ptr [ebp + 31], 14
    mov edx, dword ptr [ebp + 28]
    mov dword ptr [ecx], edx
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 72], edx
    mov dword ptr [ecx + 16], edi
    jne L34
    mov edx, dword ptr [esi + 100]
    or edx, dword ptr [ebp + 28]
    mov edi, dword ptr [ebp + 24]
    mov dword ptr [ecx], edx
L34:
    mov edx, dword ptr [esi + 48]
    mov dword ptr [ecx + 20], edx
    mov edx, dword ptr [esi + 52]
    mov dword ptr [ecx + 24], edx
    mov edx, edi
    mov edi, dword ptr [ebx + 16]
    shl edx, 2
    cmp dword ptr [ebp + 16], 0
    mov dword ptr [edx + edi], eax
    je L35
    mov edi, dword ptr [ebp + 16]
    mov dword ptr [edx + edi], eax
L35:
    mov eax, dword ptr [ebp + 20]
    test eax, eax
    je L36
    mov edi, dword ptr [eax + 48]
    mov dword ptr [ecx + 48], edi
    mov edi, dword ptr [eax + 96]
    mov dword ptr [ecx + 96], edi
    mov eax, dword ptr [eax + 100]
    mov dword ptr [ecx + 100], eax
L36:
    mov eax, dword ptr [ecx + 48]
    cmp eax, -1
    je L37
    mov eax, dword ptr [ebx + 16]
    mov edx, dword ptr [edx + eax]
    mov eax, dword ptr [ecx + 48]
    mov edi, dword ptr [esi + 24]
    mov dword ptr [edi + eax*4], edx
    xor eax, eax
    cmp dword ptr [ecx + 96], eax
    jne L37
    push dword ptr [ebp - 12]
    push 01010F7F8h
    push eax
    push eax
    push esi
    call sub_1006E118
    add esp, 20
L37:
    mov edi, dword ptr [ebp + 24]
    inc edi
    cmp edi, dword ptr [ebp + 12]
    mov dword ptr [ebp + 24], edi
    jb L28
L38:
    xor edi, edi
    cmp dword ptr [ebp + 12], edi
    jbe L40
L39:
    mov eax, dword ptr [ebx + 16]
    push 0
    push dword ptr [eax + edi*4]
    mov ecx, esi
    call sub_1006CD6A
    inc edi
    cmp edi, dword ptr [ebp + 12]
    jb L39
L40:
    test byte ptr [esi + 20], 4
    jne L45
    mov ecx, ebx
    call sub_10085ABB
    test eax, eax
    jne L45
    xor edi, edi
    cmp edi, dword ptr [ebp + 12]
    jae L43
L41:
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [esi + 8]
    mov eax, dword ptr [eax + edi*4]
    mov ecx, dword ptr [ecx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    test byte ptr [ecx], 64
    jne L42
    lea ecx, [ebp - 16]
    push ecx
    push eax
    mov ecx, esi
    call sub_1006E652
    test eax, eax
    jl L42
    inc edi
    cmp edi, dword ptr [ebp + 12]
    jb L41
L42:
    cmp edi, dword ptr [ebp + 12]
L43:
    jne L45
    mov eax, dword ptr [ebp + 12]
    and eax, 0000FFFFFh
    or eax, 010000000h
    mov dword ptr [ebx], eax
    mov eax, dword ptr [ebx + 12]
    xor edi, edi
    cmp dword ptr [ebp + 12], edi
    mov dword ptr [ebx + 4], eax
    jbe L45
L44:
    mov ecx, dword ptr [esi + 8]
    mov eax, dword ptr [ebx + 16]
    mov eax, dword ptr [eax + edi*4]
    mov edx, dword ptr [ecx + 20]
    mov eax, dword ptr [edx + eax*4]
    fld qword ptr [eax + 32]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push dword ptr [ecx + 120]
    call sub_1008666D
    mov ecx, dword ptr [ebx + 8]
    mov dword ptr [ecx + edi*4], eax
    mov eax, dword ptr [ebx + 8]
    cmp dword ptr [eax + edi*4], -1
    je L48
    inc edi
    cmp edi, dword ptr [ebp + 12]
    jb L44
L45:
    mov eax, dword ptr [ebx]
    and eax, 0FFF00000h
    mov ecx, 020500000h
    cmp eax, ecx
    ja L53
    je L60
    cmp eax, 010000000h
    je L51
    cmp eax, 010100000h
    je L49
    cmp eax, 020000000h
    je L60
    cmp eax, 020100000h
    je L60
    cmp eax, 020400000h
    jne L64
    and dword ptr [ebp + 28], 0
    cmp dword ptr [ebp + 12], 0
    jbe L64
L46:
    mov ecx, dword ptr [ebp + 28]
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax + 20]
    mov edx, dword ptr [ebx + 16]
    mov edi, dword ptr [ebx + 12]
    add edi, dword ptr [ebp + 28]
    shl ecx, 2
    mov edx, dword ptr [ecx + edx]
    mov edx, dword ptr [eax + edx*4]
    mov dword ptr [ebp + 20], edx
    mov edx, dword ptr [ebx + 8]
    mov ecx, dword ptr [ecx + edx]
    mov edi, dword ptr [edx + edi*4]
    mov edi, dword ptr [eax + edi*4]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [edi]
    and ecx, dword ptr [eax]
    mov eax, dword ptr [ebp + 20]
    and ecx, 2
    or dword ptr [eax], ecx
    inc dword ptr [ebp + 28]
    mov eax, dword ptr [ebp + 28]
    cmp eax, dword ptr [ebp + 12]
    jb L46
    jmp L64
L47:
    push 01010F7D0h
    push 0
    push 0
    push esi
    call sub_1006E2A5
    add esp, 16
    mov eax, 080004005h
    jmp L66
L48:
    mov eax, 08007000Eh
    jmp L66
L49:
    xor eax, eax
    cmp dword ptr [ebp + 12], eax
    mov dword ptr [ebp + 28], eax
    jbe L64
L50:
    mov ecx, dword ptr [ebx + 16]
    mov edi, dword ptr [ebx + 8]
    mov edx, eax
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax + 20]
    shl edx, 2
    mov ecx, dword ptr [edx + ecx]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edx + edi]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax]
    and eax, 2
    or dword ptr [ecx], eax
    mov eax, dword ptr [ebp + 28]
    inc eax
    cmp eax, dword ptr [ebp + 12]
    mov dword ptr [ebp + 28], eax
    jb L50
    jmp L64
L51:
    xor eax, eax
    cmp dword ptr [ebp + 12], eax
    mov dword ptr [ebp + 28], eax
    jbe L64
L52:
    mov edi, dword ptr [ebx + 8]
    mov edx, eax
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [eax + 20]
    mov eax, dword ptr [ebx + 16]
    shl edx, 2
    mov eax, dword ptr [edx + eax]
    mov eax, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edx + edi]
    mov ecx, dword ptr [ecx + edx*4]
    mov dword ptr [eax + 52], edx
    mov edx, dword ptr [ecx]
    or dword ptr [eax], edx
    fld qword ptr [ecx + 32]
    fstp qword ptr [eax + 32]
    fld qword ptr [ecx + 40]
    fstp qword ptr [eax + 40]
    mov eax, dword ptr [ebp + 28]
    inc eax
    cmp eax, dword ptr [ebp + 12]
    mov dword ptr [ebp + 28], eax
    jb L52
    jmp L64
L53:
    cmp eax, 020700000h
    je L60
    cmp eax, 020800000h
    je L60
    cmp eax, 030000000h
    je L56
    cmp eax, 050000000h
    jne L64
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [esi + 8]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ecx + 20]
    mov eax, dword ptr [ecx + eax*4]
    and dword ptr [ebp + 28], 0
    cmp dword ptr [ebp + 12], 0
    mov dword ptr [ebp + 24], eax
    jbe L55
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [esi + 8]
    mov edx, dword ptr [ebx + 12]
    mov ecx, dword ptr [ecx + 20]
    mov dword ptr [ebp + 20], eax
    lea edi, [eax + edx*4]
L54:
    mov eax, dword ptr [ebp + 20]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [ecx + eax*4]
    mov edx, dword ptr [edi]
    mov edx, dword ptr [ecx + edx*4]
    mov eax, dword ptr [eax]
    and eax, dword ptr [edx]
    test al, 2
    je L55
    inc dword ptr [ebp + 28]
    mov eax, dword ptr [ebp + 28]
    add dword ptr [ebp + 20], 4
    add edi, 4
    cmp eax, dword ptr [ebp + 12]
    jb L54
L55:
    mov eax, dword ptr [ebp + 28]
    cmp eax, dword ptr [ebp + 12]
    jne L64
    mov eax, dword ptr [ebp + 24]
    or dword ptr [eax], 2
    jmp L64
L56:
    xor edi, edi
    cmp dword ptr [ebp + 12], edi
    mov dword ptr [ebp + 20], edi
    jbe L64
L57:
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax + 20]
    mov ecx, dword ptr [ebx + 16]
    mov ecx, dword ptr [ecx + edi*4]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ebx + 8]
    mov dword ptr [ebp + 28], ecx
    mov ecx, dword ptr [ebx + 12]
    add edi, ecx
    mov edi, dword ptr [edx + edi*4]
    mov edi, dword ptr [eax + edi*4]
    mov dword ptr [ebp + 24], edi
    mov edi, dword ptr [ebp + 20]
    lea ecx, [edi + ecx*2]
    mov ecx, dword ptr [edx + ecx*4]
    mov eax, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ebp + 24]
    and eax, dword ptr [ecx]
    test al, 1
    je L58
    mov eax, dword ptr [ebp + 28]
    or dword ptr [eax], 23
    jmp L59
L58:
    test al, 2
    je L59
    mov eax, dword ptr [ebp + 28]
    or dword ptr [eax], 2
L59:
    inc edi
    cmp edi, dword ptr [ebp + 12]
    mov dword ptr [ebp + 20], edi
    jb L57
    jmp L64
L60:
    and dword ptr [ebp + 28], 0
    cmp dword ptr [ebp + 12], 0
    jbe L64
L61:
    mov edx, dword ptr [ebp + 28]
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax + 20]
    mov ecx, dword ptr [ebx + 16]
    mov edi, dword ptr [ebx + 12]
    add edi, dword ptr [ebp + 28]
    shl edx, 2
    mov ecx, dword ptr [edx + ecx]
    mov ecx, dword ptr [eax + ecx*4]
    mov dword ptr [ebp + 20], ecx
    mov ecx, dword ptr [ebx + 8]
    mov edx, dword ptr [edx + ecx]
    mov edx, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + edi*4]
    mov eax, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax]
    and eax, dword ptr [edx]
    test al, 1
    je L62
    mov eax, dword ptr [ebp + 20]
    or dword ptr [eax], 23
    jmp L63
L62:
    test al, 2
    je L63
    mov eax, dword ptr [ebp + 20]
    or dword ptr [eax], 2
L63:
    inc dword ptr [ebp + 28]
    mov eax, dword ptr [ebp + 28]
    cmp eax, dword ptr [ebp + 12]
    jb L61
L64:
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [ebx + 60], eax
    mov eax, dword ptr [esi + 56]
    mov dword ptr [ebx + 56], eax
L65:
    xor eax, eax
L66:
    pop edi
    pop esi
    pop ebx
    leave
    ret 24
FUN_1006e308 ENDP
END
