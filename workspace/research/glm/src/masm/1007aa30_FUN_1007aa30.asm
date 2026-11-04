.686
.MODEL FLAT, C
EXTRN sub_1006C9B3:PROC
EXTRN sub_1006D8B4:PROC
EXTRN sub_1006DCC4:PROC
EXTRN sub_1006DCF0:PROC
EXTRN sub_1006DEF8:PROC
EXTRN sub_1006E012:PROC
EXTRN sub_1006E2FC:PROC
EXTRN sub_1006E423:PROC
EXTRN sub_1006E658:PROC
EXTRN sub_1006E6D0:PROC
EXTRN sub_1006E736:PROC
EXTRN sub_1006E8C0:PROC
EXTRN sub_1006E9C8:PROC
EXTRN sub_1006EBFA:PROC
EXTRN sub_1006EDA4:PROC
EXTRN sub_1006F200:PROC
EXTRN sub_1006F432:PROC
EXTRN sub_10071262:PROC
EXTRN sub_100712A7:PROC
EXTRN sub_100716B7:PROC
EXTRN sub_100718EB:PROC
EXTRN sub_1007A9B4:PROC
EXTRN sub_1007AA1C:PROC
EXTRN sub_1007AC4B:PROC
EXTRN sub_1007B73B:PROC
EXTRN sub_1007BFCB:PROC
EXTRN sub_100830EA:PROC
EXTRN sub_10086361:PROC
EXTRN sub_10086B80:PROC
EXTRN sub_10086D78:PROC
EXTRN sub_100F793E:PROC
EXTRN sub_100F7956:PROC
EXTRN sub_100F7D4D:PROC
EXTRN sub_100F7D5F:PROC
EXTRN sub_100F7E44:PROC
EXTRN sub_100F804F:PROC
EXTRN sub_100F8057:PROC
EXTRN sub_100F805F:PROC
EXTRN sub_100F8067:PROC
EXTRN sub_100F806F:PROC
EXTRN sub_100F82BB:PROC
.CODE
FUN_1007aa30 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 52
    push ebx
    push esi
    xor esi, esi
    push edi
    mov edi, dword ptr [ebp + 12]
    cmp edi, esi
    mov ebx, ecx
    mov dword ptr [ebp - 40], esi
    mov dword ptr [ebp - 28], esi
    mov dword ptr [ebp - 44], esi
    mov dword ptr [ebp - 32], esi
    mov dword ptr [ebp - 16], esi
    mov dword ptr [ebp - 8], esi
    je L84
    cmp dword ptr [edi + 4], 10
    jne L84
    cmp dword ptr [edi + 56], esi
    je L0
    push dword ptr [ebp + 8]
    push 01010FBA0h
    push 000000DACh
    push edi
    push ebx
    call sub_1006DCF0
    add esp, 20
    mov eax, 080004001h
    jmp L85
L0:
    cmp dword ptr [ebp + 24], esi
    je L1
    push dword ptr [ebp + 8]
    mov ecx, dword ptr [ebx + 8]
    call sub_10086B80
    cmp eax, esi
    mov dword ptr [ebp - 4], eax
    jl L62
L1:
    mov eax, dword ptr [ebp + 16]
    cmp eax, esi
    je L2
    mov ecx, dword ptr [eax + 8]
    mov dword ptr [ebp - 36], ecx
    jmp L3
L2:
    mov dword ptr [ebp - 36], esi
L3:
    cmp eax, esi
    je L4
    mov eax, dword ptr [eax + 12]
    mov dword ptr [ebp - 52], eax
    jmp L5
L4:
    mov dword ptr [ebp - 52], esi
L5:
    mov eax, dword ptr [edi + 36]
    xor ecx, ecx
    jmp L8
L6:
    mov edx, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 12]
    cmp eax, esi
    mov dword ptr [ebp + 16], edx
    je L7
    mov edx, dword ptr [eax + 8]
    cmp edx, esi
    je L7
    cmp dword ptr [edx + 4], 12
    jne L7
    mov eax, dword ptr [eax + 12]
L7:
    mov edx, dword ptr [ebp + 16]
    mov edx, dword ptr [edx + 24]
    add ecx, dword ptr [edx + 20]
L8:
    cmp eax, esi
    jne L6
    mov esi, ecx
    shl esi, 2
    push esi
    call sub_100F793E
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 28], eax
    je L83
    cmp dword ptr [ebp + 24], 0
    je L9
    push esi
    call sub_100F7956
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 16], eax
    je L83
L9:
    mov edx, dword ptr [ebp - 36]
    mov esi, dword ptr [edi + 36]
    mov eax, dword ptr [ebp - 28]
    mov dword ptr [ebp + 16], edx
    jmp L15
L10:
    mov ecx, dword ptr [esi + 8]
    mov esi, dword ptr [esi + 12]
    test esi, esi
    je L11
    mov eax, dword ptr [esi + 8]
    test eax, eax
    je L11
    cmp dword ptr [eax + 4], 12
    jne L11
    mov esi, dword ptr [esi + 12]
L11:
    cmp dword ptr [ebp + 24], 0
    mov eax, dword ptr [ecx + 24]
    mov dword ptr [ebp - 48], eax
    je L12
    cmp dword ptr [ebp + 28], 0
    je L14
    test byte ptr [eax + 28], 64
    je L14
L12:
    test edx, edx
    je L14
    mov ecx, dword ptr [edx + 8]
    test ecx, ecx
    je L13
    push 0
    push dword ptr [ebp - 12]
    push ecx
    mov ecx, ebx
    call sub_1007B73B
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L62
    mov eax, dword ptr [ebp - 48]
    mov edx, dword ptr [ebp + 16]
L13:
    mov edx, dword ptr [edx + 12]
    mov dword ptr [ebp + 16], edx
L14:
    mov eax, dword ptr [eax + 20]
    mov ecx, dword ptr [ebp - 12]
    lea eax, [ecx + eax*4]
L15:
    test esi, esi
    mov dword ptr [ebp - 12], eax
    jne L10
    mov ecx, dword ptr [ebp - 36]
    mov eax, dword ptr [edi + 36]
    test eax, eax
    mov dword ptr [ebp + 16], ecx
    mov ecx, dword ptr [ebp - 28]
    mov dword ptr [ebp - 12], ecx
    je L37
    jmp L17
L16:
    mov eax, dword ptr [ebp - 24]
L17:
    mov ecx, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 12]
    and dword ptr [ebp - 48], 0
    test eax, eax
    mov dword ptr [ebp - 36], ecx
    mov dword ptr [ebp - 24], eax
    je L18
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L18
    cmp dword ptr [ecx + 4], 12
    jne L18
    mov eax, dword ptr [eax + 12]
    mov dword ptr [ebp - 48], ecx
    mov dword ptr [ebp - 24], eax
L18:
    mov eax, dword ptr [ebp - 36]
    mov esi, dword ptr [eax + 24]
    xor edx, edx
    cmp dword ptr [ebp + 24], edx
    je L32
    cmp dword ptr [ebp + 28], edx
    je L19
    test byte ptr [esi + 28], 64
    jne L32
L19:
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [eax + 116]
    mov dword ptr [ebp - 20], ecx
    mov ecx, dword ptr [esi + 28]
    test cl, 64
    je L20
    mov eax, dword ptr [eax + 124]
    jmp L21
L20:
    test cl, 16
    je L22
    mov eax, dword ptr [eax + 000000080h]
L21:
    mov dword ptr [ebp - 20], eax
L22:
    cmp dword ptr [esi + 20], edx
    mov dword ptr [ebp - 4], edx
    jbe L27
L23:
    mov eax, dword ptr [esi + 16]
    fldz
    add eax, dword ptr [ebp - 4]
    push ecx
    push ecx
    mov ecx, dword ptr [ebx + 8]
    fstp qword ptr [esp]
    push 0
    push 0
    push dword ptr [ebp - 20]
    mov dword ptr [ebp - 48], eax
    call sub_10086361
    mov ecx, dword ptr [ebx + 8]
    cmp eax, dword ptr [ecx + 8]
    jae L24
    mov ecx, dword ptr [ecx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    jmp L25
L24:
    xor ecx, ecx
L25:
    test ecx, ecx
    je L26
    mov edx, dword ptr [ebp - 48]
    mov dword ptr [ecx + 48], edx
    mov edx, dword ptr [ebp - 36]
    mov dword ptr [ecx + 96], edx
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ecx + 100], edx
L26:
    mov ecx, dword ptr [ebx + 24]
    mov edx, dword ptr [ebp - 48]
    inc dword ptr [ebp - 4]
    mov dword ptr [ecx + edx*4], eax
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 20]
    jb L23
L27:
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [ebp - 20]
    cmp dword ptr [eax + 116], ecx
    je L28
    mov ecx, dword ptr [ebx + 24]
    push dword ptr [esi + 20]
    mov eax, dword ptr [esi + 16]
    lea eax, [ecx + eax*4]
    push eax
    push dword ptr [esi + 32]
    mov ecx, ebx
    call sub_1006EDA4
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L62
    mov ecx, dword ptr [ebp - 20]
L28:
    mov eax, dword ptr [ebx + 8]
    cmp dword ptr [eax + 124], ecx
    jne L29
    push dword ptr [esi + 48]
    mov ecx, dword ptr [ebx + 24]
    mov eax, dword ptr [esi + 16]
    push 0
    push 0
    push 1
    push dword ptr [ebp - 20]
    lea eax, [ecx + eax*4]
    push eax
    push dword ptr [esi + 32]
    mov ecx, ebx
    call sub_10071262
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L62
    push esi
    mov ecx, ebx
    call sub_1006C9B3
    jmp L35
L29:
    cmp dword ptr [eax + 000000080h], ecx
    jne L36
    push dword ptr [esi + 48]
    mov ecx, dword ptr [ebx + 24]
    push dword ptr [esi + 44]
    mov eax, dword ptr [esi + 16]
    push 0
    push 0
    push dword ptr [ebp - 20]
    lea eax, [ecx + eax*4]
    push eax
    push dword ptr [esi + 32]
    mov ecx, ebx
    call sub_100712A7
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L62
    mov ecx, dword ptr [ebx + 24]
    push dword ptr [esi + 20]
    mov eax, dword ptr [esi + 16]
    lea eax, [ecx + eax*4]
    push eax
    mov ecx, ebx
    call sub_1006D8B4
    test eax, eax
    je L31
    and dword ptr [ebp - 20], 0
    cmp dword ptr [esi + 20], 0
    jbe L36
L30:
    mov eax, dword ptr [esi + 16]
    add eax, dword ptr [ebp - 20]
    mov edx, dword ptr [ebp - 8]
    inc dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 16]
    inc dword ptr [ebp - 20]
    mov dword ptr [ecx + edx*4], eax
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [esi + 20]
    jb L30
    jmp L36
L31:
    mov eax, dword ptr [ebp - 36]
    mov eax, dword ptr [eax + 20]
    push dword ptr [eax + 24]
    push dword ptr [ebp + 8]
    push 01010FB70h
    push 000000DAEh
    push esi
    push ebx
    call sub_1006E012
    add esp, 24
    jmp L36
L32:
    push 0
    push dword ptr [ebp - 36]
    mov ecx, ebx
    call sub_1007A9B4
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L62
    cmp dword ptr [ebp + 16], 0
    je L34
    test byte ptr [esi + 28], 16
    je L33
    mov ecx, dword ptr [esi + 16]
    mov edx, dword ptr [ebx + 24]
    mov eax, dword ptr [ebp + 16]
    mov eax, dword ptr [eax + 8]
    push 0
    push 0
    push dword ptr [ebp - 12]
    lea ecx, [edx + ecx*4]
    push ecx
    mov ecx, dword ptr [esi + 20]
    and ecx, 0000FFFFFh
    or ecx, 010000000h
    push ecx
    push eax
    mov ecx, ebx
    call sub_1006E6D0
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L62
L33:
    mov eax, dword ptr [ebp + 16]
    mov eax, dword ptr [eax + 12]
    mov dword ptr [ebp + 16], eax
    jmp L36
L34:
    push 0
    push dword ptr [ebp - 48]
    mov ecx, ebx
    call sub_1007AA1C
L35:
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L62
L36:
    cmp dword ptr [ebp - 24], 0
    mov ecx, dword ptr [ebp - 12]
    mov eax, dword ptr [esi + 20]
    lea eax, [ecx + eax*4]
    mov dword ptr [ebp - 12], eax
    jne L16
L37:
    cmp dword ptr [ebp + 24], 0
    je L46
    xor esi, esi
    cmp dword ptr [ebp - 8], esi
    jbe L39
L38:
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + esi*4]
    mov edx, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebx + 8]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [ecx + 20]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [ecx]
    push 1
    push eax
    call dword ptr [edx + 4]
    test eax, eax
    jl L50
    inc esi
    cmp esi, dword ptr [ebp - 8]
    jb L38
L39:
    push ebx
    push dword ptr [ebp - 8]
    push dword ptr [ebp - 16]
    push 01006DD5Ch
    call sub_10086D78
    and dword ptr [ebp + 16], 0
    cmp dword ptr [ebp - 8], 0
    je L46
    mov edx, dword ptr [ebp - 16]
    mov edx, dword ptr [edx]
    mov eax, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebx + 8]
    mov edx, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 20]
    mov edx, dword ptr [ecx + edx*4]
    mov dword ptr [ebp - 36], edx
    xor edx, edx
    inc edx
    cmp dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 24], edx
    jbe L46
L40:
    mov esi, dword ptr [ebp - 24]
    mov edx, dword ptr [ebp - 16]
    mov edx, dword ptr [edx + esi*4]
    mov edx, dword ptr [eax + edx*4]
    mov esi, dword ptr [ebp - 36]
    mov edx, dword ptr [ecx + edx*4]
    mov esi, dword ptr [esi + 108]
    cmp esi, dword ptr [edx + 108]
    jne L41
    mov esi, dword ptr [ebp - 36]
    mov esi, dword ptr [esi + 16]
    cmp esi, dword ptr [edx + 16]
    jne L41
    mov esi, dword ptr [ebp - 36]
    mov esi, dword ptr [esi]
    cmp esi, dword ptr [edx]
    jne L41
    inc dword ptr [ebp + 16]
    jmp L42
L41:
    mov dword ptr [ebp - 36], edx
L42:
    inc dword ptr [ebp - 24]
    mov edx, dword ptr [ebp - 24]
    cmp edx, dword ptr [ebp - 8]
    jb L40
    mov eax, dword ptr [ebp + 16]
    test eax, eax
    je L46
    mov esi, eax
    shl esi, 2
    push esi
    call sub_100F7D4D
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 44], eax
    je L83
    push esi
    call sub_100F7D5F
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 32], eax
    je L83
    mov ecx, dword ptr [ebp - 16]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [ebx + 24]
    mov edx, dword ptr [edx + ecx*4]
    mov esi, dword ptr [ebx + 8]
    mov esi, dword ptr [esi + 20]
    mov edx, dword ptr [esi + edx*4]
    mov dword ptr [ebp - 24], edx
    mov edx, dword ptr [ebp - 32]
    mov dword ptr [ebp - 48], edx
    mov edx, dword ptr [ebp - 44]
    xor eax, eax
    sub edx, dword ptr [ebp - 32]
    mov dword ptr [ebp + 16], eax
    mov dword ptr [ebp - 36], 1
    mov dword ptr [ebp - 12], edx
L43:
    mov esi, dword ptr [ebp - 16]
    mov edx, dword ptr [ebp - 36]
    mov edx, dword ptr [esi + edx*4]
    mov esi, dword ptr [ebx + 24]
    mov dword ptr [ebp - 4], edx
    mov edx, dword ptr [esi + edx*4]
    mov esi, dword ptr [ebx + 8]
    mov esi, dword ptr [esi + 20]
    mov dword ptr [ebp - 20], edx
    mov edx, dword ptr [esi + edx*4]
    mov esi, dword ptr [ebp - 24]
    mov esi, dword ptr [esi + 108]
    cmp esi, dword ptr [edx + 108]
    jne L44
    mov esi, dword ptr [ebp - 24]
    mov esi, dword ptr [esi + 16]
    cmp esi, dword ptr [edx + 16]
    jne L44
    mov edx, dword ptr [ebp - 48]
    mov eax, dword ptr [ebp - 20]
    mov esi, dword ptr [ebp - 12]
    mov dword ptr [esi + edx], eax
    mov eax, dword ptr [ebx + 24]
    mov eax, dword ptr [eax + ecx*4]
    mov dword ptr [edx], eax
    mov eax, dword ptr [ebp + 16]
    inc eax
    add edx, 4
    mov dword ptr [ebp + 16], eax
    mov dword ptr [ebp - 48], edx
    jmp L45
L44:
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ebp - 24], edx
L45:
    inc dword ptr [ebp - 36]
    mov edx, dword ptr [ebp - 36]
    cmp edx, dword ptr [ebp - 8]
    jb L43
    push 0
    push 0
    push dword ptr [ebp - 32]
    and eax, 0000FFFFFh
    push dword ptr [ebp - 44]
    or eax, 010000000h
    push eax
    push edi
    mov ecx, ebx
    call sub_1006E8C0
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L62
L46:
    cmp dword ptr [ebp + 24], 0
    mov eax, dword ptr [ebx + 4]
    mov eax, dword ptr [eax + 24]
    je L47
    mov esi, eax
    shl esi, 2
    push esi
    call sub_100F7E44
    test eax, eax
    pop ecx
    mov dword ptr [ebp - 40], eax
    je L83
    mov ecx, esi
    mov esi, dword ptr [ebx + 24]
    mov edi, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebp + 12]
L47:
    mov esi, dword ptr [ebx + 80]
    push dword ptr [ebp - 40]
    and dword ptr [ebx + 80], 0
    push dword ptr [edi + 40]
    mov ecx, ebx
    mov dword ptr [edi + 56], 1
    call sub_1007AC4B
    mov dword ptr [ebp - 4], eax
    xor eax, eax
    cmp dword ptr [ebx + 80], eax
    jne L48
    cmp dword ptr [ebx + 84], eax
    jne L48
    xor ecx, ecx
    jmp L49
L48:
    xor ecx, ecx
    inc ecx
L49:
    cmp dword ptr [ebp - 4], eax
    mov dword ptr [ebx + 80], esi
    mov dword ptr [edi + 56], eax
    jl L62
    cmp ecx, eax
    jne L51
    cmp dword ptr [edi + 20], eax
    jbe L51
    push dword ptr [ebp + 8]
    push 01010FB4Ch
    push 000000DB3h
    push edi
    push ebx
    call sub_1006E2FC
    add esp, 20
L50:
    mov dword ptr [ebp - 4], 080004005h
    jmp L62
L51:
    cmp dword ptr [ebp + 24], eax
    je L57
    mov ecx, dword ptr [edi + 20]
    cmp ecx, eax
    je L60
    cmp dword ptr [ebx + 84], eax
    je L53
    cmp ecx, eax
    jbe L53
L52:
    mov ecx, dword ptr [edi + 16]
    mov edx, dword ptr [ebx + 24]
    mov esi, dword ptr [ebx + 36]
    add ecx, eax
    inc eax
    mov dword ptr [edx + ecx*4], esi
    cmp eax, dword ptr [edi + 20]
    jb L52
L53:
    mov ecx, dword ptr [ebx + 24]
    mov eax, dword ptr [edi + 16]
    lea eax, [ecx + eax*4]
    xor esi, esi
    push esi
    push esi
    push eax
    push eax
    mov eax, dword ptr [edi + 20]
    and eax, 0000FFFFFh
    or eax, 010000000h
    push eax
    push edi
    mov ecx, ebx
    call sub_1006E9C8
    cmp eax, esi
    mov dword ptr [ebp - 4], eax
    jl L62
    mov ecx, dword ptr [ebx + 24]
    push dword ptr [edi + 20]
    mov eax, dword ptr [edi + 16]
    lea eax, [ecx + eax*4]
    push eax
    push dword ptr [edi + 32]
    mov ecx, ebx
    call sub_1006F200
    cmp eax, esi
    mov dword ptr [ebp - 4], eax
    jl L62
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [ebx + 24]
    push esi
    push dword ptr [edi + 48]
    push 1
    push esi
    push dword ptr [eax + 000000084h]
    mov eax, dword ptr [edi + 16]
    lea eax, [ecx + eax*4]
    push eax
    push dword ptr [edi + 32]
    mov ecx, ebx
    call sub_100716B7
    cmp eax, esi
    mov dword ptr [ebp - 4], eax
    jl L62
    mov ecx, dword ptr [ebx + 24]
    push dword ptr [edi + 20]
    mov eax, dword ptr [edi + 16]
    lea eax, [ecx + eax*4]
    push eax
    mov ecx, ebx
    call sub_1006DCC4
    test eax, eax
    je L56
    cmp dword ptr [edi + 20], esi
    jbe L60
L54:
    mov eax, dword ptr [edi + 16]
    mov edx, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebx + 8]
    add eax, esi
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [ecx + 20]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [ecx]
    push 1
    push eax
    call dword ptr [edx + 4]
    test eax, eax
    jl L55
    inc esi
    cmp esi, dword ptr [edi + 20]
    jb L54
    jmp L60
L55:
    mov dword ptr [ebx + 76], 1
    jmp L60
L56:
    push dword ptr [ebp + 8]
    push 01010FB1Ch
    push 000000DAFh
    push edi
    push ebx
    call sub_1006E423
    add esp, 20
    jmp L60
L57:
    mov edx, dword ptr [ebp + 20]
    cmp edx, eax
    je L60
    cmp dword ptr [ebx + 84], eax
    je L59
    cmp dword ptr [edi + 20], eax
    jbe L60
L58:
    mov ecx, dword ptr [ebx + 36]
    mov dword ptr [edx + eax*4], ecx
    inc eax
    cmp eax, dword ptr [edi + 20]
    jb L58
    jmp L60
L59:
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [eax + 20]
    mov eax, dword ptr [eax + 16]
    mov esi, dword ptr [ebx + 24]
    shl ecx, 2
    lea esi, [esi + eax*4]
    mov eax, ecx
    shr ecx, 2
    mov edi, edx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebp + 12]
L60:
    mov eax, dword ptr [ebp - 52]
    mov edi, dword ptr [edi + 36]
    test edi, edi
    mov dword ptr [ebp + 16], eax
    mov eax, dword ptr [ebp - 28]
    mov dword ptr [ebp - 12], eax
    jne L64
L61:
    and dword ptr [ebp - 4], 0
L62:
    push dword ptr [ebp - 40]
    call sub_100F804F
    push dword ptr [ebp - 28]
    call sub_100F8057
    push dword ptr [ebp - 16]
    call sub_100F805F
    push dword ptr [ebp - 44]
    call sub_100F8067
    push dword ptr [ebp - 32]
    call sub_100F806F
    mov eax, dword ptr [ebp - 4]
    add esp, 20
    jmp L85
L63:
    mov edi, dword ptr [ebp - 24]
L64:
    mov eax, dword ptr [edi + 8]
    mov edi, dword ptr [edi + 12]
    test edi, edi
    mov dword ptr [ebp - 52], eax
    mov dword ptr [ebp - 24], edi
    je L65
    mov ecx, dword ptr [edi + 8]
    test ecx, ecx
    je L65
    cmp dword ptr [ecx + 4], 12
    jne L65
    mov ecx, dword ptr [edi + 12]
    mov dword ptr [ebp - 24], ecx
L65:
    mov esi, dword ptr [eax + 24]
    test byte ptr [esi + 28], 32
    je L77
    mov edi, dword ptr [eax + 20]
    xor eax, eax
    add edi, 16
    cmp dword ptr [ebx + 84], eax
    je L67
    cmp dword ptr [esi + 20], eax
    mov dword ptr [ebp + 12], eax
    jbe L72
L66:
    mov eax, dword ptr [esi + 16]
    add eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebx + 24]
    mov edx, dword ptr [ebx + 36]
    inc dword ptr [ebp + 12]
    mov dword ptr [ecx + eax*4], edx
    mov eax, dword ptr [ebp + 12]
    cmp eax, dword ptr [esi + 20]
    jb L66
    jmp L72
L67:
    cmp dword ptr [esi + 20], eax
    mov dword ptr [ebp + 20], eax
    jbe L72
    mov eax, dword ptr [esi + 16]
    mov edx, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebx + 8]
    lea eax, [edx + eax*4]
    mov dword ptr [ebp + 12], eax
L68:
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax]
    cmp eax, dword ptr [ecx + 8]
    jae L69
    mov edx, dword ptr [ecx + 20]
    mov eax, dword ptr [edx + eax*4]
    jmp L70
L69:
    xor eax, eax
L70:
    test eax, eax
    je L71
    mov edx, dword ptr [ecx + 116]
    cmp edx, dword ptr [eax + 4]
    je L82
L71:
    inc dword ptr [ebp + 20]
    mov eax, dword ptr [ebp + 20]
    add dword ptr [ebp + 12], 4
    cmp eax, dword ptr [esi + 20]
    jb L68
L72:
    cmp dword ptr [ebp + 24], 0
    je L76
    mov ecx, dword ptr [ebx + 24]
    mov eax, dword ptr [esi + 16]
    push 0
    lea eax, [ecx + eax*4]
    push 0
    push eax
    push eax
    mov eax, dword ptr [esi + 20]
    and eax, 0000FFFFFh
    or eax, 010000000h
    push eax
    push esi
    mov ecx, ebx
    call sub_1006EBFA
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L62
    mov ecx, dword ptr [ebx + 24]
    push dword ptr [esi + 20]
    mov eax, dword ptr [esi + 16]
    lea eax, [ecx + eax*4]
    push eax
    push dword ptr [esi + 32]
    mov ecx, ebx
    call sub_1006F432
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L62
    mov eax, dword ptr [ebx + 8]
    mov ecx, dword ptr [ebx + 24]
    push 0
    push dword ptr [esi + 44]
    push 1
    push 0
    push dword ptr [eax + 000000084h]
    mov eax, dword ptr [esi + 16]
    lea eax, [ecx + eax*4]
    push eax
    push dword ptr [esi + 32]
    mov ecx, ebx
    call sub_100718EB
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L62
    mov ecx, dword ptr [ebx + 24]
    push dword ptr [esi + 20]
    mov eax, dword ptr [esi + 16]
    lea eax, [ecx + eax*4]
    push eax
    mov ecx, ebx
    call sub_1006DEF8
    test eax, eax
    je L75
    xor edi, edi
    cmp dword ptr [esi + 20], edi
    jbe L77
L73:
    mov eax, dword ptr [esi + 16]
    mov edx, dword ptr [ebx + 24]
    mov ecx, dword ptr [ebx + 8]
    add eax, edi
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [ecx + 20]
    mov eax, dword ptr [edx + eax*4]
    mov edx, dword ptr [ecx]
    push 1
    push eax
    call dword ptr [edx + 4]
    test eax, eax
    jl L74
    inc edi
    cmp edi, dword ptr [esi + 20]
    jb L73
    jmp L77
L74:
    mov dword ptr [ebx + 76], 1
    jmp L77
L75:
    push dword ptr [edi + 8]
    push dword ptr [ebp + 8]
    push 01010FAECh
    push 000000DAFh
    push esi
    push ebx
    call sub_1006E658
    add esp, 24
    jmp L77
L76:
    cmp dword ptr [ebp + 16], 0
    je L81
    mov eax, dword ptr [ebp + 16]
    mov eax, dword ptr [eax + 8]
    test eax, eax
    je L80
    push 0
    push 0
    push eax
    mov ecx, ebx
    call sub_1007BFCB
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L62
L77:
    cmp dword ptr [ebp + 24], 0
    je L80
    cmp dword ptr [ebp + 28], 0
    je L78
    test byte ptr [esi + 28], 64
    jne L80
L78:
    test byte ptr [esi + 28], 64
    je L81
    mov eax, dword ptr [ebp - 52]
    mov eax, dword ptr [eax + 20]
    mov eax, dword ptr [eax + 24]
    cmp byte ptr [eax], 36
    mov dword ptr [ebp + 20], eax
    je L81
    lea edi, [eax + 1]
L79:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L79
    mov ecx, dword ptr [ebx]
    sub eax, edi
    lea edi, [eax + 2]
    push 1
    push edi
    call sub_100830EA
    test eax, eax
    mov dword ptr [ebp + 12], eax
    je L83
    push dword ptr [ebp + 20]
    push 01010FAE8h
    push edi
    push eax
    call sub_100F82BB
    mov eax, dword ptr [ebp - 52]
    mov eax, dword ptr [eax + 20]
    mov ecx, dword ptr [ebp + 12]
    add esp, 16
    mov dword ptr [eax + 24], ecx
    jmp L81
L80:
    mov eax, dword ptr [ebp + 16]
    test eax, eax
    je L81
    mov eax, dword ptr [eax + 12]
    mov dword ptr [ebp + 16], eax
L81:
    cmp dword ptr [ebp - 24], 0
    mov ecx, dword ptr [ebp - 12]
    mov eax, dword ptr [esi + 20]
    lea eax, [ecx + eax*4]
    mov dword ptr [ebp - 12], eax
    jne L63
    jmp L61
L82:
    push dword ptr [edi + 8]
    push dword ptr [ebp + 8]
    push 01010FAB4h
    push 000000DB4h
    push dword ptr [eax + 96]
    push ebx
    call sub_1006E736
    add esp, 24
    jmp L62
L83:
    mov dword ptr [ebp - 4], 08007000Eh
    jmp L62
L84:
    mov eax, 080004005h
L85:
    pop edi
    pop esi
    pop ebx
    leave
    ret 24
FUN_1007aa30 ENDP
END
