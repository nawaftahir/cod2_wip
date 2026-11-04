.686
.MODEL FLAT, C
EXTRN sub_100650FA:PROC
EXTRN sub_10065124:PROC
EXTRN sub_10065152:PROC
EXTRN sub_10065216:PROC
EXTRN sub_10082910:PROC
EXTRN sub_10082923:PROC
EXTRN sub_1008293B:PROC
EXTRN sub_10082959:PROC
EXTRN sub_100829A3:PROC
EXTRN sub_10082A3D:PROC
EXTRN sub_10082D11:PROC
EXTRN sub_10082F4E:PROC
EXTRN sub_100830FA:PROC
EXTRN sub_1009976C:PROC
EXTRN sub_1009985E:PROC
EXTRN sub_10099881:PROC
EXTRN sub_100998B7:PROC
EXTRN sub_100998F2:PROC
EXTRN sub_10099928:PROC
EXTRN sub_10099956:PROC
EXTRN sub_10099973:PROC
EXTRN sub_10099984:PROC
EXTRN sub_100999C8:PROC
EXTRN sub_100999F4:PROC
EXTRN sub_10099A21:PROC
EXTRN sub_10099A48:PROC
EXTRN sub_10099A6F:PROC
EXTRN sub_10099AA5:PROC
EXTRN sub_10099BB3:PROC
EXTRN sub_10099BE9:PROC
EXTRN sub_10099C20:PROC
EXTRN sub_10099D23:PROC
EXTRN sub_10099D54:PROC
EXTRN sub_10099D87:PROC
EXTRN sub_10099DF1:PROC
EXTRN sub_10099DF6:PROC
EXTRN sub_10099DF8:PROC
EXTRN sub_10099E14:PROC
EXTRN sub_10099E38:PROC
EXTRN sub_10099E7D:PROC
EXTRN sub_10099F00:PROC
EXTRN sub_10099F05:PROC
EXTRN sub_1009A176:PROC
EXTRN sub_1009A18A:PROC
EXTRN sub_1009A1E9:PROC
EXTRN sub_1009A245:PROC
EXTRN sub_1009A264:PROC
EXTRN sub_1009AB6F:PROC
EXTRN sub_1009AE86:PROC
EXTRN sub_1009B440:PROC
EXTRN sub_1009BDC1:PROC
EXTRN sub_1009BFED:PROC
EXTRN sub_1009C113:PROC
EXTRN sub_1009C1BD:PROC
EXTRN sub_1009C449:PROC
EXTRN sub_1009EEFD:PROC
EXTRN sub_1009EF98:PROC
EXTRN sub_100A09CE:PROC
EXTRN sub_100A0E4C:PROC
EXTRN sub_100A0E6F:PROC
EXTRN sub_100A15F6:PROC
.CODE
FUN_100a12d3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 72
    push ebx
    mov eax, 01011580Ch
    push esi
    push edi
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 48], 0101157F8h
    mov dword ptr [ebp - 44], 0101157E4h
    mov dword ptr [ebp - 40], 0101157D0h
    mov dword ptr [ebp - 36], 0101157C0h
    mov dword ptr [ebp - 32], 0101157A8h
    mov dword ptr [ebp - 28], 010115794h
    mov dword ptr [ebp - 72], eax
    mov dword ptr [ebp - 68], 010115788h
    mov dword ptr [ebp - 64], 010115778h
    mov dword ptr [ebp - 60], eax
    mov dword ptr [ebp - 56], eax
    mov dword ptr [ebp - 52], 010115770h
    call sub_10099973
    xor ebx, ebx
    cmp eax, ebx
    mov dword ptr [ebp - 24], eax
    je L79
    cmp dword ptr [ecx + 16], ebx
    je L79
    cmp dword ptr [ebp + 8], ebx
    je L79
    mov eax, dword ptr [eax + 24]
    push 20
    mov dword ptr [ebp - 20], eax
    call sub_100650FA
    cmp eax, ebx
    je L0
    push 010114734h
    push ebx
    push ebx
    mov ecx, eax
    call sub_10082910
    mov dword ptr [ebp - 12], eax
    jmp L1
L0:
    mov dword ptr [ebp - 12], ebx
L1:
    cmp dword ptr [ebp - 12], ebx
    je L79
    push 48
    call sub_10065124
    cmp eax, ebx
    je L2
    push ebx
    push ebx
    push ebx
    push 1
    mov ecx, eax
    call sub_10082D11
    mov edi, eax
    jmp L3
L2:
    xor edi, edi
L3:
    cmp edi, ebx
    mov dword ptr [ebp - 8], edi
    je L79
    mov eax, dword ptr [ebp - 12]
    push 64
    mov dword ptr [eax + 8], edi
    call sub_10065152
    cmp eax, ebx
    je L4
    mov ecx, eax
    call sub_100830FA
    mov esi, eax
    jmp L5
L4:
    xor esi, esi
L5:
    cmp esi, ebx
    je L79
    cmp dword ptr [ebp + 16], ebx
    mov dword ptr [edi + 24], esi
    je L6
    push dword ptr [ebp + 16]
    call sub_10082923
    cmp eax, ebx
    mov dword ptr [edi + 28], eax
    je L79
L6:
    mov ebx, dword ptr [ebp + 12]
    test ebx, ebx
    je L9
    push ebx
    call sub_1008293B
    test eax, eax
    mov dword ptr [esi + 48], eax
    je L79
L7:
    mov eax, dword ptr [ebx + 8]
    test eax, eax
    je L8
    cmp dword ptr [eax + 4], 3
    jne L8
    push eax
    call sub_10082959
    test eax, eax
    mov dword ptr [esi + 44], eax
    je L79
L8:
    mov ebx, dword ptr [ebx + 12]
    test ebx, ebx
    jne L7
L9:
    mov eax, dword ptr [ebp + 20]
    test eax, eax
    je L10
    cmp dword ptr [eax + 4], 13
    je L10
    mov ecx, dword ptr [ebp - 4]
    push eax
    push dword ptr [ebp + 8]
    call sub_1009C1BD
    mov dword ptr [esi + 36], eax
L10:
    xor eax, eax
    cmp dword ptr [ebp - 20], eax
    mov dword ptr [ebp + 16], 1
    mov dword ptr [ebp + 12], eax
    mov dword ptr [ebp - 16], eax
    je L11
    push dword ptr [ebp - 20]
    call sub_100829A3
    test eax, eax
    mov dword ptr [esi + 32], eax
    je L79
L11:
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [eax + 4], 3
    je L19
L12:
    push 24
    call sub_10065216
    test eax, eax
    je L13
    mov ecx, eax
    call sub_10082F4E
    mov ebx, eax
    jmp L14
L13:
    xor ebx, ebx
L14:
    test ebx, ebx
    je L79
    cmp dword ptr [ebp + 12], 0
    je L15
    mov dword ptr [ebp - 16], 000000C01h
L15:
    mov eax, dword ptr [esi + 32]
    mov dword ptr [ebx + 16], eax
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 12]
    test eax, eax
    lea edi, [ebx + 20]
    je L16
    mov ecx, dword ptr [ebp - 4]
    push edi
    push eax
    call sub_100A09CE
    test eax, eax
    jge L18
    mov dword ptr [ebp - 16], 000000BF2h
    jmp L17
L16:
    mov dword ptr [ebp + 12], edi
L17:
    mov dword ptr [edi], 1
L18:
    mov eax, dword ptr [edi]
    imul eax, dword ptr [ebp + 16]
    mov dword ptr [ebp + 16], eax
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [esi + 32], ebx
    mov eax, dword ptr [eax + 8]
    cmp dword ptr [eax + 4], 3
    mov dword ptr [ebp + 8], eax
    jne L12
    mov edi, dword ptr [ebp - 8]
L19:
    push dword ptr [ebp + 8]
    call sub_10082A3D
    test eax, eax
    mov dword ptr [edi + 20], eax
    je L79
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 16]
    mov ebx, dword ptr [eax + 16]
    mov edi, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp - 16]
    add edi, 16
    sub eax, 000000BF2h
    je L77
    sub eax, 15
    je L76
    cmp dword ptr [ebp + 12], 0
    je L25
    test ebx, ebx
    je L21
    cmp ebx, 3
    je L21
    cmp ebx, 4
    je L21
    cmp ebx, 5
    je L21
    push dword ptr [ebp + ebx*4 - 48]
    push dword ptr [edi + 8]
    push 010115740h
    push 000000C00h
L20:
    push edi
    push dword ptr [ebp - 4]
    call sub_1009976C
    add esp, 24
    jmp L79
L21:
    push dword ptr [ebp - 20]
    mov ecx, dword ptr [ebp - 4]
    call sub_10099DF1
    imul eax, dword ptr [ebp + 16]
    test eax, eax
    mov dword ptr [ebp - 20], eax
    je L24
    mov eax, dword ptr [esi + 36]
    test eax, eax
    je L23
    cmp dword ptr [eax + 4], 13
    jne L23
    push dword ptr [eax + 16]
    mov ecx, dword ptr [ebp - 4]
    call sub_10099E14
    xor edx, edx
    div dword ptr [ebp - 20]
    test edx, edx
    je L22
    push dword ptr [ebp + ebx*4 - 72]
    push dword ptr [edi + 8]
    push 010115714h
    push 000000C03h
    jmp L20
L22:
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [ecx], eax
    imul eax, dword ptr [ebp + 16]
    mov dword ptr [ebp + 16], eax
    jmp L25
L23:
    push dword ptr [ebp + ebx*4 - 72]
    push dword ptr [edi + 8]
    push 0101156F4h
    push 000000C02h
    jmp L20
L24:
    mov eax, dword ptr [ebp + 12]
    and dword ptr [eax], 0
    and dword ptr [ebp + 16], 0
L25:
    cmp dword ptr [ebp + 16], 1
    jb L75
    cmp dword ptr [ebp + 16], 000010000h
    ja L75
    push dword ptr [esi + 32]
    mov ecx, dword ptr [ebp - 4]
    call sub_10099E7D
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [esi + 20], eax
    mov edx, dword ptr [ecx + 16]
    mov edx, dword ptr [edx + 16]
    mov dword ptr [esi + 24], edx
    mov ecx, dword ptr [ecx + 16]
    cmp dword ptr [ecx + 16], 1
    je L26
    mov ecx, dword ptr [ebp - 4]
    mov edx, dword ptr [ecx + 88]
    mov dword ptr [esi + 16], edx
    add dword ptr [ecx + 88], eax
    jmp L27
L26:
    or dword ptr [esi + 16], 0FFFFFFFFh
L27:
    mov eax, dword ptr [ebp - 24]
    cmp dword ptr [eax + 20], 0
    mov ecx, dword ptr [eax + 16]
    mov dword ptr [ebp + 16], ecx
    je L28
    push dword ptr [ebp + ebx*4 - 48]
    push dword ptr [edi + 8]
    push 0101156D0h
    push 000000BDFh
    push edi
    push dword ptr [ebp - 4]
    call sub_1009985E
    add esp, 24
L28:
    test byte ptr [ebp + 17], 1
    je L29
    push dword ptr [ebp + ebx*4 - 48]
    push dword ptr [edi + 8]
    push 0101156A8h
    push 000000BEFh
    push edi
    push dword ptr [ebp - 4]
    call sub_10099881
    add esp, 24
L29:
    cmp ebx, 1
    jne L30
    push dword ptr [esi + 32]
    mov ecx, dword ptr [ebp - 4]
    call sub_10099DF8
    test eax, eax
    je L37
    push 0101157E4h
    push dword ptr [edi + 8]
    push 010115684h
    push 000000BDBh
    push edi
    push dword ptr [ebp - 4]
    call sub_100998B7
    add esp, 24
L30:
    cmp ebx, 2
    jne L31
    test byte ptr [ebp + 16], 16
    jne L37
    push dword ptr [esi + 32]
    mov ecx, dword ptr [ebp - 4]
    call sub_10099E38
    test eax, eax
    je L37
    push dword ptr [edi + 8]
    push 010115650h
    push 000000BE6h
    push edi
    push dword ptr [ebp - 4]
    call sub_100998F2
    add esp, 20
L31:
    cmp ebx, 3
    je L32
    cmp ebx, 4
    jne L33
L32:
    push dword ptr [esi + 32]
    mov ecx, dword ptr [ebp - 4]
    call sub_10099F05
    test eax, eax
    jne L33
    push dword ptr [ebp + ebx*4 - 48]
    push dword ptr [edi + 8]
    push 010115634h
    push 000000BDEh
    push edi
    push dword ptr [ebp - 4]
    call sub_10099928
    add esp, 24
L33:
    test ebx, ebx
    jne L37
    test byte ptr [ebp + 16], 2
    je L36
    test byte ptr [ebp + 16], 1
    je L34
    push 0101157F8h
    push dword ptr [edi + 8]
    push 010115608h
    push 000000BBFh
    push edi
    push dword ptr [ebp - 4]
    call sub_10099956
    add esp, 24
    and dword ptr [ebp + 16], 0FFFFFFFDh
L34:
    test byte ptr [ebp + 16], 2
    je L36
    test byte ptr [ebp + 16], 64
    je L35
    push 0101157F8h
    push dword ptr [edi + 8]
    push 0101155D8h
    push 000000BBFh
    push edi
    push dword ptr [ebp - 4]
    call sub_10099984
    add esp, 24
    and dword ptr [ebp + 16], 0FFFFFFFDh
L35:
    test byte ptr [ebp + 16], 2
    jne L42
L36:
    or dword ptr [ebp + 16], 65
    jmp L42
L37:
    test byte ptr [ebp + 16], 2
    je L38
    cmp ebx, 3
    je L38
    cmp ebx, 4
    je L38
    push dword ptr [ebp + ebx*4 - 48]
    push dword ptr [edi + 8]
    push 0101155B0h
    push 000000BBFh
    push edi
    push dword ptr [ebp - 4]
    call sub_100999C8
    add esp, 24
    and dword ptr [ebp + 16], 0FFFFFFFDh
L38:
    test byte ptr [ebp + 16], 64
    je L40
    cmp ebx, 2
    je L39
    push dword ptr [ebp + ebx*4 - 48]
    push dword ptr [edi + 8]
    push 010115588h
    push 000000BE7h
    push edi
    push dword ptr [ebp - 4]
    call sub_100999F4
    add esp, 24
    and dword ptr [ebp + 16], 0FFFFFFBFh
L39:
    test byte ptr [ebp + 16], 64
    je L40
    test byte ptr [ebp + 16], 32
    je L40
    push dword ptr [ebp + ebx*4 - 48]
    push dword ptr [edi + 8]
    push 01011555Ch
    push 000000BF6h
    push edi
    push dword ptr [ebp - 4]
    call sub_10099A21
    add esp, 24
    and dword ptr [ebp + 16], 0FFFFFFBFh
L40:
    test byte ptr [ebp + 16], 1
    je L41
    push dword ptr [ebp + ebx*4 - 48]
    push dword ptr [edi + 8]
    push 010115534h
    push 000000BBEh
    push edi
    push dword ptr [ebp - 4]
    call sub_10099A48
    add esp, 24
    and dword ptr [ebp + 16], 0FFFFFFFEh
L41:
    test byte ptr [ebp + 16], 8
    je L42
    push dword ptr [ebp + ebx*4 - 48]
    push dword ptr [edi + 8]
    push 01011550Ch
    push 000000BEEh
    push edi
    push dword ptr [ebp - 4]
    call sub_10099A6F
    add esp, 24
    and dword ptr [ebp + 16], 0FFFFFFF7h
L42:
    test byte ptr [ebp + 16], 4
    je L43
    cmp ebx, 3
    je L43
    cmp ebx, 4
    je L43
    cmp ebx, 2
    je L43
    push dword ptr [ebp + ebx*4 - 48]
    push dword ptr [edi + 8]
    push 0101154E4h
    push 000000BC0h
    push edi
    push dword ptr [ebp - 4]
    call sub_10099AA5
    add esp, 24
    and dword ptr [ebp + 16], 0FFFFFFFBh
L43:
    cmp ebx, 5
    jne L44
    mov ecx, dword ptr [ebp - 4]
    push 1
    push dword ptr [esi + 32]
    call sub_10099F00
    or dword ptr [ebp + 16], 64
L44:
    mov eax, dword ptr [ebp + 20]
    mov ecx, dword ptr [ebp + 16]
    and dword ptr [ebp - 20], 0
    test eax, eax
    mov dword ptr [esi + 28], ecx
    je L50
    cmp dword ptr [eax + 4], 13
    jne L45
    mov ecx, dword ptr [ebp - 4]
    push 0
    push 0
    push eax
    jmp L48
L45:
    mov eax, dword ptr [esi + 36]
    test eax, eax
    mov dword ptr [ebp + 12], eax
    je L46
    mov eax, dword ptr [eax + 16]
    mov dword ptr [ebp + 20], eax
    jmp L47
L46:
    and dword ptr [ebp + 20], 0
L47:
    push dword ptr [ebp + 20]
    mov ecx, dword ptr [ebp - 4]
    call sub_1009A176
    cmp dword ptr [esi + 20], eax
    mov ecx, dword ptr [ebp - 4]
    push 1
    jne L49
    push 0
    push dword ptr [ebp + 12]
L48:
    push dword ptr [esi + 32]
    call sub_1009EEFD
    jmp L52
L49:
    push dword ptr [ebp + 20]
    push dword ptr [esi + 32]
    push dword ptr [edi + 8]
    push edi
    call sub_1009BFED
    and dword ptr [esi + 36], 0
    jmp L53
L50:
    test ebx, ebx
    je L51
    cmp ebx, 3
    je L51
    cmp ebx, 4
    jne L53
L51:
    test cl, 2
    je L53
    push edi
    fldz
    push ecx
    push ecx
    mov ecx, dword ptr [ebp - 4]
    fstp qword ptr [esp]
    push 0
    push 5
    call sub_1009C449
L52:
    mov dword ptr [esi + 36], eax
L53:
    cmp dword ptr [esi + 36], 0
    je L65
    cmp ebx, 1
    jne L54
    push 010115788h
    push 0101157E4h
    push dword ptr [edi + 8]
    push 0101154C8h
    jmp L55
L54:
    cmp ebx, 2
    jne L56
    push dword ptr [esi + 32]
    mov ecx, dword ptr [ebp - 4]
    call sub_1009A18A
    test eax, eax
    jne L56
    push 010115778h
    push 0101157D0h
    push dword ptr [edi + 8]
    push 010115498h
L55:
    push 000000BC1h
    push edi
    push dword ptr [ebp - 4]
    call sub_10099BB3
    add esp, 28
    jmp L71
L56:
    mov eax, dword ptr [ebp + 16]
    mov dword ptr [ebp + 12], eax
    and dword ptr [ebp + 12], 16
    jne L57
    test al, 32
    je L57
    push dword ptr [ebp + ebx*4 - 72]
    push dword ptr [ebp + ebx*4 - 48]
    push dword ptr [edi + 8]
    push 010115470h
    push 000000BE5h
    push edi
    push dword ptr [ebp - 4]
    call sub_10099BE9
    add esp, 28
    jmp L59
L57:
    mov dword ptr [ebp + 20], eax
    and dword ptr [ebp + 20], 80
    je L58
    push dword ptr [esi + 36]
    mov ecx, dword ptr [ebp - 4]
    call sub_1009AB6F
    test eax, eax
    jne L58
    push dword ptr [ebp + ebx*4 - 72]
    push dword ptr [edi + 8]
    push 010115448h
    push 000000BC3h
    push edi
    push dword ptr [ebp - 4]
    call sub_10099C20
    add esp, 24
    jmp L59
L58:
    mov eax, dword ptr [esi + 36]
    mov ecx, dword ptr [ebp - 4]
    push 0
    push dword ptr [eax + 16]
    push dword ptr [esi + 32]
    call sub_1009BDC1
    test eax, eax
    jne L60
    mov ecx, dword ptr [ebp - 4]
    push eax
    mov eax, dword ptr [esi + 36]
    push dword ptr [eax + 16]
    push dword ptr [esi + 32]
    push dword ptr [edi + 8]
    push edi
    call sub_1009C113
L59:
    and dword ptr [esi + 36], 0
    jmp L70
L60:
    mov eax, dword ptr [ebp + 16]
    and eax, 64
    mov dword ptr [ebp + 16], eax
    je L61
    push dword ptr [esi + 36]
    mov ecx, dword ptr [ebp - 4]
    call sub_100A0E4C
    mov dword ptr [esi + 40], eax
L61:
    cmp dword ptr [ebp + 20], 0
    jne L62
    push dword ptr [esi + 32]
    mov ecx, dword ptr [ebp - 4]
    call sub_1009A1E9
    test eax, eax
    je L62
    push dword ptr [esi + 36]
    mov ecx, dword ptr [ebp - 4]
    call sub_100A0E6F
    jmp L63
L62:
    xor eax, eax
    cmp dword ptr [ebp + 12], eax
    jne L64
    cmp dword ptr [ebp + 16], eax
    je L64
L63:
    mov dword ptr [esi + 36], eax
    jmp L70
L64:
    mov eax, dword ptr [esi + 36]
    mov ecx, dword ptr [ebp - 4]
    and dword ptr [esi + 36], 0
    push esi
    push dword ptr [ebp + 8]
    mov dword ptr [ebp + 20], eax
    call sub_1009EF98
    mov ecx, dword ptr [ebp - 4]
    push 1
    push dword ptr [ebp + 20]
    push eax
    push 20
    call sub_100A15F6
    mov dword ptr [ebp - 20], eax
    jmp L70
L65:
    test ebx, ebx
    jne L66
    push dword ptr [esi + 32]
    mov ecx, dword ptr [ebp - 4]
    call sub_1009A245
    test eax, eax
    je L72
    test byte ptr [ebp + 16], 2
    jne L69
L66:
    cmp ebx, 3
    je L67
    cmp ebx, 4
    jne L68
L67:
    push dword ptr [esi + 32]
    mov ecx, dword ptr [ebp - 4]
    call sub_1009A264
    test eax, eax
    jne L69
L68:
    cmp ebx, 5
    jne L70
L69:
    push dword ptr [ebp + ebx*4 - 72]
    push dword ptr [edi + 8]
    push 010115434h
    push 000000BC4h
    push edi
    push dword ptr [ebp - 4]
    call sub_10099D23
    add esp, 24
L70:
    test ebx, ebx
    je L72
    cmp ebx, 1
    je L72
    cmp ebx, 2
    je L72
    cmp dword ptr [esi + 44], 0
    je L72
    push dword ptr [ebp + ebx*4 - 48]
    push dword ptr [edi + 8]
    push 010115414h
    push 000000BE3h
    push edi
    push dword ptr [ebp - 4]
    call sub_10099D54
    add esp, 24
L71:
    and dword ptr [esi + 36], 0
L72:
    mov eax, dword ptr [ebp - 8]
    cmp dword ptr [eax + 28], 0
    je L73
    test ebx, ebx
    je L73
    cmp ebx, 2
    je L73
    push dword ptr [ebp + ebx*4 - 48]
    push dword ptr [edi + 8]
    push 0101153F0h
    push 000000BE0h
    push edi
    push dword ptr [ebp - 4]
    call sub_10099D87
    mov eax, dword ptr [ebp - 8]
    add esp, 24
    and dword ptr [eax + 28], 0
L73:
    mov ecx, dword ptr [ebp - 4]
    push 0
    push dword ptr [ebp - 8]
    call sub_1009B440
    test eax, eax
    jl L79
    cmp dword ptr [ebp - 20], 0
    je L74
    push dword ptr [ebp - 20]
    mov ecx, dword ptr [ebp - 4]
    call sub_1009AE86
    test eax, eax
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [ecx + 12], eax
    je L79
L74:
    mov eax, dword ptr [ebp - 12]
    jmp L80
L75:
    push dword ptr [edi + 8]
    push 0101151B4h
    push 000000BF3h
    jmp L78
L76:
    push dword ptr [edi + 8]
    push 0101153BCh
    push 000000C01h
    jmp L78
L77:
    push dword ptr [edi + 8]
    push 010115148h
    push 000000BF2h
L78:
    push edi
    push dword ptr [ebp - 4]
    call sub_10099DF6
    add esp, 20
L79:
    xor eax, eax
L80:
    pop edi
    pop esi
    pop ebx
    leave
    ret 16
FUN_100a12d3 ENDP
END
