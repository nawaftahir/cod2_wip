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
EXTRN g_1019BEB0:DWORD
EXTRN g_1019BEB8:DWORD
.CODE
FUN_100a8370 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    and dword ptr [ebp - 8], 0
    push ebx
    push esi
    mov esi, ecx
    cmp dword ptr [esi + 8], 0
    push edi
    jbe L2
    mov edx, dword ptr [esi + 000000088h]
    mov ecx, dword ptr [esi + 20]
    mov edi, dword ptr [esi + 8]
L0:
    mov eax, dword ptr [ecx]
    cmp edx, dword ptr [eax + 4]
    jne L1
    mov eax, dword ptr [eax + 12]
    cmp eax, dword ptr [ebp - 8]
    jb L1
    inc eax
    mov dword ptr [ebp - 8], eax
L1:
    add ecx, 4
    dec edi
    jne L0
L2:
    mov ecx, dword ptr [esi + 000000224h]
    mov eax, dword ptr [esi + 76]
    cmp eax, ecx
    mov dword ptr [ebp - 32], ecx
    mov dword ptr [ebp - 20], eax
    jae L23
L3:
    mov eax, dword ptr [esi + 000000230h]
    mov edx, dword ptr [ebp - 20]
    mov ebx, dword ptr [eax + edx*4]
    test ebx, ebx
    je L22
    mov eax, dword ptr [ebx]
    test eax, eax
    je L22
    mov edi, eax
    and edi, 0000FFFFFh
    and eax, 0FFF00000h
    cmp eax, 070100000h
    mov dword ptr [ebp - 12], edi
    jne L9
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [esi + 20]
    mov edi, dword ptr [eax]
    mov edi, dword ptr [ecx + edi*4]
    mov edx, dword ptr [esi + 16]
    mov edi, dword ptr [edi + 4]
    mov edi, dword ptr [edx + edi*4]
    test byte ptr [edi + 5], 2
    je L8
    mov edi, dword ptr [ebp - 12]
    mov edi, dword ptr [eax + edi*4]
    mov edi, dword ptr [ecx + edi*4]
    mov edi, dword ptr [edi + 4]
    mov edi, dword ptr [edx + edi*4]
    test byte ptr [edi + 5], 2
    je L8
    mov edi, dword ptr [ebp - 12]
    mov eax, dword ptr [eax + edi*8]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 5], 2
    je L9
    push 116
    call sub_100858F7
    test eax, eax
    je L4
    mov ecx, eax
    call sub_10085467
    mov dword ptr [ebp - 16], eax
    jmp L5
L4:
    and dword ptr [ebp - 16], 0
L5:
    mov ecx, dword ptr [ebp - 16]
    test ecx, ecx
    je L27
    push 0
    push edi
    mov eax, edi
    and eax, 0000FFFFFh
    push edi
    or eax, 010000000h
    push eax
    call sub_10085977
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L30
    mov ecx, dword ptr [ebp - 16]
    push ebx
    call sub_100854DC
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L30
    and dword ptr [ebp - 4], 0
    test edi, edi
    jbe L7
L6:
    mov edi, dword ptr [ebp - 4]
    fldz
    mov eax, dword ptr [ebx + 16]
    mov ecx, dword ptr [esi + 20]
    mov edx, dword ptr [ebp - 16]
    mov edx, dword ptr [edx + 8]
    shl edi, 2
    mov eax, dword ptr [edi + eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebx + 8]
    mov ecx, dword ptr [edi + ecx]
    push ecx
    push ecx
    fstp qword ptr [esp]
    mov dword ptr [edi + edx], ecx
    push dword ptr [eax + 16]
    mov ecx, esi
    push dword ptr [ebp - 8]
    push dword ptr [esi + 000000088h]
    call sub_100862B3
    mov ecx, dword ptr [ebp - 16]
    mov edx, dword ptr [ecx + 16]
    mov dword ptr [edi + edx], eax
    mov eax, dword ptr [ecx + 16]
    mov eax, dword ptr [edi + eax]
    mov edx, dword ptr [ebx + 8]
    mov dword ptr [edi + edx], eax
    mov eax, dword ptr [ecx + 16]
    cmp dword ptr [edi + eax], -1
    je L27
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 12]
    jb L6
    mov edi, dword ptr [ebp - 12]
L7:
    inc dword ptr [ebp - 8]
    cmp dword ptr [esi + 000000224h], 000000200h
    jae L27
    push dword ptr [ebp - 16]
    mov ecx, esi
    call sub_100861ED
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L30
    mov eax, dword ptr [esi + 000000224h]
    mov ecx, dword ptr [esi + 000000230h]
    mov edx, dword ptr [ebp - 16]
    mov dword ptr [ecx + eax*4], edx
    inc dword ptr [esi + 000000224h]
    jmp L9
L8:
    mov edi, dword ptr [ebp - 12]
L9:
    mov eax, dword ptr [ebx]
    and eax, 0FFF00000h
    cmp eax, 030000000h
    jne L19
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    je L19
    xor edx, edx
    inc edx
    cmp edi, edx
    jbe L11
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [eax]
    add eax, 4
L10:
    cmp ecx, dword ptr [eax]
    jne L24
    inc edx
    add eax, 4
    cmp edx, edi
    jb L10
L11:
    push 116
    call sub_10085A51
    test eax, eax
    je L12
    mov ecx, eax
    call sub_100855C1
    mov edi, eax
    jmp L13
L12:
    xor edi, edi
L13:
    test edi, edi
    je L27
    push edi
    mov ecx, esi
    call sub_10086284
    test eax, eax
    mov dword ptr [ebp - 4], eax
    mov ecx, edi
    jl L26
    push 0
    push 1
    push 3
    push 070300001h
    call sub_10085ADA
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L30
    push ebx
    mov ecx, edi
    call sub_1008563E
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L30
    mov ecx, dword ptr [edi + 8]
    fld qword ptr [g_1019BEB8]
    mov eax, dword ptr [ebx + 8]
    mov eax, dword ptr [eax]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    mov dword ptr [ecx], eax
    push 0
    push dword ptr [esi + 120]
    mov ecx, esi
    call sub_100863F5
    fld qword ptr [g_1019BEB0]
    mov ecx, dword ptr [edi + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 0
    mov dword ptr [ecx + 4], eax
    push 0
    push dword ptr [esi + 120]
    mov ecx, esi
    call sub_10086414
    mov ecx, dword ptr [edi + 8]
    mov dword ptr [ecx + 8], eax
    mov eax, dword ptr [edi + 8]
    cmp dword ptr [eax + 4], -1
    je L27
    cmp dword ptr [eax + 8], -1
    je L27
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push 3
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [esi + 000000088h]
    call sub_1008644A
    mov ecx, dword ptr [edi + 16]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [edi + 16]
    cmp dword ptr [eax], -1
    je L27
    mov ecx, dword ptr [ebp - 12]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [ebp - 4], eax
    jbe L15
    mov edx, ecx
    shl edx, 3
    shl ecx, 2
    mov dword ptr [ebp - 24], edx
    mov dword ptr [ebp - 16], ecx
L14:
    mov ecx, dword ptr [edi + 16]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [ebx + 8]
    mov dword ptr [edx + eax*4], ecx
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [ebp - 16]
    add dword ptr [ebp - 16], 4
    add ecx, eax
    mov edx, dword ptr [ecx]
    mov dword ptr [ebp - 28], edx
    mov edx, dword ptr [ebp - 24]
    mov eax, dword ptr [eax + edx]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [ebp - 28]
    mov dword ptr [edx + eax], ecx
    mov eax, dword ptr [ebp - 4]
    inc eax
    add edx, 4
    cmp eax, dword ptr [ebp - 12]
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 24], edx
    jb L14
L15:
    mov eax, dword ptr [esi + 000000224h]
    inc dword ptr [ebp - 8]
    cmp eax, 000000200h
    jae L27
    mov ecx, dword ptr [esi + 000000230h]
    mov dword ptr [ecx + eax*4], edi
    mov eax, dword ptr [esi]
    inc dword ptr [esi + 000000224h]
    push 0
    push edi
    mov ecx, esi
    call dword ptr [eax + 0x20]
    test eax, eax
    je L18
    push 116
    call sub_10085BCB
    test eax, eax
    je L16
    mov ecx, eax
    call sub_1008573B
    mov dword ptr [ebp - 16], eax
    jmp L17
L16:
    and dword ptr [ebp - 16], 0
L17:
    push dword ptr [ebp - 16]
    mov ecx, esi
    call sub_100863FB
    test eax, eax
    mov ecx, dword ptr [ebp - 16]
    mov dword ptr [ebp - 4], eax
    jl L25
    test ecx, ecx
    je L27
    push 0
    push 1
    push 2
    push 020400001h
    call sub_10085C5A
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L30
    mov ecx, dword ptr [ebp - 16]
    push ebx
    call sub_100857BF
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L30
    mov ecx, dword ptr [edi + 16]
    fldz
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [ebp - 16]
    mov edx, dword ptr [eax + 16]
    mov dword ptr [edx], ecx
    mov ecx, dword ptr [edi + 8]
    mov ecx, dword ptr [ecx + 8]
    mov eax, dword ptr [eax + 8]
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 3
    mov dword ptr [eax], ecx
    push 0
    push dword ptr [esi + 000000088h]
    mov ecx, esi
    call sub_10086583
    mov ecx, dword ptr [edi + 16]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [edi + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ebp - 16]
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [edx + 4], eax
    mov dword ptr [edi + 4], 2
    mov dword ptr [edi], 020500001h
    mov eax, dword ptr [esi + 000000224h]
    cmp eax, 000000200h
    jae L27
    mov edx, dword ptr [esi + 000000230h]
    mov dword ptr [edx + eax*4], ecx
    inc dword ptr [esi + 000000224h]
L18:
    mov eax, dword ptr [ebp - 12]
    and eax, 0000FFFFFh
    or eax, 070F00000h
    mov dword ptr [esi + 00000044Ch], 1
    mov dword ptr [ebx], eax
L19:
    push 116
    call sub_10085CBE
    test eax, eax
    je L20
    mov ecx, eax
    call sub_1008582E
    mov edi, eax
    jmp L21
L20:
    xor edi, edi
L21:
    test edi, edi
    je L27
    push ebx
    mov ecx, edi
    call sub_10085F89
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L30
    cmp dword ptr [esi + 000000224h], 000000200h
    jae L27
    push edi
    mov ecx, esi
    call sub_10086510
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L30
    mov eax, dword ptr [esi + 000000224h]
    mov ecx, dword ptr [esi + 000000230h]
    mov dword ptr [ecx + eax*4], edi
    inc dword ptr [esi + 000000224h]
    mov ecx, dword ptr [ebp - 32]
L22:
    inc dword ptr [ebp - 20]
    cmp dword ptr [ebp - 20], ecx
    jb L3
L23:
    mov eax, dword ptr [esi + 76]
    jmp L29
L24:
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 0000000FFh
    push eax
    push 010116C3Ch
    push 0000011CAh
    push dword ptr [ebx + 60]
    push esi
    call sub_1008B5EE
    add esp, 20
    mov dword ptr [ebp - 4], 080004005h
    jmp L30
L25:
    test ecx, ecx
    je L30
L26:
    push 1
    call sub_1006C968
    jmp L30
L27:
    mov dword ptr [ebp - 4], 08007000Eh
    jmp L30
L28:
    mov edx, dword ptr [esi + 000000230h]
    mov edx, dword ptr [edx + eax*4]
    and dword ptr [edx], 0
    inc eax
L29:
    cmp eax, ecx
    jb L28
    and dword ptr [ebp - 4], 0
L30:
    mov eax, dword ptr [ebp - 4]
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100a8370 ENDP
END
