.686
.MODEL FLAT, C
EXTRN sub_100670B9:PROC
EXTRN sub_1009EBA8:PROC
EXTRN sub_100A02BE:PROC
EXTRN sub_100A02C2:PROC
EXTRN sub_100A02CC:PROC
EXTRN sub_100A0305:PROC
EXTRN sub_100A030A:PROC
EXTRN sub_100A0330:PROC
EXTRN sub_100A0333:PROC
EXTRN sub_100A0337:PROC
EXTRN sub_100A0388:PROC
EXTRN sub_100A039C:PROC
EXTRN sub_100A03B0:PROC
EXTRN sub_100A03C4:PROC
EXTRN sub_100A03D8:PROC
EXTRN sub_100A0404:PROC
EXTRN sub_100A0446:PROC
EXTRN sub_100A0454:PROC
EXTRN sub_100A045A:PROC
EXTRN sub_100A0460:PROC
EXTRN sub_100A0472:PROC
EXTRN sub_100A0488:PROC
EXTRN sub_100A04D0:PROC
EXTRN sub_100A04E9:PROC
EXTRN sub_100A0504:PROC
EXTRN sub_100A0534:PROC
EXTRN sub_100A0538:PROC
EXTRN sub_100A0548:PROC
EXTRN sub_100A0566:PROC
EXTRN sub_100A0568:PROC
EXTRN sub_100A056C:PROC
EXTRN sub_100A057C:PROC
EXTRN sub_100A0594:PROC
EXTRN sub_100A05A0:PROC
EXTRN sub_100A05A8:PROC
EXTRN sub_100A05BC:PROC
EXTRN sub_100A05D8:PROC
EXTRN sub_100A05F4:PROC
EXTRN sub_100A060B:PROC
EXTRN sub_100A0680:PROC
EXTRN sub_100A06B2:PROC
EXTRN sub_100A06E8:PROC
EXTRN sub_100A070C:PROC
EXTRN sub_100A073E:PROC
EXTRN sub_100A0748:PROC
EXTRN sub_100A075C:PROC
EXTRN sub_100A0770:PROC
EXTRN sub_100A07B0:PROC
EXTRN sub_100A07C5:PROC
EXTRN sub_100A0848:PROC
EXTRN sub_100A087C:PROC
EXTRN sub_100A08AF:PROC
EXTRN sub_100A08B0:PROC
EXTRN sub_100A08C2:PROC
EXTRN sub_100A08D5:PROC
EXTRN sub_100A08E4:PROC
EXTRN sub_100A091C:PROC
EXTRN sub_100A0961:PROC
EXTRN sub_100A0968:PROC
EXTRN sub_100A09B9:PROC
EXTRN sub_100A09C4:PROC
EXTRN sub_100A0A35:PROC
EXTRN sub_100A0A49:PROC
EXTRN sub_100A0A6E:PROC
EXTRN sub_100A0A77:PROC
EXTRN sub_100A0AA5:PROC
EXTRN sub_100A0AF6:PROC
EXTRN sub_100A0B06:PROC
EXTRN sub_100A0B2A:PROC
EXTRN sub_100A0B5E:PROC
EXTRN sub_100A0B92:PROC
EXTRN sub_100A0BC6:PROC
EXTRN sub_100A0CC6:PROC
EXTRN sub_100A0CE3:PROC
EXTRN sub_100A0D00:PROC
EXTRN sub_100F7907:PROC
EXTRN sub_100F7C5D:PROC
EXTRN sub_100F831C:PROC
EXTRN sub_100F8339:PROC
EXTRN sub_100F8356:PROC
.CODE
FUN_1009f7dc PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    push push esi
    mov mov ebx, ecx
    push push edi
    mov mov dword ptr [ebp - 4], ebx
    lea lea esi, [ebx + 32]
    mov mov ecx, dword ptr [ebx + 4]
    push push esi
    call sub_100670B9
    test test eax, eax
    jge L1
    mov mov dword ptr [ebx + 64], 1
    or or eax, -1
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
    mov mov eax, dword ptr [esi]
    cmp cmp eax, 13
    ja L0
    jmp jmp dword ptr [eax*4 + 0100A02A3h]
    mov mov cl, byte ptr [ebx + 41]
    test test cl, cl
    jne L3
    movsx movsx eax, byte ptr [ebx + 40]
L0:
    jmp L2
    cmp cmp byte ptr [ebx + 42], 0
L1:
    jne L118
    cmp cmp cl, 61
    jne L18
    movsx movsx eax, byte ptr [ebx + 40]
    cmp cmp eax, 45
    jg L16
    je L15
    sub sub eax, 33
    je L14
    sub sub eax, 4
    je L13
    sub sub eax, 5
    je L11
    dec dec eax
    jne L120
    mov mov eax, 0145h
    jmp L4
    mov mov eax, 0142h
    jmp L5
    mov mov eax, 0144h
    jmp L6
    mov mov eax, 013Fh
    jmp L7
    mov mov eax, 0146h
    jmp L8
    sub sub eax, 47
    je L27
    sub sub eax, 13
    je L26
    dec dec eax
    je L24
L4:
    dec dec eax
    jne L124
L5:
    mov mov eax, 013Dh
    jmp L9
    mov mov eax, 013Eh
    jmp L10
    mov mov eax, 013Ch
    jmp L12
    mov mov eax, 0143h
    jmp L16
    mov mov al, byte ptr [ebx + 40]
    cmp cmp al, cl
    jne L126
L9:
    movsx movsx eax, al
    sub sub eax, 38
    je L36
    sub sub eax, 5
    je L35
    dec dec eax
    dec dec eax
    je L34
    sub sub eax, 79
L12:
    jne L127
    mov mov eax, 0141h
    jmp L17
    mov mov eax, 013Bh
    jmp L19
    mov mov eax, 013Ah
    jmp L20
    mov mov eax, 0140h
    jmp L21
    mov mov eax, 0147h
    jmp L22
    mov mov eax, 0148h
L18:
    jmp L23
    mov mov eax, 0149h
    jmp L25
    mov mov eax, 014Ah
    jmp L28
    mov mov eax, 014Bh
    jmp L29
    mov mov eax, 014Ch
    jmp L30
    mov mov eax, 014Dh
    jmp L31
    mov mov eax, dword ptr [ebx + 40]
L26:
    movsx movsx ecx, byte ptr [eax]
    mov mov dword ptr [ebp - 8], ecx
    add add ecx, -97
    cmp cmp ecx, 22
    ja L54
L29:
    jmp jmp dword ptr [ecx*4 + 0100A02DBh]
    push push 5
    mov mov edi, 010193094h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A0337
    mov mov esi, eax
    push push 13
    mov mov edi, 010115020h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L58
    mov mov eax, 0102h
    jmp L32
    push push 5
    mov mov edi, 010114858h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L44
    mov mov eax, 0103h
    jmp L33
    mov mov edi, 01010EA80h
    push push 6
    mov mov esi, eax
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L62
    jmp sub_100A0388
    push push 5
    mov mov edi, 010115018h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A039C
    push push 6
    mov mov edi, 010115010h
    mov mov esi, eax
    pop pop ecx
L36:
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A03B0
    push push 5
    mov mov edi, 010115008h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A03C4
    push push 6
    mov mov edi, 010115000h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A03D8
    push push 13
    mov mov edi, 01010C6F0h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L51
    mov mov eax, 0104h
    jmp L37
    push push 8
    mov mov edi, 010114FF8h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L55
    mov mov eax, 0105h
    jmp L38
    push push 17
    mov mov edi, 010114FE4h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L59
    mov mov eax, 0106h
    jmp L39
    push push 6
    mov mov edi, 010114FDCh
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L63
    mov mov eax, 0107h
    jmp L40
    push push 11
    mov mov edi, 010114FD0h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A0454
    mov mov edi, 010114FC4h
    jmp L94
    push push 8
    mov mov edi, 010192F58h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A0472
    push push 7
    pop pop edx
    mov mov edi, 010114FBCh
    mov mov esi, eax
    mov mov ecx, edx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A0488
    push push 8
    mov mov edi, 010114FB4h
    mov mov esi, eax
    pop pop ecx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L67
    mov mov eax, 0109h
    jmp L41
    push push 3
    mov mov edi, 010114FB0h
    mov mov esi, eax
    pop pop ecx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L70
    mov mov eax, 010Bh
    jmp L42
    mov mov ecx, edx
    mov mov edi, 01011483Ch
    mov mov esi, eax
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L72
L41:
    mov mov eax, 010Ah
    jmp L43
    mov mov esi, eax
    push push 13
    mov mov edi, 010114FA0h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A04E9
    mov mov ebx, dword ptr [ebp - 4]
    push push dword ptr [ebp - 8]
    call sub_100F7907
    cmp cmp eax, 97
    pop pop ecx
    je sub_100A05BC
L43:
    cmp cmp eax, 100
    je sub_100A05A8
    cmp cmp eax, 112
    je sub_100A0594
    cmp cmp eax, 116
    jne sub_100A05F4
    push push 010114F94h
    push push dword ptr [ebx + 40]
    call sub_100F7C5D
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_100A060B
    mov mov eax, 012Bh
    jmp L45
    push push 5
L44:
    mov mov edi, 01010C894h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L85
    mov mov eax, 010Ch
    jmp L46
    push push 5
    mov mov edi, 010114F8Ch
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A0568
    push push 9
    mov mov edi, 010114F80h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A057C
    mov mov esi, eax
    push push 7
    mov mov edi, 010114F78h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L83
    mov mov eax, 010Dh
    jmp L47
    push push 6
    mov mov edi, 0101983FCh
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L92
    mov mov eax, 010Eh
    jmp L48
    push push 6
    mov mov edi, 010114844h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L96
    mov mov eax, 010Fh
    jmp L49
    push push 4
    mov mov edi, 010114F74h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L99
    mov mov eax, 0110h
    jmp L50
    mov mov edi, 010114F6Ch
    push push 7
    jmp L69
    mov mov edi, 010114F64h
    jmp L109
    mov mov esi, eax
    push push 5
    mov mov edi, 01011484Ch
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L89
    mov mov eax, 0111h
    jmp L52
    push push 3
    mov mov edi, 01010C8BCh
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L104
    mov mov eax, 0112h
    jmp L53
    push push 3
    mov mov edi, 010114F60h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
L51:
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L108
    mov mov eax, 0113h
    jmp L56
    push push 7
    mov mov edi, 010114F58h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L111
    mov mov eax, 0114h
    jmp L57
    push push 6
    mov mov edi, 010114F50h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
L55:
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L114
    mov mov eax, 0115h
    jmp L60
    mov mov esi, eax
    push push 4
    mov mov edi, 010114854h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L95
    mov mov eax, 0116h
    jmp L61
    mov mov edi, 010114F48h
    push push 5
    jmp L77
    push push 7
    mov mov edi, 010114BD4h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L122
    mov mov eax, 0117h
    jmp L64
    mov mov edi, 010114F40h
    push push 8
    jmp L80
    push push 10
    mov mov edi, 010114F34h
    mov mov esi, eax
    pop pop ecx
L63:
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A06E8
    mov mov edi, 010114F30h
    push push 4
    jmp L82
    push push 4
    mov mov edi, 010114F2Ch
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A02BE
    mov mov eax, 0118h
    jmp L65
    mov mov edi, 010114F20h
    push push 9
    jmp L84
    push push 14
    mov mov edi, 0101147A0h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A030A
    mov mov eax, 011Ah
    jmp L66
    push push 8
    mov mov edi, 010114F18h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A0748
    push push 10
    mov mov edi, 010114F0Ch
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A075C
    push push 7
    mov mov edi, 010114F04h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A0770
    cmp cmp dword ptr [ebx + 72], edx
    je L105
    mov mov esi, eax
    push push 12
    mov mov edi, 0101147C0h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L106
    mov mov eax, 011Bh
    jmp L68
    push push 9
    mov mov edi, 010114EF8h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0404
    mov mov eax, 011Ch
    jmp L71
    push push 17
    mov mov edi, 010114EE4h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A07C5
    push push 10
    mov mov edi, 01010C700h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0460
    mov mov eax, 011Eh
L71:
    jmp L72
    mov mov esi, eax
    push push 7
    mov mov edi, 010114EDCh
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L112
    mov mov eax, 011Dh
    jmp L73
    push push 10
    mov mov edi, 0101147F0h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A04D0
    mov mov eax, 0120h
    jmp L74
    push push 10
    mov mov edi, 0101147E4h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0504
    mov mov eax, 0121h
    jmp L75
    push push 10
    mov mov edi, 0101147D8h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0538
    mov mov eax, 0122h
    jmp L76
    push push 12
    mov mov edi, 0101147CCh
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A056C
    mov mov eax, 0123h
    jmp L78
    push push 14
    mov mov edi, 010114ECCh
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A05A0
    mov mov eax, 0124h
    jmp L79
    push push 7
    pop pop edx
    mov mov edi, 010114EC4h
    mov mov esi, eax
    mov mov ecx, edx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A05D8
    mov mov eax, 0125h
    jmp L81
    push push 6
    mov mov edi, 010114EBCh
    mov mov esi, eax
    pop pop ecx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A08AF
    mov mov edi, 010114EB4h
    mov mov esi, eax
    mov mov ecx, edx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A08C2
    mov mov edi, 010114EACh
    mov mov esi, eax
    mov mov ecx, edx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A08D5
    push push 17
    mov mov edi, 010114E98h
    mov mov esi, eax
    pop pop ecx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0680
    mov mov eax, 0127h
    jmp L86
    mov mov edi, 01019760Ch
    mov mov esi, eax
    mov mov ecx, edx
L84:
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A06B2
    mov mov eax, 0128h
    jmp L87
    push push 12
    mov mov edi, 010114E8Ch
    mov mov esi, eax
    pop pop ecx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A091C
    mov mov edi, 01011482Ch
    mov mov esi, eax
    mov mov ecx, edx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A070C
    mov mov eax, 0129h
    jmp L88
    mov mov edi, 010114E84h
    mov mov esi, eax
    mov mov ecx, edx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A073E
    mov mov eax, 012Ah
    jmp L90
    mov mov ecx, edx
    mov mov edi, 010114E7Ch
    mov mov esi, eax
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A0961
    mov mov ebx, dword ptr [ebp - 4]
    cmp cmp dword ptr [ebx + 72], edx
    je sub_100A0305
    push push 8
    mov mov edi, 01019558Ch
    mov mov esi, eax
    pop pop ecx
L90:
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A07B0
    mov mov eax, 011Fh
    jmp L91
    mov mov esi, eax
    push push 11
    mov mov edi, 010114784h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0333
    mov mov eax, 0126h
    jmp L93
    push push 9
    mov mov edi, 010114E70h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A09B9
    push push 10
    mov mov edi, 010114820h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0848
    mov mov eax, 012Dh
L93:
    jmp L97
    push push 10
    mov mov edi, 010114814h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A087C
    mov mov eax, 012Eh
    jmp L98
    push push 10
    mov mov edi, 010114808h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A08B0
    mov mov eax, 012Fh
    jmp L100
    push push 12
    mov mov edi, 0101147FCh
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A08E4
    mov mov eax, 0130h
    jmp L101
    push push 5
    mov mov edi, 010114E68h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A0A35
    push push 6
    mov mov edi, 010114E60h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A0A49
    push push 5
    mov mov edi, 010198404h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0968
    mov mov eax, 0131h
    jmp L102
    push push 4
    mov mov edi, 010114E5Ch
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A0A77
    push push 8
    mov mov edi, 010114E54h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A09C4
    mov mov eax, 0132h
L102:
    jmp L103
    push push 9
    mov mov edi, 010114E48h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A0AA5
    cmp cmp dword ptr [ebx + 72], edx
    je sub_100A0446
    mov mov esi, eax
    push push 8
    mov mov edi, 0101950A0h
    pop pop ecx
    xor xor eax, eax
L103:
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A045A
    mov mov eax, 012Ch
    jmp L107
    push push 8
    mov mov edi, 010114E40h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0A6E
    mov mov eax, 0133h
L106:
    jmp L110
    push push 6
    mov mov edi, 010114E38h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A0AF6
    push push 9
    mov mov edi, 010114E2Ch
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_100A0B06
    mov mov edi, 010114E24h
    jmp sub_100A0330
    push push 7
    mov mov edi, 010114BDCh
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0AF6
    mov mov eax, 0134h
    jmp L113
    push push 15
    mov mov edi, 010114790h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0B2A
    mov mov eax, 0135h
    jmp L115
    push push 8
    mov mov edi, 010114E1Ch
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0B5E
    mov mov eax, 0151h
    jmp L116
    push push 5
    mov mov edi, 010114870h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0B92
    mov mov eax, 0137h
    jmp L117
    push push 9
    mov mov edi, 010114E10h
    mov mov esi, eax
    pop pop ecx
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0BC6
    mov mov eax, 0138h
    jmp L119
    cmp cmp dword ptr [ebx + 72], 0
    je sub_100A0534
    mov mov esi, eax
    push push 13
    mov mov edi, 0101147B0h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0548
    mov mov eax, 0136h
    jmp L121
    mov mov esi, eax
    push push 6
    mov mov edi, 010114E08h
    pop pop ecx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_100A0566
    mov mov eax, 0139h
    jmp L123
    push push 010114B84h
    push push dword ptr [ebx + 40]
    call sub_100F831C
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_100A0CC6
    mov mov eax, 0119h
    jmp L125
    push push 010114E00h
    push push dword ptr [ebx + 40]
    call sub_100F8339
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_100A0CE3
L124:
    mov mov eax, 0108h
    jmp L126
    push push 010114DFCh
    push push dword ptr [ebx + 40]
    call sub_100F8356
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_100A0D00
    mov mov eax, 0101h
    jmp L128
    xor xor eax, eax
    push push eax
    push push eax
    push push eax
    push push dword ptr [ebx + 16]
    lea lea ecx, [ebx + 32]
    push push eax
L126:
    push push eax
    push push ecx
    push push eax
    mov mov ecx, ebx
    call sub_1009EBA8
    neg neg eax
    sbb sbb eax, eax
    neg neg eax
    add add eax, 014Fh
    jmp sub_100A02C2
L127:
    mov mov eax, 014Eh
    jmp sub_100A02CC
FUN_1009f7dc ENDP
END
