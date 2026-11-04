.686
.MODEL FLAT, C
EXTRN sub_1006E068:PROC
EXTRN sub_1006E341:PROC
EXTRN sub_10086B53:PROC
EXTRN sub_10086B8B:PROC
EXTRN sub_10086C81:PROC
EXTRN sub_10087C24:PROC
EXTRN sub_1008A995:PROC
EXTRN sub_1008AF22:PROC
EXTRN sub_1008BAC6:PROC
EXTRN sub_1008DAEB:PROC
EXTRN sub_1008E45D:PROC
EXTRN sub_1008F6B2:PROC
EXTRN g_1019BC88:DWORD
EXTRN g_1019BE20:DWORD
.CODE
FUN_10093c67 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 72
    push ebx
    push esi
    push edi
    xor ebx, ebx
    mov edi, ecx
    mov dword ptr [ebp - 4], ebx
    call sub_1008AF22
    call sub_1008A995
    or dword ptr [ebp - 32], 0FFFFFFFFh
    or dword ptr [ebp - 16], 0FFFFFFFFh
    cmp dword ptr [edi + 12], ebx
    mov dword ptr [ebp - 24], ebx
    jbe L101
    jmp L1
L0:
    xor ebx, ebx
L1:
    mov eax, dword ptr [edi + 24]
    mov ecx, dword ptr [ebp - 24]
    mov esi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi]
    mov edx, eax
    and edx, 0FFF00000h
    je L100
    cmp edx, 011000000h
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ebp - 12], ecx
    jne L4
    xor edx, edx
    cmp dword ptr [esi + 4], ebx
    jbe L3
    mov eax, dword ptr [edi + 20]
    mov ecx, dword ptr [esi + 8]
L2:
    mov ebx, dword ptr [ecx]
    mov ebx, dword ptr [eax + ebx*4]
    mov ebx, dword ptr [ebx + 48]
    mov ebx, dword ptr [eax + ebx*4]
    test byte ptr [ebx], 4
    je L3
    inc edx
    add ecx, 4
    cmp edx, dword ptr [esi + 4]
    jb L2
L3:
    cmp edx, dword ptr [esi + 4]
    jne L94
    jmp L91
L4:
    mov ecx, eax
    and ecx, 0F0000000h
    cmp ecx, 010000000h
    jne L19
    cmp dword ptr [esi + 12], ebx
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 12], ebx
    jbe L13
L5:
    mov ecx, dword ptr [ebp - 12]
    mov eax, dword ptr [esi + 16]
    mov ebx, dword ptr [esi + 8]
    shl ecx, 2
    mov edx, dword ptr [ecx + eax]
    mov ecx, dword ptr [ecx + ebx]
    mov eax, dword ptr [edi + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov ebx, dword ptr [ecx + 48]
    mov ecx, dword ptr [esi]
    and ecx, 0FFF00000h
    cmp ecx, 010000000h
    mov dword ptr [ebp - 36], edx
    mov dword ptr [ebp - 40], ebx
    je L6
    cmp ecx, 010100000h
    jne L10
L6:
    mov ecx, dword ptr [eax + edx*4]
    mov edx, dword ptr [eax + ebx*4]
    mov eax, dword ptr [edx]
    mov dword ptr [ebp - 44], ecx
    mov ecx, dword ptr [ecx]
    or eax, ecx
    and eax, 00E000000h
    mov ebx, 002000000h
    test ebx, eax
    jne L7
    mov ebx, 004000000h
    test ebx, eax
    jne L7
    mov ebx, 008000000h
    test ebx, eax
    je L8
L7:
    mov eax, ebx
L8:
    mov ebx, ecx
    and ebx, 00E000000h
    cmp eax, ebx
    je L9
    mov ebx, dword ptr [ebp - 44]
    and ecx, 0F1FFFFFFh
    or ecx, eax
    mov dword ptr [ebx], ecx
    mov dword ptr [ebp - 4], 1
L9:
    mov ecx, dword ptr [edx]
    mov dword ptr [ebp - 44], ecx
    and ecx, 00E000000h
    cmp eax, ecx
    je L10
    mov ecx, dword ptr [edx + 4]
    mov ebx, dword ptr [edi + 16]
    mov ecx, dword ptr [ebx + ecx*4]
    test byte ptr [ecx + 4], 2
    je L10
    xor ebx, ebx
    inc ebx
    cmp dword ptr [edx + 92], ebx
    jne L10
    mov ecx, dword ptr [ebp - 44]
    and ecx, 0F1FFFFFFh
    or ecx, eax
    mov dword ptr [edx], ecx
    mov dword ptr [ebp - 4], ebx
L10:
    push dword ptr [ebp - 40]
    mov ebx, dword ptr [ebp - 36]
    push ebx
    push esi
    mov ecx, edi
    call sub_1008DAEB
    test eax, eax
    jl L103
    mov eax, dword ptr [edi + 20]
    lea ecx, [eax + ebx*4]
    mov edx, dword ptr [ecx]
    mov edx, dword ptr [edx + 48]
    cmp edx, ebx
    jne L11
    inc dword ptr [ebp - 8]
    jmp L12
L11:
    mov edx, dword ptr [eax + edx*4]
    cmp dword ptr [edx + 48], -1
    jne L12
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [ecx + 48]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [eax + 48], ecx
L12:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [esi + 12]
    jb L5
L13:
    mov eax, dword ptr [esi + 12]
    cmp dword ptr [ebp - 8], eax
    je L94
    xor ecx, ecx
    cmp eax, ecx
    mov dword ptr [ebp - 8], ecx
    mov dword ptr [ebp - 4], ecx
    jbe L17
L14:
    mov edx, dword ptr [esi + 16]
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [edx + eax*4]
    mov ecx, dword ptr [edi + 20]
    mov ebx, dword ptr [ecx + eax*4]
    cmp dword ptr [ebx + 48], eax
    jne L15
    mov ecx, dword ptr [ebp - 8]
    shl ecx, 2
    inc dword ptr [ebp - 8]
    mov dword ptr [ecx + edx], eax
    mov eax, dword ptr [esi + 8]
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [eax + edx*4]
    mov dword ptr [ecx + eax], edx
    jmp L16
L15:
    mov eax, dword ptr [ecx + eax*4]
    mov edx, dword ptr [eax + 48]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [ecx + 4]
    mov ebx, dword ptr [edi + 16]
    mov edx, dword ptr [ebx + edx*4]
    test byte ptr [edx + 4], 2
    je L16
    cmp dword ptr [ecx + 96], 0
    jne L16
    mov eax, dword ptr [eax + 96]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 96], eax
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [edi + 20]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 100]
    mov dword ptr [ecx + 100], eax
L16:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 12]
    jb L14
    mov ecx, dword ptr [ebp - 8]
    test ecx, ecx
    je L17
    mov eax, dword ptr [esi]
    xor eax, ecx
    and eax, 0000FFFFFh
    xor eax, dword ptr [esi]
    jmp L18
L17:
    xor eax, eax
L18:
    mov dword ptr [esi + 4], ecx
    mov dword ptr [esi + 12], ecx
    jmp L92
L19:
    cmp ecx, 020000000h
    jne L45
    cmp dword ptr [esi + 12], ebx
    mov dword ptr [ebp - 20], ebx
    mov dword ptr [ebp - 8], ebx
    jbe L31
L20:
    mov edx, dword ptr [ebp - 8]
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [esi + 8]
    shl edx, 2
    mov ebx, dword ptr [edx + eax]
    mov edx, dword ptr [edx + ecx]
    mov eax, dword ptr [edi + 20]
    mov edx, dword ptr [eax + edx*4]
    mov edx, dword ptr [edx + 48]
    mov dword ptr [ebp - 40], edx
    mov edx, dword ptr [esi + 12]
    add edx, dword ptr [ebp - 8]
    mov dword ptr [ebp - 52], ebx
    mov ecx, dword ptr [ecx + edx*4]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ecx + 48]
    mov ecx, dword ptr [esi]
    and ecx, 0FFF00000h
    cmp ecx, 020000000h
    mov dword ptr [ebp - 48], edx
    je L21
    cmp ecx, 020100000h
    jne L28
L21:
    mov ecx, dword ptr [eax + ebx*4]
    mov dword ptr [ebp - 44], ecx
    mov ecx, dword ptr [ebp - 40]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [ecx]
    mov dword ptr [ebp - 36], ecx
    mov ecx, dword ptr [eax]
    or ecx, edx
    and ecx, 00E000000h
    mov ebx, 008000000h
    test ebx, ecx
    mov dword ptr [ebp - 28], eax
    jne L22
    mov ebx, 004000000h
    test ebx, ecx
    jne L22
    mov ebx, 002000000h
    test ebx, ecx
    je L23
L22:
    mov ecx, ebx
L23:
    mov ebx, dword ptr [ebp - 44]
    mov ebx, dword ptr [ebx]
    and ebx, 00E000000h
    or ecx, ebx
    mov ebx, 002000000h
    test ebx, ecx
    jne L24
    mov ebx, 004000000h
    test ebx, ecx
    jne L24
    mov ebx, 008000000h
    test ebx, ecx
    je L25
L24:
    mov ecx, ebx
L25:
    mov ebx, edx
    and ebx, 00E000000h
    cmp ecx, ebx
    je L27
    mov eax, dword ptr [ebp - 36]
    mov eax, dword ptr [eax + 4]
    mov ebx, dword ptr [edi + 16]
    mov eax, dword ptr [ebx + eax*4]
    test byte ptr [eax + 4], 2
    je L26
    mov eax, dword ptr [ebp - 36]
    xor ebx, ebx
    inc ebx
    cmp dword ptr [eax + 92], ebx
    jne L26
    and edx, 0F1FFFFFFh
    or edx, ecx
    mov dword ptr [eax], edx
    mov dword ptr [ebp - 4], ebx
L26:
    mov eax, dword ptr [ebp - 28]
L27:
    mov edx, dword ptr [eax]
    mov dword ptr [ebp - 44], edx
    and edx, 00E000000h
    cmp ecx, edx
    je L28
    mov edx, dword ptr [eax + 4]
    mov ebx, dword ptr [edi + 16]
    mov edx, dword ptr [ebx + edx*4]
    test byte ptr [edx + 4], 2
    je L28
    xor ebx, ebx
    inc ebx
    cmp dword ptr [eax + 92], ebx
    jne L28
    mov edx, dword ptr [ebp - 44]
    and edx, 0F1FFFFFFh
    or edx, ecx
    mov dword ptr [eax], edx
    mov dword ptr [ebp - 4], ebx
L28:
    push dword ptr [ebp - 48]
    mov ebx, dword ptr [ebp - 52]
    push dword ptr [ebp - 40]
    mov ecx, edi
    push ebx
    push esi
    call sub_1008E45D
    test eax, eax
    jl L103
    mov eax, dword ptr [edi + 20]
    lea ecx, [eax + ebx*4]
    mov edx, dword ptr [ecx]
    mov edx, dword ptr [edx + 48]
    cmp edx, ebx
    jne L29
    inc dword ptr [ebp - 20]
    jmp L30
L29:
    mov edx, dword ptr [eax + edx*4]
    cmp dword ptr [edx + 48], -1
    jne L30
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [ecx + 48]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [eax + 48], ecx
L30:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 12]
    jb L20
L31:
    mov eax, dword ptr [esi + 12]
    cmp dword ptr [ebp - 20], eax
    je L94
    cmp dword ptr [ebp - 20], 0
    jne L37
    xor ecx, ecx
    inc ecx
    cmp eax, ecx
    mov dword ptr [ebp - 28], ecx
    jbe L33
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [edi + 20]
    mov edx, dword ptr [ecx]
    mov edx, dword ptr [eax + edx*4]
    mov edx, dword ptr [edx + 48]
    mov edx, dword ptr [eax + edx*4]
    mov edx, dword ptr [edx + 4]
    add ecx, 4
L32:
    mov ebx, dword ptr [ecx]
    mov ebx, dword ptr [eax + ebx*4]
    mov ebx, dword ptr [ebx + 48]
    mov ebx, dword ptr [eax + ebx*4]
    cmp edx, dword ptr [ebx + 4]
    jne L36
    inc dword ptr [ebp - 28]
    mov ebx, dword ptr [ebp - 28]
    add ecx, 4
    cmp ebx, dword ptr [esi + 12]
    jb L32
L33:
    and dword ptr [ebp - 8], 0
    cmp dword ptr [esi + 12], 0
    jbe L91
L34:
    mov edx, dword ptr [ebp - 8]
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + edx*4]
    mov eax, dword ptr [edi + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ecx + 48]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [eax + 4]
    mov ebx, dword ptr [edi + 16]
    mov edx, dword ptr [ebx + edx*4]
    test byte ptr [edx + 4], 2
    je L35
    cmp dword ptr [eax + 96], 0
    jne L35
    mov ecx, dword ptr [ecx + 96]
    mov edx, dword ptr [ebp - 8]
    mov dword ptr [eax + 96], ecx
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 100]
    mov dword ptr [eax + 100], ecx
L35:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 12]
    jb L34
    jmp L91
L36:
    mov eax, dword ptr [esi + 12]
    test eax, eax
    je L33
L37:
    and dword ptr [ebp - 20], 0
    test eax, eax
    jbe L41
L38:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [ebp - 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi + 20]
    mov edx, dword ptr [eax + ecx*4]
    cmp dword ptr [edx + 48], ecx
    mov dword ptr [ebp - 52], edx
    je L40
    mov ebx, dword ptr [edx]
    mov edx, dword ptr [edx + 48]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax]
    and eax, 0F1FFFFFFh
    or eax, ebx
    cmp ebx, eax
    je L39
    mov edx, dword ptr [ebp - 52]
    mov dword ptr [edx], eax
    mov dword ptr [ebp - 4], 1
L39:
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [eax + 48], ecx
L40:
    inc dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [esi + 12]
    jb L38
L41:
    mov ebx, dword ptr [ebp - 12]
    mov eax, ebx
    cmp eax, dword ptr [edi + 8]
    jae L44
L42:
    mov eax, dword ptr [edi + 20]
    mov ecx, dword ptr [eax + ebx*4]
    test ecx, ecx
    je L43
    push 1
    call sub_1006E068
L43:
    inc ebx
    cmp ebx, dword ptr [edi + 8]
    jb L42
L44:
    mov eax, dword ptr [ebp - 12]
    jmp L69
L45:
    cmp ecx, 030000000h
    jne L70
    cmp dword ptr [esi + 12], 0
    mov dword ptr [ebp - 20], ebx
    mov dword ptr [ebp - 8], ebx
    jbe L56
L46:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + ebx*4]
    mov ecx, dword ptr [esi + 8]
    mov edx, dword ptr [ecx + ebx*4]
    mov dword ptr [ebp - 44], eax
    mov eax, dword ptr [edi + 20]
    mov edx, dword ptr [eax + edx*4]
    mov edx, dword ptr [edx + 48]
    mov dword ptr [ebp - 56], edx
    mov edx, dword ptr [esi + 12]
    add ebx, edx
    mov ebx, dword ptr [ecx + ebx*4]
    mov ebx, dword ptr [eax + ebx*4]
    mov ebx, dword ptr [ebx + 48]
    mov dword ptr [ebp - 36], ebx
    mov ebx, dword ptr [ebp - 8]
    lea edx, [ebx + edx*2]
    mov ecx, dword ptr [ecx + edx*4]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ecx + 48]
    mov ecx, dword ptr [esi]
    and ecx, 0FFF00000h
    cmp ecx, 030000000h
    mov dword ptr [ebp - 48], edx
    jne L53
    mov ecx, dword ptr [ebp - 44]
    mov ecx, dword ptr [eax + ecx*4]
    mov dword ptr [ebp - 52], ecx
    mov ecx, dword ptr [ebp - 36]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [ecx]
    mov dword ptr [ebp - 40], ecx
    mov ecx, dword ptr [eax]
    or ecx, edx
    and ecx, 00E000000h
    mov ebx, 008000000h
    test ebx, ecx
    mov dword ptr [ebp - 28], eax
    jne L47
    mov ebx, 004000000h
    test ebx, ecx
    jne L47
    mov ebx, 002000000h
    test ebx, ecx
    je L48
L47:
    mov ecx, ebx
L48:
    mov ebx, dword ptr [ebp - 52]
    mov ebx, dword ptr [ebx]
    and ebx, 00E000000h
    or ecx, ebx
    mov ebx, 002000000h
    test ebx, ecx
    jne L49
    mov ebx, 004000000h
    test ebx, ecx
    jne L49
    mov ebx, 008000000h
    test ebx, ecx
    je L50
L49:
    mov ecx, ebx
L50:
    mov ebx, edx
    and ebx, 00E000000h
    cmp ecx, ebx
    je L52
    mov eax, dword ptr [ebp - 40]
    mov eax, dword ptr [eax + 4]
    mov ebx, dword ptr [edi + 16]
    mov eax, dword ptr [ebx + eax*4]
    test byte ptr [eax + 4], 2
    je L51
    mov eax, dword ptr [ebp - 40]
    xor ebx, ebx
    inc ebx
    cmp dword ptr [eax + 92], ebx
    jne L51
    and edx, 0F1FFFFFFh
    or edx, ecx
    mov dword ptr [eax], edx
    mov dword ptr [ebp - 4], ebx
L51:
    mov eax, dword ptr [ebp - 28]
L52:
    mov edx, dword ptr [eax]
    mov dword ptr [ebp - 52], edx
    and edx, 00E000000h
    cmp ecx, edx
    je L53
    mov edx, dword ptr [eax + 4]
    mov ebx, dword ptr [edi + 16]
    mov edx, dword ptr [ebx + edx*4]
    test byte ptr [edx + 4], 2
    je L53
    xor ebx, ebx
    inc ebx
    cmp dword ptr [eax + 92], ebx
    jne L53
    mov edx, dword ptr [ebp - 52]
    and edx, 0F1FFFFFFh
    or edx, ecx
    mov dword ptr [eax], edx
    mov dword ptr [ebp - 4], ebx
L53:
    push dword ptr [ebp - 48]
    mov ebx, dword ptr [ebp - 44]
    push dword ptr [ebp - 36]
    mov ecx, edi
    push dword ptr [ebp - 56]
    push ebx
    push esi
    call sub_1008F6B2
    test eax, eax
    jl L103
    mov eax, dword ptr [edi + 20]
    lea ecx, [eax + ebx*4]
    mov edx, dword ptr [ecx]
    mov edx, dword ptr [edx + 48]
    cmp edx, ebx
    jne L54
    inc dword ptr [ebp - 20]
    jmp L55
L54:
    mov edx, dword ptr [eax + edx*4]
    cmp dword ptr [edx + 48], -1
    jne L55
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [ecx + 48]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [eax + 48], ecx
L55:
    mov ebx, dword ptr [ebp - 8]
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    mov dword ptr [ebp - 8], ebx
    jb L46
L56:
    mov eax, dword ptr [esi + 12]
    cmp dword ptr [ebp - 20], eax
    je L94
    cmp dword ptr [ebp - 20], 0
    jne L62
    xor ecx, ecx
    inc ecx
    cmp eax, ecx
    mov dword ptr [ebp - 28], ecx
    jbe L58
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [edi + 20]
    mov edx, dword ptr [ecx]
    mov edx, dword ptr [eax + edx*4]
    mov edx, dword ptr [edx + 48]
    mov edx, dword ptr [eax + edx*4]
    mov edx, dword ptr [edx + 4]
    add ecx, 4
L57:
    mov ebx, dword ptr [ecx]
    mov ebx, dword ptr [eax + ebx*4]
    mov ebx, dword ptr [ebx + 48]
    mov ebx, dword ptr [eax + ebx*4]
    cmp edx, dword ptr [ebx + 4]
    jne L61
    inc dword ptr [ebp - 28]
    mov ebx, dword ptr [ebp - 28]
    add ecx, 4
    cmp ebx, dword ptr [esi + 12]
    jb L57
L58:
    and dword ptr [ebp - 12], 0
    cmp dword ptr [esi + 12], 0
    jbe L91
L59:
    mov edx, dword ptr [ebp - 12]
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + edx*4]
    mov eax, dword ptr [edi + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ecx + 48]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [eax + 4]
    mov ebx, dword ptr [edi + 16]
    mov edx, dword ptr [ebx + edx*4]
    test byte ptr [edx + 4], 2
    je L60
    cmp dword ptr [eax + 96], 0
    jne L60
    mov ecx, dword ptr [ecx + 96]
    mov edx, dword ptr [ebp - 12]
    mov dword ptr [eax + 96], ecx
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [edi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 100]
    mov dword ptr [eax + 100], ecx
L60:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [esi + 12]
    jb L59
    jmp L91
L61:
    mov eax, dword ptr [esi + 12]
    test eax, eax
    je L58
L62:
    and dword ptr [ebp - 20], 0
    test eax, eax
    jbe L66
L63:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [ebp - 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi + 20]
    mov edx, dword ptr [eax + ecx*4]
    cmp dword ptr [edx + 48], ecx
    mov dword ptr [ebp - 56], edx
    je L65
    mov ebx, dword ptr [edx]
    mov edx, dword ptr [edx + 48]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax]
    and eax, 0F1FFFFFFh
    or eax, ebx
    cmp ebx, eax
    je L64
    mov edx, dword ptr [ebp - 56]
    mov dword ptr [edx], eax
    mov dword ptr [ebp - 4], 1
L64:
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [eax + 48], ecx
L65:
    inc dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [esi + 12]
    jb L63
L66:
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [edi + 8]
    mov ebx, eax
    jae L69
L67:
    mov ecx, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx + ebx*4]
    test ecx, ecx
    je L68
    push 1
    call sub_1006E341
    mov eax, dword ptr [ebp - 12]
L68:
    inc ebx
    cmp ebx, dword ptr [edi + 8]
    jb L67
L69:
    mov dword ptr [edi + 8], eax
    jmp L94
L70:
    cmp edx, 050000000h
    jne L73
    xor ebx, ebx
    inc ebx
    push ebx
    push esi
    mov ecx, edi
    call sub_10087C24
    test eax, eax
    jl L103
    cmp eax, ebx
    je L71
    mov dword ptr [ebp - 4], ebx
L71:
    mov ecx, dword ptr [esi + 16]
    mov edx, dword ptr [ecx]
    mov eax, dword ptr [edi + 20]
    mov ebx, dword ptr [eax + edx*4]
    cmp dword ptr [ebx + 48], edx
    je L94
    mov ebx, dword ptr [edi + 16]
    mov ecx, edx
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ecx + 48]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [eax + 4]
    mov edx, dword ptr [ebx + edx*4]
    test byte ptr [edx + 4], 2
    je L72
    cmp dword ptr [eax + 96], 0
    jne L72
    mov ecx, dword ptr [ecx + 96]
    mov dword ptr [eax + 96], ecx
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [edi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 100]
    mov dword ptr [eax + 100], ecx
L72:
    xor eax, eax
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi + 12], eax
    jmp L93
L73:
    cmp eax, 050100004h
    jne L94
    mov ecx, dword ptr [edi + 20]
    or dword ptr [ebp - 64], 0FFFFFFFFh
    or dword ptr [ebp - 68], 0FFFFFFFFh
    xor eax, eax
    inc eax
    mov dword ptr [ebp - 60], eax
    mov dword ptr [ebp - 72], eax
    mov eax, dword ptr [esi + 8]
    mov edx, dword ptr [eax]
    mov ebx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [eax + 12]
    mov eax, dword ptr [ecx + eax*4]
    mov edx, dword ptr [ecx + edx*4]
    mov dword ptr [ebp - 20], eax
    mov eax, dword ptr [ebx + 4]
    mov dword ptr [ebp - 28], edx
    mov edx, dword ptr [edi + 16]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 5], 1
    je L77
    cmp dword ptr [ebx + 8], -1
    jne L77
    fld qword ptr [ebx + 32]
    fcomp qword ptr [g_1019BE20]
    fnstsw ax
    test ah, 65
    jne L75
    mov eax, dword ptr [ebp - 28]
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 5], 1
    mov dword ptr [ebp - 68], 2
    je L78
    mov eax, dword ptr [ebp - 28]
    cmp dword ptr [eax + 8], -1
    jne L78
    fld qword ptr [eax + 32]
    fcomp qword ptr [g_1019BE20]
    fnstsw ax
    test ah, 65
    jne L76
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 5], 1
    je L78
    mov eax, dword ptr [ebp - 20]
    cmp dword ptr [eax + 8], -1
    jne L78
    mov edx, eax
    fld qword ptr [edx + 32]
    fld qword ptr [g_1019BE20]
    fucompp
    fnstsw ax
    test ah, 68
    jp L74
    mov dword ptr [ebp - 64], 1
    jmp L80
L74:
    fld qword ptr [edx + 32]
    fld qword ptr [g_1019BC88]
    fucompp
    fnstsw ax
    test ah, 68
    jp L78
    mov dword ptr [ebp - 64], 3
    jmp L80
L75:
    and dword ptr [ebp - 68], 0
L76:
    and dword ptr [ebp - 64], 0
    jmp L80
L77:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [ecx + eax*4]
    cmp dword ptr [eax + 92], 0
    jne L78
    and dword ptr [ebp - 68], 0
L78:
    mov eax, dword ptr [esi + 16]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [ecx + eax*4]
    cmp dword ptr [eax + 92], 0
    jne L79
    and dword ptr [ebp - 64], 0
L79:
    cmp dword ptr [ebp - 68], -1
    je L94
    cmp dword ptr [ebp - 64], -1
    je L94
L80:
    xor ebx, ebx
L81:
    mov eax, dword ptr [ebp + ebx - 72]
    sub eax, 0
    je L86
    dec eax
    je L84
    dec eax
    je L83
    dec eax
    jne L89
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax + 4]
L82:
    mov ecx, dword ptr [esi + 16]
    mov edx, dword ptr [edi + 20]
    mov ecx, dword ptr [ebx + ecx]
    mov ecx, dword ptr [edx + ecx*4]
    mov dword ptr [ecx + 48], eax
    jmp L89
L83:
    mov eax, dword ptr [esi + 8]
    mov eax, dword ptr [eax]
    jmp L82
L84:
    cmp dword ptr [ebp - 32], -1
    jne L85
    push ecx
    fld1
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push dword ptr [edi + 120]
    mov ecx, edi
    call sub_10086B53
    mov ecx, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov dword ptr [ebp - 32], eax
    mov dword ptr [ecx + 48], eax
L85:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [edi + 20]
    mov eax, dword ptr [ebx + eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp - 32]
    jmp L88
L86:
    cmp dword ptr [ebp - 16], -1
    jne L87
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push 0
    push 0
    push dword ptr [edi + 120]
    mov ecx, edi
    call sub_10086B8B
    mov ecx, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ecx + 48], eax
L87:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [edi + 20]
    mov eax, dword ptr [ebx + eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp - 16]
L88:
    mov dword ptr [eax + 48], ecx
L89:
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ebx + ecx]
    mov eax, dword ptr [edi + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [edi + 16]
    mov dword ptr [ebp - 56], ecx
    mov ecx, dword ptr [ecx + 48]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax + 4]
    mov ecx, dword ptr [edx + ecx*4]
    test byte ptr [ecx + 4], 2
    je L90
    cmp dword ptr [eax + 96], 0
    jne L90
    mov ecx, dword ptr [ebp - 56]
    mov ecx, dword ptr [ecx + 96]
    mov dword ptr [eax + 96], ecx
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ebx + ecx]
    mov edx, dword ptr [edi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 100]
    mov dword ptr [eax + 100], ecx
L90:
    add ebx, 4
    cmp ebx, 16
    jb L81
L91:
    xor eax, eax
    mov dword ptr [esi + 4], eax
    mov dword ptr [esi + 12], eax
L92:
    mov dword ptr [ebp - 4], 1
L93:
    mov dword ptr [esi], eax
L94:
    mov eax, dword ptr [esi + 12]
    xor ebx, ebx
    cmp eax, ebx
    je L100
    mov dword ptr [ebp - 20], ebx
    jbe L96
    mov ecx, dword ptr [esi + 16]
L95:
    mov edx, dword ptr [ecx]
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [eax]
    test dl, 64
    mov dword ptr [ebp - 44], edx
    jne L96
    mov eax, dword ptr [eax + 4]
    mov edx, dword ptr [edi + 16]
    mov eax, dword ptr [edx + eax*4]
    test dword ptr [eax + 4], 000011028h
    jne L96
    test byte ptr [ebp - 44], 4
    je L96
    test byte ptr [ebp - 44], 8
    je L96
    inc dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 20]
    add ecx, 4
    cmp eax, dword ptr [esi + 12]
    jb L95
L96:
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [esi + 12]
    jne L100
    mov eax, dword ptr [ebp - 16]
    cmp eax, -1
    jne L97
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [edi + 120]
    mov ecx, edi
    call sub_10086C81
    mov ecx, dword ptr [edi + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ecx + 48], eax
L97:
    xor ecx, ecx
    cmp dword ptr [esi + 12], ebx
    jbe L99
L98:
    mov edx, dword ptr [esi + 16]
    mov edx, dword ptr [edx + ecx*4]
    mov ebx, dword ptr [edi + 20]
    mov edx, dword ptr [ebx + edx*4]
    inc ecx
    mov dword ptr [edx + 48], eax
    cmp ecx, dword ptr [esi + 12]
    jb L98
    xor ebx, ebx
L99:
    mov dword ptr [esi], ebx
    mov dword ptr [esi + 4], ebx
    mov dword ptr [esi + 12], ebx
    mov dword ptr [ebp - 4], 1
L100:
    inc dword ptr [ebp - 24]
    mov eax, dword ptr [ebp - 24]
    cmp eax, dword ptr [edi + 12]
    jb L0
    cmp dword ptr [ebp - 4], 0
    jne L102
L101:
    xor eax, eax
    inc eax
    jmp L103
L102:
    mov ecx, edi
    call sub_1008BAC6
    xor eax, eax
L103:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_10093c67 ENDP
END
