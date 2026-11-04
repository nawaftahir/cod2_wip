.686
.MODEL FLAT, C
EXTRN sub_1006E068:PROC
EXTRN sub_1006E341:PROC
EXTRN sub_10086B53:PROC
EXTRN sub_10086B8B:PROC
EXTRN sub_10086C81:PROC
EXTRN sub_10087C24:PROC
EXTRN sub_1008A995:PROC
EXTRN sub_1008AF22:PROC
EXTRN sub_1008BAC6:PROC
EXTRN sub_1008DAEB:PROC
EXTRN sub_1008E45D:PROC
EXTRN sub_1008F6B2:PROC
EXTRN sub_10094829:PROC
EXTRN sub_1009482D:PROC
EXTRN sub_10094831:PROC
EXTRN sub_10094835:PROC
EXTRN sub_1009483A:PROC
EXTRN sub_10094845:PROC
EXTRN sub_10094885:PROC
EXTRN sub_1009488E:PROC
EXTRN sub_10094899:PROC
EXTRN sub_1009489F:PROC
EXTRN sub_100948A2:PROC
EXTRN sub_100948E0:PROC
EXTRN sub_100948EF:PROC
EXTRN sub_100948FA:PROC
EXTRN sub_10094909:PROC
EXTRN sub_10094952:PROC
EXTRN sub_10094961:PROC
EXTRN sub_10094969:PROC
EXTRN sub_10094998:PROC
EXTRN sub_100949A3:PROC
EXTRN sub_100949BD:PROC
EXTRN sub_100949D1:PROC
EXTRN sub_100949D6:PROC
EXTRN sub_100949EF:PROC
EXTRN sub_100949F8:PROC
EXTRN sub_10094A98:PROC
EXTRN sub_10094AAF:PROC
EXTRN sub_10094AF8:PROC
EXTRN sub_10094B22:PROC
EXTRN sub_10094B37:PROC
EXTRN sub_10094B39:PROC
EXTRN sub_10094B4A:PROC
EXTRN sub_10094B52:PROC
EXTRN sub_10094B58:PROC
EXTRN sub_10094B90:PROC
EXTRN sub_10094BD9:PROC
EXTRN sub_10094BE5:PROC
EXTRN sub_10094BFD:PROC
EXTRN sub_10094C09:PROC
EXTRN sub_10094C15:PROC
EXTRN sub_10094C77:PROC
EXTRN sub_10094C7B:PROC
EXTRN sub_10094CE4:PROC
EXTRN sub_10094D24:PROC
EXTRN sub_10094D60:PROC
EXTRN sub_10094D66:PROC
EXTRN sub_10094E23:PROC
EXTRN sub_10094E69:PROC
EXTRN sub_10094EB1:PROC
EXTRN sub_10094EBE:PROC
EXTRN sub_10094EDA:PROC
EXTRN sub_10094EE4:PROC
EXTRN sub_10094EEE:PROC
EXTRN sub_10094F25:PROC
EXTRN sub_10094F2E:PROC
EXTRN sub_10094F32:PROC
EXTRN sub_10094F4D:PROC
EXTRN sub_10094F56:PROC
EXTRN sub_10094F85:PROC
EXTRN sub_10094F8D:PROC
EXTRN sub_10094F9A:PROC
EXTRN sub_10094FA7:PROC
EXTRN sub_10094FB5:PROC
EXTRN sub_10094FBF:PROC
EXTRN sub_10094FCD:PROC
EXTRN sub_10094FCF:PROC
EXTRN sub_10094FDC:PROC
EXTRN sub_10095039:PROC
EXTRN sub_1009503D:PROC
EXTRN sub_10095044:PROC
EXTRN sub_1009504D:PROC
EXTRN sub_10095072:PROC
EXTRN sub_10095092:PROC
EXTRN sub_100950B8:PROC
EXTRN sub_100950CF:PROC
EXTRN sub_100950F3:PROC
EXTRN sub_100950F8:PROC
EXTRN sub_10095102:PROC
EXTRN sub_1009510B:PROC
EXTRN sub_100951B0:PROC
EXTRN sub_100951B6:PROC
EXTRN sub_10095270:PROC
EXTRN sub_10095273:PROC
EXTRN sub_10095285:PROC
EXTRN sub_10095297:PROC
EXTRN sub_1009529D:PROC
EXTRN sub_100952A3:PROC
EXTRN sub_100952C7:PROC
EXTRN sub_100952F0:PROC
EXTRN sub_10095315:PROC
EXTRN sub_10095332:PROC
EXTRN sub_10095334:PROC
EXTRN sub_10095398:PROC
EXTRN sub_100953A6:PROC
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_10093c67 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 72
    push push ebx
    push push esi
    push push edi
    xor xor ebx, ebx
    mov mov edi, ecx
    mov mov dword ptr [ebp - 4], ebx
    call sub_1008AF22
    call sub_1008A995
    or or dword ptr [ebp - 32], -1
    or or dword ptr [ebp - 16], -1
    cmp cmp dword ptr [edi + 12], ebx
    mov mov dword ptr [ebp - 24], ebx
    jbe sub_1009482D
    jmp L0
    xor xor ebx, ebx
    mov mov eax, dword ptr [edi + 24]
    mov mov ecx, dword ptr [ebp - 24]
    mov mov esi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi]
    mov mov edx, eax
    and and edx, 0FFF00000h
    je sub_10094835
    cmp cmp edx, 011000000h
    mov mov ecx, dword ptr [edi + 8]
    mov mov dword ptr [ebp - 12], ecx
    jne L3
    xor xor edx, edx
    cmp cmp dword ptr [esi + 4], ebx
    jbe L1
    mov mov eax, dword ptr [edi + 20]
    mov mov ecx, dword ptr [esi + 8]
    mov mov ebx, dword ptr [ecx]
    mov mov ebx, dword ptr [eax + ebx*4]
    mov mov ebx, dword ptr [ebx + 48]
    mov mov ebx, dword ptr [eax + ebx*4]
    test test byte ptr [ebx], 4
    je L4
    inc inc edx
    add add ecx, 4
    cmp cmp edx, dword ptr [esi + 4]
    jb L2
    cmp cmp edx, dword ptr [esi + 4]
    jne L60
    jmp L59
    mov mov ecx, eax
    and and ecx, 0F0000000h
    cmp cmp ecx, 010000000h
    jne L15
    cmp cmp dword ptr [esi + 12], ebx
    mov mov dword ptr [ebp - 8], ebx
    mov mov dword ptr [ebp - 12], ebx
    jbe L11
    mov mov ecx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [esi + 16]
    mov mov ebx, dword ptr [esi + 8]
    shl shl ecx, 2
    mov mov edx, dword ptr [ecx + eax]
    mov mov ecx, dword ptr [ecx + ebx]
    mov mov eax, dword ptr [edi + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov ebx, dword ptr [ecx + 48]
    mov mov ecx, dword ptr [esi]
    and and ecx, 0FFF00000h
    cmp cmp ecx, 010000000h
    mov mov dword ptr [ebp - 36], edx
    mov mov dword ptr [ebp - 40], ebx
    je L5
L1:
    cmp cmp ecx, 010100000h
L2:
    jne L9
    mov mov ecx, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [eax + ebx*4]
    mov mov eax, dword ptr [edx]
    mov mov dword ptr [ebp - 44], ecx
    mov mov ecx, dword ptr [ecx]
    or or eax, ecx
    and and eax, 0E000000h
    mov mov ebx, 02000000h
    test test ebx, eax
    jne L6
    mov mov ebx, 04000000h
    test test ebx, eax
    jne L7
    mov mov ebx, 08000000h
    test test ebx, eax
    je L8
    mov mov eax, ebx
    mov mov ebx, ecx
    and and ebx, 0E000000h
    cmp cmp eax, ebx
    je L10
    mov mov ebx, dword ptr [ebp - 44]
    and and ecx, 0F1FFFFFFh
    or or ecx, eax
    mov mov dword ptr [ebx], ecx
    mov mov dword ptr [ebp - 4], 1
    mov mov ecx, dword ptr [edx]
    mov mov dword ptr [ebp - 44], ecx
    and and ecx, 0E000000h
    cmp cmp eax, ecx
    je L12
    mov mov ecx, dword ptr [edx + 4]
    mov mov ebx, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebx + ecx*4]
    test test byte ptr [ecx + 4], 2
    je L13
    xor xor ebx, ebx
    inc inc ebx
    cmp cmp dword ptr [edx + 92], ebx
    jne L14
    mov mov ecx, dword ptr [ebp - 44]
    and and ecx, 0F1FFFFFFh
    or or ecx, eax
    mov mov dword ptr [edx], ecx
    mov mov dword ptr [ebp - 4], ebx
    push push dword ptr [ebp - 40]
    mov mov ebx, dword ptr [ebp - 36]
    push push ebx
    push push esi
    mov mov ecx, edi
    call sub_1008DAEB
    test test eax, eax
    jl sub_10094998
    mov mov eax, dword ptr [edi + 20]
    lea lea ecx, [eax + ebx*4]
    mov mov edx, dword ptr [ecx]
    mov mov edx, dword ptr [edx + 48]
    cmp cmp edx, ebx
    jne L16
    inc inc dword ptr [ebp - 8]
    jmp L17
    mov mov edx, dword ptr [eax + edx*4]
    cmp cmp dword ptr [edx + 48], -1
    jne L18
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [ecx + 48]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [eax + 48], ecx
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [esi + 12]
    jb L11
    mov mov eax, dword ptr [esi + 12]
    cmp cmp dword ptr [ebp - 8], eax
    je sub_10094909
    xor xor ecx, ecx
L5:
    cmp cmp eax, ecx
    mov mov dword ptr [ebp - 8], ecx
    mov mov dword ptr [ebp - 4], ecx
    jbe L21
    mov mov edx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov ecx, dword ptr [edi + 20]
    mov mov ebx, dword ptr [ecx + eax*4]
    cmp cmp dword ptr [ebx + 48], eax
    jne L19
    mov mov ecx, dword ptr [ebp - 8]
    shl shl ecx, 2
    inc inc dword ptr [ebp - 8]
    mov mov dword ptr [ecx + edx], eax
    mov mov eax, dword ptr [esi + 8]
    mov mov edx, dword ptr [ebp - 4]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov dword ptr [ecx + eax], edx
    jmp L22
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [eax + 48]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [ecx + 4]
    mov mov ebx, dword ptr [edi + 16]
    mov mov edx, dword ptr [ebx + edx*4]
    test test byte ptr [edx + 4], 2
    je L23
    cmp cmp dword ptr [ecx + 96], 0
L6:
    jne L24
    mov mov eax, dword ptr [eax + 96]
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + 96], eax
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [edi + 20]
L8:
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 100]
    mov mov dword ptr [ecx + 100], eax
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 12]
    jb L20
    mov mov ecx, dword ptr [ebp - 8]
    test test ecx, ecx
    je L25
    mov mov eax, dword ptr [esi]
    xor xor eax, ecx
    and and eax, 0FFFFFh
    xor xor eax, dword ptr [esi]
    jmp L26
    xor xor eax, eax
    mov mov dword ptr [esi + 4], ecx
    mov mov dword ptr [esi + 12], ecx
    jmp sub_100949A3
    cmp cmp ecx, 020000000h
    jne L43
    cmp cmp dword ptr [esi + 12], ebx
    mov mov dword ptr [ebp - 20], ebx
    mov mov dword ptr [ebp - 8], ebx
    jbe L35
    mov mov edx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [esi + 8]
    shl shl edx, 2
    mov mov ebx, dword ptr [edx + eax]
    mov mov edx, dword ptr [edx + ecx]
    mov mov eax, dword ptr [edi + 20]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [edx + 48]
    mov mov dword ptr [ebp - 40], edx
    mov mov edx, dword ptr [esi + 12]
    add add edx, dword ptr [ebp - 8]
    mov mov dword ptr [ebp - 52], ebx
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ecx + 48]
    mov mov ecx, dword ptr [esi]
    and and ecx, 0FFF00000h
    cmp cmp ecx, 020000000h
    mov mov dword ptr [ebp - 48], edx
    je L27
    cmp cmp ecx, 020100000h
    jne L34
    mov mov ecx, dword ptr [eax + ebx*4]
    mov mov dword ptr [ebp - 44], ecx
    mov mov ecx, dword ptr [ebp - 40]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [ebp - 36], ecx
    mov mov ecx, dword ptr [eax]
    or or ecx, edx
    and and ecx, 0E000000h
    mov mov ebx, 08000000h
    test test ebx, ecx
    mov mov dword ptr [ebp - 28], eax
    jne L28
    mov mov ebx, 04000000h
    test test ebx, ecx
    jne L29
    mov mov ebx, 02000000h
    test test ebx, ecx
    je L30
    mov mov ecx, ebx
    mov mov ebx, dword ptr [ebp - 44]
    mov mov ebx, dword ptr [ebx]
    and and ebx, 0E000000h
    or or ecx, ebx
    mov mov ebx, 02000000h
    test test ebx, ecx
    jne L31
    mov mov ebx, 04000000h
    test test ebx, ecx
    jne L32
    mov mov ebx, 08000000h
    test test ebx, ecx
    je L33
    mov mov ecx, ebx
    mov mov ebx, edx
    and and ebx, 0E000000h
    cmp cmp ecx, ebx
    je L36
    mov mov eax, dword ptr [ebp - 36]
    mov mov eax, dword ptr [eax + 4]
    mov mov ebx, dword ptr [edi + 16]
    mov mov eax, dword ptr [ebx + eax*4]
    test test byte ptr [eax + 4], 2
    je L37
    mov mov eax, dword ptr [ebp - 36]
    xor xor ebx, ebx
    inc inc ebx
    cmp cmp dword ptr [eax + 92], ebx
    jne L38
    and and edx, 0F1FFFFFFh
    or or edx, ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [ebp - 4], ebx
    mov mov eax, dword ptr [ebp - 28]
    mov mov edx, dword ptr [eax]
    mov mov dword ptr [ebp - 44], edx
    and and edx, 0E000000h
    cmp cmp ecx, edx
    je L39
    mov mov edx, dword ptr [eax + 4]
    mov mov ebx, dword ptr [edi + 16]
    mov mov edx, dword ptr [ebx + edx*4]
    test test byte ptr [edx + 4], 2
    je L40
    xor xor ebx, ebx
    inc inc ebx
    cmp cmp dword ptr [eax + 92], ebx
    jne L41
    mov mov edx, dword ptr [ebp - 44]
    and and edx, 0F1FFFFFFh
    or or edx, ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [ebp - 4], ebx
    push push dword ptr [ebp - 48]
    mov mov ebx, dword ptr [ebp - 52]
    push push dword ptr [ebp - 40]
    mov mov ecx, edi
    push push ebx
    push push esi
    call sub_1008E45D
    test test eax, eax
    jl sub_10094BD9
    mov mov eax, dword ptr [edi + 20]
    lea lea ecx, [eax + ebx*4]
    mov mov edx, dword ptr [ecx]
    mov mov edx, dword ptr [edx + 48]
    cmp cmp edx, ebx
    jne L42
    inc inc dword ptr [ebp - 20]
    jmp L44
    mov mov edx, dword ptr [eax + edx*4]
    cmp cmp dword ptr [edx + 48], -1
    jne L45
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [ecx + 48]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [eax + 48], ecx
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 12]
    jb L35
    mov mov eax, dword ptr [esi + 12]
    cmp cmp dword ptr [ebp - 20], eax
    je sub_10094B4A
    cmp cmp dword ptr [ebp - 20], 0
    jne L48
    xor xor ecx, ecx
    inc inc ecx
    cmp cmp eax, ecx
    mov mov dword ptr [ebp - 28], ecx
    jbe L46
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [edi + 20]
    mov mov edx, dword ptr [ecx]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [edx + 48]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [edx + 4]
    add add ecx, 4
    mov mov ebx, dword ptr [ecx]
    mov mov ebx, dword ptr [eax + ebx*4]
    mov mov ebx, dword ptr [ebx + 48]
    mov mov ebx, dword ptr [eax + ebx*4]
    cmp cmp edx, dword ptr [ebx + 4]
    jne L49
    inc inc dword ptr [ebp - 28]
    mov mov ebx, dword ptr [ebp - 28]
    add add ecx, 4
L22:
    cmp cmp ebx, dword ptr [esi + 12]
    jb L47
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [esi + 12], 0
    jbe sub_10094B90
    mov mov edx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov eax, dword ptr [edi + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ecx + 48]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [eax + 4]
    mov mov ebx, dword ptr [edi + 16]
    mov mov edx, dword ptr [ebx + edx*4]
    test test byte ptr [edx + 4], 2
    je L52
    cmp cmp dword ptr [eax + 96], 0
    jne L53
    mov mov ecx, dword ptr [ecx + 96]
    mov mov edx, dword ptr [ebp - 8]
    mov mov dword ptr [eax + 96], ecx
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 100]
    mov mov dword ptr [eax + 100], ecx
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 12]
    jb L51
    jmp sub_10094BE5
    mov mov eax, dword ptr [esi + 12]
    test test eax, eax
    je L50
    and and dword ptr [ebp - 20], 0
    test test eax, eax
    jbe L54
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [edi + 20]
    mov mov edx, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [edx + 48], ecx
    mov mov dword ptr [ebp - 52], edx
    je L55
    mov mov ebx, dword ptr [edx]
    mov mov edx, dword ptr [edx + 48]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [eax]
    and and eax, 0F1FFFFFFh
    or or eax, ebx
    cmp cmp ebx, eax
    je L56
    mov mov edx, dword ptr [ebp - 52]
    mov mov dword ptr [edx], eax
    mov mov dword ptr [ebp - 4], 1
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [eax + 48], ecx
    inc inc dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [esi + 12]
    jb L54
    mov mov ebx, dword ptr [ebp - 12]
    mov mov eax, ebx
    cmp cmp eax, dword ptr [edi + 8]
    jae L57
    mov mov eax, dword ptr [edi + 20]
    mov mov ecx, dword ptr [eax + ebx*4]
    test test ecx, ecx
    je L58
    push push 1
    call sub_1006E068
    inc inc ebx
    cmp cmp ebx, dword ptr [edi + 8]
    jb L57
    mov mov eax, dword ptr [ebp - 12]
    jmp sub_100949BD
    cmp cmp ecx, 030000000h
    jne sub_100949D1
    cmp cmp dword ptr [esi + 12], 0
    mov mov dword ptr [ebp - 20], ebx
    mov mov dword ptr [ebp - 8], ebx
    jbe sub_100948A2
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov ecx, dword ptr [esi + 8]
    mov mov edx, dword ptr [ecx + ebx*4]
    mov mov dword ptr [ebp - 44], eax
    mov mov eax, dword ptr [edi + 20]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [edx + 48]
    mov mov dword ptr [ebp - 56], edx
    mov mov edx, dword ptr [esi + 12]
    add add ebx, edx
    mov mov ebx, dword ptr [ecx + ebx*4]
    mov mov ebx, dword ptr [eax + ebx*4]
    mov mov ebx, dword ptr [ebx + 48]
    mov mov dword ptr [ebp - 36], ebx
    mov mov ebx, dword ptr [ebp - 8]
    lea lea edx, [ebx + edx*2]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ecx + 48]
    mov mov ecx, dword ptr [esi]
    and and ecx, 0FFF00000h
    cmp cmp ecx, 030000000h
    mov mov dword ptr [ebp - 48], edx
    jne sub_1009489F
    mov mov ecx, dword ptr [ebp - 44]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov dword ptr [ebp - 52], ecx
    mov mov ecx, dword ptr [ebp - 36]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [ebp - 40], ecx
    mov mov ecx, dword ptr [eax]
    or or ecx, edx
    and and ecx, 0E000000h
    mov mov ebx, 08000000h
    test test ebx, ecx
    mov mov dword ptr [ebp - 28], eax
    jne sub_10094831
    mov mov ebx, 04000000h
    test test ebx, ecx
    jne sub_1009483A
    mov mov ebx, 02000000h
    test test ebx, ecx
    je sub_10094845
    mov mov ecx, ebx
    mov mov ebx, dword ptr [ebp - 52]
    mov mov ebx, dword ptr [ebx]
    and and ebx, 0E000000h
    or or ecx, ebx
    mov mov ebx, 02000000h
    test test ebx, ecx
    jne sub_10094885
    mov mov ebx, 04000000h
    test test ebx, ecx
    jne sub_1009488E
    mov mov ebx, 08000000h
    test test ebx, ecx
    je sub_10094899
    mov mov ecx, ebx
    mov mov ebx, edx
    and and ebx, 0E000000h
    cmp cmp ecx, ebx
    je sub_100948E0
    mov mov eax, dword ptr [ebp - 40]
L29:
    mov mov eax, dword ptr [eax + 4]
    mov mov ebx, dword ptr [edi + 16]
    mov mov eax, dword ptr [ebx + eax*4]
    test test byte ptr [eax + 4], 2
    je sub_100948EF
    mov mov eax, dword ptr [ebp - 40]
    xor xor ebx, ebx
    inc inc ebx
    cmp cmp dword ptr [eax + 92], ebx
    jne sub_100948FA
    and and edx, 0F1FFFFFFh
    or or edx, ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [ebp - 4], ebx
    mov mov eax, dword ptr [ebp - 28]
    mov mov edx, dword ptr [eax]
    mov mov dword ptr [ebp - 52], edx
    and and edx, 0E000000h
    cmp cmp ecx, edx
    je sub_10094952
    mov mov edx, dword ptr [eax + 4]
    mov mov ebx, dword ptr [edi + 16]
    mov mov edx, dword ptr [ebx + edx*4]
    test test byte ptr [edx + 4], 2
    je sub_10094961
    xor xor ebx, ebx
    inc inc ebx
L31:
    cmp cmp dword ptr [eax + 92], ebx
    jne sub_10094969
    mov mov edx, dword ptr [ebp - 52]
    and and edx, 0F1FFFFFFh
    or or edx, ecx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [ebp - 4], ebx
    push push dword ptr [ebp - 48]
    mov mov ebx, dword ptr [ebp - 44]
    push push dword ptr [ebp - 36]
    mov mov ecx, edi
    push push dword ptr [ebp - 56]
    push push ebx
    push push esi
    call sub_1008F6B2
    test test eax, eax
    jl sub_10094EB1
    mov mov eax, dword ptr [edi + 20]
    lea lea ecx, [eax + ebx*4]
    mov mov edx, dword ptr [ecx]
    mov mov edx, dword ptr [edx + 48]
    cmp cmp edx, ebx
    jne sub_100949D6
    inc inc dword ptr [ebp - 20]
    jmp sub_100949EF
    mov mov edx, dword ptr [eax + edx*4]
    cmp cmp dword ptr [edx + 48], -1
    jne sub_100949F8
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [ecx + 48]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [eax + 48], ecx
    mov mov ebx, dword ptr [ebp - 8]
    inc inc ebx
    cmp cmp ebx, dword ptr [esi + 12]
    mov mov dword ptr [ebp - 8], ebx
    jb sub_100948A2
L37:
    mov mov eax, dword ptr [esi + 12]
    cmp cmp dword ptr [ebp - 20], eax
    je sub_10094E23
    cmp cmp dword ptr [ebp - 20], 0
    jne sub_10094AF8
    xor xor ecx, ecx
    inc inc ecx
    cmp cmp eax, ecx
    mov mov dword ptr [ebp - 28], ecx
    jbe sub_10094A98
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [edi + 20]
    mov mov edx, dword ptr [ecx]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [edx + 48]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [edx + 4]
    add add ecx, 4
    mov mov ebx, dword ptr [ecx]
    mov mov ebx, dword ptr [eax + ebx*4]
    mov mov ebx, dword ptr [ebx + 48]
    mov mov ebx, dword ptr [eax + ebx*4]
    cmp cmp edx, dword ptr [ebx + 4]
    jne sub_10094B22
    inc inc dword ptr [ebp - 28]
    mov mov ebx, dword ptr [ebp - 28]
    add add ecx, 4
    cmp cmp ebx, dword ptr [esi + 12]
    jb sub_10094AAF
    and and dword ptr [ebp - 12], 0
    cmp cmp dword ptr [esi + 12], 0
    jbe sub_10094E69
L39:
    mov mov edx, dword ptr [ebp - 12]
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov eax, dword ptr [edi + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
L40:
    mov mov edx, dword ptr [ecx + 48]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [eax + 4]
    mov mov ebx, dword ptr [edi + 16]
    mov mov edx, dword ptr [ebx + edx*4]
    test test byte ptr [edx + 4], 2
    je sub_10094B52
    cmp cmp dword ptr [eax + 96], 0
    jne sub_10094B58
    mov mov ecx, dword ptr [ecx + 96]
    mov mov edx, dword ptr [ebp - 12]
    mov mov dword ptr [eax + 96], ecx
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 100]
    mov mov dword ptr [eax + 100], ecx
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_10094B39
    jmp sub_10094EBE
    mov mov eax, dword ptr [esi + 12]
    test test eax, eax
    je sub_10094B37
    and and dword ptr [ebp - 20], 0
    test test eax, eax
    jbe sub_10094BFD
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [edi + 20]
    mov mov edx, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [edx + 48], ecx
    mov mov dword ptr [ebp - 56], edx
    je sub_10094C09
    mov mov ebx, dword ptr [edx]
    mov mov edx, dword ptr [edx + 48]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [eax]
    and and eax, 0F1FFFFFFh
    or or eax, ebx
    cmp cmp ebx, eax
    je sub_10094C15
    mov mov edx, dword ptr [ebp - 56]
    mov mov dword ptr [edx], eax
    mov mov dword ptr [ebp - 4], 1
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [eax + 48], ecx
    inc inc dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_10094BFD
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [edi + 8]
    mov mov ebx, eax
    jae sub_10094C77
    mov mov ecx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx + ebx*4]
    test test ecx, ecx
    je sub_10094C7B
    push push 1
    call sub_1006E341
    mov mov eax, dword ptr [ebp - 12]
    inc inc ebx
    cmp cmp ebx, dword ptr [edi + 8]
    jb sub_10094C77
    mov mov dword ptr [edi + 8], eax
    jmp sub_10094F56
    cmp cmp edx, 050000000h
    jne sub_10094D24
    xor xor ebx, ebx
    inc inc ebx
    push push ebx
    push push esi
    mov mov ecx, edi
    call sub_10087C24
    test test eax, eax
    jl sub_10095044
    cmp cmp eax, ebx
    je sub_10094CE4
    mov mov dword ptr [ebp - 4], ebx
    mov mov ecx, dword ptr [esi + 16]
    mov mov edx, dword ptr [ecx]
    mov mov eax, dword ptr [edi + 20]
    mov mov ebx, dword ptr [eax + edx*4]
    cmp cmp dword ptr [ebx + 48], edx
    je sub_10094F8D
    mov mov ebx, dword ptr [edi + 16]
    mov mov ecx, edx
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [ecx + 48]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [eax + 4]
    mov mov edx, dword ptr [ebx + edx*4]
    test test byte ptr [edx + 4], 2
    je sub_10094D60
    cmp cmp dword ptr [eax + 96], 0
    jne sub_10094D66
    mov mov ecx, dword ptr [ecx + 96]
    mov mov dword ptr [eax + 96], ecx
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ecx]
L46:
    mov mov edx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 100]
    mov mov dword ptr [eax + 100], ecx
    xor xor eax, eax
    mov mov dword ptr [esi + 4], eax
    mov mov dword ptr [esi + 12], eax
    jmp sub_10094FCF
    cmp cmp eax, 050100004h
    jne sub_10094FDC
    mov mov ecx, dword ptr [edi + 20]
    or or dword ptr [ebp - 64], -1
    or or dword ptr [ebp - 68], -1
    xor xor eax, eax
    inc inc eax
    mov mov dword ptr [ebp - 60], eax
    mov mov dword ptr [ebp - 72], eax
    mov mov eax, dword ptr [esi + 8]
    mov mov edx, dword ptr [eax]
    mov mov ebx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [eax + 4]
    mov mov eax, dword ptr [eax + 12]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebx + 4]
    mov mov dword ptr [ebp - 28], edx
    mov mov edx, dword ptr [edi + 16]
    mov mov eax, dword ptr [edx + eax*4]
    test test byte ptr [eax + 5], 1
    je sub_10094EDA
    cmp cmp dword ptr [ebx + 8], -1
    jne sub_10094EE4
    fld fld qword ptr [ebx + 32]
    fcomp fcomp qword ptr [g_1019BE20]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10094EEE
    mov mov eax, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [edx + eax*4]
    test test byte ptr [eax + 5], 1
    mov mov dword ptr [ebp - 68], 2
    je sub_10094F25
    mov mov eax, dword ptr [ebp - 28]
    cmp cmp dword ptr [eax + 8], -1
    jne sub_10094F2E
    fld fld qword ptr [eax + 32]
    fcomp fcomp qword ptr [g_1019BE20]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10094F25
    mov mov eax, dword ptr [ebp - 20]
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [edx + eax*4]
    test test byte ptr [eax + 5], 1
    je sub_10094F4D
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp dword ptr [eax + 8], -1
    jne sub_10094F56
    mov mov edx, eax
    fld fld qword ptr [edx + 32]
    fld fld qword ptr [g_1019BE20]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_10094F32
    mov mov dword ptr [ebp - 64], 1
    jmp sub_10094F9A
    fld fld qword ptr [edx + 32]
    fld fld qword ptr [g_1019BC88]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_10094F85
    mov mov dword ptr [ebp - 64], 3
    jmp sub_10094FB5
    and and dword ptr [ebp - 68], 0
    and and dword ptr [ebp - 64], 0
    jmp sub_10094FBF
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + 4]
    mov mov eax, dword ptr [ecx + eax*4]
    cmp cmp dword ptr [eax + 92], 0
    jne sub_10094FA7
    and and dword ptr [ebp - 68], 0
    mov mov eax, dword ptr [esi + 16]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [ecx + eax*4]
    cmp cmp dword ptr [eax + 92], 0
    jne sub_10094FCD
    and and dword ptr [ebp - 64], 0
    cmp cmp dword ptr [ebp - 68], -1
    je sub_100950F8
    cmp cmp dword ptr [ebp - 64], -1
    je sub_10095102
    xor xor ebx, ebx
    mov mov eax, dword ptr [ebp + ebx - 72]
    sub sub eax, 0
    je sub_10095072
    dec dec eax
    je sub_1009503D
    dec dec eax
    je sub_10095039
    dec dec eax
    jne sub_100950B8
    mov mov eax, dword ptr [esi + 8]
L54:
    mov mov eax, dword ptr [eax + 4]
    mov mov ecx, dword ptr [esi + 16]
    mov mov edx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ebx + ecx]
L55:
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov dword ptr [ecx + 48], eax
    jmp sub_100950CF
    mov mov eax, dword ptr [esi + 8]
    mov mov eax, dword ptr [eax]
    jmp sub_1009504D
    cmp cmp dword ptr [ebp - 32], -1
    jne sub_10095092
    push push ecx
    fld1 fld1
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push dword ptr [edi + 120]
    mov mov ecx, edi
    call sub_10086B53
    mov mov ecx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov dword ptr [ebp - 32], eax
    mov mov dword ptr [ecx + 48], eax
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [edi + 20]
    mov mov eax, dword ptr [ebx + eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp - 32]
    jmp sub_1009510B
    cmp cmp dword ptr [ebp - 16], -1
    jne sub_10095102
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push 0
    push push 0
    push push dword ptr [edi + 120]
    mov mov ecx, edi
    call sub_10086B8B
    mov mov ecx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov dword ptr [ebp - 16], eax
L57:
    mov mov dword ptr [ecx + 48], eax
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [edi + 20]
    mov mov eax, dword ptr [ebx + eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov dword ptr [eax + 48], ecx
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ebx + ecx]
    mov mov eax, dword ptr [edi + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edi + 16]
    mov mov dword ptr [ebp - 56], ecx
    mov mov ecx, dword ptr [ecx + 48]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [eax + 4]
    mov mov ecx, dword ptr [edx + ecx*4]
    test test byte ptr [ecx + 4], 2
    je sub_100951B0
    cmp cmp dword ptr [eax + 96], 0
    jne sub_100951B6
    mov mov ecx, dword ptr [ebp - 56]
    mov mov ecx, dword ptr [ecx + 96]
    mov mov dword ptr [eax + 96], ecx
    mov mov ecx, dword ptr [esi + 16]
    mov mov ecx, dword ptr [ebx + ecx]
    mov mov edx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 100]
    mov mov dword ptr [eax + 100], ecx
    add add ebx, 4
    cmp cmp ebx, 16
    jb sub_100950F3
    xor xor eax, eax
    mov mov dword ptr [esi + 4], eax
    mov mov dword ptr [esi + 12], eax
    mov mov dword ptr [ebp - 4], 1
    mov mov dword ptr [esi], eax
    mov mov eax, dword ptr [esi + 12]
    xor xor ebx, ebx
    cmp cmp eax, ebx
    je sub_100952C7
    mov mov dword ptr [ebp - 20], ebx
    jbe sub_10095270
    mov mov ecx, dword ptr [esi + 16]
    mov mov edx, dword ptr [ecx]
    mov mov eax, dword ptr [edi + 20]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [eax]
    test test dl, 64
    mov mov dword ptr [ebp - 44], edx
    jne sub_10095285
    mov mov eax, dword ptr [eax + 4]
    mov mov edx, dword ptr [edi + 16]
    mov mov eax, dword ptr [edx + eax*4]
    test test dword ptr [eax + 4], 011028h
    jne sub_10095297
    test test byte ptr [ebp - 44], 4
    je sub_1009529D
    test test byte ptr [ebp - 44], 8
    je sub_100952A3
    inc inc dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 20]
    add add ecx, 4
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_10095273
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [esi + 12]
    jne sub_10095315
    mov mov eax, dword ptr [ebp - 16]
    cmp cmp eax, -1
    jne sub_100952F0
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push ebx
    push push dword ptr [edi + 120]
    mov mov ecx, edi
    call sub_10086C81
    mov mov ecx, dword ptr [edi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ecx + 48], eax
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 12], ebx
    jbe sub_10095334
    mov mov edx, dword ptr [esi + 16]
    mov mov edx, dword ptr [edx + ecx*4]
    mov mov ebx, dword ptr [edi + 20]
    mov mov edx, dword ptr [ebx + edx*4]
    inc inc ecx
    mov mov dword ptr [edx + 48], eax
    cmp cmp ecx, dword ptr [esi + 12]
    jb sub_10095332
    xor xor ebx, ebx
    mov mov dword ptr [esi], ebx
    mov mov dword ptr [esi + 4], ebx
    mov mov dword ptr [esi + 12], ebx
    mov mov dword ptr [ebp - 4], 1
    inc inc dword ptr [ebp - 24]
    mov mov eax, dword ptr [ebp - 24]
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_10094829
    cmp cmp dword ptr [ebp - 4], 0
    jne sub_10095398
    xor xor eax, eax
    inc inc eax
    jmp sub_100953A6
    mov mov ecx, edi
    call sub_1008BAC6
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_10093c67 ENDP
END
