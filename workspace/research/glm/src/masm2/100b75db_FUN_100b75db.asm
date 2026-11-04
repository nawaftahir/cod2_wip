.686
.MODEL FLAT, C
EXTRN sub_1006CA0C:PROC
EXTRN sub_1006CA8D:PROC
EXTRN sub_10085769:PROC
EXTRN sub_100857E4:PROC
EXTRN sub_10085BF9:PROC
EXTRN sub_10085C7B:PROC
EXTRN sub_1008B53E:PROC
EXTRN sub_1008B698:PROC
EXTRN sub_100B7CB0:PROC
EXTRN sub_100B7CB1:PROC
EXTRN sub_100B7CBE:PROC
EXTRN sub_100B7CC0:PROC
EXTRN sub_100B7CC3:PROC
EXTRN sub_100B7CCA:PROC
EXTRN sub_100B7CD3:PROC
EXTRN sub_100B7D20:PROC
EXTRN sub_100B7D43:PROC
EXTRN sub_100B7D4F:PROC
EXTRN sub_100B7D77:PROC
EXTRN sub_100B7DB5:PROC
EXTRN sub_100B7DB8:PROC
EXTRN sub_100B7DC5:PROC
EXTRN sub_100B7DD6:PROC
EXTRN sub_100B7E22:PROC
EXTRN sub_100B7E33:PROC
EXTRN sub_100B7E85:PROC
EXTRN sub_100B7EC8:PROC
EXTRN sub_100B7ECD:PROC
EXTRN sub_100B7ED7:PROC
EXTRN sub_100B7EDB:PROC
EXTRN sub_100B7EE5:PROC
EXTRN sub_100B7F71:PROC
EXTRN sub_100B7F86:PROC
EXTRN sub_100B7F89:PROC
EXTRN sub_100B7F8A:PROC
EXTRN sub_100B7F96:PROC
EXTRN sub_100B7FAF:PROC
EXTRN sub_100B7FED:PROC
EXTRN sub_100B8029:PROC
EXTRN sub_100B8036:PROC
EXTRN sub_100B804A:PROC
EXTRN sub_100B804D:PROC
EXTRN sub_100B8051:PROC
EXTRN sub_100B805A:PROC
EXTRN sub_100B805D:PROC
EXTRN sub_100B8073:PROC
EXTRN sub_100B80E6:PROC
EXTRN sub_100B80E9:PROC
EXTRN sub_100B80FD:PROC
EXTRN sub_100B8180:PROC
EXTRN sub_100B81A2:PROC
EXTRN sub_100B81AF:PROC
EXTRN sub_100B81F8:PROC
EXTRN sub_100B8200:PROC
EXTRN sub_100B821D:PROC
EXTRN sub_100B8224:PROC
EXTRN sub_100B8266:PROC
EXTRN sub_100B826C:PROC
EXTRN sub_100B826E:PROC
EXTRN sub_100B8273:PROC
EXTRN sub_100B8276:PROC
EXTRN sub_100B828D:PROC
EXTRN sub_100B8294:PROC
EXTRN sub_100B82BE:PROC
EXTRN EXTRN g_1019BC88:DWORD:DWORD
.CODE
FUN_100b75db PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 96
    push push ebx
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [eax]
    and and ecx, 0FFFFFh
    mov mov dword ptr [ebp - 32], ebx
    mov mov dword ptr [ebp - 16], ecx
    jne L0
    xor xor eax, eax
    inc inc eax
    jmp L29
    mov mov eax, dword ptr [eax + 4]
    xor xor edx, edx
    div div ecx
    and and dword ptr [ebp - 60], 0
    push push esi
    push push edi
    test test eax, eax
    mov mov dword ptr [ebp - 64], eax
    jbe L30
    and and dword ptr [ebp - 48], 0
    or or esi, -1
    mov mov eax, esi
L0:
    lea lea edi, [ebp - 80]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 16], ecx
    stosd stosd dword ptr es:[edi], eax
    mov mov dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 28], ecx
    mov mov dword ptr [ebp - 24], ecx
    mov mov dword ptr [ebp - 36], ecx
    mov mov dword ptr [ebp - 40], ecx
    stosd stosd dword ptr es:[edi], eax
    mov mov dword ptr [ebp - 12], esi
    mov mov dword ptr [ebp - 8], esi
    jbe L8
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [eax + 8]
    add add eax, dword ptr [ebp - 48]
    mov mov dword ptr [ebp - 44], eax
    mov mov eax, dword ptr [ebp - 16]
    mov mov dword ptr [ebp - 56], eax
    mov mov eax, dword ptr [ebp - 44]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [eax + 16]
    xor xor edi, edi
    sub sub edx, edi
    je L7
    dec dec edx
    je L6
    dec dec edx
    je L1
    dec dec edx
    jne L10
    cmp cmp dword ptr [ebp - 8], -1
    jne L11
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 72]
    shl shl edx, 2
    or or dword ptr [ebp + edx - 80], -1
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 8], ecx
    mov mov dword ptr [ebp + edx - 96], ecx
    je L12
    mov mov ecx, dword ptr [ebx + 24]
    mov mov edi, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [edi]
    mov mov ecx, eax
    and and ecx, 0FFF00000h
    cmp cmp ecx, 010000000h
    mov mov dword ptr [ebp - 40], edi
    jne L3
    xor xor ecx, ecx
    and and eax, 0FFFFFh
    jbe L13
    mov mov edx, dword ptr [edi + 16]
    mov mov esi, dword ptr [edx]
    cmp cmp esi, dword ptr [ebp - 8]
    je L4
    inc inc ecx
    add add edx, 4
    cmp cmp ecx, eax
    jb L2
    mov mov esi, dword ptr [ebp - 12]
    jmp L14
    mov mov eax, dword ptr [edi + 8]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [ebp - 8], eax
    jmp L5
    and and dword ptr [ebp - 40], 0
    jmp L16
    cmp cmp esi, -1
    jne L18
    mov mov edx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + 72]
    shl shl edx, 2
    or or dword ptr [ebp + edx - 80], -1
    cmp cmp eax, -1
    mov mov esi, ecx
    mov mov dword ptr [ebp - 12], esi
    mov mov dword ptr [ebp + edx - 96], ecx
    je L19
    mov mov ecx, dword ptr [ebx + 24]
    mov mov edi, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [edi]
    mov mov ecx, eax
    and and ecx, 0FFF00000h
    cmp cmp ecx, 010000000h
    mov mov dword ptr [ebp - 36], edi
    jne L16
    xor xor ecx, ecx
    and and eax, 0FFFFFh
    jbe L20
    mov mov edx, dword ptr [edi + 16]
    cmp cmp dword ptr [edx], esi
    je L17
    inc inc ecx
    add add edx, 4
    cmp cmp ecx, eax
    jb L15
    jmp L21
    mov mov eax, dword ptr [edi + 8]
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov dword ptr [ebp - 12], esi
    jmp L22
    and and dword ptr [ebp - 36], 0
    jmp L23
    cmp cmp dword ptr [eax + 72], -1
    je L24
    cmp cmp dword ptr [ebp - 24], edi
    jne L26
    mov mov eax, dword ptr [eax + 72]
    mov mov edx, dword ptr [ebx + 24]
    mov mov edx, dword ptr [edx + eax*4]
    mov mov dword ptr [ebp - 24], edx
    jmp L25
    cmp cmp dword ptr [eax + 72], -1
    je L27
    cmp cmp dword ptr [ebp - 28], edi
    jne L28
    mov mov eax, dword ptr [eax + 72]
    mov mov edx, dword ptr [ebx + 24]
    mov mov edx, dword ptr [edx + eax*4]
    mov mov dword ptr [ebp - 28], edx
    mov mov edx, dword ptr [ebp - 4]
    shl shl edx, 2
    mov mov dword ptr [ebp + edx - 80], eax
    mov mov dword ptr [ebp + edx - 96], ecx
    inc inc dword ptr [ebp - 4]
    add add dword ptr [ebp - 44], 4
    dec dec dword ptr [ebp - 56]
    jne L9
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 16]
    jne L48
    cmp cmp eax, 1
    jbe L49
    mov mov edx, dword ptr [ebp - 24]
    xor xor ecx, ecx
    test test edx, edx
    je L35
    cmp cmp dword ptr [edx], 020500001h
    jne L36
    cmp cmp esi, -1
    je L32
    mov mov eax, dword ptr [edx + 8]
    cmp cmp esi, dword ptr [eax]
L3:
    je L33
    cmp cmp esi, dword ptr [eax + 4]
    je L34
    inc inc ecx
    mov mov edi, dword ptr [ebp - 8]
    cmp cmp edi, -1
    je L39
    mov mov eax, dword ptr [edx + 8]
    cmp cmp edi, dword ptr [eax]
    je L37
    cmp cmp edi, dword ptr [eax + 4]
    je L38
    xor xor ecx, ecx
    inc inc ecx
L5:
    cmp cmp esi, -1
    je L40
    cmp cmp edi, esi
    mov mov eax, dword ptr [edx + 8]
    mov mov edx, dword ptr [eax]
    je L41
    cmp cmp edx, dword ptr [eax + 4]
    jne L43
    jmp L42
    cmp cmp edx, dword ptr [eax + 4]
    je L44
L7:
    xor xor ecx, ecx
    inc inc ecx
    mov mov eax, dword ptr [ebp - 28]
    xor xor edx, edx
L8:
    cmp cmp eax, edx
    je L45
    cmp cmp dword ptr [eax], 010000001h
    jne L55
    mov mov eax, dword ptr [eax + 8]
    mov mov esi, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [esi + eax*4]
    mov mov esi, dword ptr [eax + 4]
    mov mov edi, dword ptr [ebx + 16]
    mov mov esi, dword ptr [edi + esi*4]
    test test byte ptr [esi + 5], 1
    je L46
    fld fld qword ptr [g_1019BC88]
    fld fld qword ptr [eax + 32]
    fucompp fucompp
L10:
    fnstsw fnstsw ax
    test test ah, 68
    jnp L47
    xor xor ecx, ecx
    inc inc ecx
L11:
    cmp cmp ecx, edx
    jne L63
    cmp cmp dword ptr [ebp - 4], edx
    mov mov dword ptr [ebp - 56], edx
    jbe L64
    mov mov eax, dword ptr [ebp + edx*4 - 80]
    cmp cmp eax, -1
L12:
    mov mov dword ptr [ebp - 52], eax
    je L61
    mov mov eax, dword ptr [ebp - 16]
    test test eax, eax
    mov mov dword ptr [ebp - 20], 1
    mov mov dword ptr [ebp - 28], eax
    jbe L52
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov edx, dword ptr [ebx + 20]
    mov mov esi, dword ptr [ebx + 0FCh]
    add add eax, dword ptr [ebp - 48]
    mov mov dword ptr [ebp - 44], ecx
    mov mov ecx, dword ptr [eax]
    mov mov ecx, dword ptr [edx + ecx*4]
    cmp cmp dword ptr [ecx + 80], esi
    jae L50
    and and dword ptr [ebp - 20], 0
    mov mov edi, dword ptr [ebp - 52]
    cmp cmp dword ptr [ecx + 76], edi
    jbe L51
    and and dword ptr [ebp - 20], 0
    cmp cmp dword ptr [ebp - 36], 0
    jne L53
L15:
    cmp cmp dword ptr [ecx + 16], 2
    je L56
L17:
    cmp cmp dword ptr [ebp - 40], 0
    jne L57
    cmp cmp dword ptr [ecx + 16], 3
    jne L58
    dec dec dword ptr [ebp - 28]
    jmp L59
    mov mov ecx, dword ptr [ecx + 84]
    cmp cmp ecx, dword ptr [ebp - 52]
    jae L62
    and and dword ptr [ebp - 20], 0
    add add eax, 4
    dec dec dword ptr [ebp - 44]
    jne L54
    mov mov edx, dword ptr [ebp - 56]
    and and dword ptr [ebp - 44], 0
    mov mov eax, dword ptr [ebp - 44]
    mov mov eax, dword ptr [ebp + eax*4 - 80]
    cmp cmp eax, -1
    je sub_100B7CB1
    mov mov ecx, dword ptr [ebx + 24]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 4]
    test test ecx, ecx
    jbe sub_100B7CBE
    mov mov edx, dword ptr [ebx + 20]
L20:
    mov mov eax, dword ptr [eax + 8]
    mov mov ebx, dword ptr [ebp - 52]
    mov mov edi, ecx
    mov mov ecx, dword ptr [eax]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov esi, dword ptr [ecx + 72]
    cmp cmp esi, ebx
    jbe sub_100B7CC0
    cmp cmp esi, -1
    jne sub_100B7CCA
    cmp cmp dword ptr [ecx + 80], ebx
L22:
    jae sub_100B7CD3
    and and dword ptr [ebp - 20], 0
L23:
    add add eax, 4
    dec dec edi
    jne sub_100B7CC3
    mov mov edx, dword ptr [ebp - 56]
L24:
    mov mov ebx, dword ptr [ebp - 32]
    inc inc dword ptr [ebp - 44]
    mov mov eax, dword ptr [ebp - 44]
    cmp cmp eax, dword ptr [ebp - 4]
    jb sub_100B7CB0
    cmp cmp dword ptr [ebp - 20], 0
    jne sub_100B7D20
    inc inc edx
    cmp cmp edx, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 56], edx
    jb L60
    jmp sub_100B7D43
    mov mov eax, dword ptr [ebp + edx*4 - 80]
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 56], eax
    je sub_100B7D4F
    mov mov edi, dword ptr [ebp - 28]
    cmp cmp edi, 2
    jae sub_100B7D77
    mov mov eax, dword ptr [ebp - 16]
    inc inc dword ptr [ebp - 60]
    shl shl eax, 2
    add add dword ptr [ebp - 48], eax
    mov mov eax, dword ptr [ebp - 60]
    cmp cmp eax, dword ptr [ebp - 64]
    jb L31
    xor xor eax, eax
    inc inc eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    push push 116
    call sub_10085BF9
    test test eax, eax
    je sub_100B7DB8
    mov mov ecx, eax
    call sub_10085769
    mov mov esi, eax
    jmp sub_100B7DC5
    xor xor esi, esi
    test test esi, esi
    jne sub_100B7DD6
    mov mov eax, 08007000Eh
    jmp sub_100B7DB5
    push push 0
    push push edi
L29:
    lea lea eax, [edi + edi]
    push push eax
    mov mov eax, edi
    and and eax, 0FFFFFh
    or or eax, 070900000h
    push push eax
    mov mov ecx, esi
L30:
    call sub_10085C7B
    test test eax, eax
    jge sub_100B7E22
    mov mov edi, eax
    jmp sub_100B7FED
    push push dword ptr [ebx + 0100h]
    mov mov ecx, esi
    call sub_100857E4
    test test eax, eax
    jl sub_100B7E33
    xor xor ecx, ecx
    test test edi, edi
    jbe sub_100B7EC8
    mov mov eax, edi
    shl shl eax, 2
    mov mov edx, dword ptr [ebp - 24]
L33:
    test test edx, edx
    je sub_100B7E85
    mov mov edx, dword ptr [edx + 8]
    mov mov edx, dword ptr [edx]
    mov mov edi, dword ptr [esi + 8]
    mov mov dword ptr [edi + ecx*4], edx
    mov mov edx, dword ptr [ebp - 24]
    mov mov edx, dword ptr [edx + 8]
    mov mov edx, dword ptr [edx + 4]
    jmp sub_100B7EDB
    mov mov edx, dword ptr [ebp - 8]
    cmp cmp edx, -1
L35:
    jne sub_100B7ED7
    mov mov edx, dword ptr [ebp - 12]
L36:
    cmp cmp edx, -1
    jne sub_100B7EE5
    mov mov eax, dword ptr [ebx + 0100h]
    push push 010117D9Ch
    push push 012D9h
    push push dword ptr [eax + 60]
    push push ebx
    call sub_1008B53E
    xor xor edi, edi
    add add esp, 16
    inc inc edi
    jmp sub_100B805A
    cmp cmp dword ptr [ebp - 12], -1
    jne sub_100B7EE5
    mov mov edi, dword ptr [esi + 8]
L41:
    mov mov dword ptr [edi + ecx*4], edx
    mov mov edi, dword ptr [esi + 8]
    mov mov dword ptr [eax + edi], edx
    inc inc ecx
    add add eax, 4
L43:
    cmp cmp ecx, dword ptr [ebp - 28]
    jb sub_100B7ECD
    xor xor edx, edx
L44:
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 4], edx
    jbe sub_100B7F86
    cmp cmp dword ptr [ebp - 36], 0
    mov mov eax, dword ptr [ebp + edx*4 - 96]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    jne sub_100B7F71
    cmp cmp dword ptr [ecx + 16], 2
    je sub_100B7F8A
    cmp cmp dword ptr [ebp - 40], 0
    jne sub_100B7F89
    cmp cmp dword ptr [ecx + 16], 3
    je sub_100B7F96
    mov mov ecx, dword ptr [esi + 16]
    mov mov dword ptr [ecx + edi*4], eax
    inc inc edi
    cmp cmp edi, dword ptr [ebp - 28]
    ja sub_100B8073
    mov mov ebx, dword ptr [ebp - 32]
    inc inc edx
    cmp cmp edx, dword ptr [ebp - 4]
    jb sub_100B7F86
    mov mov eax, dword ptr [esi + 12]
    and and dword ptr [ebp - 16], 0
    test test eax, eax
    jbe sub_100B804A
    mov mov dword ptr [ebp - 60], 1
    mov mov ecx, dword ptr [ebp - 60]
    cmp cmp ecx, eax
    mov mov dword ptr [ebp - 48], ecx
    jae sub_100B804D
    mov mov eax, dword ptr [esi + 16]
    mov mov edx, dword ptr [ebp - 16]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov ecx, dword ptr [ebx + 20]
    mov mov edi, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [ebp - 48]
    shl shl edx, 2
L46:
    mov mov eax, dword ptr [edx + eax]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [edi + 16]
    cmp cmp eax, dword ptr [ecx + 16]
    jbe sub_100B805D
    mov mov eax, dword ptr [esi + 16]
    add add edx, eax
    mov mov ebx, dword ptr [edx]
L47:
    mov mov dword ptr [ebp - 64], ebx
    mov mov ebx, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [esi + 16]
    mov mov edx, dword ptr [ebp - 64]
    mov mov dword ptr [eax + ebx*4], edx
    mov mov ebx, dword ptr [ebp - 32]
    mov mov eax, dword ptr [edi + 16]
    cmp cmp eax, dword ptr [ecx + 16]
    je sub_100B80FD
    inc inc dword ptr [ebp - 48]
    mov mov eax, dword ptr [ebp - 48]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_100B804D
    inc inc dword ptr [ebp - 16]
    mov mov eax, dword ptr [esi + 12]
    inc inc dword ptr [ebp - 60]
    cmp cmp dword ptr [ebp - 16], eax
    jb sub_100B8051
    xor xor edx, edx
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 4], edx
    jbe sub_100B80E6
    mov mov eax, dword ptr [ebp + ecx*4 - 80]
    cmp cmp eax, -1
    je sub_100B80E9
    mov mov edi, dword ptr [ebx + 24]
    mov mov eax, dword ptr [edi + eax*4]
    mov mov dword ptr [eax], edx
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp - 4]
    jb sub_100B80E6
    mov mov ecx, dword ptr [ebp - 36]
    cmp cmp ecx, edx
    mov mov edi, 010000002h
    je sub_100B81A2
    mov mov eax, dword ptr [ecx]
    cmp cmp eax, 010000001h
    jne sub_100B8180
    mov mov dword ptr [ecx], edx
    jmp sub_100B81AF
    mov mov eax, dword ptr [ebp - 32]
    mov mov ecx, dword ptr [eax + 0100h]
    push push 010117D9Ch
    push push 012DAh
L49:
    push push dword ptr [ecx + 60]
    push push eax
    jmp sub_100B8029
    mov mov eax, dword ptr [ebx + 0100h]
    push push 010117D6Ch
    push push 012DBh
    push push dword ptr [eax + 60]
    push push ebx
    call sub_1008B698
    add add esp, 16
    mov mov edi, 080004005h
    push push 1
    mov mov ecx, esi
    call sub_1006CA0C
L50:
    mov mov eax, edi
    jmp sub_100B7FAF
    cmp cmp eax, edi
    jne sub_100B8200
    mov mov eax, dword ptr [ecx + 8]
    mov mov edx, dword ptr [eax]
    cmp cmp edx, dword ptr [ebp - 12]
    jne sub_100B81F8
    mov mov edx, dword ptr [eax + 4]
L51:
    cmp cmp edx, dword ptr [ebp - 8]
L52:
    jne sub_100B8200
    and and dword ptr [ecx], 0
    mov mov edx, dword ptr [ebp - 12]
    cmp cmp dword ptr [eax + 4], edx
    jne sub_100B821D
    mov mov eax, dword ptr [eax]
    cmp cmp eax, dword ptr [ebp - 8]
    jne sub_100B8224
    and and dword ptr [ecx], 0
    mov mov ecx, dword ptr [ebp - 40]
    test test ecx, ecx
    je sub_100B8266
L55:
    mov mov eax, dword ptr [ecx]
    cmp cmp eax, 010000001h
L56:
    je sub_100B826C
    cmp cmp eax, edi
    jne sub_100B8273
    mov mov eax, dword ptr [ecx + 8]
    mov mov edx, dword ptr [ebp - 12]
    cmp cmp dword ptr [eax], edx
    jne sub_100B826E
    mov mov edi, dword ptr [eax + 4]
    cmp cmp edi, dword ptr [ebp - 8]
    jne sub_100B8276
    and and dword ptr [ecx], 0
    cmp cmp dword ptr [eax + 4], edx
    jne sub_100B828D
    mov mov edx, dword ptr [ebp - 8]
    cmp cmp dword ptr [eax], edx
    jne sub_100B8294
    and and dword ptr [ecx], 0
L62:
    mov mov edi, dword ptr [ebp - 56]
    mov mov eax, dword ptr [ebx + 24]
L63:
    shl shl edi, 2
    mov mov ecx, dword ptr [edi + eax]
    test test ecx, ecx
    je sub_100B82BE
    push push 1
L64:
    call sub_1006CA8D
    mov mov eax, dword ptr [ebx + 24]
    mov mov dword ptr [edi + eax], esi
    xor xor eax, eax
    jmp sub_100B8036
FUN_100b75db ENDP
END
