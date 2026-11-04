.686
.MODEL FLAT, C
EXTRN sub_10065555:PROC
EXTRN sub_100655C4:PROC
EXTRN sub_100655ED:PROC
EXTRN sub_1006561C:PROC
EXTRN sub_10065648:PROC
EXTRN sub_100656CE:PROC
EXTRN sub_100656ED:PROC
EXTRN sub_10082DDC:PROC
EXTRN sub_10082EE4:PROC
EXTRN sub_10082FCD:PROC
EXTRN sub_10082FD8:PROC
EXTRN sub_10083037:PROC
EXTRN sub_100831DC:PROC
EXTRN sub_1008323A:PROC
EXTRN sub_100833A6:PROC
EXTRN sub_100835F0:PROC
EXTRN sub_10083A3E:PROC
EXTRN sub_10083EE9:PROC
EXTRN sub_10083FE8:PROC
EXTRN sub_10099D2A:PROC
EXTRN sub_1009A2BE:PROC
EXTRN sub_1009B3A3:PROC
EXTRN sub_1009B3B2:PROC
EXTRN sub_1009B3B6:PROC
EXTRN sub_1009B3BB:PROC
EXTRN sub_1009B3BE:PROC
EXTRN sub_1009B3C2:PROC
EXTRN sub_1009B3CC:PROC
EXTRN sub_1009B3D0:PROC
EXTRN sub_1009B3D4:PROC
EXTRN sub_1009B3EB:PROC
EXTRN sub_1009B3ED:PROC
EXTRN sub_1009B3F1:PROC
EXTRN sub_1009B423:PROC
EXTRN sub_1009B425:PROC
EXTRN sub_1009B447:PROC
EXTRN sub_1009B472:PROC
EXTRN sub_1009B486:PROC
EXTRN sub_1009B487:PROC
EXTRN sub_1009B488:PROC
EXTRN sub_1009B4CB:PROC
EXTRN sub_1009B4CC:PROC
EXTRN sub_1009B4CF:PROC
EXTRN sub_1009B51E:PROC
EXTRN sub_1009B5B3:PROC
EXTRN sub_1009B5C6:PROC
EXTRN sub_1009B5CA:PROC
EXTRN sub_1009B5CC:PROC
EXTRN sub_1009B5D1:PROC
EXTRN sub_1009B603:PROC
EXTRN sub_1009B612:PROC
EXTRN sub_1009B64E:PROC
EXTRN sub_1009B670:PROC
EXTRN sub_1009B679:PROC
EXTRN sub_1009B682:PROC
EXTRN sub_1009B6AD:PROC
EXTRN sub_1009B6C2:PROC
EXTRN sub_1009B701:PROC
EXTRN sub_1009B734:PROC
EXTRN sub_1009B76D:PROC
EXTRN sub_1009B78F:PROC
EXTRN sub_1009B7A3:PROC
EXTRN sub_1009B7E1:PROC
EXTRN sub_1009B7F5:PROC
EXTRN sub_1009B839:PROC
EXTRN sub_1009B847:PROC
EXTRN sub_1009B851:PROC
EXTRN sub_1009B85D:PROC
EXTRN sub_1009B882:PROC
EXTRN sub_1009B890:PROC
EXTRN sub_1009B89D:PROC
EXTRN sub_1009B8A1:PROC
EXTRN sub_1009B8F2:PROC
EXTRN sub_1009B919:PROC
EXTRN sub_1009B945:PROC
EXTRN sub_1009B96D:PROC
EXTRN sub_1009B9A0:PROC
EXTRN sub_1009B9A1:PROC
EXTRN sub_1009B9CA:PROC
EXTRN sub_1009B9E9:PROC
EXTRN sub_1009B9F2:PROC
EXTRN sub_1009BA05:PROC
EXTRN sub_1009BA20:PROC
EXTRN sub_1009BA2B:PROC
.CODE
FUN_1009acc9 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0160h
    mov mov eax, dword ptr [ebp + 16]
    push push ebx
    xor xor ebx, ebx
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 20], ecx
    je L0
    mov mov dword ptr [eax], ebx
    mov mov eax, dword ptr [ebp + 20]
    cmp cmp eax, ebx
    je L1
    mov mov dword ptr [eax], ebx
    mov mov eax, dword ptr [ebp + 12]
    xor xor edx, edx
    cmp cmp eax, ebx
    je L5
    mov mov ecx, dword ptr [eax + 8]
    cmp cmp ecx, ebx
    je L3
    cmp cmp dword ptr [ecx + 4], 13
    jne L4
    mov mov ecx, dword ptr [ecx + 16]
    cmp cmp ecx, ebx
    je L6
    cmp cmp dword ptr [ecx + 4], 9
L1:
    jne L7
    mov mov eax, dword ptr [eax + 12]
    inc inc edx
    cmp cmp eax, ebx
    jne L2
    cmp cmp eax, ebx
    jne L8
    cmp cmp edx, 4
    jbe L9
    xor xor eax, eax
    inc inc eax
    jmp sub_1009B3D4
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + 8]
    push push esi
    mov mov dword ptr [ebp - 4], 94
    mov mov dword ptr [ebp - 16], eax
    push push edi
    mov mov eax, dword ptr [ebp - 4]
    mov mov edi, dword ptr [ebp - 16]
    add add eax, ebx
    shr shr eax, 1
    mov mov ecx, eax
    imul imul ecx, ecx, 0A4h
    mov mov esi, dword ptr [ecx + 0101107FCh]
    mov mov dl, byte ptr [edi]
L5:
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi]
    jne L12
    test test cl, cl
    je L12
    mov mov dl, byte ptr [edi + 1]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi + 1]
    jne L13
    inc inc edi
    inc inc edi
    inc inc esi
    inc inc esi
    test test cl, cl
    jne L10
    xor xor ecx, ecx
L8:
    jmp L14
    sbb sbb ecx, ecx
    sbb sbb ecx, -1
    test test ecx, ecx
    jle L15
    lea lea ebx, [eax + 1]
    jmp L16
    jge L17
    mov mov dword ptr [ebp - 4], eax
    cmp cmp ebx, dword ptr [ebp - 4]
    jb L11
    jmp L25
    test test eax, eax
    lea lea ecx, [eax + 1]
    mov mov ebx, eax
    mov mov dword ptr [ebp - 4], ecx
    jbe L19
    imul imul eax, eax, 0A4h
    lea lea edi, [eax + 010110758h]
    mov mov ecx, dword ptr [edi]
    mov mov esi, dword ptr [ebp - 16]
    mov mov al, byte ptr [esi]
    mov mov dl, al
    cmp cmp al, byte ptr [ecx]
    jne L20
    test test dl, dl
    je L20
    mov mov al, byte ptr [esi + 1]
    mov mov dl, al
    cmp cmp al, byte ptr [ecx + 1]
    jne L22
    inc inc esi
    inc inc esi
    inc inc ecx
    inc inc ecx
    test test dl, dl
    jne L18
    xor xor ecx, ecx
    jmp L23
    sbb sbb ecx, ecx
    sbb sbb ecx, -1
    test test ecx, ecx
    jne L24
    dec dec ebx
    sub sub edi, 0A4h
    test test ebx, ebx
    ja L21
    mov mov edi, dword ptr [ebp - 4]
    cmp cmp edi, 94
    jae L27
    imul imul edi, edi, 0A4h
    add add edi, 0101107FCh
    mov mov eax, dword ptr [edi]
    mov mov esi, dword ptr [ebp - 16]
L11:
    mov mov dl, byte ptr [esi]
    mov mov cl, dl
    cmp cmp dl, byte ptr [eax]
    jne L28
L12:
    test test cl, cl
    je L28
    mov mov dl, byte ptr [esi + 1]
    mov mov cl, dl
    cmp cmp dl, byte ptr [eax + 1]
    jne L30
L13:
    inc inc esi
    inc inc esi
    inc inc eax
    inc inc eax
    test test cl, cl
    jne L26
    xor xor eax, eax
    jmp L31
    sbb sbb eax, eax
    sbb sbb eax, -1
L14:
    test test eax, eax
    jne L32
    inc inc dword ptr [ebp - 4]
    add add edi, 0A4h
    cmp cmp dword ptr [ebp - 4], 94
    jb L29
    cmp cmp ebx, dword ptr [ebp - 4]
    je L50
L16:
    mov mov dword ptr [ebp - 16], ebx
    jae L51
    imul imul ebx, ebx, 0A4h
    add add ebx, 0101107F8h
    mov mov dword ptr [ebp - 12], ebx
    or or eax, -1
    lea lea edi, [ebp - 80]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    push push 30
    pop pop eax
    lea lea edi, [ebp - 40]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov esi, dword ptr [ebp - 12]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    push push 5
    pop pop eax
    lea lea edi, [ebp - 60]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    lea lea ecx, [ebp - 088h]
    stosd stosd dword ptr es:[edi], eax
    call sub_10082FCD
    lea lea ecx, [ebp - 0ACh]
    call sub_10082FD8
    mov mov ebx, dword ptr [ebp + 12]
    test test ebx, ebx
    mov mov dword ptr [ebp - 8], 1
    je L47
    lea lea edi, [esi + 44]
    cmp cmp dword ptr [ebp - 8], 5
    jae L44
L18:
    cmp cmp dword ptr [edi - 8], 0
    je L45
    mov mov eax, dword ptr [ebx + 8]
    mov mov esi, dword ptr [eax + 16]
    mov mov eax, dword ptr [edi]
    mov mov eax, dword ptr [ebp + eax*4 - 60]
    cmp cmp eax, 5
    je L34
    test test eax, eax
    jne L33
    mov mov ecx, dword ptr [esi + 16]
    cmp cmp ecx, 1
    je L35
    cmp cmp ecx, 2
    je L37
    mov mov ecx, dword ptr [esi + 16]
    test test ecx, ecx
    jne L36
    test test eax, eax
    je L39
    cmp cmp eax, 1
    je L40
    cmp cmp eax, 2
    jmp L38
    cmp cmp ecx, eax
L24:
    jne L48
    jmp L41
    mov mov eax, dword ptr [edi]
    mov mov ecx, dword ptr [esi + 16]
    shl shl eax, 2
    mov mov dword ptr [ebp + eax - 60], ecx
    mov mov ecx, dword ptr [edi + 4]
    mov mov dword ptr [ebp + eax - 100], ecx
    mov mov eax, dword ptr [edi + 8]
    cmp cmp dword ptr [ebp + eax*4 - 40], 30
    jne L42
    mov mov ecx, dword ptr [esi + 20]
    shl shl eax, 2
    mov mov dword ptr [ebp + eax - 40], ecx
    mov mov ecx, dword ptr [edi + 12]
    mov mov dword ptr [ebp + eax - 100], ecx
    jmp L46
    mov mov eax, dword ptr [ebp + eax*4 - 40]
    mov mov ecx, dword ptr [ebp - 20]
    mov mov dword ptr [ebp - 116], eax
    mov mov eax, dword ptr [esi + 20]
    mov mov dword ptr [ebp - 098h], eax
    mov mov eax, dword ptr [edi + 8]
    lea lea eax, [ebp + eax*4 - 40]
    push push eax
    lea lea eax, [ebp - 0ACh]
    push push eax
    lea lea eax, [ebp - 088h]
    push push eax
    call sub_1009A2BE
L27:
    test test eax, eax
    jl L55
    mov mov edx, dword ptr [esi + 16]
    test test edx, edx
    je L53
    mov mov eax, dword ptr [edi + 16]
    test test eax, eax
    jge L49
    mov mov ecx, dword ptr [esi + 24]
    not not eax
    lea lea eax, [ebp + eax*4 - 80]
    cmp cmp dword ptr [eax], ecx
    jbe L50
    mov mov dword ptr [eax], ecx
    jmp L52
    cmp cmp dword ptr [esi + 24], eax
    jb L60
    test test edx, edx
    je L56
    mov mov eax, dword ptr [edi + 20]
    test test eax, eax
    jge L57
    mov mov ecx, dword ptr [esi + 28]
    not not eax
    lea lea eax, [ebp + eax*4 - 80]
L32:
    cmp cmp dword ptr [eax], ecx
    jbe L58
    mov mov dword ptr [eax], ecx
    jmp L59
    cmp cmp dword ptr [esi + 28], eax
    jb L62
    test test byte ptr [edi - 4], 32
    je L61
    mov mov ecx, dword ptr [ebp - 20]
    push push esi
    call sub_10099D2A
    test test eax, eax
    jne L63
    mov mov ebx, dword ptr [ebx + 12]
    inc inc dword ptr [ebp - 8]
    add add edi, 32
    test test ebx, ebx
    jne L43
    test test ebx, ebx
    jne sub_1009B3A3
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, 5
    mov mov esi, dword ptr [ebp - 12]
    jae L64
    shl shl eax, 5
    cmp cmp dword ptr [eax + esi + 4], ebx
    jne sub_1009B3BB
    cmp cmp dword ptr [esi + 8], 0
    je L66
    mov mov eax, dword ptr [esi + 12]
    lea lea eax, [ebp + eax*4 - 60]
    cmp cmp dword ptr [eax], 5
    jne L65
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [eax], ecx
    mov mov eax, dword ptr [esi + 20]
    lea lea eax, [ebp + eax*4 - 40]
    cmp cmp dword ptr [eax], 30
    jne L67
    mov mov ecx, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [eax], ecx
    mov mov ebx, dword ptr [ebp - 12]
    and and dword ptr [ebp - 8], 0
    add add ebx, 24
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebx - 8]
    lea lea ecx, [ebp + ecx*4 - 60]
    mov mov esi, dword ptr [ecx]
    push push 5
    pop pop edi
    cmp cmp esi, edi
    je sub_1009B3BE
    test test esi, esi
    jne sub_1009B3B6
    mov mov edx, dword ptr [eax]
    cmp cmp edx, 1
    je sub_1009B3B2
    cmp cmp edx, 2
    jne sub_1009B3C2
    mov mov dword ptr [ecx], edx
    jmp sub_1009B3CC
    cmp cmp esi, ecx
    je sub_1009B3D0
    add add eax, 4
    mov mov ecx, dword ptr [eax]
    cmp cmp ecx, edi
    jne sub_1009B3CC
    cmp cmp dword ptr [eax], edi
    je sub_1009B423
    jmp sub_1009B3ED
    test test eax, eax
    je sub_1009B3F1
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ecx], eax
    mov mov ecx, dword ptr [ebp - 8]
    mov mov esi, dword ptr [ebx]
    lea lea ecx, [ebp + ecx*4 - 40]
    mov mov edi, dword ptr [ecx]
    cmp cmp edi, 30
    mov mov eax, esi
    jne sub_1009B472
    test test eax, eax
    je sub_1009B425
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [ebp - 8]
    lea lea eax, [ebp + eax*4 - 80]
    cmp cmp dword ptr [eax], -1
    jne sub_1009B447
    mov mov dword ptr [eax], 1
    inc inc dword ptr [ebp - 8]
    add add ebx, 32
    cmp cmp dword ptr [ebp - 8], 5
    jb sub_1009B3EB
    cmp cmp dword ptr [ebp - 8], 5
    je sub_1009B487
    inc inc dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 16]
    add add dword ptr [ebp - 12], 0A4h
    cmp cmp eax, dword ptr [ebp - 4]
    jb L54
    mov mov edi, dword ptr [ebp - 16]
    cmp cmp edi, dword ptr [ebp - 4]
    jne sub_1009B4CC
    xor xor eax, eax
    inc inc eax
    jmp sub_1009B76D
    cmp cmp edi, edx
    je sub_1009B4CF
    add add eax, 4
    mov mov edx, dword ptr [eax]
    cmp cmp edx, 30
    jne sub_1009B4CB
    cmp cmp dword ptr [eax], 30
    jne sub_1009B486
    mov mov eax, dword ptr [esi]
    jmp sub_1009B488
    cmp cmp dword ptr [ebp + 16], 0
    je sub_1009B734
L33:
    push push 5
    lea lea esi, [ebp - 0160h]
    pop pop edi
    mov mov ecx, esi
    call sub_1008323A
    add add esi, 36
    dec dec edi
    jne sub_1009B51E
    mov mov ebx, dword ptr [ebp - 16]
    xor xor edi, edi
L34:
    imul imul ebx, ebx, 0A4h
    lea lea eax, [ebp - 0148h]
L35:
    lea lea ecx, [ebx + 010110814h]
    cmp cmp dword ptr [ecx - 24], 0
    je sub_1009B5CC
    mov mov edx, dword ptr [ecx - 20]
    test test edx, edx
    mov mov dword ptr [ebp + 12], edx
    je sub_1009B5CA
    mov mov edx, dword ptr [ecx - 16]
    mov mov edx, dword ptr [ebp + edx*4 - 60]
    mov mov dword ptr [eax - 8], edx
    mov mov edx, dword ptr [ecx - 8]
L39:
    mov mov edx, dword ptr [ebp + edx*4 - 40]
    mov mov dword ptr [eax - 4], edx
    mov mov edx, dword ptr [ecx]
    test test edx, edx
    jge sub_1009B5B3
    not not edx
    mov mov edx, dword ptr [ebp + edx*4 - 80]
    mov mov dword ptr [eax], edx
    mov mov edx, dword ptr [ecx + 4]
    test test edx, edx
    jge sub_1009B5D1
    not not edx
    mov mov edx, dword ptr [ebp + edx*4 - 80]
    mov mov esi, dword ptr [ebp + 12]
    and and esi, 0C00h
    test test edi, edi
    mov mov dword ptr [eax + 4], edx
    mov mov dword ptr [eax + 8], esi
    je sub_1009B603
    test test byte ptr [ebp + 12], 32
    jne sub_1009B612
    or or esi, 0200h
    mov mov dword ptr [eax + 8], esi
    inc inc edi
    add add ecx, 32
    add add eax, 36
    cmp cmp edi, 5
L42:
    jb sub_1009B5C6
    cmp cmp dword ptr [ebp - 0150h], 1
    je sub_1009B64E
    cmp cmp dword ptr [ebp - 0150h], 2
    jne sub_1009B670
    cmp cmp dword ptr [ebp - 0144h], 1
    jne sub_1009B679
    cmp cmp dword ptr [ebp - 0148h], 1
    jne sub_1009B682
    and and dword ptr [ebp - 0150h], 0
    push push 64
    call sub_10065555
    test test eax, eax
    je sub_1009B6AD
    mov mov ecx, eax
    call sub_100833A6
    mov mov esi, eax
    mov mov dword ptr [ebp - 4], esi
    jmp sub_1009B6C2
L47:
    and and dword ptr [ebp - 4], 0
    mov mov esi, dword ptr [ebp - 4]
    test test esi, esi
    je sub_1009B882
    cmp cmp dword ptr [ebx + 010110800h], 0
    je sub_1009B701
    lea lea ecx, [ebp - 0160h]
    call sub_10083EE9
    test test eax, eax
    mov mov dword ptr [esi + 32], eax
    je sub_1009B8A1
    add add esi, 36
    lea lea eax, [ebx + 01011081Ch]
    mov mov dword ptr [ebp - 12], esi
    mov mov dword ptr [ebp - 8], 1
    lea lea edi, [ebp - 0120h]
    mov mov dword ptr [ebp + 12], eax
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp dword ptr [eax], 0
    je sub_1009B85D
    push push 20
    call sub_100655C4
    test test eax, eax
    je sub_1009B78F
    push push 010114A3Ch
    push push 0
    push push 0
    mov mov ecx, eax
    call sub_10082DDC
L51:
    jmp sub_1009B7A3
    xor xor eax, eax
    test test eax, eax
    mov mov dword ptr [esi], eax
    je sub_1009B8F2
    push push 48
    call sub_100655ED
    test test eax, eax
    je sub_1009B7E1
    xor xor ecx, ecx
    push push ecx
    push push ecx
    push push ecx
    push push 1
    mov mov ecx, eax
    call sub_100831DC
    mov mov ebx, eax
L55:
    jmp sub_1009B7F5
    xor xor ebx, ebx
L56:
    test test ebx, ebx
L57:
    je sub_1009B919
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax]
    push push 48
    mov mov dword ptr [eax + 8], ebx
    call sub_1006561C
    test test eax, eax
    je sub_1009B839
    push push dword ptr [ebp + 8]
    mov mov ecx, eax
L60:
    call sub_10083037
    jmp sub_1009B847
    xor xor eax, eax
    test test eax, eax
    mov mov dword ptr [ebx + 20], eax
    je sub_1009B945
    mov mov ecx, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ecx]
    push push 64
    mov mov dword ptr [eax + 24], ecx
    call sub_10065648
    test test eax, eax
    je sub_1009B890
    mov mov ecx, eax
    call sub_100835F0
    mov mov esi, eax
    jmp sub_1009B89D
    xor xor esi, esi
L63:
    test test esi, esi
    je sub_1009B96D
    mov mov dword ptr [ebx + 24], esi
    or or dword ptr [esi + 16], -1
    mov mov eax, dword ptr [edi - 4]
    imul imul eax, dword ptr [edi]
    mov mov dword ptr [esi + 20], eax
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [esi + 24], 2
    mov mov eax, dword ptr [eax + 4]
    lea lea ecx, [edi - 28]
    mov mov dword ptr [esi + 28], eax
    call sub_10083FE8
    test test eax, eax
    mov mov dword ptr [esi + 32], eax
    je sub_1009B9A0
    mov mov eax, dword ptr [ebp - 12]
    mov mov esi, dword ptr [eax]
    add add dword ptr [ebp + 12], 32
L64:
    add add esi, 12
    inc inc dword ptr [ebp - 8]
    add add edi, 36
    cmp cmp dword ptr [ebp - 8], 5
    mov mov dword ptr [ebp - 12], esi
    jb sub_1009B851
    mov mov eax, dword ptr [ebp + 16]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [ebp - 16]
    mov mov dword ptr [eax], ecx
    mov mov ebx, dword ptr [ebp + 20]
    xor xor esi, esi
    cmp cmp ebx, esi
    je sub_1009B9CA
    push push 20
    call sub_100656CE
    cmp cmp eax, esi
    je sub_1009B9A1
    push push 010114A34h
    push push esi
    push push esi
    mov mov ecx, eax
    call sub_10082EE4
    mov mov esi, eax
    test test esi, esi
    je sub_1009B9F2
    push push 64
    call sub_100656ED
    test test eax, eax
    je sub_1009B9E9
    push push dword ptr [ebp + 8]
    imul imul edi, edi, 0A4h
    push push dword ptr [edi + 0101107F8h]
    mov mov ecx, eax
    push push 2
    call sub_10083A3E
    jmp sub_1009BA05
    xor xor eax, eax
    test test eax, eax
    mov mov dword ptr [esi + 8], eax
    je sub_1009BA20
    mov mov dword ptr [ebx], esi
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 16
    mov mov eax, 08007000Eh
    jmp sub_1009BA2B
FUN_1009acc9 ENDP
END
