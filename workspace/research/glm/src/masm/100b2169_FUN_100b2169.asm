.686
.MODEL FLAT, C
EXTRN sub_1006CB6D:PROC
EXTRN sub_1006CCB8:PROC
EXTRN sub_10086100:PROC
EXTRN sub_1008616E:PROC
EXTRN sub_10086186:PROC
EXTRN sub_100867B3:PROC
EXTRN sub_1008B218:PROC
EXTRN sub_1008B25E:PROC
EXTRN sub_1008B701:PROC
EXTRN sub_1008BA0D:PROC
EXTRN sub_1008BF7D:PROC
EXTRN sub_100A7140:PROC
EXTRN sub_100A7834:PROC
EXTRN sub_100A7957:PROC
EXTRN sub_100A7A5C:PROC
EXTRN sub_100A819E:PROC
EXTRN sub_100A829E:PROC
EXTRN sub_100A83F1:PROC
EXTRN sub_100A8971:PROC
EXTRN sub_100A8D68:PROC
EXTRN sub_100A8E20:PROC
EXTRN sub_100A9300:PROC
EXTRN sub_100A9313:PROC
EXTRN sub_100A9899:PROC
EXTRN sub_100A9A38:PROC
EXTRN sub_100A9D75:PROC
EXTRN sub_100AB491:PROC
EXTRN sub_100AB73B:PROC
EXTRN sub_100AB883:PROC
EXTRN sub_100AB8E2:PROC
EXTRN sub_100ABAAF:PROC
EXTRN sub_100ABDF4:PROC
EXTRN sub_100ABEA2:PROC
EXTRN sub_100ABF6D:PROC
EXTRN sub_100AC2E5:PROC
EXTRN sub_100AC4C6:PROC
EXTRN sub_100AC7BF:PROC
EXTRN sub_100AC923:PROC
EXTRN sub_100AD6FE:PROC
EXTRN sub_100AE08C:PROC
EXTRN sub_100AE1F0:PROC
EXTRN sub_100AE309:PROC
EXTRN sub_100B0DC8:PROC
EXTRN sub_100B0DE1:PROC
EXTRN sub_100B0E5B:PROC
EXTRN sub_100B0E74:PROC
EXTRN sub_100B10ED:PROC
EXTRN sub_100B1108:PROC
EXTRN sub_100B1824:PROC
EXTRN sub_100B1EB1:PROC
EXTRN sub_100B2028:PROC
EXTRN sub_100B24D9:PROC
EXTRN sub_100BA8F5:PROC
EXTRN sub_100BAB87:PROC
EXTRN sub_100BAC24:PROC
EXTRN sub_100BAC70:PROC
EXTRN sub_100BACCA:PROC
EXTRN sub_100BAD0F:PROC
EXTRN sub_100BAD92:PROC
EXTRN sub_100BC62A:PROC
EXTRN sub_100BE513:PROC
EXTRN sub_100C1EEB:PROC
EXTRN sub_100C2B76:PROC
EXTRN sub_100C64E2:PROC
EXTRN sub_100C720D:PROC
EXTRN sub_100C74FA:PROC
EXTRN sub_100C751A:PROC
EXTRN sub_100C7675:PROC
EXTRN sub_100C7816:PROC
EXTRN sub_100C788D:PROC
EXTRN sub_100C7B87:PROC
EXTRN sub_100F7E13:PROC
EXTRN sub_100F7E24:PROC
.CODE
FUN_100b2169 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    push ebx
    push esi
    push edi
    push 4
    push 1
    push 000000311h
    push 01010E914h
    mov esi, ecx
    call sub_10086100
    fldz
    push ecx
    push ecx
    fstp qword ptr [esp]
    xor edi, edi
    push edi
    mov ebx, eax
    push edi
    push ebx
    mov ecx, esi
    call sub_1008616E
    fld1
    push ecx
    push ecx
    fstp qword ptr [esp]
    push 1
    push edi
    push ebx
    mov ecx, esi
    mov dword ptr [esi + 000000440h], eax
    call sub_10086186
    mov dword ptr [esi + 000000444h], eax
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    mov dword ptr [esi + 00000044Ch], edi
    jne L3
    xor ebx, ebx
    cmp dword ptr [esi + 12], edi
    jbe L2
L0:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 060700000h
    jne L1
    mov ecx, esi
    call sub_100A7140
    mov edi, eax
    test edi, edi
    jl L85
    xor edi, edi
L1:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L0
L2:
    mov ecx, esi
    call sub_100BA8F5
    mov ecx, esi
    call sub_1008BF7D
L3:
    cmp dword ptr [esi + 12], edi
    mov dword ptr [ebp - 12], edi
    mov dword ptr [ebp - 8], edi
    jbe L13
L4:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    cmp dword ptr [eax + 4], edi
    mov dword ptr [ebp - 4], edi
    jbe L9
    mov edx, dword ptr [eax + 8]
L5:
    mov edi, dword ptr [edx]
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + edi*4]
    mov ebx, dword ptr [ecx + 4]
    mov edi, dword ptr [esi + 16]
    mov edi, dword ptr [edi + ebx*4]
    mov ebx, dword ptr [edi + 4]
    test bl, 16
    je L6
    test bh, 2
    jne L6
    cmp dword ptr [ecx + 16], 3
    jne L6
    cmp byte ptr [ecx + 108], 3
    jne L6
    mov ecx, dword ptr [eax]
    and ecx, 0FFF00000h
    cmp ecx, 060700000h
    jne L7
    cmp dword ptr [ebp - 4], 7
    jne L7
L6:
    inc dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + 000000100h]
    mov edi, dword ptr [ebp - 4]
    add edx, 4
    cmp edi, dword ptr [ecx + 4]
    jb L5
    jmp L8
L7:
    mov ecx, dword ptr [esi + 0000000C8h]
    and ecx, 0000000FFh
    push ecx
    push 010117A98h
    push 0000011A0h
    push dword ptr [eax + 60]
    mov dword ptr [ebp - 12], 1
    push esi
    call sub_1008B218
    add esp, 20
L8:
    xor edi, edi
L9:
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax]
    and ecx, 0FFF00000h
    cmp ecx, 060600000h
    je L10
    cmp ecx, 060B00000h
    je L10
    cmp ecx, 060100000h
    je L10
    cmp ecx, 061000000h
    jne L11
L10:
    push 010115D38h
    push 0000011B4h
    push dword ptr [eax + 60]
    push esi
    call sub_1008B25E
    add esp, 16
    mov dword ptr [ebp - 12], 1
L11:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 12]
    jb L4
    cmp dword ptr [ebp - 12], edi
    je L13
L12:
    mov edi, 080004005h
    jmp L85
L13:
    xor ecx, ecx
    cmp dword ptr [esi + 8], edi
    push 20
    pop edx
    jbe L17
L14:
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    or dword ptr [eax + 56], 0FFFFFFFFh
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov ebx, dword ptr [eax + 4]
    cmp ebx, dword ptr [esi + 000000080h]
    jne L16
    cmp byte ptr [eax + 108], 1
    jne L15
    mov dword ptr [eax], edx
L15:
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    jae L16
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    cmp byte ptr [eax + 108], 3
    jne L16
    mov dword ptr [eax], edx
L16:
    inc ecx
    cmp ecx, dword ptr [esi + 8]
    jb L14
L17:
    xor ecx, ecx
    cmp dword ptr [esi + 12], edi
    jbe L22
L18:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ecx
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [esi + 000000100h], eax
    mov edx, dword ptr [eax]
    and edx, 0FFF00000h
    cmp edx, 060000000h
    je L19
    cmp edx, 060500000h
    je L19
    cmp edx, 060A00000h
    je L19
    cmp edx, 060F00000h
    jne L21
L19:
    xor edx, edx
    cmp dword ptr [eax + 12], edi
    jbe L21
L20:
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax + edx*4]
    mov ebx, dword ptr [esi + 20]
    mov eax, dword ptr [ebx + eax*4]
    mov dword ptr [eax], 20
    mov eax, dword ptr [esi + 000000100h]
    inc edx
    cmp edx, dword ptr [eax + 12]
    jb L20
L21:
    mov eax, dword ptr [esi + 000000100h]
    inc ecx
    mov dword ptr [eax + 36], edi
    cmp ecx, dword ptr [esi + 12]
    jb L18
L22:
    xor ebx, ebx
    cmp dword ptr [esi + 12], edi
    jbe L26
L23:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 020000000h
    je L24
    cmp eax, 020100000h
    je L24
    cmp eax, 030000000h
    jne L25
L24:
    mov ecx, esi
    call sub_100BC62A
    mov edi, eax
    test edi, edi
    jl L85
    xor edi, edi
L25:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L23
L26:
    xor ebx, ebx
    cmp dword ptr [esi + 12], edi
    jbe L31
L27:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 010000000h
    je L28
    cmp eax, 010100000h
    jne L30
    mov ecx, esi
    call sub_100A7957
    jmp L29
L28:
    mov ecx, esi
    call sub_100A7834
L29:
    mov edi, eax
    test edi, edi
    jl L85
    xor edi, edi
L30:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L27
L31:
    mov ecx, esi
    call sub_100BAB87
    xor ebx, ebx
    cmp dword ptr [esi + 12], edi
    jbe L39
L32:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 010100000h
    je L35
    cmp eax, 020400000h
    je L34
    cmp eax, 020500000h
    je L33
    cmp eax, 050000000h
    jne L38
    mov ecx, esi
    call sub_100BE513
    jmp L37
L33:
    mov ecx, esi
    call sub_100C74FA
    jmp L36
L34:
    mov ecx, esi
    call sub_100C788D
    mov ecx, esi
    call sub_100C720D
    push 0
    mov ecx, esi
    call sub_100C7675
    mov ecx, esi
    call sub_100C751A
    jmp L37
L35:
    push 0
    mov ecx, esi
    call sub_100C64E2
L36:
    mov ecx, esi
    call sub_100C7816
L37:
    mov edi, eax
    test edi, edi
    jl L85
L38:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L32
L39:
    mov ecx, esi
    call sub_100BAC24
    xor ebx, ebx
    cmp dword ptr [esi + 12], ebx
    jbe L43
L40:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 020400000h
    je L41
    cmp eax, 020500000h
    jne L42
L41:
    mov ecx, esi
    call sub_100A9D75
    mov edi, eax
    test edi, edi
    jl L85
L42:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L40
L43:
    mov ecx, esi
    call sub_100BAC70
    xor ebx, ebx
    cmp dword ptr [esi + 12], ebx
    jbe L46
L44:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 060F00000h
    jne L45
    push 1
    mov ecx, esi
    call sub_100A9300
    mov edi, eax
    test edi, edi
    jl L85
    push 0
    mov ecx, esi
    call sub_100A9313
    mov edi, eax
    test edi, edi
    jl L85
L45:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L44
L46:
    mov ecx, esi
    call sub_100BACCA
    xor ebx, ebx
    cmp dword ptr [esi + 12], ebx
    jbe L49
L47:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 020400000h
    jne L48
    mov ecx, esi
    call sub_100A9A38
    mov edi, eax
    test edi, edi
    jl L85
L48:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L47
L49:
    mov ecx, esi
    call sub_100BAD0F
    xor ebx, ebx
    cmp dword ptr [esi + 12], ebx
    jbe L52
L50:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov dword ptr [esi + 000000100h], eax
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 070300000h
    jne L51
    mov ecx, esi
    call sub_100C7B87
    push 0
    mov ecx, esi
    call sub_100C1EEB
    mov edi, eax
    test edi, edi
    jl L85
L51:
    inc ebx
    cmp ebx, dword ptr [esi + 12]
    jb L50
L52:
    mov eax, dword ptr [esi + 12]
    xor ebx, ebx
    test eax, eax
    mov dword ptr [ebp - 32], eax
    jbe L54
L53:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [esi + 0000000FCh], ebx
    mov eax, dword ptr [eax + ebx*4]
    mov ecx, esi
    mov dword ptr [esi + 000000100h], eax
    call sub_100A8E20
    mov edi, eax
    test edi, edi
    jl L85
    inc ebx
    cmp ebx, dword ptr [ebp - 32]
    jb L53
L54:
    mov ecx, esi
    call sub_100BAD92
    mov ecx, esi
    call sub_100C2B76
    mov edi, eax
    xor ebx, ebx
    cmp edi, ebx
    jl L85
    mov ecx, esi
    call sub_100A9899
    mov edi, eax
    cmp edi, ebx
    jl L85
    mov ecx, esi
    call sub_100A819E
    mov edi, eax
    cmp edi, ebx
    jl L85
    mov eax, dword ptr [esi + 0000000C8h]
    mov ecx, eax
    and ecx, 00000FFFFh
    cmp ecx, 000000104h
    jne L79
    mov edi, 000000800h
    push edi
    call sub_100F7E13
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 00000022Ch], eax
    je L55
    push edi
    call sub_100F7E24
    cmp eax, ebx
    pop ecx
    mov dword ptr [esi + 000000230h], eax
    jne L56
L55:
    mov eax, 08007000Eh
    jmp L86
L56:
    mov edi, dword ptr [esi + 00000022Ch]
    mov edx, 000000200h
    xor eax, eax
    mov dword ptr [esi + 000000224h], ebx
    mov dword ptr [esi + 000000220h], ebx
    mov ecx, edx
    rep stosd dword ptr es:[edi], eax
    mov edi, dword ptr [esi + 000000230h]
    mov ecx, edx
    rep stosd dword ptr es:[edi], eax
    mov ecx, esi
    call sub_100AB883
    mov edi, eax
    cmp edi, ebx
    jl L85
    mov ecx, esi
    call sub_100ABDF4
    mov edi, eax
    cmp edi, ebx
    jl L85
    mov ecx, esi
    call sub_100ABF6D
    test eax, eax
    jne L12
    mov ecx, esi
    call sub_100ABEA2
    cmp eax, -1
    mov dword ptr [ebp - 32], eax
    jne L58
    push 010117A54h
L57:
    push 000001194h
    push ebx
    push esi
    mov edi, 080004005h
    call sub_1008B701
    add esp, 16
    jmp L85
L58:
    mov ecx, esi
    call sub_100AB73B
    mov dword ptr [ebp - 12], ebx
    lea edi, [esi + 000000304h]
L59:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push ebx
    push ebx
    push dword ptr [esi + 000000088h]
    mov ecx, esi
    call sub_100867B3
    cmp eax, -1
    mov dword ptr [edi], eax
    je L75
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    inc dword ptr [ebp - 12]
    add edi, 4
    cmp dword ptr [ebp - 12], 64
    mov dword ptr [eax + 60], ebx
    jb L59
    or dword ptr [ebp - 16], 0FFFFFFFFh
    or dword ptr [ebp - 28], 0FFFFFFFFh
    push 16
    xor eax, eax
    cmp dword ptr [ebp - 32], ebx
    lea edi, [esi + 0000002C4h]
    pop ecx
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [ebp - 4], ebx
    jbe L72
L60:
    mov edi, dword ptr [esi + 00000022Ch]
    mov edx, 000000200h
    xor eax, eax
    mov ecx, edx
    rep stosd dword ptr es:[edi], eax
    mov edi, dword ptr [esi + 000000230h]
    mov ecx, edx
    rep stosd dword ptr es:[edi], eax
    push 1
    push dword ptr [ebp - 4]
    mov ecx, esi
    mov dword ptr [esi + 000000220h], ebx
    mov dword ptr [esi + 000000224h], ebx
    call sub_100AC2E5
    test eax, eax
    je L71
    mov ecx, esi
    mov dword ptr [esi + 000000408h], ebx
    mov dword ptr [esi + 000000404h], ebx
    call sub_100AB8E2
    lea eax, [ebp - 24]
    push eax
    push dword ptr [esi + 000000220h]
    mov ecx, esi
    push 6
    push dword ptr [esi + 00000022Ch]
    call sub_100B0DC8
    lea eax, [ebp - 12]
    push eax
    push dword ptr [esi + 000000224h]
    mov ecx, esi
    push 6
    push dword ptr [esi + 000000230h]
    call sub_100B0DE1
    lea edi, [esi + 0000002C4h]
    mov dword ptr [ebp - 8], 16
L61:
    mov ecx, dword ptr [edi]
    cmp ecx, ebx
    je L62
    push 1
    call sub_1006CB6D
L62:
    mov dword ptr [edi], ebx
    add edi, 4
    dec dword ptr [ebp - 8]
    jne L61
    mov ecx, esi
    call sub_100B1EB1
    mov edi, eax
    cmp edi, ebx
    jl L85
    cmp edi, 1
    je L71
    push ebx
    mov ecx, esi
    call sub_100AC7BF
    test eax, eax
    jl L71
    push 1
    push 1
    mov ecx, esi
    call sub_100AE08C
    test eax, eax
    jl L71
    lea eax, [ebp - 24]
    push eax
    push dword ptr [esi + 000000220h]
    mov ecx, esi
    push 6
    push dword ptr [esi + 00000022Ch]
    call sub_100B0E5B
    lea eax, [ebp - 12]
    push eax
    push dword ptr [esi + 000000224h]
    mov ecx, esi
    push 6
    push dword ptr [esi + 000000230h]
    call sub_100B0E74
    mov eax, dword ptr [esi + 000000230h]
    mov ecx, dword ptr [esi + 00000022Ch]
    xor edx, edx
    mov dword ptr [ebp - 8], ebx
    sub ecx, eax
    mov dword ptr [ebp - 20], 6
L63:
    cmp dword ptr [ecx + eax], ebx
    je L64
    inc edx
L64:
    cmp dword ptr [eax], ebx
    je L65
    inc dword ptr [ebp - 8]
L65:
    add eax, 4
    dec dword ptr [ebp - 20]
    jne L63
    mov ecx, dword ptr [ebp - 24]
    lea eax, [edx + edx]
    cmp ecx, eax
    mov dword ptr [ebp - 20], ecx
    ja L66
    mov dword ptr [ebp - 20], eax
L66:
    mov eax, dword ptr [ebp - 8]
    mov edi, dword ptr [ebp - 12]
    add eax, eax
    cmp dword ptr [ebp - 12], eax
    ja L67
    mov edi, eax
L67:
    lea eax, [edx + ecx]
    neg eax
    sbb eax, eax
    and eax, 10
    add eax, edi
    add eax, dword ptr [ebp - 20]
    cmp ecx, 8
    jbe L68
    add eax, 20
L68:
    cmp dword ptr [ebp - 12], 8
    jbe L69
    add eax, 20
L69:
    cmp eax, dword ptr [ebp - 28]
    jae L70
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ebp - 16], ecx
    mov dword ptr [ebp - 28], eax
L70:
    mov dword ptr [esi + 000000404h], ebx
L71:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 32]
    jb L60
L72:
    mov edi, dword ptr [esi + 00000022Ch]
    mov edx, 000000200h
    xor eax, eax
    mov ecx, edx
    rep stosd dword ptr es:[edi], eax
    mov edi, dword ptr [esi + 000000230h]
    mov ecx, edx
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [esi + 000000220h], ebx
    mov dword ptr [esi + 000000224h], ebx
    lea edi, [esi + 0000002C4h]
    mov dword ptr [ebp - 32], 12
L73:
    mov ecx, dword ptr [edi]
    cmp ecx, ebx
    je L74
    push 1
    call sub_1006CCB8
L74:
    mov dword ptr [edi], ebx
    add edi, 4
    dec dword ptr [ebp - 32]
    jne L73
    cmp dword ptr [ebp - 16], -1
    jne L76
    push 010117A28h
    jmp L57
L75:
    mov edi, 08007000Eh
    jmp L85
L76:
    push ebx
    push dword ptr [ebp - 16]
    mov ecx, esi
    call sub_100AC4C6
    mov ecx, esi
    call sub_100ABAAF
    mov ecx, esi
    call sub_100B2028
    push ebx
    mov ecx, esi
    call sub_100AC923
    mov edi, eax
    cmp edi, ebx
    jl L85
    push ebx
    push ebx
    mov ecx, esi
    call sub_100AE1F0
    mov edi, eax
    cmp edi, ebx
    jl L85
    mov eax, dword ptr [esi + 00000022Ch]
    xor ecx, ecx
L77:
    cmp dword ptr [eax], ebx
    jne L78
    inc ecx
    add eax, 4
    cmp ecx, 6
    jb L77
L78:
    cmp dword ptr [esi + 000000220h], 6
    jne L83
    cmp ecx, 6
    jne L83
    mov dword ptr [esi + 000000220h], ebx
    jmp L83
L79:
    cmp dword ptr [esi + 12], 000000080h
    jbe L80
    and eax, 0000000FFh
    push eax
    push 0101179E8h
    push 000001194h
    push ebx
    push esi
    call sub_1008BA0D
    add esp, 20
    jmp L12
L80:
    mov ecx, esi
    call sub_100AB491
    mov edi, eax
    cmp edi, ebx
    jl L85
    cmp dword ptr [esi + 00000022Ch], ebx
    je L81
    mov ecx, esi
    call sub_100A83F1
    mov edi, eax
    cmp edi, ebx
    jl L85
    cmp dword ptr [esi + 00000022Ch], ebx
    je L81
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    je L81
    mov ecx, esi
    call sub_100B24D9
    mov edi, eax
    cmp edi, ebx
    jl L85
L81:
    cmp dword ptr [esi + 000000230h], ebx
    je L82
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    je L82
    mov ecx, esi
    call sub_100A8971
    mov edi, eax
    cmp edi, ebx
    jl L85
    mov ecx, esi
    call sub_100B1824
    mov edi, eax
    cmp edi, ebx
    jl L85
    mov ecx, esi
    call sub_100A8D68
    mov edi, eax
    cmp edi, ebx
    jl L85
L82:
    push ebx
    push ebx
    mov ecx, esi
    mov dword ptr [esi + 0000000DCh], ebx
    call sub_100AE309
    mov edi, eax
    cmp edi, ebx
    jl L85
L83:
    mov ecx, esi
    mov dword ptr [esi + 0000000DCh], 1
    call sub_100AD6FE
    mov edi, eax
    cmp edi, ebx
    jl L85
    push ebx
    push dword ptr [esi + 000000220h]
    mov ecx, esi
    push ebx
    push dword ptr [esi + 00000022Ch]
    call sub_100B10ED
    mov edi, eax
    cmp edi, ebx
    jl L85
    push ebx
    push dword ptr [esi + 000000224h]
    mov ecx, esi
    push ebx
    push dword ptr [esi + 000000230h]
    call sub_100B1108
    mov edi, eax
    cmp edi, ebx
    jl L85
    mov ecx, esi
    call sub_100A829E
    mov edi, eax
    cmp edi, ebx
    jl L85
    cmp dword ptr [esi + 000000230h], ebx
    je L84
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    je L84
    call sub_100A7A5C
    mov edi, eax
    cmp edi, ebx
    jl L85
L84:
    xor edi, edi
L85:
    mov eax, edi
L86:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100b2169 ENDP
END
