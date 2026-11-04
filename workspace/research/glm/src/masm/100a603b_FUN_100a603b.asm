.686
.MODEL FLAT, C
EXTRN sub_10087617:PROC
EXTRN sub_1008AF8E:PROC
EXTRN sub_1008AFEB:PROC
EXTRN sub_1008C091:PROC
EXTRN sub_1008C22D:PROC
EXTRN sub_1008C613:PROC
EXTRN sub_1008DC9B:PROC
EXTRN sub_10094F6C:PROC
EXTRN sub_100A5B3C:PROC
EXTRN sub_100BA968:PROC
EXTRN sub_100BAA21:PROC
EXTRN sub_100BAA8A:PROC
EXTRN sub_100BABBD:PROC
EXTRN sub_100BAD56:PROC
EXTRN sub_100BAE43:PROC
EXTRN sub_100BAF18:PROC
EXTRN sub_100BAF8B:PROC
EXTRN sub_100BAFC6:PROC
EXTRN sub_100BB21A:PROC
EXTRN sub_100BB7D4:PROC
EXTRN sub_100BBA09:PROC
EXTRN sub_100BBB72:PROC
EXTRN sub_100BC1A0:PROC
EXTRN sub_100BC46B:PROC
EXTRN sub_100BC58D:PROC
EXTRN sub_100BE761:PROC
EXTRN sub_100BE8B7:PROC
EXTRN sub_100BEFA5:PROC
EXTRN sub_100BEFBC:PROC
EXTRN sub_100BF0D2:PROC
EXTRN sub_100BF104:PROC
EXTRN sub_100BF2F1:PROC
EXTRN sub_100BF357:PROC
EXTRN sub_100BFB5A:PROC
EXTRN sub_100BFFE9:PROC
EXTRN sub_100C0602:PROC
EXTRN sub_100C0761:PROC
EXTRN sub_100C076C:PROC
EXTRN sub_100C08CB:PROC
EXTRN sub_100C0986:PROC
EXTRN sub_100C0A83:PROC
EXTRN sub_100C0B18:PROC
EXTRN sub_100C0F9E:PROC
EXTRN sub_100C13D2:PROC
EXTRN sub_100C1553:PROC
EXTRN sub_100C158F:PROC
EXTRN sub_100C1672:PROC
EXTRN sub_100C1DFC:PROC
EXTRN sub_100C20A0:PROC
EXTRN sub_100C6253:PROC
EXTRN sub_100C649B:PROC
EXTRN sub_100C64A1:PROC
EXTRN sub_100C7DB3:PROC
.CODE
FUN_100a603b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push esi
    mov esi, ecx
    test byte ptr [esi + 112], 64
    push edi
    jne L0
    call sub_100A5B3C
    mov edi, eax
    test edi, edi
    jge L1
    jmp L85
L0:
    mov edi, dword ptr [ebp - 8]
L1:
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    push ebx
    mov dword ptr [ebp - 4], ecx
    mov ebx, 0FFF00000h
    jbe L5
L2:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 011400000h
    je L3
    xor edi, edi
    inc edi
    jmp L4
L3:
    mov ecx, esi
    call sub_100BF0D2
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, dword ptr [ebp - 4]
L4:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 4], ecx
    jb L2
L5:
    test byte ptr [esi + 0000000CCh], 4
    je L9
    mov ecx, esi
    call sub_1008AF8E
    and dword ptr [ebp - 4], 0
    cmp dword ptr [esi + 12], 0
    jbe L8
    mov ecx, dword ptr [ebp - 4]
L6:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 010000000h
    jne L7
    mov ecx, esi
    call sub_100BBA09
    mov ecx, dword ptr [ebp - 4]
L7:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 4], ecx
    jb L6
L8:
    mov ecx, esi
    call sub_1008AFEB
    test byte ptr [esi + 0000000CCh], 4
    jne L58
L9:
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    mov dword ptr [ebp - 4], ecx
    jbe L15
L10:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 010100000h
    je L12
    cmp eax, 020000000h
    je L11
    cmp eax, 020100000h
    je L11
    cmp eax, 030000000h
    je L11
    xor edi, edi
    inc edi
    jmp L14
L11:
    mov ecx, esi
    call sub_100BC46B
    mov ecx, esi
    mov edi, eax
    call sub_100BA968
    jmp L13
L12:
    push 1
    mov ecx, esi
    call sub_100C6253
    mov edi, eax
L13:
    test edi, edi
    jl L84
    mov ecx, dword ptr [ebp - 4]
L14:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 4], ecx
    jb L10
L15:
    test byte ptr [esi + 108], 000000080h
    je L25
    test byte ptr [esi + 113], 1
    je L25
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    mov dword ptr [ebp - 4], ecx
    jbe L19
L16:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 030000000h
    je L17
    xor edi, edi
    inc edi
    jmp L18
L17:
    test edi, edi
    jl L84
    xor eax, eax
    push eax
    push eax
    push eax
    mov ecx, esi
    call sub_100BBB72
    mov edi, eax
    test edi, edi
    jl L84
    xor eax, eax
    push eax
    push eax
    push eax
    mov ecx, esi
    call sub_100BC1A0
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, dword ptr [ebp - 4]
L18:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 4], ecx
    jb L16
L19:
    mov ecx, esi
    call sub_1008C091
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, esi
    call sub_100BAA21
    and dword ptr [ebp - 4], 0
    cmp dword ptr [esi + 12], 0
    jbe L25
L20:
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 020000000h
    je L22
    cmp eax, 030000000h
    je L21
    cmp eax, 070B00000h
    je L22
    xor edi, edi
    inc edi
    jmp L24
L21:
    mov ecx, esi
    call sub_100C158F
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, esi
    call sub_100C1672
    mov edi, eax
    jmp L23
L22:
    mov ecx, esi
    call sub_100BC58D
    mov ecx, esi
    mov edi, eax
    call sub_100BAA8A
L23:
    test edi, edi
    jl L84
    mov ecx, dword ptr [ebp - 4]
L24:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 4], ecx
    jb L20
L25:
    xor eax, eax
    cmp dword ptr [esi + 12], eax
    mov dword ptr [ebp - 8], eax
    jbe L38
L26:
    mov ecx, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], eax
    mov eax, dword ptr [ecx + eax*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 010500000h
    je L32
    cmp eax, 010F00000h
    je L30
    cmp eax, 011400000h
    je L29
    cmp eax, 020100000h
    je L28
    cmp eax, 020400000h
    jne L33
    test byte ptr [esi + 108], 32
    je L27
    mov ecx, esi
    call sub_100C0F9E
    mov edi, eax
L27:
    cmp edi, 1
    jne L34
    push edi
    mov ecx, esi
    call sub_100C649B
    jmp L31
L28:
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000200h
    jb L33
    mov ecx, esi
    call sub_100C1553
    jmp L31
L29:
    mov ecx, esi
    call sub_100BF357
    jmp L31
L30:
    mov ecx, esi
    call sub_100BE761
L31:
    mov edi, eax
    jmp L34
L32:
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000200h
    jb L33
    mov ecx, esi
    call sub_100BB7D4
    jmp L31
L33:
    xor edi, edi
    inc edi
L34:
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    mov dword ptr [ebp - 4], ecx
    jbe L37
    xor edi, edi
    inc edi
L35:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 070000000h
    jne L36
    mov ecx, esi
    call sub_100C64A1
    mov ecx, dword ptr [ebp - 4]
L36:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 4], ecx
    jb L35
L37:
    test edi, edi
    jl L84
    mov eax, dword ptr [ebp - 8]
    inc eax
    cmp eax, dword ptr [esi + 12]
    mov dword ptr [ebp - 8], eax
    jb L26
L38:
    mov ecx, esi
    call sub_1008C22D
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, esi
    call sub_100BABBD
    and dword ptr [ebp - 4], 0
    cmp dword ptr [esi + 12], 0
    jbe L48
L39:
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 020500000h
    je L44
    cmp eax, 050000000h
    je L43
    cmp eax, 070300000h
    je L42
    cmp eax, 073500000h
    je L41
    cmp eax, 073600000h
    je L41
    cmp eax, 074600000h
    je L40
    cmp eax, 074700000h
    je L40
    xor edi, edi
    inc edi
    jmp L47
L40:
    mov ecx, esi
    call sub_100C0602
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, esi
    call sub_100C0761
    jmp L45
L41:
    mov ecx, esi
    call sub_100BEFA5
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, esi
    call sub_100BF104
    jmp L45
L42:
    push 1
    mov ecx, esi
    call sub_100C1DFC
    jmp L45
L43:
    test byte ptr [esi + 108], 32
    je L46
    mov ecx, esi
    call sub_100C13D2
    jmp L45
L44:
    mov ecx, esi
    call sub_100C0B18
L45:
    mov edi, eax
L46:
    test edi, edi
    jl L84
    mov ecx, dword ptr [ebp - 4]
L47:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 4], ecx
    jb L39
L48:
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    mov dword ptr [ebp - 8], ecx
    jbe L55
L49:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    mov edx, 074400000h
    cmp eax, edx
    ja L51
    je L52
    cmp eax, 073500000h
    je L50
    cmp eax, 073600000h
    je L50
    cmp eax, 073700000h
    je L50
    cmp eax, 073800000h
    jne L54
L50:
    mov ecx, esi
    call sub_100BF2F1
    jmp L53
L51:
    cmp eax, 074500000h
    je L52
    cmp eax, 074600000h
    je L52
    cmp eax, 074700000h
    jne L54
L52:
    mov ecx, esi
    call sub_100C0986
L53:
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, dword ptr [ebp - 8]
L54:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 8], ecx
    jb L49
L55:
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    mov dword ptr [ebp - 8], ecx
    jbe L58
L56:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 073700000h
    jne L57
    mov ecx, esi
    call sub_100BEFBC
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, dword ptr [ebp - 8]
L57:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 8], ecx
    jb L56
L58:
    mov ecx, esi
    call sub_100BAD56
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    mov dword ptr [ebp - 8], ecx
    jbe L62
L59:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 074600000h
    je L60
    cmp eax, 074700000h
    jne L61
L60:
    mov ecx, esi
    call sub_100C076C
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, esi
    call sub_100C08CB
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, dword ptr [ebp - 8]
L61:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 8], ecx
    jb L59
L62:
    xor edi, edi
    cmp dword ptr [esi + 12], edi
    jbe L66
L63:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], edi
    mov eax, dword ptr [eax + edi*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 074400000h
    je L64
    cmp eax, 074500000h
    je L64
    cmp eax, 074600000h
    je L64
    cmp eax, 074700000h
    jne L65
L64:
    mov ecx, esi
    call sub_100C0A83
L65:
    inc edi
    cmp edi, dword ptr [esi + 12]
    jb L63
L66:
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    mov dword ptr [ebp - 8], ecx
    jbe L69
L67:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 020900000h
    jne L68
    mov ecx, esi
    call sub_100BFFE9
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, dword ptr [ebp - 8]
L68:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 8], ecx
    jb L67
L69:
    mov ecx, esi
    call sub_100BAE43
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    mov dword ptr [ebp - 8], ecx
    jbe L72
L70:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 020900000h
    jne L71
    mov ecx, esi
    call sub_100BFB5A
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, dword ptr [ebp - 8]
L71:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 8], ecx
    jb L70
L72:
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    mov dword ptr [ebp - 8], ecx
    jbe L75
L73:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 011400000h
    jne L74
    mov ecx, esi
    call sub_100BB21A
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, dword ptr [ebp - 8]
L74:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 8], ecx
    jb L73
L75:
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    mov dword ptr [ebp - 8], ecx
    jbe L78
L76:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 070300000h
    jne L77
    push 0
    mov ecx, esi
    call sub_100C20A0
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, dword ptr [ebp - 8]
L77:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 8], ecx
    jb L76
L78:
    mov ecx, esi
    call sub_100BAF18
    xor ecx, ecx
    cmp dword ptr [esi + 12], ecx
    mov dword ptr [ebp - 8], ecx
    jbe L83
L79:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, ebx
    cmp eax, 010300000h
    je L80
    cmp eax, 010500000h
    je L80
    cmp eax, 010600000h
    je L80
    cmp eax, 010700000h
    je L80
    cmp eax, 050000000h
    je L80
    cmp eax, 070300000h
    jne L82
    mov ecx, esi
    call sub_100C7DB3
    jmp L81
L80:
    mov ecx, esi
    call sub_100BE8B7
L81:
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, dword ptr [ebp - 8]
L82:
    inc ecx
    cmp ecx, dword ptr [esi + 12]
    mov dword ptr [ebp - 8], ecx
    jb L79
L83:
    mov ecx, esi
    call sub_100BAF8B
    mov ecx, esi
    call sub_1008C613
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, esi
    call sub_10094F6C
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, esi
    call sub_10087617
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, esi
    call sub_1008DC9B
    mov edi, eax
    test edi, edi
    jl L84
    mov ecx, esi
    call sub_100BAFC6
    xor edi, edi
L84:
    pop ebx
L85:
    mov eax, edi
    pop edi
    pop esi
    leave
    ret
FUN_100a603b ENDP
END
