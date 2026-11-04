.686
.MODEL FLAT, C
EXTRN sub_1006969A:PROC
EXTRN sub_100696BF:PROC
EXTRN sub_100696C8:PROC
EXTRN sub_100696C9:PROC
EXTRN sub_100696CD:PROC
EXTRN sub_100696E8:PROC
EXTRN sub_10069727:PROC
EXTRN sub_10069743:PROC
EXTRN sub_1006976B:PROC
EXTRN sub_1006976C:PROC
EXTRN sub_10069797:PROC
EXTRN sub_100697BA:PROC
EXTRN sub_100697C7:PROC
EXTRN sub_100697D6:PROC
EXTRN sub_100697FB:PROC
EXTRN sub_10069804:PROC
EXTRN sub_1006980E:PROC
EXTRN sub_10069810:PROC
EXTRN sub_1006982B:PROC
EXTRN sub_1006983A:PROC
EXTRN sub_10069853:PROC
EXTRN sub_10069882:PROC
EXTRN sub_10069890:PROC
EXTRN sub_100698A8:PROC
EXTRN sub_100698AC:PROC
EXTRN sub_100698BD:PROC
EXTRN sub_100698C2:PROC
EXTRN sub_100698DA:PROC
EXTRN sub_100698DF:PROC
EXTRN sub_10069901:PROC
EXTRN sub_10069904:PROC
EXTRN sub_10069919:PROC
EXTRN sub_1006992E:PROC
EXTRN sub_10069930:PROC
EXTRN sub_10069958:PROC
EXTRN sub_1006995A:PROC
EXTRN sub_1006996F:PROC
EXTRN sub_10069986:PROC
EXTRN sub_100699AA:PROC
EXTRN sub_100699D8:PROC
EXTRN sub_100699E6:PROC
EXTRN sub_100699E8:PROC
EXTRN sub_100699FE:PROC
EXTRN sub_10069A01:PROC
EXTRN sub_10069A0D:PROC
EXTRN sub_10069A0E:PROC
EXTRN sub_10069A29:PROC
EXTRN sub_10069A2E:PROC
EXTRN sub_10069A30:PROC
EXTRN sub_10069A55:PROC
EXTRN sub_10069A5E:PROC
EXTRN sub_10069A63:PROC
EXTRN sub_10069ACE:PROC
EXTRN sub_10069AFD:PROC
EXTRN sub_10069B2D:PROC
EXTRN sub_10069B5D:PROC
EXTRN sub_10069B69:PROC
EXTRN sub_10069B8D:PROC
EXTRN sub_10069BC1:PROC
EXTRN sub_10069BC7:PROC
EXTRN sub_10069BDE:PROC
EXTRN sub_10069BEE:PROC
EXTRN sub_10069BF5:PROC
EXTRN sub_10069C0D:PROC
EXTRN sub_10069C25:PROC
EXTRN sub_10069C3D:PROC
EXTRN sub_10069C3E:PROC
EXTRN sub_10069C57:PROC
EXTRN sub_10069C6C:PROC
EXTRN sub_10069C7E:PROC
EXTRN sub_10069C8A:PROC
EXTRN sub_10069C94:PROC
EXTRN sub_10069CA4:PROC
EXTRN sub_10069CA6:PROC
EXTRN sub_10069CB4:PROC
EXTRN sub_10069CBA:PROC
EXTRN sub_10069CCF:PROC
EXTRN sub_10069CD1:PROC
EXTRN sub_10069D5F:PROC
EXTRN sub_10069D91:PROC
EXTRN sub_10069DBD:PROC
EXTRN sub_10069DBF:PROC
EXTRN sub_10069DDF:PROC
EXTRN sub_10069DED:PROC
EXTRN sub_10069DF8:PROC
EXTRN sub_10069E04:PROC
EXTRN sub_10069E0D:PROC
EXTRN sub_10069E1F:PROC
EXTRN sub_10069E26:PROC
EXTRN sub_10069E2B:PROC
EXTRN sub_10069E3F:PROC
EXTRN sub_10069EAA:PROC
EXTRN sub_10069EB7:PROC
EXTRN sub_10069EDA:PROC
EXTRN sub_10069EEC:PROC
EXTRN sub_10069EFB:PROC
EXTRN sub_10069F0D:PROC
EXTRN sub_10069F17:PROC
EXTRN sub_10069F21:PROC
EXTRN sub_10069F2D:PROC
EXTRN sub_10069F49:PROC
EXTRN sub_100F7889:PROC
EXTRN sub_100F7A5B:PROC
EXTRN sub_100F8985:PROC
EXTRN sub_100F8A7D:PROC
EXTRN sub_100F8B57:PROC
EXTRN sub_100F8C48:PROC
.CODE
FUN_10068daa PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 84
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + 8]
    push push ebx
    xor xor ebx, ebx
    push push esi
    mov mov esi, ecx
    xor xor ecx, ecx
    mov mov dword ptr [esi + 84], ebx
    cmp cmp byte ptr [eax], cl
    push push edi
    mov mov dword ptr [ebp - 16], esi
    mov mov dword ptr [ebp - 4], 010Dh
    mov mov dword ptr [ebp - 64], ecx
    mov mov dword ptr [ebp - 8], ebx
    mov mov dword ptr [ebp - 12], ebx
    mov mov dword ptr [ebp - 60], 1
    mov mov dword ptr [ebp - 36], ebx
    mov mov dword ptr [ebp - 44], ebx
    mov mov dword ptr [ebp - 48], ebx
    mov mov dword ptr [ebp - 28], ebx
    mov mov dword ptr [ebp - 40], ebx
    mov mov dword ptr [ebp - 32], ebx
    mov mov dword ptr [ebp - 24], ebx
    mov mov dword ptr [ebp - 52], ebx
    mov mov dword ptr [ebp - 56], eax
    mov mov dword ptr [ebp - 20], eax
    je sub_100696C9
    mov mov ecx, dword ptr [ebp - 20]
    push push 3
    pop pop edx
    jmp L0
    cmp cmp al, 95
    je L2
    inc inc ecx
    mov mov dword ptr [ebp - 20], ecx
    mov mov al, byte ptr [ecx]
    test test al, al
    jne L1
    mov mov esi, dword ptr [ebp - 56]
    mov mov eax, ecx
    sub sub eax, esi
    cmp cmp eax, 15
    ja sub_100696E8
    mov mov ecx, eax
    mov mov ebx, ecx
    shr shr ecx, 2
    lea lea edi, [ebp - 84]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, ebx
    and and ecx, edx
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov byte ptr [ebp + eax - 84], 0
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp byte ptr [eax], 0
    je L3
    inc inc dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 20]
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp - 60], ebx
    mov mov dword ptr [ebp - 56], eax
    je L32
    xor xor edx, edx
    xor xor edi, edi
    mov mov esi, dword ptr [edi + 01010CBF0h]
    lea lea eax, [ebp - 84]
    mov mov bl, byte ptr [eax]
    mov mov cl, bl
    cmp cmp bl, byte ptr [esi]
    jne L6
    test test cl, cl
    je L5
L0:
    mov mov bl, byte ptr [eax + 1]
    mov mov cl, bl
    cmp cmp bl, byte ptr [esi + 1]
    jne L8
L2:
    inc inc eax
    inc inc eax
    inc inc esi
    inc inc esi
    test test cl, cl
    jne L4
    xor xor ebx, ebx
    xor xor eax, eax
    jmp L9
    sbb sbb eax, eax
    sbb sbb eax, -1
    xor xor ebx, ebx
    cmp cmp eax, ebx
    je L10
    add add edi, 68
    inc inc edx
    cmp cmp edi, 01650h
    jb L7
    cmp cmp edx, 84
    je sub_1006976C
    mov mov esi, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [esi + 56]
    mov mov eax, edx
    shl shl eax, 4
    add add eax, ecx
    add add eax, edx
    mov mov eax, dword ptr [eax*4 + 01010CBF8h]
    cmp cmp eax, -6
    ja L17
    je L16
    sub sub eax, ebx
    je L15
    dec dec eax
    je L14
    dec dec eax
    je L13
    dec dec eax
    je L12
    dec dec eax
    je L11
    dec dec eax
    jne L18
    mov mov dword ptr [ebp - 4], 0107h
    jmp L19
L3:
    mov mov dword ptr [ebp - 4], 0106h
    jmp L20
    mov mov dword ptr [ebp - 4], 0105h
    jmp L21
    mov mov dword ptr [ebp - 4], 0104h
    jmp L22
    mov mov dword ptr [ebp - 4], 0103h
    jmp L23
    mov mov dword ptr [ebp - 4], 0102h
    jmp L26
    mov mov dword ptr [ebp - 4], 010Ch
    jmp L29
    cmp cmp eax, -5
    je L28
    cmp cmp eax, -4
    je L27
    cmp cmp eax, -3
    je L25
    cmp cmp eax, -2
    je L24
    cmp cmp eax, -1
    jne L30
    mov mov dword ptr [esi + 84], 07E7h
    jmp sub_10069804
    mov mov dword ptr [ebp - 4], 0109h
    jmp L31
    mov mov dword ptr [ebp - 4], 0108h
L6:
    jmp L33
    mov mov dword ptr [ebp - 4], 010Ah
    jmp L34
    mov mov dword ptr [ebp - 4], 010Bh
    mov mov eax, edx
    shl shl eax, 4
    add add eax, edx
    cmp cmp ecx, 6
    mov mov edx, dword ptr [eax*4 + 01010CBF4h]
L9:
    mov mov dword ptr [ebp - 64], edx
    mov mov dword ptr [ebp - 60], ebx
    jl L35
    cmp cmp ecx, 9
    jg L36
    cmp cmp dword ptr [ebp - 4], 0103h
    jl L37
    cmp cmp dword ptr [ebp - 4], 0107h
    jg L38
    xor xor eax, eax
    inc inc eax
    mov mov dword ptr [ebp - 36], eax
    jmp L39
    xor xor eax, eax
    inc inc eax
    cmp cmp ecx, 4
    jl L40
    cmp cmp ecx, 5
    jle L41
    cmp cmp ecx, 6
    jl L42
    cmp cmp ecx, 14
    jg L43
    cmp cmp dword ptr [ebp - 4], 0103h
    jl L44
    cmp cmp dword ptr [ebp - 4], 0107h
    jg L45
    cmp cmp edx, 31
    je L46
    mov mov dword ptr [ebp - 44], eax
    cmp cmp ecx, 10
    jl L49
    cmp cmp ecx, 14
    jg L47
    cmp cmp edx, 31
    jne L48
    mov mov dword ptr [ebp - 48], eax
    cmp cmp ecx, 10
    jl L50
    cmp cmp ecx, 14
    jg L51
    cmp cmp dword ptr [ebp - 4], 0103h
    jl L52
    cmp cmp dword ptr [ebp - 4], 0107h
    jg L53
    mov mov dword ptr [ebp - 52], eax
    cmp cmp ecx, 4
    jl L54
    cmp cmp ecx, 5
    jle L55
    cmp cmp ecx, 10
    jl L56
    cmp cmp ecx, 14
    jg L57
    cmp cmp edx, 31
    jne L58
    mov mov dword ptr [ebp - 28], eax
    cmp cmp ecx, 13
    jl L59
    cmp cmp ecx, 14
    jg L60
L13:
    cmp cmp edx, 31
    jne L61
    mov mov dword ptr [ebp - 40], eax
    cmp cmp ecx, ebx
    jl L62
L15:
    cmp cmp ecx, 5
    jg L63
L16:
    cmp cmp edx, 31
    jne L64
    mov mov dword ptr [ebp - 32], eax
    cmp cmp edx, 40
    je L65
    cmp cmp edx, 44
    je L66
    cmp cmp edx, 94
    jne L67
    mov mov dword ptr [ebp - 24], eax
    mov mov dword ptr [esi + 84], 07E8h
    jmp sub_100698BD
    cmp cmp dword ptr [ebp - 44], ebx
    je L68
    push push 4
    mov mov edi, 01010ECF8h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L69
    or or byte ptr [ebp - 6], 16
    mov mov dword ptr [ebp - 36], ebx
    mov mov dword ptr [ebp - 44], ebx
    jmp sub_100698DF
    cmp cmp dword ptr [ebp - 48], ebx
    je L70
    push push 9
    mov mov edi, 01010ECECh
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L71
    or or byte ptr [ebp - 6], 64
    mov mov dword ptr [ebp - 48], ebx
    jmp sub_10069901
    cmp cmp dword ptr [ebp - 36], ebx
L19:
    je L75
    mov mov edi, 01010ECE8h
    lea lea esi, [ebp - 84]
    mov mov ecx, edx
    xor xor eax, eax
L21:
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L72
    mov mov dword ptr [ebp - 8], 03000000h
    jmp L76
    mov mov edi, 01010ECE4h
L23:
    lea lea esi, [ebp - 84]
    mov mov ecx, edx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
L26:
    jne L73
    mov mov dword ptr [ebp - 8], 02000000h
L29:
    jmp L78
    mov mov edi, 01010ECE0h
    lea lea esi, [ebp - 84]
    mov mov ecx, edx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L74
    mov mov dword ptr [ebp - 8], 01000000h
L30:
    jmp L79
    mov mov edi, 01010ECDCh
    lea lea esi, [ebp - 84]
    mov mov ecx, edx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L77
    mov mov dword ptr [ebp - 8], 0F000000h
    jmp L81
    mov mov edi, 01010ECD8h
    lea lea esi, [ebp - 84]
    mov mov ecx, edx
    xor xor eax, eax
L34:
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L80
    mov mov dword ptr [ebp - 8], 0E000000h
    jmp L82
    mov mov edi, 01010ECD4h
    lea lea esi, [ebp - 84]
    mov mov ecx, edx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100699FE
    mov mov dword ptr [ebp - 8], 0D000000h
    mov mov dword ptr [ebp - 36], ebx
    jmp sub_100699AA
    cmp cmp dword ptr [ebp - 28], ebx
    je L85
    xor xor eax, eax
    mov mov edi, 01010ECD0h
    lea lea esi, [ebp - 84]
    mov mov ecx, edx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L83
    mov mov eax, 010000000h
    jmp L86
    push push 5
    mov mov edi, 01010ECC8h
    lea lea esi, [ebp - 84]
L35:
    pop pop ecx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
L36:
    jne L84
    mov mov eax, 018000000h
    jmp L87
L37:
    push push 7
    mov mov edi, 01010ECC0h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L88
    mov mov eax, 020000000h
    or or dword ptr [ebp - 12], eax
    xor xor ebx, ebx
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 28], ebx
    je L89
    mov mov dword ptr [ebp - 40], ebx
    mov mov dword ptr [ebp - 32], ebx
    jmp sub_10069A0D
    cmp cmp dword ptr [ebp - 52], ebx
    je L90
    mov mov edi, 01010ECBCh
    lea lea esi, [ebp - 84]
    mov mov ecx, edx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L91
    or or byte ptr [ebp - 6], 32
    mov mov dword ptr [ebp - 52], ebx
    jmp sub_10069A2E
    cmp cmp dword ptr [ebp - 40], ebx
    je sub_100697D6
    cmp cmp byte ptr [ebp - 84], 0
    lea lea esi, [ebp - 84]
    je L94
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F8985
    test test eax, eax
L45:
    pop pop ecx
    je L93
    inc inc esi
    cmp cmp byte ptr [esi], 0
    jne L92
    cmp cmp byte ptr [esi], 0
    je L95
    push push esi
    call sub_100F7889
    pop pop ecx
    mov mov ebx, eax
    jmp L96
    xor xor ebx, ebx
    cmp cmp ebx, 15
    ja sub_1006980E
L47:
    mov mov al, byte ptr [esi]
    test test al, al
    mov mov byte ptr [ebp + 11], al
    mov mov dword ptr [ebp - 68], esi
    je sub_1006969A
    mov mov byte ptr [esi], 0
    inc inc esi
    mov mov al, byte ptr [esi]
    test test al, al
    je sub_100696C8
    movsx movsx eax, al
    push push eax
L49:
    call sub_100F8A7D
    test test eax, eax
    pop pop ecx
    je sub_100696CD
    inc inc esi
    mov mov al, byte ptr [esi]
    test test al, al
    jne sub_100696BF
    cmp cmp byte ptr [esi], 0
    jne sub_1006983A
    push push 9
    mov mov edi, 0101966DCh
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
L53:
    jne sub_10069727
    test test ebx, ebx
    je sub_10069853
    and and ebx, 15
    shl shl ebx, 16
    and and eax, 15
    or or ebx, eax
    or or dword ptr [ebp - 12], ebx
    and and dword ptr [ebp - 40], 0
    jmp sub_10069A29
L55:
    push push 12
    mov mov edi, 01010ECB0h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
L56:
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1006976B
    inc inc eax
L57:
    jmp sub_10069743
    push push 13
    mov mov edi, 01010ECA0h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069797
    push push 2
    jmp sub_10069890
    push push 7
    mov mov edi, 010192F8Ch
    lea lea esi, [ebp - 84]
L60:
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
L61:
    jne sub_100697C7
    push push 3
    jmp sub_100698A8
    push push 6
    pop pop eax
    mov mov edi, 01010EC98h
    lea lea esi, [ebp - 84]
    mov mov ecx, eax
    xor xor edx, edx
L62:
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100697FB
    push push 4
    jmp sub_100698C2
    push push 9
    mov mov edi, 0101956A0h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1006982B
    push push 5
    jmp sub_100698DA
    push push 8
    mov mov edi, 010195674h
    lea lea esi, [ebp - 84]
    pop pop ecx
L67:
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100697BA
    push push 9
    mov mov edi, 010195668h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069882
    push push 7
    jmp sub_10069904
    push push 11
    mov mov edi, 01010EC8Ch
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100698AC
    push push 8
    jmp sub_10069919
    push push 10
    pop pop eax
    mov mov edi, 01010EC80h
    lea lea esi, [ebp - 84]
    mov mov ecx, eax
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
L68:
    jne sub_100698DA
    push push 9
    jmp sub_10069930
    push push 6
    mov mov edi, 0101966D4h
    lea lea esi, [ebp - 84]
    pop pop ecx
L69:
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_10069810
    push push 4
    mov mov edi, 010195A98h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1006992E
    push push 11
    jmp sub_1006995A
    push push 6
    mov mov edi, 01010EC78h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069958
    push push 12
    jmp sub_1006996F
    push push 7
L70:
    mov mov edi, 01010EC70h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069986
    push push 13
L71:
    pop pop eax
    jmp sub_10069853
    mov mov eax, dword ptr [ebp - 68]
    mov mov cl, byte ptr [ebp + 11]
    mov mov byte ptr [eax], cl
    xor xor edx, edx
    cmp cmp dword ptr [ebp - 32], edx
    je sub_10069B69
    cmp cmp byte ptr [ebp - 84], dl
    lea lea esi, [ebp - 84]
    je sub_100699E8
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F8B57
    test test eax, eax
    pop pop ecx
    je sub_100699E6
    inc inc esi
    cmp cmp byte ptr [esi], 0
    jne sub_100699D8
    cmp cmp byte ptr [esi], 0
    je sub_10069A01
    push push esi
    call sub_100F7A5B
    pop pop ecx
    mov mov ebx, eax
    jmp sub_10069A0E
    xor xor ebx, ebx
L72:
    cmp cmp ebx, 15
    ja sub_10069CA4
    cmp cmp byte ptr [esi], 0
    je sub_10069A30
    mov mov byte ptr [esi], 0
    inc inc esi
    mov mov al, byte ptr [esi]
    test test al, al
    je sub_10069A5E
    movsx movsx eax, al
    push push eax
    call sub_100F8C48
    test test eax, eax
    pop pop ecx
    je sub_10069A63
    inc inc esi
    mov mov al, byte ptr [esi]
    test test al, al
    jne sub_10069A55
    cmp cmp byte ptr [esi], 0
    jne sub_10069CD1
    push push 9
    mov mov edi, 0101966DCh
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_10069BC7
    push push 12
    mov mov edi, 01010ECB0h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069ACE
    inc inc eax
    jmp sub_10069BDE
    push push 13
L74:
    mov mov edi, 01010ECA0h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069AFD
    push push 2
    jmp sub_10069BF5
    push push 7
    mov mov edi, 010192F8Ch
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069B2D
    push push 3
    jmp sub_10069C0D
    push push 6
    mov mov edi, 01010EC98h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
L78:
    jne sub_10069B5D
    push push 4
    jmp sub_10069C25
    push push 9
    mov mov edi, 0101956A0h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069B8D
    push push 5
    jmp sub_10069C3D
    push push 8
    pop pop eax
    mov mov edi, 010195674h
    lea lea esi, [ebp - 84]
    mov mov ecx, eax
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
L81:
    jne sub_10069BC1
    push push 6
    jmp sub_10069C57
    push push 9
    mov mov edi, 010195668h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069BEE
    push push 7
    jmp sub_10069C6C
    push push 11
    mov mov edi, 01010EC8Ch
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_10069C7E
    push push 10
    pop pop eax
    mov mov edi, 01010EC80h
    lea lea esi, [ebp - 84]
    mov mov ecx, eax
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069C3E
    push push 9
    jmp sub_10069C94
    push push 6
    mov mov edi, 0101966D4h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_10069CA6
    push push 4
    mov mov edi, 010195A98h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069C8A
    push push 11
    jmp sub_10069CBA
    push push 6
    mov mov edi, 01010EC78h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
L83:
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069CB4
    push push 12
    jmp sub_10069CCF
    push push 7
    mov mov edi, 01010EC70h
    lea lea esi, [ebp - 84]
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069E04
    push push 13
    pop pop eax
    and and ebx, 15
    shl shl ebx, 16
    and and eax, 15
    or or ebx, eax
    and and dword ptr [ebp - 32], 0
    mov mov dword ptr [ebp - 12], ebx
    and and dword ptr [ebp - 28], 0
    jmp sub_10069DBD
    cmp cmp dword ptr [ebp - 24], edx
    je sub_10069E2B
    push push 3
    pop pop eax
    mov mov edi, 01010EC6Ch
    lea lea esi, [ebp - 84]
    mov mov ecx, eax
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069D5F
    mov mov dword ptr [ebp - 12], 1
L88:
    jmp sub_10069DDF
    mov mov edi, 01010EC68h
    lea lea esi, [ebp - 84]
    mov mov ecx, eax
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069D91
    mov mov dword ptr [ebp - 12], 2
    jmp sub_10069DF8
    mov mov edi, 01010EC64h
    lea lea esi, [ebp - 84]
    mov mov ecx, eax
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069DBF
    mov mov dword ptr [ebp - 12], eax
    jmp sub_10069E0D
    mov mov edi, 01010EC60h
    lea lea esi, [ebp - 84]
    mov mov ecx, eax
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069DED
    mov mov dword ptr [ebp - 12], 4
    jmp sub_10069E26
    mov mov edi, 01010EC5Ch
    lea lea esi, [ebp - 84]
    mov mov ecx, eax
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069E1F
L90:
    mov mov dword ptr [ebp - 12], 5
    jmp sub_10069E3F
    mov mov ecx, eax
    mov mov edi, 01010EC58h
L91:
    lea lea esi, [ebp - 84]
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_10069EB7
    mov mov dword ptr [ebp - 12], 6
    mov mov dword ptr [ebp - 24], edx
    xor xor ebx, ebx
    mov mov esi, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp byte ptr [eax], 0
    jne L97
    mov mov ecx, dword ptr [ebp - 64]
    cmp cmp ecx, 40
    jne sub_10069EAA
    cmp cmp dword ptr [ebp - 24], ebx
    jne sub_10069EDA
    mov mov eax, dword ptr [esi + 56]
    cmp cmp dword ptr [eax*4 + 01010E248h], -1
    je sub_10069EEC
    push push 41
    pop pop ecx
    mov mov dword ptr [ebp - 4], 010Ch
    cmp cmp ecx, 44
    jne sub_10069EEC
    cmp cmp dword ptr [ebp - 24], ebx
    jne sub_10069EFB
L93:
    mov mov eax, dword ptr [esi + 56]
    cmp cmp dword ptr [eax*4 + 01010E290h], -1
    je sub_10069F0D
    push push 45
    pop pop ecx
    mov mov dword ptr [ebp - 4], 010Ch
    cmp cmp ecx, 94
    jne sub_10069F17
    cmp cmp dword ptr [ebp - 24], ebx
    jne sub_10069F21
    cmp cmp dword ptr [ebp - 32], ebx
    je sub_10069F2D
    mov mov eax, 010Dh
    jmp sub_10069F49
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [esi + 68], eax
    mov mov eax, dword ptr [ebp - 12]
    mov mov dword ptr [esi + 72], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [esi + 64], ecx
    mov mov dword ptr [esi + 84], ebx
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_10068daa ENDP
END
