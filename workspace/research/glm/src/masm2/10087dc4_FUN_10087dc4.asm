.686
.MODEL FLAT, C
EXTRN sub_1008652B:PROC
EXTRN sub_10088406:PROC
EXTRN sub_10088429:PROC
EXTRN sub_1008842A:PROC
EXTRN sub_10088470:PROC
EXTRN sub_10088488:PROC
EXTRN sub_100884AF:PROC
EXTRN sub_100884B4:PROC
EXTRN sub_100884DA:PROC
EXTRN sub_100884E6:PROC
EXTRN sub_10088519:PROC
EXTRN sub_10088534:PROC
EXTRN sub_1008854F:PROC
EXTRN sub_10088551:PROC
EXTRN sub_10088553:PROC
EXTRN sub_10088559:PROC
EXTRN sub_1008855C:PROC
EXTRN sub_10088560:PROC
EXTRN sub_10088577:PROC
EXTRN sub_10088583:PROC
EXTRN sub_1008858F:PROC
EXTRN sub_100885B1:PROC
EXTRN sub_1008860F:PROC
EXTRN sub_1008862A:PROC
EXTRN sub_10088637:PROC
EXTRN sub_10088664:PROC
EXTRN sub_10088670:PROC
EXTRN sub_10088678:PROC
EXTRN sub_10088690:PROC
EXTRN sub_100886A8:PROC
EXTRN sub_100886AB:PROC
EXTRN sub_100886B8:PROC
EXTRN sub_100886CA:PROC
EXTRN sub_100886D7:PROC
EXTRN sub_100886DD:PROC
EXTRN sub_100886F0:PROC
EXTRN sub_100886F5:PROC
EXTRN sub_100886FC:PROC
EXTRN sub_100886FF:PROC
EXTRN sub_1008871A:PROC
EXTRN sub_10088733:PROC
EXTRN sub_1008874F:PROC
EXTRN sub_1008876C:PROC
EXTRN sub_10088774:PROC
EXTRN sub_100887D9:PROC
EXTRN sub_100887FF:PROC
EXTRN sub_10088804:PROC
EXTRN sub_10088816:PROC
EXTRN sub_1008881F:PROC
EXTRN sub_10088832:PROC
EXTRN sub_1008884E:PROC
EXTRN sub_10088858:PROC
EXTRN sub_1008888A:PROC
EXTRN sub_100888A6:PROC
EXTRN sub_10088939:PROC
EXTRN sub_1008893E:PROC
EXTRN sub_10088950:PROC
EXTRN sub_10088959:PROC
EXTRN sub_1008896C:PROC
EXTRN sub_10088988:PROC
EXTRN sub_10088992:PROC
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_10087dc4 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push edi
    mov mov edi, ecx
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + ebx*4]
    cmp cmp dword ptr [eax + 8], -1
    mov mov dword ptr [ebp - 12], edi
    jne L0
    test test byte ptr [eax], 1
    je L1
    mov mov ecx, dword ptr [edi + 16]
    mov mov edx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [ecx + edx*4]
    test test byte ptr [ecx + 4], 2
    jne L2
    mov mov eax, 080004005h
    jmp sub_10088406
    mov mov ecx, dword ptr [edi + 24]
    mov mov eax, dword ptr [eax + 72]
    mov mov edx, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [edx + 12]
    xor xor ecx, ecx
    test test eax, eax
    push push esi
    jbe L3
    mov mov esi, dword ptr [edx + 16]
    cmp cmp dword ptr [esi], ebx
    je L5
    inc inc ecx
    add add esi, 4
    cmp cmp ecx, eax
    jb L4
    cmp cmp ecx, eax
    je sub_1008842A
    mov mov esi, dword ptr [edx]
    and and esi, 0FFF00000h
L2:
    cmp cmp esi, 010000000h
    jne L8
    push push dword ptr [ebp + 28]
    mov mov eax, dword ptr [edx + 8]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push dword ptr [eax + ecx*4]
    jmp L9
    cmp cmp esi, 020500000h
    jne L10
    push push dword ptr [ebp + 28]
    mov mov edx, dword ptr [edx + 8]
    push push dword ptr [ebp + 24]
    mov mov esi, dword ptr [edx + ecx*4]
    push push dword ptr [ebp + 20]
    add add eax, ecx
    push push dword ptr [ebp + 16]
    mov mov ebx, dword ptr [edx + eax*4]
    push push dword ptr [ebp + 12]
    mov mov ecx, edi
    push push esi
    call L6
L6:
    test test eax, eax
    jl sub_10088488
    cmp cmp esi, ebx
    je L13
    push push dword ptr [ebp + 28]
    push push dword ptr [ebp + 24]
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push ebx
    mov mov ecx, edi
    call L7
L7:
    test test eax, eax
    jl sub_100884AF
    jmp L16
    cmp cmp esi, 020200000h
    jne L17
    mov mov edx, dword ptr [edx + 8]
    mov mov esi, dword ptr [edx + ecx*4]
    add add eax, ecx
    mov mov edx, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax]
    cmp cmp eax, -1
    mov mov ebx, 0100h
    je L11
    cmp cmp edx, eax
    jne L12
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + esi*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov dword ptr [ebp + 20], eax
    mov mov eax, dword ptr [edi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    test test dword ptr [eax + 4], ebx
    je L14
    mov mov eax, dword ptr [ebp + 20]
    cmp cmp dword ptr [eax + 8], -1
    jne L15
    mov mov ecx, dword ptr [ebp + 16]
    mov mov eax, dword ptr [ecx]
    cmp cmp eax, -1
    je L21
    mov mov edi, dword ptr [edi + 20]
    mov mov eax, dword ptr [edi + eax*4]
    fld fld qword ptr [eax + 32]
    mov mov edi, dword ptr [edi + esi*4]
    fcomp fcomp qword ptr [edi + 32]
    fnstsw fnstsw ax
    test test ah, 5
    jp L19
    jmp L23
    mov mov eax, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax]
    cmp cmp eax, -1
    je L18
    cmp cmp esi, eax
    jne sub_10088534
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov dword ptr [ebp + 20], eax
    mov mov eax, dword ptr [edi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    test test dword ptr [eax + 4], ebx
    je sub_1008854F
    mov mov eax, dword ptr [ebp + 20]
    cmp cmp dword ptr [eax + 8], -1
    jne sub_1008855C
    mov mov ecx, dword ptr [ebp + 28]
    mov mov eax, dword ptr [ecx]
    cmp cmp eax, -1
    je L20
    mov mov edi, dword ptr [edi + 20]
    mov mov eax, dword ptr [edi + eax*4]
    fld fld qword ptr [eax + 32]
    mov mov edi, dword ptr [edi + edx*4]
    fcomp fcomp qword ptr [edi + 32]
    fnstsw fnstsw ax
    test test ah, 65
    jne L22
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], esi
    mov mov dword ptr [ecx], edx
    xor xor eax, eax
    jmp sub_1008858F
    cmp cmp esi, 020300000h
    jne L34
    mov mov edx, dword ptr [edx + 8]
    mov mov esi, dword ptr [edx + ecx*4]
    add add eax, ecx
    mov mov edx, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax]
    cmp cmp eax, -1
    mov mov ebx, 0100h
    je L24
    cmp cmp edx, eax
    jne L27
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + esi*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov dword ptr [ebp + 28], eax
    mov mov eax, dword ptr [edi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    test test dword ptr [eax + 4], ebx
    je L29
    mov mov eax, dword ptr [ebp + 28]
    cmp cmp dword ptr [eax + 8], -1
    jne L30
    mov mov ecx, dword ptr [ebp + 24]
    mov mov eax, dword ptr [ecx]
    cmp cmp eax, -1
    je L31
    mov mov edi, dword ptr [edi + 20]
    mov mov eax, dword ptr [edi + eax*4]
    fld fld qword ptr [eax + 32]
    mov mov edi, dword ptr [edi + esi*4]
L11:
    fcomp fcomp qword ptr [edi + 32]
    fnstsw fnstsw ax
    test test ah, 65
    jne L25
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], edx
    mov mov dword ptr [ecx], esi
    jmp L26
    mov mov eax, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax]
    cmp cmp eax, -1
    je L35
    cmp cmp esi, eax
    jne sub_1008860F
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov dword ptr [ebp + 28], eax
    mov mov eax, dword ptr [edi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    test test dword ptr [eax + 4], ebx
    je sub_1008862A
    mov mov eax, dword ptr [ebp + 28]
    cmp cmp dword ptr [eax + 8], -1
    jne sub_10088637
L12:
    mov mov ecx, dword ptr [ebp + 20]
    mov mov eax, dword ptr [ecx]
    cmp cmp eax, -1
    je L28
    mov mov edi, dword ptr [edi + 20]
    mov mov eax, dword ptr [edi + eax*4]
    fld fld qword ptr [eax + 32]
L14:
    mov mov edi, dword ptr [edi + edx*4]
    fcomp fcomp qword ptr [edi + 32]
    fnstsw fnstsw ax
    test test ah, 5
    jp L33
    jmp L32
    cmp cmp esi, 030000000h
    jne sub_10088670
    mov mov eax, dword ptr [edx + 12]
    mov mov esi, dword ptr [edx + 8]
    mov mov edi, dword ptr [edi + 20]
    lea lea ebx, [ecx + eax]
    mov mov ebx, dword ptr [esi + ebx*4]
    mov mov ebx, dword ptr [edi + ebx*4]
    lea lea eax, [ecx + eax*2]
    mov mov eax, dword ptr [esi + eax*4]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov esi, dword ptr [ebp - 12]
    mov mov edi, dword ptr [esi + 16]
    mov mov dword ptr [ebp + 8], eax
    mov mov eax, dword ptr [ebx + 4]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov dword ptr [ebp - 8], ebx
    mov mov ebx, 0100h
    test test dword ptr [eax + 4], ebx
    je sub_100886AB
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp dword ptr [eax + 8], -1
    jne sub_100886B8
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [edi + eax*4]
    test test dword ptr [eax + 4], ebx
    je sub_100886CA
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp dword ptr [eax + 8], -1
    jne sub_100886D7
    mov mov eax, dword ptr [ebp - 8]
    fld fld qword ptr [eax + 32]
    fld fld qword ptr [g_1019BE20]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_10088429
    mov mov eax, dword ptr [ebp + 8]
    fld fld qword ptr [eax + 32]
    fld fld qword ptr [g_1019BC88]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_10088470
    mov mov eax, dword ptr [ebp - 8]
    fld fld qword ptr [eax + 32]
    fld fld qword ptr [g_1019BC88]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_1008871A
    mov mov eax, dword ptr [ebp + 8]
    fld fld qword ptr [eax + 32]
    fld fld qword ptr [g_1019BE20]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_10088733
    mov mov eax, dword ptr [edx + 8]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [eax + 4]
    mov mov edx, dword ptr [edi + edx*4]
    test test byte ptr [edx + 4], 2
    je sub_1008874F
    mov mov edx, dword ptr [eax + 72]
L23:
    mov mov eax, dword ptr [esi + 24]
    mov mov edi, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [edi]
    and and eax, 0FFF00000h
    cmp cmp eax, 020400000h
    mov mov dword ptr [ebp - 4], eax
    je sub_10088519
    cmp cmp eax, 010100000h
    jne sub_10088774
    mov mov eax, dword ptr [edi + 12]
    and and dword ptr [ebp + 8], 0
    test test eax, eax
    jbe sub_10088553
    mov mov edx, dword ptr [edi + 16]
    mov mov dword ptr [ebp - 12], edx
    mov mov edx, dword ptr [ebp - 12]
    cmp cmp dword ptr [edx], ecx
    je sub_10088560
    inc inc dword ptr [ebp + 8]
    add add dword ptr [ebp - 12], 4
    cmp cmp dword ptr [ebp + 8], eax
    jb sub_10088559
    cmp cmp dword ptr [ebp - 4], 010100000h
    jne sub_100885B1
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push dword ptr [esi + 120]
    mov mov ecx, esi
    call sub_1008652B
    mov mov ecx, dword ptr [ebp + 8]
    mov mov edx, eax
    cmp cmp edx, -1
    mov mov eax, dword ptr [edi + 8]
    mov mov ecx, dword ptr [eax + ecx*4]
    jne sub_10088690
    mov mov eax, 08007000Eh
    jmp sub_100887D9
    mov mov ecx, dword ptr [ebp + 8]
    and and dword ptr [ebp - 4], 0
    mov mov edi, dword ptr [edi + 8]
    mov mov edx, eax
    neg neg edx
    shl shl edx, 2
    add add ecx, eax
    lea lea ecx, [edi + ecx*4]
    mov mov dword ptr [ebp - 24], edi
L27:
    mov mov dword ptr [ebp - 12], ecx
    mov mov ecx, dword ptr [ebp - 12]
    mov mov edi, dword ptr [ecx]
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + edi*4]
    mov mov dword ptr [ebp - 20], edi
    mov mov edi, dword ptr [ecx + 4]
    mov mov dword ptr [ebp - 16], ecx
L29:
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + edi*4]
    test test byte ptr [ecx + 4], 2
L31:
    je sub_10088678
    mov mov ecx, dword ptr [ebp - 16]
    mov mov edi, dword ptr [ecx + 72]
    mov mov ecx, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ecx + edi*4]
L32:
    mov mov edi, dword ptr [ecx]
L33:
    and and edi, 0FFF00000h
    cmp cmp edi, 010100000h
    je sub_100886A8
    inc inc dword ptr [ebp - 4]
    add add dword ptr [ebp - 12], edx
    cmp cmp dword ptr [ebp - 4], 2
L34:
    jb sub_10088664
    mov mov edx, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp + 12]
    jmp sub_100886FC
    and and dword ptr [ebp - 12], 0
    cmp cmp dword ptr [ecx + 12], 0
    jbe sub_100886F0
    mov mov edx, dword ptr [ecx + 16]
    jmp sub_100886DD
    mov mov edx, dword ptr [ebp - 16]
L35:
    mov mov edi, dword ptr [ebp - 20]
    cmp cmp edi, dword ptr [edx]
    je sub_100886FF
    inc inc dword ptr [ebp - 12]
    add add edx, 4
    mov mov dword ptr [ebp - 16], edx
    mov mov edx, dword ptr [ebp - 12]
    cmp cmp edx, dword ptr [ecx + 12]
    jb sub_100886F5
    imul imul eax, dword ptr [ebp - 4]
    add add eax, dword ptr [ebp + 8]
    mov mov edx, dword ptr [ebp - 24]
    mov mov edx, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [ebp - 4], 2
    je sub_1008888A
    mov mov eax, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax]
    cmp cmp eax, -1
    je sub_1008876C
    cmp cmp edx, eax
    jne sub_100887FF
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edi, dword ptr [esi + 16]
    mov mov dword ptr [ebp + 8], eax
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [edi + eax*4]
    test test dword ptr [eax + 4], ebx
    je sub_10088816
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp dword ptr [eax + 8], -1
    jne sub_1008881F
    mov mov eax, dword ptr [ebp - 8]
    fld fld qword ptr [eax + 32]
    fld fld qword ptr [g_1019BC88]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_10088804
    mov mov edi, dword ptr [ebp + 20]
    mov mov eax, dword ptr [edi]
    cmp cmp eax, -1
    je sub_10088832
    mov mov esi, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi + eax*4]
    fld fld qword ptr [eax + 32]
    mov mov esi, dword ptr [esi + ecx*4]
    fcomp fcomp qword ptr [esi + 32]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_100884B4
    jmp sub_1008884E
    mov mov edi, dword ptr [ebp + 28]
    mov mov eax, dword ptr [edi]
    cmp cmp eax, -1
    je sub_10088858
    mov mov esi, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi + eax*4]
    fld fld qword ptr [eax + 32]
    mov mov esi, dword ptr [esi + ecx*4]
    fcomp fcomp qword ptr [esi + 32]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_100884DA
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], edx
    mov mov dword ptr [edi], ecx
    jmp sub_100884E6
    mov mov eax, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax]
    cmp cmp eax, -1
    je sub_100888A6
    cmp cmp ecx, eax
    jne sub_10088939
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edi, dword ptr [esi + 16]
    mov mov dword ptr [ebp + 20], eax
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [edi + eax*4]
    test test dword ptr [eax + 4], ebx
    je sub_10088950
    mov mov eax, dword ptr [ebp + 20]
    cmp cmp dword ptr [eax + 8], -1
    jne sub_10088959
    mov mov eax, dword ptr [ebp - 8]
    fld fld qword ptr [eax + 32]
    fld fld qword ptr [g_1019BC88]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_1008893E
    mov mov edi, dword ptr [ebp + 24]
    mov mov eax, dword ptr [edi]
    cmp cmp eax, -1
    je sub_1008896C
    mov mov esi, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi + eax*4]
    fld fld qword ptr [eax + 32]
    mov mov esi, dword ptr [esi + edx*4]
    fcomp fcomp qword ptr [esi + 32]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10088551
    jmp sub_10088988
    mov mov edi, dword ptr [ebp + 16]
    mov mov eax, dword ptr [edi]
    cmp cmp eax, -1
    je sub_10088992
    mov mov esi, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi + eax*4]
    fld fld qword ptr [eax + 32]
    mov mov esi, dword ptr [esi + edx*4]
    fcomp fcomp qword ptr [esi + 32]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_10088577
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], ecx
    mov mov dword ptr [edi], edx
    jmp sub_10088583
    mov mov eax, 080004005h
    pop pop esi
    pop pop edi
    pop pop ebx
    leave leave
    ret ret 24
FUN_10087dc4 ENDP
END
