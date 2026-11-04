.686
.MODEL FLAT, C
EXTRN sub_1006C782:PROC
EXTRN sub_1006C795:PROC
EXTRN sub_1006CD6A:PROC
EXTRN sub_1006E118:PROC
EXTRN sub_1006E2A5:PROC
EXTRN sub_1006EB62:PROC
EXTRN sub_1006EB88:PROC
EXTRN sub_1006EBD3:PROC
EXTRN sub_1006EBE9:PROC
EXTRN sub_1006EBF7:PROC
EXTRN sub_1006EC06:PROC
EXTRN sub_1006EC1D:PROC
EXTRN sub_1006EC3F:PROC
EXTRN sub_1006EC42:PROC
EXTRN sub_1006EC45:PROC
EXTRN sub_1006ECAC:PROC
EXTRN sub_1006ECBE:PROC
EXTRN sub_1006ECC1:PROC
EXTRN sub_1006ECD2:PROC
EXTRN sub_1006ECE2:PROC
EXTRN sub_1006ECED:PROC
EXTRN sub_1006ED05:PROC
EXTRN sub_1006ED07:PROC
EXTRN sub_1006ED14:PROC
EXTRN sub_1006ED4A:PROC
EXTRN sub_1006ED66:PROC
EXTRN sub_1006EDD7:PROC
EXTRN sub_1006EE13:PROC
EXTRN sub_1006EE60:PROC
EXTRN sub_1006EEA0:PROC
EXTRN sub_1006EEA4:PROC
EXTRN sub_1006EED8:PROC
EXTRN sub_1006EF16:PROC
EXTRN sub_1006EF8A:PROC
EXTRN sub_1006F014:PROC
EXTRN sub_1006F01C:PROC
EXTRN sub_1006F035:PROC
EXTRN sub_1006F040:PROC
EXTRN sub_1006F0A7:PROC
EXTRN sub_1006F0B5:PROC
EXTRN sub_1006F0FE:PROC
EXTRN sub_1006F112:PROC
EXTRN sub_1006F121:PROC
EXTRN sub_1006F128:PROC
EXTRN sub_1006F132:PROC
EXTRN sub_1006F133:PROC
EXTRN sub_1006F148:PROC
EXTRN sub_1006F165:PROC
EXTRN sub_1006F167:PROC
EXTRN sub_1006F170:PROC
EXTRN sub_1006F175:PROC
EXTRN sub_1006F1B6:PROC
EXTRN sub_1006F1DE:PROC
EXTRN sub_1006F1F9:PROC
EXTRN sub_1006F220:PROC
EXTRN sub_1006F232:PROC
EXTRN sub_1006F236:PROC
EXTRN sub_1006F23E:PROC
EXTRN sub_1006F249:PROC
EXTRN sub_1006F257:PROC
EXTRN sub_1006F2AE:PROC
EXTRN sub_1006F2B8:PROC
EXTRN sub_1006F2D8:PROC
EXTRN sub_1006F2EA:PROC
EXTRN sub_1006F2EE:PROC
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
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    mov mov edx, dword ptr [ebp + 12]
    push push ebx
    mov mov eax, edx
    and and eax, 0FFF00000h
    cmp cmp eax, 020500000h
    push push esi
    mov mov ebx, ecx
    push push edi
    mov mov dword ptr [ebp - 8], ebx
    jne L1
    test test byte ptr [ebp + 28], 4
    je L3
    mov mov eax, edx
    and and eax, 0FFFFFh
    mov mov dword ptr [ebp + 12], 0
    jbe L2
    mov mov esi, dword ptr [ebp + 20]
    mov mov edi, dword ptr [ebp + 24]
    sub sub edi, esi
    mov mov dword ptr [ebp - 4], edi
    jmp L0
    mov mov edi, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [esi]
    cmp cmp ecx, dword ptr [edi + esi]
    jne L5
    mov mov edi, dword ptr [ebx + 8]
    mov mov edi, dword ptr [edi + 20]
    mov mov ecx, dword ptr [edi + ecx*4]
    test test byte ptr [ecx], 1
    je L6
    inc inc dword ptr [ebp + 12]
    add add esi, 4
    cmp cmp dword ptr [ebp + 12], eax
    jb L4
    cmp cmp dword ptr [ebp + 12], eax
    jne L8
    and and eax, 0FFFFFh
    or or eax, 010000000h
    mov mov edx, eax
    cmp cmp edx, 050000001h
    jne L10
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push 020500001h
    jmp L12
    cmp cmp edx, 050000002h
    jne L13
    mov mov eax, dword ptr [ebx + 8]
    test test byte ptr [eax + 108], 32
    jne L14
    mov mov esi, dword ptr [ebp + 28]
    or or eax, -1
L5:
    and and esi, 64
    push push esi
    push push dword ptr [ebp + 24]
    lea lea edi, [ebp - 16]
    push push dword ptr [ebp + 20]
    stosd stosd dword ptr es:[edi], eax
L6:
    stosd stosd dword ptr es:[edi], eax
    lea lea eax, [ebp - 16]
    push push eax
    mov mov edi, 020500001h
    push push edi
    push push dword ptr [ebp + 8]
    mov mov ecx, ebx
    call L7
L7:
    test test eax, eax
    jl sub_1006EBF7
    mov mov eax, dword ptr [ebp + 24]
    push push esi
L8:
    add add eax, 4
    push push eax
    mov mov eax, dword ptr [ebp + 20]
    add add eax, 4
    push push eax
    lea lea eax, [ebp - 12]
    push push eax
    push push edi
    push push dword ptr [ebp + 8]
    mov mov ecx, ebx
    call L9
L9:
    test test eax, eax
    jl sub_1006EC1D
    push push dword ptr [ebp + 28]
    lea lea eax, [ebp - 12]
    push push eax
    lea lea eax, [ebp - 16]
    push push eax
    push push dword ptr [ebp + 16]
    push push 020400001h
    push push dword ptr [ebp + 8]
    mov mov ecx, ebx
    call L11
L11:
    test test eax, eax
    jl sub_1006EC42
    jmp sub_1006EC45
    mov mov ecx, dword ptr [ebx + 8]
    test test byte ptr [ecx + 108], 080h
    je L31
    mov mov eax, edx
    and and eax, 0FFF00000h
    cmp cmp eax, 020000000h
    mov mov dword ptr [ebp - 12], eax
    je L18
    cmp cmp eax, 020100000h
    je L19
    cmp cmp eax, 020200000h
    je L20
    cmp cmp eax, 020300000h
    jne L32
    and and edx, 0FFFFFh
    mov mov esi, edx
    mov mov eax, esi
    shl shl eax, 4
    push push eax
    call sub_100F79E4
    pop pop ecx
    mov mov ecx, eax
    test test ecx, ecx
    mov mov dword ptr [ebp - 8], ecx
    je L51
    mov mov edx, esi
    xor xor eax, eax
    shl shl edx, 2
    mov mov dword ptr [ebp + eax*4 - 32], ecx
    inc inc eax
    add add ecx, edx
    cmp cmp eax, 4
    jb L21
    test test esi, esi
    jbe L23
    mov mov eax, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebp + 20]
    mov mov edx, dword ptr [ebp + 24]
    sub sub ecx, eax
    mov mov dword ptr [ebp + 12], ecx
    mov mov ecx, dword ptr [ebp - 20]
    sub sub edx, eax
    sub sub ecx, eax
    mov mov dword ptr [ebp - 4], esi
    mov mov edi, dword ptr [ebp - 12]
    cmp cmp edi, 020000000h
    je L26
    cmp cmp edi, 020100000h
    je L25
    cmp cmp edi, 020200000h
    je L24
L13:
    cmp cmp edi, 020300000h
    jne L28
    mov mov edi, dword ptr [ebx + 32]
    mov mov dword ptr [eax], edi
L14:
    mov mov edi, dword ptr [ebx + 36]
    jmp L29
    mov mov edi, dword ptr [ebx + 36]
    mov mov dword ptr [eax], edi
    mov mov edi, dword ptr [ebx + 32]
    jmp L30
    mov mov edi, dword ptr [ebp + 12]
    mov mov edi, dword ptr [edi + eax]
    mov mov dword ptr [eax], edi
    mov mov edi, dword ptr [edx + eax]
    jmp L31
    mov mov edi, dword ptr [edx + eax]
    mov mov dword ptr [eax], edi
    mov mov edi, dword ptr [ebp + 12]
    mov mov edi, dword ptr [edi + eax]
    mov mov dword ptr [ecx + eax], edi
    add add eax, 4
    dec dec dword ptr [ebp - 4]
    jne L27
    push push esi
    push push dword ptr [ebp - 32]
    mov mov ecx, ebx
    call sub_1006C782
    test test eax, eax
    jl L33
    push push esi
    push push dword ptr [ebp - 28]
    mov mov ecx, ebx
    call sub_1006C795
    test test eax, eax
    jl L34
    mov mov eax, dword ptr [ebp + 28]
    and and eax, 64
    push push eax
    push push 0
    push push dword ptr [ebp + 24]
    mov mov edi, esi
    push push dword ptr [ebp - 32]
    mov mov dword ptr [ebp + 12], eax
    and and edi, 0FFFFFh
    mov mov eax, edi
    or or eax, 010100000h
    push push eax
    push push dword ptr [ebp + 8]
    mov mov ecx, ebx
    call L15
L15:
    test test eax, eax
    jl L35
    push push dword ptr [ebp + 12]
    mov mov eax, edi
    push push dword ptr [ebp - 32]
    or or eax, 020400000h
    push push dword ptr [ebp + 20]
    mov mov ecx, ebx
    push push dword ptr [ebp - 28]
    push push eax
    push push dword ptr [ebp + 8]
    call L16
L16:
    test test eax, eax
    jl L36
    push push dword ptr [ebp + 28]
    mov mov eax, dword ptr [ebp - 8]
    lea lea eax, [eax + esi*8]
    push push eax
    push push dword ptr [ebp - 28]
    or or edi, 030000000h
    push push dword ptr [ebp + 16]
    mov mov ecx, ebx
    push push edi
    push push dword ptr [ebp + 8]
    call L17
L17:
    test test eax, eax
    jl L37
    xor xor esi, esi
    push push dword ptr [ebp - 8]
    call sub_100F7B1D
    pop pop ecx
    mov mov eax, esi
    jmp sub_1006EDD7
    mov mov esi, eax
    jmp L38
    push push -1
    push push -1
    push push edx
    call sub_10086467
    mov mov ebx, dword ptr [ebx + 8]
    cmp cmp eax, dword ptr [ebx + 12]
    mov mov dword ptr [ebp - 4], eax
    jae L39
    mov mov ecx, dword ptr [ebx + 24]
    mov mov ebx, dword ptr [ecx + eax*4]
    jmp L40
    xor xor ebx, ebx
    xor xor eax, eax
    cmp cmp ebx, eax
    je sub_1006EC06
    cmp cmp dword ptr [ebx + 12], eax
    jne L41
    cmp cmp dword ptr [ebx + 4], eax
    jne L42
    mov mov dword ptr [ebx], eax
    jmp sub_1006EE13
    xor xor esi, esi
    push push esi
    push push esi
    mov mov ecx, ebx
    call sub_10085E7B
    push push esi
    push push esi
    mov mov ecx, ebx
    mov mov dword ptr [ebp + 12], eax
    call sub_100856E4
    mov mov edx, dword ptr [ebx + 4]
    mov mov edi, dword ptr [ebx + 8]
    mov mov esi, dword ptr [ebp + 20]
    mov mov ecx, eax
    shl shl ecx, 2
    mov mov dword ptr [ebp - 12], ecx
    sub sub edx, eax
    mov mov eax, ecx
L21:
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebx + 8]
    mov mov esi, dword ptr [ebp + 24]
    mov mov ecx, edx
    add add edi, eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov esi, dword ptr [ebp - 8]
    xor xor edx, edx
    cmp cmp dword ptr [ebx + 4], edx
L22:
    jbe L44
    mov mov eax, dword ptr [ebx + 8]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [esi + 8]
    cmp cmp eax, dword ptr [ecx + 8]
    jae L43
    mov mov ecx, dword ptr [ecx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    jmp L45
    xor xor eax, eax
    test test eax, eax
    je L46
    inc inc dword ptr [eax + 92]
    inc inc edx
    cmp cmp edx, dword ptr [ebx + 4]
    jb L44
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 12], edi
    mov mov dword ptr [ebp + 24], edi
    jbe L54
    mov mov eax, dword ptr [ebp + 16]
    and and dword ptr [ebp + 20], 0
    test test eax, eax
    je L47
    mov mov eax, dword ptr [eax + edi*4]
    cmp cmp eax, -1
    je L49
    mov mov ecx, dword ptr [esi + 8]
    cmp cmp eax, dword ptr [ecx + 8]
    jae L48
    mov mov ecx, dword ptr [ecx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    jmp L50
    xor xor eax, eax
    test test eax, eax
    mov mov dword ptr [ebp + 20], eax
    je sub_1006ECAC
    mov mov ecx, dword ptr [esi + 8]
    fldz fldz
    push push ecx
    push push ecx
L24:
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
L26:
    push push dword ptr [ecx + 088h]
    call sub_10086501
L27:
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 12], eax
    je sub_1006ECED
    mov mov ecx, dword ptr [esi + 8]
    cmp cmp eax, dword ptr [ecx + 8]
    jae L52
    mov mov ecx, dword ptr [ecx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    jmp L53
    xor xor ecx, ecx
    test test ecx, ecx
    je sub_1006ED07
    test test byte ptr [ebp + 31], 14
    mov mov edx, dword ptr [ebp + 28]
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + 72], edx
    mov mov dword ptr [ecx + 16], edi
    jne L55
    mov mov edx, dword ptr [esi + 100]
    or or edx, dword ptr [ebp + 28]
    mov mov edi, dword ptr [ebp + 24]
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [esi + 48]
    mov mov dword ptr [ecx + 20], edx
    mov mov edx, dword ptr [esi + 52]
    mov mov dword ptr [ecx + 24], edx
    mov mov edx, edi
    mov mov edi, dword ptr [ebx + 16]
    shl shl edx, 2
    cmp cmp dword ptr [ebp + 16], 0
    mov mov dword ptr [edx + edi], eax
    je sub_1006EB62
    mov mov edi, dword ptr [ebp + 16]
    mov mov dword ptr [edx + edi], eax
    mov mov eax, dword ptr [ebp + 20]
    test test eax, eax
    je sub_1006EB88
    mov mov edi, dword ptr [eax + 48]
    mov mov dword ptr [ecx + 48], edi
    mov mov edi, dword ptr [eax + 96]
    mov mov dword ptr [ecx + 96], edi
    mov mov eax, dword ptr [eax + 100]
    mov mov dword ptr [ecx + 100], eax
    mov mov eax, dword ptr [ecx + 48]
    cmp cmp eax, -1
    je sub_1006EBD3
    mov mov eax, dword ptr [ebx + 16]
    mov mov edx, dword ptr [edx + eax]
    mov mov eax, dword ptr [ecx + 48]
    mov mov edi, dword ptr [esi + 24]
    mov mov dword ptr [edi + eax*4], edx
    xor xor eax, eax
    cmp cmp dword ptr [ecx + 96], eax
    jne sub_1006EBE9
    push push dword ptr [ebp - 12]
    push push 01010F7F8h
    push push eax
    push push eax
    push push esi
    call sub_1006E118
    add add esp, 20
    mov mov edi, dword ptr [ebp + 24]
    inc inc edi
    cmp cmp edi, dword ptr [ebp + 12]
    mov mov dword ptr [ebp + 24], edi
    jb L54
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 12], edi
    jbe sub_1006EC3F
    mov mov eax, dword ptr [ebx + 16]
    push push 0
    push push dword ptr [eax + edi*4]
    mov mov ecx, esi
    call sub_1006CD6A
    inc inc edi
    cmp cmp edi, dword ptr [ebp + 12]
    jb sub_1006EC3F
    test test byte ptr [esi + 20], 4
    jne sub_1006ED05
    mov mov ecx, ebx
    call sub_10085ABB
    test test eax, eax
    jne sub_1006ED14
    xor xor edi, edi
    cmp cmp edi, dword ptr [ebp + 12]
    jae sub_1006ECC1
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [esi + 8]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    test test byte ptr [ecx], 64
    jne sub_1006ECD2
    lea lea ecx, [ebp - 16]
    push push ecx
    push push eax
    mov mov ecx, esi
    call L22
    test test eax, eax
    jl sub_1006ECE2
    inc inc edi
    cmp cmp edi, dword ptr [ebp + 12]
    jb sub_1006ECBE
    cmp cmp edi, dword ptr [ebp + 12]
    jne sub_1006ED4A
    mov mov eax, dword ptr [ebp + 12]
    and and eax, 0FFFFFh
    or or eax, 010000000h
    mov mov dword ptr [ebx], eax
    mov mov eax, dword ptr [ebx + 12]
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 12], edi
    mov mov dword ptr [ebx + 4], eax
    jbe sub_1006ED66
    mov mov ecx, dword ptr [esi + 8]
    mov mov eax, dword ptr [ebx + 16]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov edx, dword ptr [ecx + 20]
    mov mov eax, dword ptr [edx + eax*4]
    fld fld qword ptr [eax + 32]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push dword ptr [ecx + 120]
    call sub_1008666D
    mov mov ecx, dword ptr [ebx + 8]
    mov mov dword ptr [ecx + edi*4], eax
    mov mov eax, dword ptr [ebx + 8]
    cmp cmp dword ptr [eax + edi*4], -1
    je sub_1006EE60
    inc inc edi
    cmp cmp edi, dword ptr [ebp + 12]
    jb sub_1006ED66
    mov mov eax, dword ptr [ebx]
    and and eax, 0FFF00000h
    mov mov ecx, 020500000h
    cmp cmp eax, ecx
    ja sub_1006EF16
    je sub_1006F014
    cmp cmp eax, 010000000h
    je sub_1006EED8
    cmp cmp eax, 010100000h
    je sub_1006EEA0
    cmp cmp eax, 020000000h
    je sub_1006F035
    cmp cmp eax, 020100000h
    je sub_1006F040
    cmp cmp eax, 020400000h
    jne sub_1006F0A7
    and and dword ptr [ebp + 28], 0
    cmp cmp dword ptr [ebp + 12], 0
    jbe sub_1006F0B5
    mov mov ecx, dword ptr [ebp + 28]
    mov mov eax, dword ptr [esi + 8]
    mov mov eax, dword ptr [eax + 20]
    mov mov edx, dword ptr [ebx + 16]
    mov mov edi, dword ptr [ebx + 12]
    add add edi, dword ptr [ebp + 28]
    shl shl ecx, 2
    mov mov edx, dword ptr [ecx + edx]
L40:
    mov mov edx, dword ptr [eax + edx*4]
    mov mov dword ptr [ebp + 20], edx
    mov mov edx, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [ecx + edx]
    mov mov edi, dword ptr [edx + edi*4]
    mov mov edi, dword ptr [eax + edi*4]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [edi]
    and and ecx, dword ptr [eax]
    mov mov eax, dword ptr [ebp + 20]
    and and ecx, 2
    or or dword ptr [eax], ecx
    inc inc dword ptr [ebp + 28]
    mov mov eax, dword ptr [ebp + 28]
    cmp cmp eax, dword ptr [ebp + 12]
    jb sub_1006EEA4
L41:
    jmp sub_1006F0FE
L42:
    push push 01010F7D0h
    push push 0
    push push 0
    push push esi
    call sub_1006E2A5
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_1006F128
    mov mov eax, 08007000Eh
    jmp sub_1006F132
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 12], eax
    mov mov dword ptr [ebp + 28], eax
    jbe sub_1006F132
    mov mov ecx, dword ptr [ebx + 16]
    mov mov edi, dword ptr [ebx + 8]
    mov mov edx, eax
    mov mov eax, dword ptr [esi + 8]
    mov mov eax, dword ptr [eax + 20]
    shl shl edx, 2
    mov mov ecx, dword ptr [edx + ecx]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edx + edi]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [eax]
    and and eax, 2
    or or dword ptr [ecx], eax
    mov mov eax, dword ptr [ebp + 28]
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 12]
    mov mov dword ptr [ebp + 28], eax
    jb sub_1006EF8A
    jmp sub_1006F167
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 12], eax
    mov mov dword ptr [ebp + 28], eax
    jbe sub_1006F175
    mov mov edi, dword ptr [ebx + 8]
    mov mov edx, eax
    mov mov eax, dword ptr [esi + 8]
    mov mov ecx, dword ptr [eax + 20]
    mov mov eax, dword ptr [ebx + 16]
    shl shl edx, 2
    mov mov eax, dword ptr [edx + eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [edx + edi]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov dword ptr [eax + 52], edx
    mov mov edx, dword ptr [ecx]
    or or dword ptr [eax], edx
    fld fld qword ptr [ecx + 32]
    fstp fstp qword ptr [eax + 32]
    fld fld qword ptr [ecx + 40]
    fstp fstp qword ptr [eax + 40]
    mov mov eax, dword ptr [ebp + 28]
    inc inc eax
    cmp cmp eax, dword ptr [ebp + 12]
    mov mov dword ptr [ebp + 28], eax
    jb sub_1006F01C
    jmp sub_1006F1B6
    cmp cmp eax, 020700000h
    je sub_1006F165
    cmp cmp eax, 020800000h
L44:
    je sub_1006F170
    cmp cmp eax, 030000000h
    je sub_1006F112
    cmp cmp eax, 050000000h
    jne sub_1006F1DE
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [esi + 8]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    and and dword ptr [ebp + 28], 0
    cmp cmp dword ptr [ebp + 12], 0
    mov mov dword ptr [ebp + 24], eax
    jbe sub_1006F121
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [esi + 8]
    mov mov edx, dword ptr [ebx + 12]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov dword ptr [ebp + 20], eax
    lea lea edi, [eax + edx*4]
    mov mov eax, dword ptr [ebp + 20]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [edi]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov eax, dword ptr [eax]
    and and eax, dword ptr [edx]
    test test al, 2
    je sub_1006F148
    inc inc dword ptr [ebp + 28]
    mov mov eax, dword ptr [ebp + 28]
    add add dword ptr [ebp + 20], 4
    add add edi, 4
    cmp cmp eax, dword ptr [ebp + 12]
    jb sub_1006F133
    mov mov eax, dword ptr [ebp + 28]
    cmp cmp eax, dword ptr [ebp + 12]
    jne sub_1006F23E
    mov mov eax, dword ptr [ebp + 24]
    or or dword ptr [eax], 2
    jmp sub_1006F249
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 12], edi
    mov mov dword ptr [ebp + 20], edi
    jbe sub_1006F257
    mov mov eax, dword ptr [esi + 8]
    mov mov eax, dword ptr [eax + 20]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ecx + edi*4]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ebx + 8]
    mov mov dword ptr [ebp + 28], ecx
    mov mov ecx, dword ptr [ebx + 12]
    add add edi, ecx
    mov mov edi, dword ptr [edx + edi*4]
    mov mov edi, dword ptr [eax + edi*4]
    mov mov dword ptr [ebp + 24], edi
    mov mov edi, dword ptr [ebp + 20]
    lea lea ecx, [edi + ecx*2]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [ebp + 24]
    and and eax, dword ptr [ecx]
    test test al, 1
    je sub_1006F220
    mov mov eax, dword ptr [ebp + 28]
    or or dword ptr [eax], 23
    jmp sub_1006F232
    test test al, 2
    je sub_1006F236
    mov mov eax, dword ptr [ebp + 28]
    or or dword ptr [eax], 2
    inc inc edi
    cmp cmp edi, dword ptr [ebp + 12]
    mov mov dword ptr [ebp + 20], edi
    jb sub_1006F1F9
    jmp sub_1006F2AE
    and and dword ptr [ebp + 28], 0
    cmp cmp dword ptr [ebp + 12], 0
    jbe sub_1006F2B8
    mov mov edx, dword ptr [ebp + 28]
    mov mov eax, dword ptr [esi + 8]
    mov mov eax, dword ptr [eax + 20]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov edi, dword ptr [ebx + 12]
    add add edi, dword ptr [ebp + 28]
    shl shl edx, 2
    mov mov ecx, dword ptr [edx + ecx]
    mov mov ecx, dword ptr [eax + ecx*4]
L53:
    mov mov dword ptr [ebp + 20], ecx
    mov mov ecx, dword ptr [ebx + 8]
    mov mov edx, dword ptr [edx + ecx]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ecx + edi*4]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax]
    and and eax, dword ptr [edx]
    test test al, 1
    je sub_1006F2D8
    mov mov eax, dword ptr [ebp + 20]
    or or dword ptr [eax], 23
    jmp sub_1006F2EA
    test test al, 2
    je sub_1006F2EE
    mov mov eax, dword ptr [ebp + 20]
    or or dword ptr [eax], 2
    inc inc dword ptr [ebp + 28]
    mov mov eax, dword ptr [ebp + 28]
    cmp cmp eax, dword ptr [ebp + 12]
    jb sub_1006F2B8
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [ebx + 60], eax
    mov mov eax, dword ptr [esi + 56]
    mov mov dword ptr [ebx + 56], eax
    xor xor eax, eax
L55:
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 24
FUN_1006e308 ENDP
END
