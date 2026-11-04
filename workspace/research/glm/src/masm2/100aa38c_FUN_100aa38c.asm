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
EXTRN sub_100AABA7:PROC
EXTRN sub_100AABB5:PROC
EXTRN sub_100AABBD:PROC
EXTRN sub_100AAC11:PROC
EXTRN sub_100AAC27:PROC
EXTRN sub_100AAC31:PROC
EXTRN sub_100AAC90:PROC
EXTRN sub_100AAC9D:PROC
EXTRN sub_100AACA4:PROC
EXTRN sub_100AACA5:PROC
EXTRN sub_100AACAB:PROC
EXTRN sub_100AACF9:PROC
EXTRN sub_100AAD0F:PROC
EXTRN sub_100AAD19:PROC
EXTRN sub_100AAD52:PROC
EXTRN sub_100AAD5F:PROC
EXTRN sub_100AADA8:PROC
EXTRN sub_100AADC1:PROC
EXTRN sub_100AADC5:PROC
EXTRN sub_100AADC7:PROC
EXTRN sub_100AADDA:PROC
EXTRN sub_100AADE5:PROC
EXTRN sub_100AAE28:PROC
EXTRN sub_100AAE57:PROC
EXTRN sub_100AAE72:PROC
EXTRN sub_100AAE88:PROC
EXTRN sub_100AAE8D:PROC
EXTRN sub_100AAE8E:PROC
EXTRN sub_100AAE92:PROC
EXTRN sub_100AAE98:PROC
EXTRN sub_100AAEA3:PROC
EXTRN sub_100AAEA8:PROC
EXTRN sub_100AAEAA:PROC
EXTRN sub_100AAEAC:PROC
EXTRN sub_100AAEDF:PROC
EXTRN sub_100AAEEB:PROC
EXTRN sub_100AAF06:PROC
EXTRN sub_100AAF0D:PROC
EXTRN sub_100AAF2E:PROC
EXTRN sub_100AAF6B:PROC
EXTRN sub_100AAF9B:PROC
EXTRN sub_100AAFAB:PROC
EXTRN sub_100AAFB2:PROC
EXTRN sub_100AB02E:PROC
EXTRN sub_100AB13A:PROC
EXTRN sub_100AB14D:PROC
EXTRN sub_100AB150:PROC
EXTRN sub_100AB155:PROC
EXTRN sub_100AB158:PROC
EXTRN sub_100AB179:PROC
EXTRN sub_100AB185:PROC
EXTRN sub_100AB1A2:PROC
EXTRN sub_100AB23E:PROC
EXTRN sub_100AB24D:PROC
EXTRN sub_100AB276:PROC
EXTRN sub_100AB27C:PROC
EXTRN sub_100AB282:PROC
EXTRN sub_100AB287:PROC
EXTRN sub_100AB2BA:PROC
.CODE
FUN_100aa38c PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 72
    mov mov edx, dword ptr [ebp + 20]
    push push ebx
    push push esi
    push push edi
    xor xor eax, eax
    and and dword ptr [ebp - 4], eax
    mov mov ebx, ecx
    push push 6
    pop pop ecx
    lea lea edi, [ebp - 72]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebp + 28]
    lea lea esi, [edx + eax]
    test test esi, esi
    jbe L9
    mov mov edi, dword ptr [ebp + 24]
    mov mov eax, edx
    shl shl eax, 2
    sub sub edi, eax
    mov mov dword ptr [ebp - 12], edi
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, edx
    jae L0
    mov mov ecx, dword ptr [ebp + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    jmp L1
    mov mov eax, dword ptr [edi]
    test test eax, eax
    je L11
    mov mov ecx, dword ptr [eax]
    and and ecx, 0FFF00000h
    je L12
    cmp cmp dword ptr [eax + 36], 1
    je L13
    cmp cmp ecx, 060000000h
    je L2
    cmp cmp ecx, 060500000h
    je L3
    cmp cmp ecx, 060A00000h
    je L4
    cmp cmp ecx, 060F00000h
    je L5
    cmp cmp ecx, 011000000h
    je L6
    cmp cmp ecx, 072C00000h
    je L7
    cmp cmp ecx, 072D00000h
    jne L8
    cmp cmp dword ptr [ebp - 4], edx
    jb L14
    mov mov ecx, dword ptr [eax + 4]
    and and dword ptr [ebp - 8], 0
    test test ecx, ecx
    mov mov dword ptr [ebp - 16], ecx
    jbe L16
    mov mov edi, dword ptr [eax + 8]
    mov mov ecx, dword ptr [edi]
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebx + 080h]
    cmp cmp dword ptr [eax + 4], ecx
    jne L17
    movzx movzx ecx, byte ptr [eax + 109]
    cmp cmp ecx, 5
    ja L20
    cmp cmp byte ptr [eax + 108], 3
    jne L18
    mov mov edx, dword ptr [ebp + 20]
    cmp cmp dword ptr [ebp - 4], edx
    lea lea ecx, [ebp + ecx*4 - 72]
    jb L19
    mov mov edx, dword ptr [eax + 16]
    inc inc edx
    cmp cmp edx, dword ptr [ecx]
    jbe L21
    cmp cmp dword ptr [eax + 60], 0
    je L22
    mov mov dword ptr [ecx], edx
    jmp L23
    mov mov eax, dword ptr [eax + 16]
    inc inc eax
    cmp cmp eax, dword ptr [ecx]
    jbe L24
    mov mov dword ptr [ecx], eax
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    add add edi, 4
    cmp cmp eax, dword ptr [ebp - 16]
    jb L15
    mov mov edx, dword ptr [ebp + 20]
L2:
    mov mov edi, dword ptr [ebp - 12]
    inc inc dword ptr [ebp - 4]
    add add edi, 4
    cmp cmp dword ptr [ebp - 4], esi
    mov mov dword ptr [ebp - 12], edi
    jb L10
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebx + 60], 0
    jbe L28
    mov mov eax, dword ptr [ebp + 8]
    lea lea edi, [ebp - 72]
    mov mov ecx, edi
    sub sub eax, ecx
    mov mov dword ptr [ebp - 16], eax
    mov mov esi, dword ptr [edi]
    test test esi, esi
    je L29
    push push 116
    call sub_10085967
    test test eax, eax
    je L25
    mov mov ecx, eax
    call sub_100854D7
    jmp L26
    xor xor eax, eax
    test test eax, eax
    mov mov dword ptr [ebp - 8], eax
    je sub_100AAC90
    push push 0
    push push esi
    push push esi
    and and esi, 0FFFFFh
    or or esi, 072100000h
    push push esi
L13:
    mov mov ecx, eax
    call sub_100859E4
    test test eax, eax
    jl L31
    xor xor esi, esi
    cmp cmp dword ptr [edi], esi
    jbe L27
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push esi
    push push dword ptr [ebp - 4]
    mov mov ecx, ebx
    push push dword ptr [ebx + 088h]
    call sub_100862E4
    cmp cmp eax, -1
    mov mov dword ptr [ebp + esi*4 - 32], eax
    je L32
    mov mov ecx, dword ptr [ebp - 8]
L14:
    mov mov ecx, dword ptr [ecx + 16]
    mov mov dword ptr [ecx + esi*4], eax
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp - 4]
    and and dword ptr [eax + 60], 0
    or or dword ptr [eax + 56], -1
    shl shl ecx, 8
    or or ecx, 3
    inc inc esi
    cmp cmp esi, dword ptr [edi]
    mov mov dword ptr [eax + 108], ecx
    jb L27
    mov mov esi, dword ptr [edi]
L20:
    lea lea eax, [ebp - 32]
    push push eax
    push push esi
    push push dword ptr [ebp - 4]
    mov mov ecx, ebx
    push push 3
L21:
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
L22:
    call sub_100AA11F
    test test eax, eax
    jl L34
    lea lea eax, [ebp - 32]
    push push eax
    push push esi
    push push dword ptr [ebp - 4]
    mov mov ecx, ebx
    push push 3
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    call sub_100AA295
    test test eax, eax
    jl L35
    xor xor esi, esi
    cmp cmp dword ptr [edi], esi
    jbe L33
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push esi
    push push dword ptr [ebp - 4]
    mov mov ecx, ebx
    push push dword ptr [ebx + 080h]
    call sub_10086377
    cmp cmp eax, -1
    mov mov dword ptr [ebp + esi*4 - 48], eax
    je L36
    mov mov ecx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [ebp - 4]
    and and dword ptr [ecx + 60], 0
    shl shl edx, 8
    or or edx, 3
    mov mov dword ptr [ecx + 108], edx
    mov mov ecx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov dword ptr [ecx + esi*4], eax
    inc inc esi
    cmp cmp esi, dword ptr [edi]
    jb L33
    mov mov eax, dword ptr [ebp - 16]
    lea lea esi, [eax + edi]
    cmp cmp dword ptr [esi], 0
    jne L37
    push push dword ptr [ebp - 8]
    mov mov ecx, ebx
    call sub_100862AA
    test test eax, eax
    jl sub_100AADA8
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [esi], eax
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    add add edi, 4
    cmp cmp eax, dword ptr [ebx + 60]
    jb L30
    mov mov dword ptr [ebp + 24], 1
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp + 20], 0
    jbe sub_100AACA5
    mov mov eax, dword ptr [ebp + 20]
    shl shl eax, 2
    mov mov ecx, eax
    mov mov eax, dword ptr [ebp + 16]
    sub sub eax, ecx
    mov mov dword ptr [ebp - 8], eax
    jmp L40
    mov mov esi, eax
    jmp L38
    mov mov esi, 08007000Eh
    jmp L39
    mov mov eax, dword ptr [ebx + 0C8h]
    and and eax, 0FFh
    push push eax
    push push 010117078h
    push push 011A4h
    push push 0
    push push ebx
    call sub_1008B3A8
    add add esp, 20
    mov mov esi, 080004005h
    mov mov ecx, dword ptr [ebp - 8]
    push push 1
    call sub_1006C71D
    mov mov eax, esi
    jmp sub_100AAE28
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp ecx, 0200h
    jae sub_100AAD52
    cmp cmp ecx, dword ptr [ebp + 20]
    jae L41
    mov mov eax, dword ptr [ebp + 16]
    mov mov edi, dword ptr [eax + ecx*4]
    jmp L42
    mov mov edi, dword ptr [eax]
    test test edi, edi
    je sub_100AAD0F
    cmp cmp dword ptr [edi + 36], 1
    je sub_100AAD19
    mov mov eax, dword ptr [edi]
    mov mov ecx, eax
    and and ecx, 0FFF00000h
    cmp cmp ecx, 060000000h
    je L43
    cmp cmp ecx, 060500000h
    je L44
    cmp cmp ecx, 060A00000h
    je L45
    cmp cmp ecx, 060F00000h
    je L46
    cmp cmp ecx, 011000000h
    je L47
    cmp cmp ecx, 072C00000h
    je L48
    cmp cmp ecx, 072D00000h
    jne sub_100AAD5F
    and and eax, 0FFFFFh
    cmp cmp ecx, 011000000h
    mov mov esi, eax
    jne L49
    xor xor esi, esi
    test test esi, esi
    mov mov ecx, dword ptr [edi + 8]
    mov mov eax, dword ptr [ebx + 20]
    mov mov edx, dword ptr [ecx + esi*4]
    mov mov edx, dword ptr [eax + edx*4]
    je L50
    mov mov ecx, dword ptr [ecx]
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [edx + 4]
    cmp cmp eax, dword ptr [ebx + 080h]
    mov mov dword ptr [ebp - 16], eax
    jne sub_100AAC11
    mov mov eax, dword ptr [ebx + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0104h
    je sub_100AAC27
    cmp cmp dword ptr [ebp + 24], 1
    jne sub_100AAC31
L29:
    movzx movzx ecx, byte ptr [edx + 109]
    cmp cmp ecx, 6
    mov mov dword ptr [ebp + 28], ecx
    jae sub_100AADDA
    test test esi, esi
    je sub_100AABA7
    mov mov eax, dword ptr [esi + 4]
    mov mov edx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [edx + eax*4]
    test test word ptr [eax + 4], 0840h
    je sub_100AABB5
    cmp cmp ecx, dword ptr [esi + 12]
    je sub_100AABBD
    test test byte ptr [eax + 5], 8
    mov mov eax, dword ptr [ebx + 0C8h]
    je sub_100AAE57
    and and eax, 0FFh
    push push eax
    push push 010117000h
    jmp sub_100AAE72
    mov mov dword ptr [esi + 12], ecx
    lea lea eax, [ebx + ecx*4 + 0424h]
    cmp cmp dword ptr [eax], -1
    jne sub_100AAE98
    mov mov edx, dword ptr [ebp + 8]
    lea lea ecx, [edx + ecx*4]
    cmp cmp dword ptr [ecx], 0
    mov mov dword ptr [ebp - 12], ecx
    jne sub_100AAEAA
    test test esi, esi
    je sub_100AAC9D
    mov mov ecx, dword ptr [esi + 4]
    mov mov edx, dword ptr [ebp + 28]
    mov mov dword ptr [ebx + edx*4 + 040Ch], ecx
    mov mov ecx, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ecx]
    push push ecx
    mov mov dword ptr [eax], ecx
    fld fld qword ptr [esi + 32]
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [esi + 16]
    mov mov ecx, ebx
    push push dword ptr [esi + 12]
    push push dword ptr [esi + 4]
    call sub_100865B5
    xor xor ecx, ecx
    test test dword ptr [edi], 0FFFFFh
    jbe sub_100AACAB
L32:
    mov mov edx, dword ptr [edi + 8]
    mov mov dword ptr [edx + ecx*4], eax
    mov mov edx, dword ptr [edi]
    inc inc ecx
    and and edx, 0FFFFFh
L33:
    cmp cmp ecx, edx
    jb sub_100AACAB
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    push push esi
    mov mov ecx, eax
    mov mov dword ptr [ebp - 16], eax
    call sub_1008610F
    mov mov ecx, dword ptr [ebp + 28]
    mov mov eax, dword ptr [ebp - 16]
    mov mov dword ptr [eax + 12], ecx
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [esi + 64], 1
    and and dword ptr [eax + 64], 0
    mov mov dword ptr [ecx], edi
    jmp sub_100AAE92
    cmp cmp dword ptr [ebp + 24], 2
    jne sub_100AAEAC
    test test esi, esi
    je sub_100AADC5
    mov mov eax, dword ptr [ebx + 16]
    mov mov edx, dword ptr [esi + 4]
    mov mov ecx, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [esi + 12]
    cmp cmp eax, 6
    mov mov dword ptr [ebp - 12], ecx
    jae sub_100AAEDF
    test test word ptr [ecx + 4], 0840h
    je sub_100AADE5
    lea lea ecx, [ebx + eax*4 + 0424h]
    mov mov esi, dword ptr [ecx]
    cmp cmp esi, -1
    mov mov dword ptr [ebp + 28], esi
    jne sub_100AADC1
    mov mov esi, dword ptr [ebp + 8]
    cmp cmp dword ptr [esi + eax*4], 0
    jne sub_100AADC7
    mov mov dword ptr [ebx + eax*4 + 040Ch], edx
    mov mov edx, dword ptr [edi + 8]
    mov mov edx, dword ptr [edx]
    mov mov dword ptr [ecx], edx
    jmp sub_100AAEEB
    mov mov esi, dword ptr [ebp + 28]
    mov mov ecx, dword ptr [edi + 8]
    cmp cmp esi, dword ptr [ecx]
    jne sub_100AAFAB
    mov mov ecx, dword ptr [ebp + 8]
    cmp cmp dword ptr [ecx + eax*4], 0
    je sub_100AAF06
    mov mov eax, dword ptr [ebx + 0C8h]
    and and eax, 0FFh
    push push eax
    push push 010116F98h
    push push 011A6h
    push push 0
    jmp sub_100AAFB2
    xor xor eax, eax
    cmp cmp eax, dword ptr [ebx + 76]
    jae sub_100AAE88
    lea lea ecx, [ebx + 0424h]
    mov mov dword ptr [ebp + 28], ecx
    mov mov ecx, dword ptr [ebp + 8]
    cmp cmp dword ptr [ecx + eax*4], 0
    jne sub_100AAE8D
    mov mov ecx, dword ptr [ebp + 28]
    mov mov edx, dword ptr [ecx]
    mov mov ecx, dword ptr [edi + 8]
    cmp cmp edx, dword ptr [ecx]
    je sub_100AAEA3
    cmp cmp edx, -1
    je sub_100AAEA8
    add add dword ptr [ebp + 28], 4
    inc inc eax
    cmp cmp eax, dword ptr [ebx + 76]
    jb sub_100AAE8E
    cmp cmp eax, dword ptr [ebx + 76]
    je sub_100AB02E
    test test esi, esi
    mov mov dword ptr [ebp + 28], eax
    je sub_100AAF6B
    mov mov ecx, dword ptr [ebx + 0C8h]
    and and ecx, 0FFFFh
    cmp cmp ecx, 0104h
    je sub_100AAF0D
    mov mov ecx, dword ptr [ebp - 16]
    cmp cmp ecx, dword ptr [ebx + 080h]
    jne sub_100AAF2E
    mov mov ecx, dword ptr [esi + 4]
L38:
    mov mov dword ptr [ebx + eax*4 + 040Ch], ecx
L39:
    mov mov ecx, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [ebx + eax*4 + 0424h], ecx
    fld fld qword ptr [esi + 32]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [esi + 16]
    mov mov ecx, ebx
    push push dword ptr [esi + 12]
    push push dword ptr [esi + 4]
    call sub_1008672D
    xor xor ecx, ecx
    test test dword ptr [edi], 0FFFFFh
    jbe sub_100AAF9B
    mov mov edx, dword ptr [edi + 8]
    mov mov dword ptr [edx + ecx*4], eax
    mov mov edx, dword ptr [edi]
    inc inc ecx
    and and edx, 0FFFFFh
    cmp cmp ecx, edx
    jb sub_100AAF9B
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    push push esi
    mov mov ecx, eax
    mov mov dword ptr [ebp - 16], eax
    call sub_10086287
    mov mov eax, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebp + 28]
    mov mov dword ptr [eax + 12], ecx
    mov mov dword ptr [esi + 64], 1
    and and dword ptr [eax + 64], 0
    mov mov eax, ecx
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [ecx + eax*4], edi
    mov mov eax, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [eax + 36], 1
L41:
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    add add dword ptr [ebp - 8], 4
L42:
    cmp cmp eax, dword ptr [ebp + 20]
    jb sub_100AACF9
    inc inc dword ptr [ebp + 24]
    cmp cmp dword ptr [ebp + 24], 3
    jb sub_100AACA4
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebx + 60], 0
    jbe sub_100AB155
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [ebp - 4]
    lea lea esi, [eax + ecx*4]
    cmp cmp dword ptr [esi], 0
    jne sub_100AB158
    push push 116
    call sub_10085EA9
    xor xor edi, edi
    cmp cmp eax, edi
    je sub_100AB14D
    mov mov ecx, eax
    call sub_10085A1F
    jmp sub_100AB158
    push push 010116F88h
    push push 011A2h
    jmp sub_100AB150
    and and eax, 0FFh
    push push eax
    push push 010116F18h
    push push 011A3h
    push push dword ptr [edi + 60]
    push push ebx
    call sub_1008B782
    add add esp, 20
    jmp sub_100AB179
    mov mov eax, dword ptr [ebx + 0C8h]
    and and eax, 0FFh
    push push eax
L44:
    push push 010116EC0h
    push push 011A4h
    jmp sub_100AB13A
    mov mov eax, dword ptr [ebp - 12]
    test test byte ptr [eax + 5], 8
    je sub_100AB179
    push push 010116E38h
    jmp sub_100AB185
    push push 010116E10h
    push push 011A5h
    jmp sub_100AB1A2
    push push 010116DE0h
    push push 011A7h
    push push 0
    push push ebx
    call sub_1008B7CD
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100AB23E
    xor xor eax, eax
    cmp cmp eax, edi
    mov mov dword ptr [esi], eax
    je sub_100AB24D
L49:
    push push edi
    push push edi
    push push edi
    push push edi
    mov mov ecx, eax
    call sub_10085F94
    push push dword ptr [esi]
    mov mov ecx, ebx
    call sub_10086764
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebx + 60]
    jb sub_100AB155
    mov mov eax, dword ptr [ebx + 60]
    mov mov ecx, dword ptr [ebp + 12]
    xor xor esi, esi
    cmp cmp dword ptr [ebp + 20], esi
    mov mov dword ptr [ecx], eax
    jbe sub_100AB276
    mov mov eax, dword ptr [ebp + 16]
    lea lea eax, [eax + esi*4]
    mov mov edx, dword ptr [eax]
    test test edx, edx
    je sub_100AB27C
    cmp cmp dword ptr [edx + 36], 1
    je sub_100AB282
    cmp cmp dword ptr [edx], 0
    je sub_100AB287
    mov mov edi, dword ptr [eax]
    mov mov edx, dword ptr [ecx]
    mov mov ebx, dword ptr [ebp + 8]
    mov mov dword ptr [ebx + edx*4], edi
    inc inc dword ptr [ecx]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [eax + 36], 1
    inc inc esi
    cmp cmp esi, dword ptr [ebp + 20]
    jb sub_100AB276
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 24
    mov mov eax, 08007000Eh
    jmp sub_100AB2BA
FUN_100aa38c ENDP
END
