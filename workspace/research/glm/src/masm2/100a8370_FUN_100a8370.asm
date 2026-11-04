.686
.MODEL FLAT, C
EXTRN sub_1006C968:PROC
EXTRN sub_10085467:PROC
EXTRN sub_100854DC:PROC
EXTRN sub_100855C1:PROC
EXTRN sub_1008563E:PROC
EXTRN sub_1008573B:PROC
EXTRN sub_100857BF:PROC
EXTRN sub_1008582E:PROC
EXTRN sub_100858F7:PROC
EXTRN sub_10085977:PROC
EXTRN sub_10085A51:PROC
EXTRN sub_10085ADA:PROC
EXTRN sub_10085BCB:PROC
EXTRN sub_10085C5A:PROC
EXTRN sub_10085CBE:PROC
EXTRN sub_10085F89:PROC
EXTRN sub_100861ED:PROC
EXTRN sub_10086284:PROC
EXTRN sub_100862B3:PROC
EXTRN sub_100863F5:PROC
EXTRN sub_100863FB:PROC
EXTRN sub_10086414:PROC
EXTRN sub_1008644A:PROC
EXTRN sub_10086510:PROC
EXTRN sub_10086583:PROC
EXTRN sub_1008B5EE:PROC
EXTRN sub_100A88EA:PROC
EXTRN sub_100A89C4:PROC
EXTRN sub_100A8A03:PROC
EXTRN sub_100A8A14:PROC
EXTRN sub_100A8A17:PROC
EXTRN sub_100A8A19:PROC
EXTRN sub_100A8A27:PROC
EXTRN sub_100A8A2A:PROC
EXTRN sub_100A8A5E:PROC
EXTRN sub_100A8A7F:PROC
EXTRN sub_100A8AB2:PROC
EXTRN sub_100A8AB8:PROC
EXTRN sub_100A8AF2:PROC
EXTRN sub_100A8B02:PROC
EXTRN sub_100A8B18:PROC
EXTRN sub_100A8B24:PROC
EXTRN sub_100A8B66:PROC
EXTRN sub_100A8B79:PROC
EXTRN sub_100A8BAA:PROC
EXTRN sub_100A8BB0:PROC
EXTRN sub_100A8BBA:PROC
EXTRN sub_100A8BE4:PROC
EXTRN sub_100A8C51:PROC
EXTRN sub_100A8C98:PROC
EXTRN sub_100A8CAD:PROC
EXTRN sub_100A8CD7:PROC
EXTRN sub_100A8CE4:PROC
EXTRN sub_100A8CE6:PROC
EXTRN sub_100A8CFA:PROC
EXTRN sub_100A8D3D:PROC
EXTRN sub_100A8D85:PROC
EXTRN sub_100A8DA4:PROC
EXTRN sub_100A8DB6:PROC
EXTRN sub_100A8DD1:PROC
EXTRN sub_100A8DF2:PROC
EXTRN sub_100A8E25:PROC
EXTRN sub_100A8E29:PROC
EXTRN sub_100A8E32:PROC
EXTRN sub_100A8E37:PROC
EXTRN sub_100A8E3B:PROC
EXTRN EXTRN g_1019BEB0:DWORD:DWORD
EXTRN EXTRN g_1019BEB8:DWORD:DWORD
.CODE
FUN_100a8370 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    and and dword ptr [ebp - 8], 0
    push push ebx
    push push esi
    mov mov esi, ecx
    cmp cmp dword ptr [esi + 8], 0
    push push edi
    jbe L0
    mov mov edx, dword ptr [esi + 088h]
    mov mov ecx, dword ptr [esi + 20]
    mov mov edi, dword ptr [esi + 8]
    mov mov eax, dword ptr [ecx]
    cmp cmp edx, dword ptr [eax + 4]
    jne L2
    mov mov eax, dword ptr [eax + 12]
    cmp cmp eax, dword ptr [ebp - 8]
    jb L3
    inc inc eax
    mov mov dword ptr [ebp - 8], eax
    add add ecx, 4
    dec dec edi
    jne L1
    mov mov ecx, dword ptr [esi + 0224h]
    mov mov eax, dword ptr [esi + 76]
    cmp cmp eax, ecx
    mov mov dword ptr [ebp - 32], ecx
    mov mov dword ptr [ebp - 20], eax
    jae L17
L0:
    mov mov eax, dword ptr [esi + 0230h]
    mov mov edx, dword ptr [ebp - 20]
    mov mov ebx, dword ptr [eax + edx*4]
L1:
    test test ebx, ebx
    je L18
    mov mov eax, dword ptr [ebx]
    test test eax, eax
    je sub_100A88EA
    mov mov edi, eax
    and and edi, 0FFFFFh
    and and eax, 0FFF00000h
    cmp cmp eax, 070100000h
    mov mov dword ptr [ebp - 12], edi
    jne L6
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [esi + 20]
    mov mov edi, dword ptr [eax]
    mov mov edi, dword ptr [ecx + edi*4]
    mov mov edx, dword ptr [esi + 16]
    mov mov edi, dword ptr [edi + 4]
    mov mov edi, dword ptr [edx + edi*4]
    test test byte ptr [edi + 5], 2
    je L7
    mov mov edi, dword ptr [ebp - 12]
    mov mov edi, dword ptr [eax + edi*4]
    mov mov edi, dword ptr [ecx + edi*4]
    mov mov edi, dword ptr [edi + 4]
    mov mov edi, dword ptr [edx + edi*4]
    test test byte ptr [edi + 5], 2
    je L8
    mov mov edi, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax + edi*8]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [edx + eax*4]
    test test byte ptr [eax + 5], 2
    je L9
    push push 116
    call sub_100858F7
    test test eax, eax
    je L4
    mov mov ecx, eax
    call sub_10085467
    mov mov dword ptr [ebp - 16], eax
    jmp L5
    and and dword ptr [ebp - 16], 0
    mov mov ecx, dword ptr [ebp - 16]
    test test ecx, ecx
    je sub_100A89C4
    push push 0
    push push edi
    mov mov eax, edi
    and and eax, 0FFFFFh
    push push edi
    or or eax, 010000000h
    push push eax
    call sub_10085977
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100A8A03
    mov mov ecx, dword ptr [ebp - 16]
    push push ebx
    call sub_100854DC
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100A8A17
    and and dword ptr [ebp - 4], 0
    test test edi, edi
    jbe L11
    mov mov edi, dword ptr [ebp - 4]
    fldz fldz
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [esi + 20]
    mov mov edx, dword ptr [ebp - 16]
    mov mov edx, dword ptr [edx + 8]
    shl shl edi, 2
    mov mov eax, dword ptr [edi + eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [edi + ecx]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    mov mov dword ptr [edi + edx], ecx
    push push dword ptr [eax + 16]
    mov mov ecx, esi
    push push dword ptr [ebp - 8]
    push push dword ptr [esi + 088h]
    call sub_100862B3
    mov mov ecx, dword ptr [ebp - 16]
    mov mov edx, dword ptr [ecx + 16]
    mov mov dword ptr [edi + edx], eax
    mov mov eax, dword ptr [ecx + 16]
    mov mov eax, dword ptr [edi + eax]
    mov mov edx, dword ptr [ebx + 8]
    mov mov dword ptr [edi + edx], eax
    mov mov eax, dword ptr [ecx + 16]
    cmp cmp dword ptr [edi + eax], -1
    je sub_100A8A5E
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 12]
    jb L10
    mov mov edi, dword ptr [ebp - 12]
    inc inc dword ptr [ebp - 8]
    cmp cmp dword ptr [esi + 0224h], 0200h
    jae sub_100A8A7F
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    call sub_100861ED
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100A8AB2
    mov mov eax, dword ptr [esi + 0224h]
    mov mov ecx, dword ptr [esi + 0230h]
    mov mov edx, dword ptr [ebp - 16]
    mov mov dword ptr [ecx + eax*4], edx
    inc inc dword ptr [esi + 0224h]
L5:
    jmp L12
    mov mov edi, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebx]
    and and eax, 0FFF00000h
    cmp cmp eax, 030000000h
    jne sub_100A8A14
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0104h
    je sub_100A8A2A
    xor xor edx, edx
    inc inc edx
    cmp cmp edi, edx
    jbe L13
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [eax]
    add add eax, 4
    cmp cmp ecx, dword ptr [eax]
    jne sub_100A8AB8
    inc inc edx
    add add eax, 4
    cmp cmp edx, edi
    jb L14
    push push 116
    call sub_10085A51
    test test eax, eax
    je L15
    mov mov ecx, eax
    call sub_100855C1
    mov mov edi, eax
    jmp L16
    xor xor edi, edi
    test test edi, edi
    je sub_100A8B18
    push push edi
    mov mov ecx, esi
    call sub_10086284
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    mov mov ecx, edi
    jl sub_100A8B24
    push push 0
    push push 1
    push push 3
    push push 070300001h
    call sub_10085ADA
L6:
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100A8B66
    push push ebx
    mov mov ecx, edi
    call sub_1008563E
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100A8B79
    mov mov ecx, dword ptr [edi + 8]
    fld fld qword ptr [g_1019BEB8]
    mov mov eax, dword ptr [ebx + 8]
    mov mov eax, dword ptr [eax]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    mov mov dword ptr [ecx], eax
    push push 0
    push push dword ptr [esi + 120]
    mov mov ecx, esi
    call sub_100863F5
    fld fld qword ptr [g_1019BEB0]
    mov mov ecx, dword ptr [edi + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    mov mov dword ptr [ecx + 4], eax
    push push 0
    push push dword ptr [esi + 120]
    mov mov ecx, esi
    call sub_10086414
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [ecx + 8], eax
    mov mov eax, dword ptr [edi + 8]
    cmp cmp dword ptr [eax + 4], -1
    je sub_100A8BB0
    cmp cmp dword ptr [eax + 8], -1
    je sub_100A8BBA
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push 3
    push push dword ptr [ebp - 8]
    mov mov ecx, esi
    push push dword ptr [esi + 088h]
    call sub_1008644A
    mov mov ecx, dword ptr [edi + 16]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [edi + 16]
    cmp cmp dword ptr [eax], -1
    je sub_100A8BE4
    mov mov ecx, dword ptr [ebp - 12]
    xor xor eax, eax
    test test ecx, ecx
    mov mov dword ptr [ebp - 4], eax
    jbe sub_100A8A19
    mov mov edx, ecx
    shl shl edx, 3
    shl shl ecx, 2
    mov mov dword ptr [ebp - 24], edx
    mov mov dword ptr [ebp - 16], ecx
    mov mov ecx, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [ebx + 8]
    mov mov dword ptr [edx + eax*4], ecx
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [ebp - 16]
    add add dword ptr [ebp - 16], 4
    add add ecx, eax
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [ebp - 28], edx
    mov mov edx, dword ptr [ebp - 24]
    mov mov eax, dword ptr [eax + edx]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [ebp - 28]
    mov mov dword ptr [edx + eax], ecx
    mov mov eax, dword ptr [ebp - 4]
    inc inc eax
    add add edx, 4
    cmp cmp eax, dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp - 24], edx
    jb sub_100A8A27
    mov mov eax, dword ptr [esi + 0224h]
    inc inc dword ptr [ebp - 8]
    cmp cmp eax, 0200h
    jae sub_100A8C51
    mov mov ecx, dword ptr [esi + 0230h]
    mov mov dword ptr [ecx + eax*4], edi
    mov mov eax, dword ptr [esi]
    inc inc dword ptr [esi + 0224h]
    push push 0
    push push edi
    mov mov ecx, esi
    call call dword ptr [eax + 32]
    test test eax, eax
    je sub_100A8BAA
    push push 116
    call sub_10085BCB
    test test eax, eax
    je sub_100A8AF2
    mov mov ecx, eax
    call sub_1008573B
    mov mov dword ptr [ebp - 16], eax
    jmp sub_100A8B02
    and and dword ptr [ebp - 16], 0
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    call sub_100863FB
    test test eax, eax
    mov mov ecx, dword ptr [ebp - 16]
    mov mov dword ptr [ebp - 4], eax
    jl sub_100A8C98
    test test ecx, ecx
    je sub_100A8CAD
    push push 0
    push push 1
    push push 2
    push push 020400001h
    call sub_10085C5A
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100A8CE6
    mov mov ecx, dword ptr [ebp - 16]
    push push ebx
    call sub_100857BF
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100A8CFA
    mov mov ecx, dword ptr [edi + 16]
    fldz fldz
    mov mov ecx, dword ptr [ecx]
    mov mov eax, dword ptr [ebp - 16]
    mov mov edx, dword ptr [eax + 16]
    mov mov dword ptr [edx], ecx
    mov mov ecx, dword ptr [edi + 8]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov eax, dword ptr [eax + 8]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push 3
    mov mov dword ptr [eax], ecx
    push push 0
    push push dword ptr [esi + 088h]
    mov mov ecx, esi
    call sub_10086583
    mov mov ecx, dword ptr [edi + 16]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [edi + 16]
    mov mov eax, dword ptr [eax]
L13:
    mov mov ecx, dword ptr [ebp - 16]
    mov mov edx, dword ptr [ecx + 8]
    mov mov dword ptr [edx + 4], eax
    mov mov dword ptr [edi + 4], 2
    mov mov dword ptr [edi], 020500001h
    mov mov eax, dword ptr [esi + 0224h]
    cmp cmp eax, 0200h
    jae sub_100A8D3D
    mov mov edx, dword ptr [esi + 0230h]
    mov mov dword ptr [edx + eax*4], ecx
    inc inc dword ptr [esi + 0224h]
    mov mov eax, dword ptr [ebp - 12]
L15:
    and and eax, 0FFFFFh
    or or eax, 070F00000h
    mov mov dword ptr [esi + 044Ch], 1
    mov mov dword ptr [ebx], eax
    push push 116
    call sub_10085CBE
    test test eax, eax
    je sub_100A8CD7
    mov mov ecx, eax
    call sub_1008582E
    mov mov edi, eax
    jmp sub_100A8CE4
    xor xor edi, edi
    test test edi, edi
    je sub_100A8D85
    push push ebx
    mov mov ecx, edi
    call sub_10085F89
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100A8DB6
    cmp cmp dword ptr [esi + 0224h], 0200h
    jae sub_100A8DA4
    push push edi
    mov mov ecx, esi
    call sub_10086510
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100A8DD1
    mov mov eax, dword ptr [esi + 0224h]
    mov mov ecx, dword ptr [esi + 0230h]
    mov mov dword ptr [ecx + eax*4], edi
    inc inc dword ptr [esi + 0224h]
    mov mov ecx, dword ptr [ebp - 32]
    inc inc dword ptr [ebp - 20]
    cmp cmp dword ptr [ebp - 20], ecx
    jb L17
    mov mov eax, dword ptr [esi + 76]
    jmp sub_100A8DF2
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, 0FFh
    push push eax
    push push 010116C3Ch
    push push 011CAh
    push push dword ptr [ebx + 60]
    push push esi
    call sub_1008B5EE
    add add esp, 20
    mov mov dword ptr [ebp - 4], 080004005h
    jmp sub_100A8E25
    test test ecx, ecx
    je sub_100A8E29
    push push 1
    call sub_1006C968
    jmp sub_100A8E32
    mov mov dword ptr [ebp - 4], 08007000Eh
    jmp sub_100A8E3B
    mov mov edx, dword ptr [esi + 0230h]
    mov mov edx, dword ptr [edx + eax*4]
    and and dword ptr [edx], 0
    inc inc eax
L17:
    cmp cmp eax, ecx
    jb sub_100A8E37
    and and dword ptr [ebp - 4], 0
L18:
    mov mov eax, dword ptr [ebp - 4]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100a8370 ENDP
END
