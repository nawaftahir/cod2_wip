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
EXTRN sub_100C0CFA:PROC
EXTRN sub_100C0CFD:PROC
EXTRN sub_100C0DC1:PROC
EXTRN sub_100C0DC7:PROC
EXTRN sub_100C0DCE:PROC
EXTRN sub_100C0DD7:PROC
EXTRN sub_100C0DDC:PROC
EXTRN sub_100C0DDF:PROC
EXTRN sub_100C0DE5:PROC
EXTRN sub_100C0DEB:PROC
EXTRN sub_100C0E4F:PROC
EXTRN sub_100C0E63:PROC
EXTRN sub_100C0EAC:PROC
EXTRN sub_100C0EB4:PROC
EXTRN sub_100C0EB9:PROC
EXTRN sub_100C0EC7:PROC
EXTRN sub_100C0F56:PROC
EXTRN sub_100C0F62:PROC
EXTRN sub_100C0FC2:PROC
EXTRN sub_100C0FE4:PROC
EXTRN sub_100C0FF0:PROC
EXTRN sub_100C0FFC:PROC
EXTRN sub_100C1008:PROC
EXTRN sub_100C107A:PROC
EXTRN sub_100C1087:PROC
EXTRN sub_100C10A8:PROC
EXTRN sub_100C110F:PROC
EXTRN sub_100C112E:PROC
EXTRN sub_100C113F:PROC
EXTRN sub_100C1160:PROC
EXTRN sub_100C1168:PROC
EXTRN sub_100C117D:PROC
EXTRN sub_100C1190:PROC
EXTRN sub_100C119D:PROC
EXTRN sub_100C11B5:PROC
EXTRN sub_100C11C8:PROC
EXTRN sub_100C120E:PROC
EXTRN sub_100C1229:PROC
EXTRN sub_100C1238:PROC
EXTRN sub_100C123D:PROC
EXTRN sub_100C1255:PROC
EXTRN sub_100C12E8:PROC
.CODE
FUN_100c06ec PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0278h
    and and dword ptr [ebp - 72], 0
    push push ebx
    push push esi
    push push edi
    mov mov ebx, ecx
    push push 40
    or or eax, -1
    pop pop ecx
    lea lea edi, [ebp - 0138h]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov esi, dword ptr [eax]
    mov mov edi, dword ptr [eax]
    mov mov ecx, 0FFFFFh
    xor xor edx, edx
    mov mov dword ptr [ebp - 36], esi
    and and dword ptr [ebp - 36], ecx
    and and edi, ecx
    inc inc edx
    cmp cmp dword ptr [ebp - 36], edi
    mov mov dword ptr [ebp - 68], edx
    mov mov dword ptr [ebp - 64], 2
    mov mov dword ptr [ebp - 60], 3
    mov mov dword ptr [ebp - 32], eax
    mov mov dword ptr [ebp - 24], edi
    ja L0
    and and esi, 0FFF00000h
    cmp cmp esi, 020500000h
    je L1
    mov mov dword ptr [ebp - 12], edx
    jmp L26
    and and dword ptr [ebp - 48], 0
    and and dword ptr [ebp - 12], 0
    xor xor ecx, ecx
    push push 40
    pop pop ecx
    or or eax, -1
    lea lea edi, [ebp - 088h]
    lea lea edi, [ebp - 01D8h]
    rep stosd rep stosd dword ptr es:[edi], eax
    push push 40
    pop pop ecx
    lea lea edi, [ebp - 0278h]
    rep stosd rep stosd dword ptr es:[edi], eax
    xor xor eax, eax
    lea lea esi, [ebp - 088h]
    mov mov dword ptr [ebp - 40], eax
    mov mov dword ptr [ebp - 28], eax
    mov mov dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp - 8], eax
    cmp cmp dword ptr [ebp - 12], 0
    je L2
    xor xor ecx, ecx
    inc inc ecx
    sub sub ecx, dword ptr [ebp - 4]
    jmp L3
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [ebp - 32]
    mov mov edi, dword ptr [edx + 8]
    mov mov ecx, dword ptr [ecx*4 + 010118A64h]
    cmp cmp ecx, 16
    mov mov edx, dword ptr [ebx + 20]
    lea lea esi, [edi + eax*4]
    mov mov eax, dword ptr [esi]
L1:
    mov mov eax, dword ptr [edx + eax*4]
    jae L4
    mov mov eax, dword ptr [eax + 72]
    cmp cmp eax, -1
    je L6
    shl shl ecx, 5
    mov mov edi, ecx
    mov mov ecx, dword ptr [ebx + 24]
    mov mov eax, dword ptr [ecx + eax*4]
    push push 0
    push push dword ptr [edi + 010118A70h]
    lea lea ecx, [ebp - 098h]
    push push ecx
    lea lea ecx, [ebp - 72]
    push push ecx
    push push dword ptr [ebp - 36]
    mov mov ecx, ebx
    push push esi
    push push eax
    mov mov dword ptr [ebp - 20], eax
    call sub_100B98D6
    test test eax, eax
    jne L7
    push push eax
    push push dword ptr [ebp - 24]
    lea lea eax, [ebp - 098h]
    push push eax
    lea lea eax, [ebp - 0278h]
    push push eax
    lea lea eax, [ebp - 40]
    push push eax
    lea lea eax, [ebp - 088h]
    push push eax
    lea lea eax, [edi + 010118A58h]
    push push eax
    push push dword ptr [ebp - 20]
    mov mov ecx, ebx
    call sub_100B9AF7
    mov mov dword ptr [ebp - 28], eax
    jmp L8
    sub sub ecx, 16
    xor xor edx, edx
    shl shl ecx, 4
    lea lea ecx, [ebp + ecx - 01D8h]
    mov mov eax, dword ptr [ebp + edx*4 - 72]
    cmp cmp eax, dword ptr [ebp - 36]
    jae L9
    mov mov esi, dword ptr [ebp - 8]
    add add eax, esi
L2:
    mov mov eax, dword ptr [edi + eax*4]
    mov mov dword ptr [ecx], eax
    jmp L11
    or or dword ptr [ecx], -1
    inc inc edx
L3:
    add add ecx, 4
    cmp cmp edx, 4
    jb L10
    cmp cmp dword ptr [ebp - 28], 1
    je L12
    mov mov eax, dword ptr [ebp - 8]
    add add eax, dword ptr [ebp - 36]
    inc inc dword ptr [ebp - 4]
    cmp cmp dword ptr [ebp - 4], 2
    mov mov dword ptr [ebp - 8], eax
    jb L5
    jmp L13
    mov mov dword ptr [ebp - 28], 1
    xor xor esi, esi
    mov mov dword ptr [ebp - 4], esi
    mov mov dword ptr [ebp - 44], esi
    cmp cmp dword ptr [ebp - 12], esi
    je L14
    xor xor ecx, ecx
    inc inc ecx
    sub sub ecx, dword ptr [ebp - 4]
    jmp L15
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp dword ptr [ecx*4 + 010118A64h], 16
    jb L17
    cmp cmp dword ptr [ebp - 40], esi
    mov mov dword ptr [ebp - 16], esi
    jbe L20
    cmp cmp dword ptr [ebp - 36], esi
    jbe L17
    mov mov eax, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebp + eax*4 - 088h]
    mov mov edi, dword ptr [ecx + 12]
    and and dword ptr [ebp - 8], 0
    test test edi, edi
    jbe L19
    mov mov eax, dword ptr [ebp - 44]
    mov mov edx, dword ptr [ebp - 32]
    mov mov edx, dword ptr [edx + 8]
    add add eax, esi
    mov mov edx, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [ecx + 16]
    cmp cmp edx, dword ptr [eax]
    je L22
    inc inc dword ptr [ebp - 8]
    mov mov edi, dword ptr [ecx + 12]
    add add eax, 4
    cmp cmp dword ptr [ebp - 8], edi
    jb L21
    inc inc esi
    cmp cmp esi, dword ptr [ebp - 36]
    jb L18
    jmp L24
    mov mov dword ptr [ebp - 28], 1
    inc inc dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 16]
    xor xor esi, esi
    cmp cmp eax, dword ptr [ebp - 40]
    jb L20
    mov mov eax, dword ptr [ebp - 36]
    inc inc dword ptr [ebp - 4]
    add add dword ptr [ebp - 44], eax
    cmp cmp dword ptr [ebp - 4], 2
    jb L16
    cmp cmp dword ptr [ebp - 28], esi
    jne L38
    cmp cmp dword ptr [ebp - 48], 0
    jne sub_100C0CFA
    and and dword ptr [ebp - 16], 0
    cmp cmp dword ptr [ebp - 40], 0
    jbe L29
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp + eax*4 - 088h]
    mov mov eax, dword ptr [eax + 12]
    and and dword ptr [ebp - 8], 0
    test test eax, eax
    mov mov dword ptr [ebp - 52], eax
    jbe L32
    mov mov eax, dword ptr [ebx + 12]
    test test eax, eax
    jbe L31
L6:
    mov mov ecx, dword ptr [ebx + 24]
    mov mov dword ptr [ebp - 44], ecx
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebp - 44]
    mov mov ecx, dword ptr [eax]
    test test ecx, ecx
    je L33
    cmp cmp dword ptr [ecx], 0
    je L36
    mov mov edx, dword ptr [ecx + 4]
    and and dword ptr [ebp - 4], 0
    test test edx, edx
    jbe L27
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp + eax*4 - 088h]
    mov mov esi, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax + 16]
    mov mov edi, dword ptr [eax + esi*4]
L7:
    mov mov esi, dword ptr [ecx + 8]
    mov mov dword ptr [ebp - 56], edx
    mov mov eax, dword ptr [esi]
    cmp cmp eax, edi
    je L28
    mov mov edx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [edx + eax*4]
    cmp cmp dword ptr [eax + 56], edi
L8:
    jne L34
    mov mov dword ptr [ebp - 4], 1
    add add esi, 4
L9:
    dec dec dword ptr [ebp - 56]
L10:
    jne L30
    cmp cmp ecx, dword ptr [ebp - 32]
    jne L37
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp - 4], 0
    je L41
    xor xor eax, eax
    cmp cmp ecx, dword ptr [ebp + eax*4 - 088h]
    jne L40
    and and dword ptr [ebp - 4], 0
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 40]
    jb L39
    cmp cmp dword ptr [ebp - 4], 0
    je sub_100C0CFD
    mov mov dword ptr [ebp - 28], 1
    add add dword ptr [ebp - 44], 4
    dec dec dword ptr [ebp - 20]
    jne L35
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebp - 52]
    jb L32
    inc inc dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp eax, dword ptr [ebp - 40]
    jb L29
    and and dword ptr [ebp - 8], 0
    mov mov eax, dword ptr [ebp - 8]
    mov mov esi, dword ptr [ebp + eax*4 - 01D8h]
    cmp cmp esi, -1
    je sub_100C0DC7
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 40], edi
    jbe sub_100C0DCE
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + esi*4]
    mov mov dword ptr [ebp - 52], eax
    mov mov ecx, dword ptr [ebp + edi*4 - 088h]
    mov mov eax, dword ptr [ecx + 12]
    test test eax, eax
L14:
    jbe sub_100C0DDF
    mov mov ecx, dword ptr [ecx + 16]
    mov mov dword ptr [ebp - 20], eax
    mov mov edx, dword ptr [ecx]
    cmp cmp esi, edx
    je sub_100C0DDC
    mov mov eax, dword ptr [ebp - 52]
    cmp cmp dword ptr [eax + 56], edx
    jne sub_100C0DEB
    mov mov dword ptr [ebp - 28], 1
    add add ecx, 4
    dec dec dword ptr [ebp - 20]
    jne sub_100C0DE5
    inc inc edi
    cmp cmp edi, dword ptr [ebp - 40]
    jb sub_100C0DD7
    inc inc dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 8], 40
    jb sub_100C0DC1
    cmp cmp dword ptr [ebp - 28], 0
    je sub_100C0E4F
    inc inc dword ptr [ebp - 12]
    cmp cmp dword ptr [ebp - 12], 2
    jb L23
    mov mov eax, dword ptr [ebp - 28]
    test test eax, eax
    je sub_100C0E63
    inc inc dword ptr [ebp - 48]
    cmp cmp dword ptr [ebp - 48], 1
    jb L25
    jmp sub_100C0EAC
    mov mov eax, dword ptr [ebp - 32]
    mov mov ecx, dword ptr [ebp - 40]
    mov mov dword ptr [ebp + ecx*4 - 088h], eax
    xor xor eax, eax
    mov mov ecx, dword ptr [ebp + eax - 01D8h]
    cmp cmp ecx, -1
    jne sub_100C0EB4
    mov mov ecx, dword ptr [ebp + eax - 0278h]
    cmp cmp ecx, -1
    je sub_100C0EC7
    mov mov dword ptr [ebp + eax - 0138h], ecx
L20:
    add add eax, 4
    cmp cmp eax, 0A0h
    jb sub_100C0EB9
    xor xor eax, eax
    xor xor edx, edx
    mov mov dword ptr [ebp - 12], eax
    inc inc edx
    cmp cmp dword ptr [ebp - 24], 3
    jb sub_100C0FC2
    and and dword ptr [ebp - 20], 0
    cmp cmp dword ptr [ebp - 24], 0
    jbe sub_100C0F56
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov esi, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [eax + 16]
L23:
    mov mov edi, dword ptr [ecx]
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov edi, dword ptr [eax + 4]
    mov mov edi, dword ptr [esi + edi*4]
    test test byte ptr [edi + 4], 32
    jne sub_100C0FF0
    mov mov edi, dword ptr [ebp - 20]
    cmp cmp dword ptr [eax + 16], edi
    jne sub_100C0FFC
    inc inc edi
    add add ecx, 4
    cmp cmp edi, dword ptr [ebp - 24]
    mov mov dword ptr [ebp - 20], edi
    jb sub_100C0F62
    cmp cmp dword ptr [ebp - 12], 0
    jne sub_100C113F
    xor xor edx, edx
    mov mov eax, dword ptr [ebp + edx*4 - 0138h]
    lea lea ecx, [ebp + edx*4 - 0118h]
    cmp cmp eax, dword ptr [ecx - 16]
    jne sub_100C1160
    cmp cmp eax, dword ptr [ecx]
    jne sub_100C1168
    mov mov ecx, dword ptr [ebx + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    cmp cmp dword ptr [eax + 16], edx
    je sub_100C1008
    test test byte ptr [ebx + 108], 2
    jne sub_100C117D
    inc inc edx
    cmp cmp edx, 3
    jb sub_100C0FE4
    cmp cmp dword ptr [ebp - 011Ch], -1
    jne sub_100C1190
    cmp cmp dword ptr [ebp - 010Ch], -1
    jne sub_100C119D
    push push 116
    call sub_10085CCE
    test test eax, eax
    je sub_100C107A
    mov mov ecx, eax
    call sub_1008583E
    mov mov esi, eax
    jmp sub_100C1087
    mov mov eax, edx
    jmp sub_100C11B5
    xor xor esi, esi
    test test esi, esi
    mov mov dword ptr [ebp - 32], esi
    jne sub_100C10A8
    mov mov eax, 08007000Eh
    jmp sub_100C11C8
    mov mov eax, dword ptr [ebp - 24]
    push push 0
    push push dword ptr [ebp - 24]
    and and eax, 0FFFFFh
    push push dword ptr [ebp - 24]
    or or eax, 070200000h
    push push eax
    mov mov ecx, esi
    call sub_10085D5F
    mov mov edi, eax
    test test edi, edi
    mov mov ecx, esi
    jl sub_100C110F
    push push dword ptr [ebx + 0100h]
    call sub_100858C3
    mov mov edi, eax
    test test edi, edi
    jge sub_100C112E
    mov mov ecx, esi
    push push 1
    call sub_1006C93A
    mov mov eax, edi
    jmp sub_100C120E
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov esi, dword ptr [eax + 16]
    mov mov ecx, dword ptr [ebp - 24]
    mov mov eax, dword ptr [ebp - 32]
    mov mov edi, dword ptr [eax + 16]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    mov mov edx, dword ptr [ebp - 24]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [eax + 8]
    mov mov ecx, edx
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    lea lea esi, [ebp - 0138h]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    xor xor esi, esi
    test test edx, edx
    jbe sub_100C1238
    mov mov eax, 080000000h
    test test byte ptr [ebx + 108], 2
    je sub_100C1229
    mov mov ecx, dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ecx + esi*4]
    mov mov edx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    or or dword ptr [ecx], eax
L29:
    mov mov ecx, dword ptr [ebx + 0100h]
L30:
    mov mov ecx, dword ptr [ecx + 8]
L31:
    mov mov ecx, dword ptr [ecx + esi*4]
    mov mov edx, dword ptr [ebx + 20]
L34:
    mov mov ecx, dword ptr [edx + ecx*4]
L35:
    cmp cmp dword ptr [ecx + 56], -1
    je sub_100C1255
    mov mov ecx, edx
    mov mov edx, dword ptr [ebx + 0100h]
    mov mov edx, dword ptr [edx + 8]
    mov mov edx, dword ptr [edx + esi*4]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edx + 56]
    mov mov ecx, dword ptr [ecx + edx*4]
    or or dword ptr [ecx], eax
    mov mov ecx, dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov ecx, dword ptr [ecx + esi*4]
    mov mov edx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    or or dword ptr [ecx], eax
    inc inc esi
    cmp cmp esi, dword ptr [ebp - 24]
    jb sub_100C123D
    push push dword ptr [ebp - 32]
    mov mov ecx, dword ptr [ebx + 0100h]
    call sub_100860A7
    mov mov ecx, dword ptr [ebp - 32]
    push push 1
L40:
    mov mov dword ptr [ebp - 12], eax
    call sub_1006CA0E
L41:
    mov mov eax, dword ptr [ebp - 12]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    xor xor eax, eax
    inc inc eax
    jmp sub_100C12E8
FUN_100c06ec ENDP
END
