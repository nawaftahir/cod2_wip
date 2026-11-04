.686
.MODEL FLAT, C
EXTRN sub_1006C6F2:PROC
EXTRN sub_1006CC83:PROC
EXTRN sub_10085519:PROC
EXTRN sub_10085587:PROC
EXTRN sub_100855AE:PROC
EXTRN sub_10085623:PROC
EXTRN sub_100856A7:PROC
EXTRN sub_1008571C:PROC
EXTRN sub_100859A9:PROC
EXTRN sub_10085A21:PROC
EXTRN sub_10085A3E:PROC
EXTRN sub_10085ABD:PROC
EXTRN sub_10085B37:PROC
EXTRN sub_10085BB5:PROC
EXTRN sub_10086241:PROC
EXTRN sub_100863F9:PROC
EXTRN sub_1008667E:PROC
EXTRN sub_1008B8F1:PROC
EXTRN sub_1008B90F:PROC
EXTRN sub_100B3C3D:PROC
EXTRN sub_100B3D25:PROC
EXTRN sub_100B3E6C:PROC
EXTRN sub_100B3FC9:PROC
EXTRN sub_100BAC59:PROC
EXTRN sub_100BB14B:PROC
EXTRN sub_100CA7A0:PROC
EXTRN sub_100CA7AE:PROC
EXTRN sub_100CA9C6:PROC
EXTRN sub_100CAA27:PROC
EXTRN sub_100CAA4B:PROC
EXTRN sub_100CAA82:PROC
EXTRN sub_100CABAE:PROC
EXTRN sub_100CAC46:PROC
EXTRN sub_100CAE2E:PROC
EXTRN sub_100CAE51:PROC
EXTRN sub_100CB158:PROC
EXTRN sub_100CB545:PROC
EXTRN sub_100CB572:PROC
EXTRN sub_100CB684:PROC
EXTRN sub_100CB721:PROC
EXTRN sub_100CBB5A:PROC
EXTRN sub_100CBC8E:PROC
EXTRN sub_100CBC8F:PROC
EXTRN sub_100CBCA1:PROC
EXTRN sub_100CBCF9:PROC
EXTRN sub_100CBD05:PROC
EXTRN sub_100CBD17:PROC
EXTRN sub_100CBD9B:PROC
EXTRN sub_100CBE4C:PROC
EXTRN sub_100CBE4E:PROC
EXTRN sub_100CBE90:PROC
EXTRN sub_100CBF05:PROC
EXTRN sub_100CC0D8:PROC
.CODE
FUN_100b517f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 52
    push ebx
    push esi
    mov ebx, ecx
    mov eax, dword ptr [ebx + 12]
    xor esi, esi
    push edi
    xor edi, edi
    cmp eax, esi
    mov dword ptr [ebp - 20], eax
    mov dword ptr [ebp - 4], esi
    jbe L1
L0:
    mov eax, dword ptr [ebx + 24]
    mov dword ptr [ebx + 0000000FCh], esi
    mov eax, dword ptr [eax + esi*4]
    mov ecx, ebx
    mov dword ptr [ebx + 000000100h], eax
    call sub_100BB14B
    inc esi
    cmp esi, dword ptr [ebx + 12]
    jb L0
L1:
    xor eax, eax
    cmp dword ptr [ebp - 20], eax
    mov dword ptr [ebp - 16], eax
    jbe L23
L2:
    mov ecx, dword ptr [ebx + 24]
    mov dword ptr [ebx + 0000000FCh], eax
    mov eax, dword ptr [ecx + eax*4]
    mov dword ptr [ebx + 000000100h], eax
    mov ecx, dword ptr [eax]
    and ecx, 0FFF00000h
    cmp ecx, 060500000h
    je L3
    cmp ecx, 060F00000h
    je L3
    cmp ecx, 060A00000h
    je L3
    cmp ecx, 060200000h
    je L3
    cmp ecx, 060700000h
    je L3
    cmp ecx, 060C00000h
    je L3
    cmp ecx, 061100000h
    je L3
    cmp ecx, 060300000h
    je L3
    cmp ecx, 060800000h
    je L3
    cmp ecx, 060D00000h
    je L3
    cmp ecx, 061200000h
    je L3
    cmp ecx, 060000000h
    je L3
    cmp ecx, 011000000h
    je L3
    push eax
    jmp L22
L3:
    mov eax, dword ptr [eax]
    mov esi, eax
    and esi, 0000FFFFFh
    and eax, 0FFF00000h
    cmp eax, 011000000h
    mov dword ptr [ebp - 12], esi
    jne L4
    and dword ptr [ebp - 12], 0
L4:
    and dword ptr [ebp - 8], 0
    test esi, esi
    jbe L8
    mov edi, dword ptr [ebp - 12]
    shl edi, 2
L5:
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [edi + eax]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ebp - 8]
    cmp dword ptr [eax + 16], ecx
    jne L8
    test byte ptr [eax + 62], 31
    jne L8
    mov ecx, dword ptr [eax + 4]
    cmp ecx, dword ptr [ebx + 000000080h]
    jne L6
    push dword ptr [eax + 108]
    mov edx, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [edx + 0x54]
    cmp eax, 6
    jmp L7
L6:
    cmp ecx, dword ptr [ebx + 000000088h]
L7:
    jne L8
    inc dword ptr [ebp - 8]
    add edi, 4
    cmp dword ptr [ebp - 8], esi
    jb L5
L8:
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 060000000h
    jne L15
    cmp esi, 1
    jne L15
    mov eax, dword ptr [ebx]
    xor edi, edi
    push edi
    push edi
    push 4
    lea ecx, [ebp - 36]
    push ecx
    push dword ptr [ebx + 0000000FCh]
    mov ecx, ebx
    call dword ptr [eax + 0x80]
    test eax, eax
    jl L74
    push 116
    call sub_100859A9
    cmp eax, edi
    je L9
    mov ecx, eax
    call sub_10085519
    mov esi, eax
    jmp L10
L9:
    xor esi, esi
L10:
    cmp esi, edi
    mov dword ptr [ebp - 4], esi
    je L28
    push edi
    push 2
    push 2
    push 010000002h
    mov ecx, esi
    call sub_10085A21
    test eax, eax
    jl L72
    push dword ptr [ebx + 000000100h]
    mov ecx, esi
    call sub_10085587
    test eax, eax
    jl L72
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 4]
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 4]
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [ecx + 4], eax
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [ebp - 36]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [ebp - 32]
    mov eax, dword ptr [esi + 16]
    mov dword ptr [eax + 4], ecx
    push esi
    mov ecx, ebx
    call sub_10086241
    test eax, eax
    jl L72
    push 116
    call sub_10085A3E
    cmp eax, edi
    je L11
    mov ecx, eax
    call sub_100855AE
    mov esi, eax
    jmp L12
L11:
    xor esi, esi
L12:
    cmp esi, edi
    mov dword ptr [ebp - 8], esi
    je L74
    mov eax, dword ptr [ebx + 000000100h]
    push edi
    push dword ptr [eax + 12]
    mov ecx, esi
    push 4
    push 060500002h
    call sub_10085ABD
    test eax, eax
    mov ecx, esi
    jl L73
    push dword ptr [ebx + 000000100h]
    call sub_10085623
    test eax, eax
    jl L27
    push 8
    pop eax
    lea ecx, [ebp - 36]
    sub ecx, eax
L13:
    mov edx, dword ptr [ebx + 000000100h]
    mov edx, dword ptr [edx + 8]
    mov edi, dword ptr [esi + 8]
    mov edx, dword ptr [edx]
    mov dword ptr [eax + edi - 8], edx
    mov edi, dword ptr [ecx + eax]
    mov edx, dword ptr [esi + 8]
    mov dword ptr [eax + edx], edi
    add eax, 4
    cmp eax, 16
    jb L13
    mov eax, dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [eax + 12]
    mov esi, dword ptr [eax + 16]
    mov eax, dword ptr [ebp - 8]
    mov edi, dword ptr [eax + 16]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebx + 000000100h]
    test ecx, ecx
    je L14
    push 1
    call sub_1006C6F2
    mov eax, dword ptr [ebp - 8]
L14:
    mov ecx, dword ptr [ebx + 24]
    mov edx, dword ptr [ebp - 16]
    mov dword ptr [ecx + edx*4], eax
    mov dword ptr [ebx + 000000100h], eax
    jmp L20
L15:
    cmp dword ptr [ebp - 8], esi
    je L21
    mov eax, dword ptr [ebx]
    xor edi, edi
    push edi
    push edi
    push 4
    lea ecx, [ebp - 52]
    push ecx
    push dword ptr [ebx + 0000000FCh]
    mov ecx, ebx
    call dword ptr [eax + 0x80]
    test eax, eax
    jl L74
    push 116
    call sub_10085B37
    cmp eax, edi
    je L16
    mov ecx, eax
    call sub_100856A7
    mov dword ptr [ebp - 4], eax
    jmp L17
L16:
    mov dword ptr [ebp - 4], edi
L17:
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, edi
    je L28
    push edi
    push esi
    mov eax, esi
    and eax, 0000FFFFFh
    push esi
    or eax, 010000000h
    push eax
    call sub_10085BB5
    test eax, eax
    jl L72
    push dword ptr [ebx + 000000100h]
    mov ecx, dword ptr [ebp - 4]
    call sub_1008571C
    test eax, eax
    jl L72
    cmp esi, edi
    mov dword ptr [ebp - 8], edi
    jbe L19
    mov ecx, dword ptr [ebp - 12]
    shl ecx, 2
L18:
    mov edx, dword ptr [ebx + 000000100h]
    mov edx, dword ptr [edx + 8]
    mov edx, dword ptr [ecx + edx]
    mov eax, dword ptr [ebp - 8]
    mov edi, dword ptr [ebp - 4]
    mov edi, dword ptr [edi + 8]
    shl eax, 2
    inc dword ptr [ebp - 8]
    mov dword ptr [eax + edi], edx
    mov edi, dword ptr [ebp + eax - 52]
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [edx + 16]
    mov dword ptr [eax + edx], edi
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [edx + 16]
    mov edi, dword ptr [ebx + 000000100h]
    mov edi, dword ptr [edi + 8]
    mov eax, dword ptr [eax + edx]
    mov dword ptr [ecx + edi], eax
    add ecx, 4
    cmp dword ptr [ebp - 8], esi
    jb L18
L19:
    push dword ptr [ebp - 4]
    mov ecx, ebx
    call sub_100863F9
    test eax, eax
    jl L72
L20:
    and dword ptr [ebp - 4], 0
L21:
    push dword ptr [ebx + 000000100h]
L22:
    mov ecx, ebx
    call sub_1008667E
    mov edi, eax
    test edi, edi
    jl L74
    mov eax, dword ptr [ebx + 000000100h]
    and dword ptr [eax], 0
    mov eax, dword ptr [ebp - 16]
    inc eax
    cmp eax, dword ptr [ebp - 20]
    mov dword ptr [ebp - 16], eax
    jb L2
L23:
    mov ecx, ebx
    call sub_100BAC59
    mov eax, dword ptr [ebx + 12]
    xor esi, esi
    test eax, eax
    mov dword ptr [ebp - 20], eax
    jbe L74
L24:
    mov eax, dword ptr [ebx + 24]
    mov dword ptr [ebx + 0000000FCh], esi
    mov eax, dword ptr [eax + esi*4]
    mov dword ptr [ebx + 000000100h], eax
    mov eax, dword ptr [eax + 60]
    test eax, eax
    je L25
    cmp dword ptr [eax + 4], 13
    jne L25
    add eax, 48
    mov dword ptr [ebx + 000000104h], eax
L25:
    mov ecx, dword ptr [ebx + 000000100h]
    mov eax, dword ptr [ecx]
    and eax, 0FFF00000h
    je L26
    cmp dword ptr [ecx + 4], 0
    je L26
    mov ecx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [ebx + 20]
    mov ecx, dword ptr [edx + ecx*4]
    cmp dword ptr [ecx + 8], -1
    jne L68
L26:
    mov ecx, 060500000h
    cmp eax, ecx
    ja L51
    je L56
    mov ecx, 020100000h
    cmp eax, ecx
    ja L41
    je L65
    mov ecx, 010600000h
    cmp eax, ecx
    ja L34
    je L33
    test eax, eax
    je L67
    cmp eax, 010000000h
    je L32
    cmp eax, 010100000h
    je L31
    cmp eax, 010300000h
    je L30
    cmp eax, 010400000h
    je L29
    cmp eax, 010500000h
    jne L71
    mov ecx, ebx
    call sub_100CBC8E
    jmp L66
L27:
    mov ecx, esi
    jmp L73
L28:
    mov eax, 08007000Eh
    jmp L75
L29:
    mov ecx, ebx
    call sub_100CBCA1
    jmp L66
L30:
    mov ecx, ebx
    call sub_100CBC8F
    jmp L66
L31:
    mov ecx, ebx
    call sub_100CB158
    jmp L66
L32:
    mov ecx, ebx
    call sub_100CBB5A
    jmp L66
L33:
    mov ecx, ebx
    call sub_100CBCF9
    jmp L66
L34:
    cmp eax, 010700000h
    je L40
    cmp eax, 010D00000h
    je L39
    cmp eax, 010E00000h
    je L37
    cmp eax, 010F00000h
    je L63
    cmp eax, 011000000h
    je L36
    cmp eax, 020000000h
    jne L71
L35:
    mov ecx, ebx
    call sub_100B3E6C
    jmp L66
L36:
    mov ecx, ebx
    call sub_100CA9C6
    jmp L66
L37:
    test byte ptr [ebx + 112], 16
    je L38
    mov ecx, ebx
    call sub_100CBD05
    jmp L66
L38:
    mov edi, 080004001h
    jmp L67
L39:
    test byte ptr [ebx + 112], 16
    je L38
    mov ecx, ebx
    call sub_100CBD17
    jmp L66
L40:
    mov ecx, ebx
    call sub_100CBD9B
    jmp L66
L41:
    mov ecx, 050000000h
    cmp eax, ecx
    ja L48
    je L47
    cmp eax, 020200000h
    je L46
    cmp eax, 020300000h
    je L45
    cmp eax, 020400000h
    je L44
    cmp eax, 020500000h
    je L43
    cmp eax, 020700000h
    je L42
    cmp eax, 030000000h
    jne L71
    mov ecx, ebx
    call sub_100CBF05
    jmp L66
L42:
    mov ecx, ebx
    call sub_100CAE51
    jmp L66
L43:
    mov ecx, ebx
    call sub_100CBE4C
    jmp L66
L44:
    mov ecx, ebx
    call sub_100CBE4E
    jmp L66
L45:
    mov ecx, ebx
    call sub_100B3C3D
    jmp L66
L46:
    mov ecx, ebx
    call sub_100B3D25
    jmp L66
L47:
    mov ecx, ebx
    call sub_100CBE90
    jmp L66
L48:
    cmp eax, 050300000h
    je L50
    cmp eax, 060000000h
    je L56
    cmp eax, 060100000h
    je L52
    cmp eax, 060200000h
    je L55
    cmp eax, 060300000h
    je L54
    cmp eax, 060400000h
    jne L71
L49:
    test byte ptr [ebx + 112], 32
    je L69
    mov ecx, ebx
    call sub_100CAA4B
    jmp L66
L50:
    mov ecx, ebx
    call sub_100CAC46
    jmp L66
L51:
    mov ecx, 061300000h
    cmp eax, ecx
    ja L57
    je L49
    mov ecx, 060C00000h
    cmp eax, ecx
    ja L53
    je L55
    cmp eax, 060600000h
    je L52
    cmp eax, 060700000h
    je L55
    cmp eax, 060800000h
    je L54
    cmp eax, 060900000h
    je L49
    cmp eax, 060A00000h
    je L56
    cmp eax, 060B00000h
    jne L71
L52:
    mov ecx, ebx
    call sub_100CA7AE
    jmp L66
L53:
    cmp eax, 060D00000h
    je L54
    cmp eax, 060E00000h
    je L49
    cmp eax, 060F00000h
    je L56
    cmp eax, 061000000h
    je L52
    cmp eax, 061100000h
    je L55
    cmp eax, 061200000h
    jne L71
L54:
    mov ecx, ebx
    call sub_100CAA82
    jmp L66
L55:
    mov ecx, ebx
    call sub_100CAA27
    jmp L66
L56:
    mov ecx, ebx
    call sub_100CA7A0
    jmp L66
L57:
    mov ecx, 070B00000h
    cmp eax, ecx
    ja L62
    je L35
    cmp eax, 070000000h
    je L61
    cmp eax, 070100000h
    je L60
    cmp eax, 070200000h
    je L59
    cmp eax, 070300000h
    je L58
    cmp eax, 070400000h
    je L58
    cmp eax, 070800000h
    jne L71
    mov ecx, ebx
    call sub_100CABAE
    jmp L66
L58:
    mov ecx, ebx
    call sub_100CB721
    jmp L66
L59:
    mov ecx, ebx
    call sub_100CB684
    jmp L66
L60:
    mov ecx, ebx
    call sub_100CB572
    jmp L66
L61:
    mov ecx, ebx
    call sub_100CC0D8
    jmp L66
L62:
    cmp eax, 070C00000h
    je L65
    cmp eax, 070D00000h
    je L64
    cmp eax, 073500000h
    je L63
    cmp eax, 073600000h
    je L63
    cmp eax, 073700000h
    je L63
    cmp eax, 073800000h
    jne L71
L63:
    mov ecx, ebx
    call sub_100CAE2E
    jmp L66
L64:
    mov ecx, ebx
    call sub_100CB545
    jmp L66
L65:
    mov ecx, ebx
    call sub_100B3FC9
L66:
    mov edi, eax
L67:
    cmp edi, 080004001h
    je L71
    inc esi
    cmp esi, dword ptr [ebp - 20]
    jb L24
    jmp L74
L68:
    push 0101179B4h
    push 00000119Fh
    jmp L70
L69:
    push 010117C40h
    push 0000011B4h
L70:
    mov eax, dword ptr [ebx + 000000100h]
    push dword ptr [eax + 60]
    push ebx
    call sub_1008B8F1
    add esp, 16
    jmp L74
L71:
    mov eax, dword ptr [ebx + 000000100h]
    push 010115D38h
    push 0000011B4h
    push dword ptr [eax + 60]
    push ebx
    call sub_1008B90F
    add esp, 16
L72:
    mov ecx, dword ptr [ebp - 4]
    test ecx, ecx
    je L74
L73:
    push 1
    call sub_1006CC83
L74:
    xor eax, eax
L75:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100b517f ENDP
END
