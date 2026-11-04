.686
.MODEL FLAT, C
EXTRN sub_1006405B:PROC
EXTRN sub_100840B6:PROC
EXTRN sub_10084151:PROC
EXTRN sub_10084474:PROC
EXTRN sub_10084535:PROC
EXTRN sub_1008472F:PROC
EXTRN sub_100847F3:PROC
EXTRN sub_100848B8:PROC
EXTRN sub_1008493F:PROC
EXTRN sub_1008495E:PROC
EXTRN sub_10084A06:PROC
EXTRN sub_10084AA9:PROC
EXTRN sub_10084B05:PROC
EXTRN sub_1008B9D5:PROC
EXTRN sub_100C4354:PROC
EXTRN sub_100C49A6:PROC
EXTRN sub_100C85FC:PROC
EXTRN sub_100C8606:PROC
EXTRN sub_100C861C:PROC
EXTRN sub_100C863A:PROC
EXTRN sub_100C8641:PROC
EXTRN sub_100C866F:PROC
EXTRN sub_100C8682:PROC
EXTRN sub_100C8688:PROC
EXTRN sub_100C8691:PROC
EXTRN sub_100C86CF:PROC
EXTRN sub_100C86E1:PROC
EXTRN sub_100C8719:PROC
EXTRN sub_100C8770:PROC
EXTRN sub_100C87F8:PROC
EXTRN sub_100C884B:PROC
EXTRN sub_100C884E:PROC
EXTRN sub_100C8852:PROC
EXTRN sub_100C8861:PROC
EXTRN sub_100C8891:PROC
EXTRN sub_100C88BE:PROC
EXTRN sub_100C88C1:PROC
EXTRN sub_100C88C2:PROC
EXTRN sub_100C88C3:PROC
EXTRN sub_100C88C7:PROC
EXTRN sub_100C88D7:PROC
EXTRN sub_100C88E7:PROC
EXTRN sub_100C88EF:PROC
EXTRN sub_100C890B:PROC
EXTRN sub_100C895D:PROC
EXTRN sub_100C8A0E:PROC
EXTRN sub_100C8A1E:PROC
EXTRN sub_100C8A2E:PROC
EXTRN sub_100C8A32:PROC
EXTRN sub_100C8A44:PROC
EXTRN sub_100C8A45:PROC
EXTRN sub_100C8A46:PROC
EXTRN sub_100C8A4E:PROC
EXTRN sub_100C8A5E:PROC
EXTRN sub_100C8A60:PROC
EXTRN sub_100C8A6D:PROC
EXTRN sub_100C8A75:PROC
EXTRN sub_100C8A7A:PROC
EXTRN sub_100C8A7E:PROC
EXTRN sub_100C8A84:PROC
EXTRN sub_100C8AE4:PROC
EXTRN sub_100C8B12:PROC
EXTRN sub_100C8B37:PROC
EXTRN sub_100C8B51:PROC
EXTRN sub_100C8BA8:PROC
EXTRN sub_100C8BB7:PROC
EXTRN sub_100C8BCF:PROC
EXTRN sub_100C8BD2:PROC
EXTRN sub_100C8BD4:PROC
EXTRN sub_100C8BD5:PROC
EXTRN sub_100C8BE3:PROC
EXTRN sub_100C8BEA:PROC
EXTRN sub_100C8C01:PROC
EXTRN sub_100C8C18:PROC
EXTRN sub_100C8C2A:PROC
EXTRN sub_100C8CDC:PROC
EXTRN sub_100C8CEA:PROC
EXTRN sub_100C8DA1:PROC
EXTRN sub_100C8DE5:PROC
EXTRN sub_100C8E0B:PROC
EXTRN sub_100C8E28:PROC
EXTRN sub_100C8E3F:PROC
EXTRN sub_100C8E47:PROC
EXTRN sub_100C8E67:PROC
EXTRN sub_100C8EA5:PROC
EXTRN sub_100C8EC1:PROC
EXTRN sub_100C8EC8:PROC
EXTRN sub_100F706F:PROC
EXTRN sub_100F7994:PROC
EXTRN sub_100F79A6:PROC
EXTRN sub_100F7BD0:PROC
EXTRN sub_100F7CB4:PROC
EXTRN sub_100F7E16:PROC
EXTRN sub_100F7EEF:PROC
EXTRN sub_100F7FAF:PROC
EXTRN sub_100F8195:PROC
EXTRN sub_100F819D:PROC
EXTRN sub_100F81A5:PROC
EXTRN sub_100F81AD:PROC
EXTRN sub_100F81B5:PROC
EXTRN sub_100F81BD:PROC
EXTRN sub_100F9785:PROC
EXTRN EXTRN g_1019BC80:DWORD:DWORD
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_100c7c92 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 017Ch
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0158h]
    neg neg eax
    sbb sbb eax, eax
    and and eax, 040CF503h
    push push edi
    add add eax, 042415443h
    push push eax
    lea lea ecx, [ebp - 80]
    mov mov dword ptr [ebp - 48], esi
    call sub_100840B6
    push push 7
    pop pop ecx
    push push 28
    xor xor ebx, ebx
    xor xor eax, eax
    lea lea edi, [ebp - 112]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, dword ptr [esi + 0C8h]
    pop pop eax
    push push ebx
    push push 1
    mov mov dword ptr [ebp - 104], ecx
    mov mov ecx, dword ptr [esi + 0CCh]
    push push eax
    mov mov dword ptr [ebp - 112], eax
    lea lea eax, [ebp - 112]
    mov mov dword ptr [ebp - 92], ecx
    push push eax
    lea lea ecx, [ebp - 80]
    mov mov dword ptr [ebp - 44], ebx
    mov mov dword ptr [ebp - 12], ebx
    mov mov dword ptr [ebp - 64], ebx
    mov mov dword ptr [ebp - 56], ebx
    mov mov dword ptr [ebp - 60], ebx
    mov mov dword ptr [ebp - 36], ebx
    call sub_10084151
    mov mov esi, eax
    cmp cmp esi, ebx
    jl sub_100C863A
    mov mov ebx, dword ptr [ebp - 48]
    xor xor edi, edi
    xor xor ecx, ecx
    cmp cmp dword ptr [ebx + 8], edi
    mov mov dword ptr [ebp - 20], edi
    mov mov dword ptr [ebp - 4], edi
    jbe L0
    mov mov eax, dword ptr [ebx + 20]
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebx + 8]
    mov mov dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax]
    mov mov esi, dword ptr [eax + 4]
    mov mov edx, dword ptr [ebx + 16]
    mov mov esi, dword ptr [edx + esi*4]
    mov mov esi, dword ptr [esi + 4]
    test test esi, 0200h
    mov mov dword ptr [ebp - 8], esi
    je L3
    test test byte ptr [ebp - 7], 1
    jne L4
    test test byte ptr [ebp - 8], 080h
    mov mov eax, dword ptr [eax + 12]
    je L1
    cmp cmp edi, eax
    ja L5
    lea lea edi, [eax + 1]
    jmp L6
    test test byte ptr [ebp - 7], 32
    je L4
    cmp cmp dword ptr [ebp - 20], eax
    ja L7
    inc inc eax
    mov mov dword ptr [ebp - 20], eax
    jmp L9
    test test byte ptr [ebp - 6], 4
    je L8
    cmp cmp dword ptr [ebp - 4], eax
    ja L10
    inc inc eax
    mov mov dword ptr [ebp - 4], eax
    jmp L11
    cmp cmp ecx, eax
    ja L12
    lea lea ecx, [eax + 1]
    add add dword ptr [ebp - 16], 4
    dec dec dword ptr [ebp - 24]
    jne L2
    mov mov edx, dword ptr [ebp - 20]
    lea lea eax, [ecx + edx]
    mov mov dword ptr [ebp - 32], eax
    lea lea eax, [edi + ecx]
    add add eax, edx
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebp - 4]
    lea lea esi, [eax + edi]
    add add esi, ecx
    add add esi, edx
    mov mov edi, esi
    shl shl edi, 2
    push push edi
    call sub_100F7994
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 12], eax
    je sub_100C86CF
    push push edi
    call sub_100F79A6
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 36], eax
    je sub_100C86E1
    and and dword ptr [ebp - 8], 0
    mov mov ecx, edi
    mov mov edi, dword ptr [ebp - 12]
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    cmp cmp dword ptr [ebx + 8], 0
    jbe L15
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [eax + 96], 0
    mov mov ecx, dword ptr [eax + 4]
    mov mov edx, dword ptr [ebx + 16]
    mov mov edi, dword ptr [edx + ecx*4]
    je L17
    cmp cmp dword ptr [eax + 8], -1
    jne L19
    mov mov ecx, dword ptr [edi + 4]
    test test ch, 2
    je L21
    test test ch, 1
    jne L22
    test test cl, cl
    jns L13
L0:
    mov mov edx, dword ptr [ebp - 32]
    jmp L16
L1:
    test test ch, 32
    je L14
    xor xor edx, edx
L2:
    jmp L18
    test test ecx, 040000h
    mov mov edx, dword ptr [ebp - 16]
    jne L20
    mov mov edx, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [eax + 12]
L3:
    mov mov edi, dword ptr [eax + 112]
    add add ecx, edx
    shr shr edi, 2
    mov mov edx, ecx
    sub sub edx, edi
    inc inc ecx
    jmp L23
    mov mov edi, dword ptr [ebp - 12]
    dec dec ecx
L5:
    lea lea edi, [edi + ecx*4]
    cmp cmp dword ptr [edi], 0
    jne L25
    mov mov dword ptr [edi], eax
    cmp cmp ecx, edx
    ja L24
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebx + 8]
    jb L15
    xor xor edx, edx
    xor xor ecx, ecx
    cmp cmp esi, edx
    mov mov dword ptr [ebp - 24], edx
    jbe L27
    mov mov edi, dword ptr [ebp - 12]
L11:
    mov mov eax, dword ptr [edi + ecx*4]
    cmp cmp eax, edx
    je L28
    mov mov ebx, dword ptr [ebp - 24]
    inc inc dword ptr [ebp - 24]
    mov mov dword ptr [edi + ebx*4], eax
    inc inc ecx
    cmp cmp ecx, esi
    jb L26
    jmp L29
    mov mov edi, dword ptr [ebp - 12]
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 24], eax
    mov mov dword ptr [ebp - 28], edx
    jbe L33
    test test eax, eax
    je L30
    mov mov ecx, dword ptr [edi + edx*4]
    mov mov esi, dword ptr [ecx + 4]
    cmp cmp esi, dword ptr [eax + 4]
    jne L31
    mov mov ecx, dword ptr [ecx + 96]
    cmp cmp ecx, dword ptr [eax + 96]
    jne L32
    mov mov ecx, dword ptr [edi + edx*4]
    mov mov esi, dword ptr [ecx + 112]
    mov mov ecx, dword ptr [ecx + 12]
    mov mov ebx, dword ptr [eax + 12]
    shr shr esi, 2
    sub sub ecx, esi
    mov mov esi, dword ptr [eax + 112]
    shr shr esi, 2
    sub sub ebx, esi
    cmp cmp ecx, ebx
    je L34
    mov mov eax, dword ptr [edi + edx*4]
    test test eax, eax
    je L35
    mov mov ecx, dword ptr [eax + 96]
    cmp cmp dword ptr [ecx + 4], 6
    jne L36
    mov mov esi, dword ptr [ecx + 20]
    test test esi, esi
    je L37
    cmp cmp dword ptr [esi + 4], 3
    jne L38
    mov mov ecx, dword ptr [ecx + 24]
    test test ecx, ecx
    je L39
    cmp cmp dword ptr [ecx + 4], 11
    jne L40
    cmp cmp dword ptr [esi + 16], 9
    jne L41
    cmp cmp dword ptr [esi + 24], 0
    je L42
    mov mov esi, dword ptr [ebp - 28]
    mov mov ecx, dword ptr [ebp - 36]
    inc inc dword ptr [ebp - 28]
    mov mov dword ptr [ecx + esi*4], edx
    inc inc edx
    cmp cmp edx, dword ptr [ebp - 24]
    jb L33
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp - 28], ecx
    mov mov dword ptr [ebp - 8], ecx
    jbe L47
    mov mov eax, dword ptr [ebp - 36]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [edi + eax*4]
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [eax + 96]
    mov mov eax, dword ptr [eax + 20]
    mov mov eax, dword ptr [eax + 24]
    xor xor esi, esi
    test test ecx, ecx
    mov mov dword ptr [ebp - 32], eax
    jbe L49
    jmp L43
    mov mov edi, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 36]
    mov mov eax, dword ptr [eax + esi*4]
    mov mov ecx, dword ptr [edi + eax*4]
    mov mov eax, dword ptr [ecx + 96]
    mov mov eax, dword ptr [eax + 20]
    mov mov eax, dword ptr [eax + 24]
    mov mov edi, dword ptr [ebp - 32]
    mov mov bl, byte ptr [edi]
    mov mov dl, bl
    cmp cmp bl, byte ptr [eax]
    jne L46
    test test dl, dl
    je L46
    mov mov bl, byte ptr [edi + 1]
    mov mov dl, bl
    cmp cmp bl, byte ptr [eax + 1]
    jne L48
    inc inc edi
    inc inc edi
    inc inc eax
    inc inc eax
    test test dl, dl
    jne L44
    xor xor eax, eax
    jmp L50
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    jl L52
    jg L51
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax + 4]
    cmp cmp eax, dword ptr [ecx + 4]
    jb L53
    inc inc esi
    cmp cmp esi, dword ptr [ebp - 8]
    jb L45
    mov mov ecx, dword ptr [ebp - 8]
    cmp cmp ecx, esi
    jbe L55
    mov mov eax, ecx
    mov mov edx, dword ptr [ebp - 36]
    mov mov edi, dword ptr [edx + eax*4 - 4]
    mov mov dword ptr [edx + eax*4], edi
    dec dec eax
    cmp cmp eax, esi
    ja L54
    mov mov eax, dword ptr [ebp - 4]
L13:
    mov mov dword ptr [edx + esi*4], eax
    mov mov edi, dword ptr [ebp - 12]
    inc inc ecx
    cmp cmp ecx, dword ptr [ebp - 28]
    mov mov dword ptr [ebp - 8], ecx
    jb L47
L14:
    mov mov ecx, dword ptr [ebp - 48]
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 08Ch]
    mov mov ebx, eax
    add add ebx, dword ptr [ebp - 28]
    je sub_100C87F8
    lea lea esi, [ebx + ebx*4]
    shl shl esi, 2
    push push esi
L20:
    call sub_100F7BD0
    test test eax, eax
L22:
    pop pop ecx
    mov mov dword ptr [ebp - 44], eax
    je sub_100C890B
    mov mov edi, dword ptr [ebp - 44]
    mov mov ecx, esi
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    lea lea eax, [ebp - 96]
    push push eax
    push push 1
    push push esi
    push push dword ptr [ebp - 44]
    lea lea ecx, [ebp - 80]
    call sub_10084474
    mov mov esi, eax
    test test esi, esi
    jl sub_100C895D
    and and dword ptr [ebp - 8], 0
    cmp cmp dword ptr [ebp - 28], 0
    mov mov dword ptr [ebp - 100], ebx
    jbe sub_100C8852
    mov mov ebx, dword ptr [ebp - 44]
    mov mov edi, dword ptr [ebp - 36]
    add add ebx, 4
    mov mov dword ptr [ebp - 16], edi
    mov mov dword ptr [ebp - 20], ebx
    mov mov ecx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [edi]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 96]
    mov mov edx, dword ptr [ecx + 24]
    mov mov ecx, dword ptr [ecx + 20]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov dword ptr [ebp - 40], edx
    mov mov edx, dword ptr [eax + 4]
    mov mov eax, dword ptr [ebp - 48]
    cmp cmp dword ptr [eax + 0158h], 0
    mov mov esi, dword ptr [eax + 16]
    mov mov edx, dword ptr [esi + edx*4]
    mov mov dword ptr [ebp - 52], edx
L26:
    jne L56
L27:
    lea lea eax, [ebx - 4]
L28:
    push push eax
    push push 7
    push push -1
    push push ecx
    jmp L62
    mov mov edx, dword ptr [edx + 4]
    test test dh, 32
    mov mov eax, 01011A654h
    je L57
    mov mov eax, 01011A64Ch
L29:
    jmp L59
    test test edx, 040000h
    je L58
    mov mov eax, 01011A644h
    jmp L60
    test test dl, dl
    jns L61
    mov mov eax, 01011A63Ch
    push push ecx
    push push eax
    lea lea eax, [ebp - 017Ch]
    push push 0FFh
    push push eax
    call sub_100F7CB4
    add add esp, 16
    lea lea eax, [ebx - 4]
    push push eax
    push push 6
    push push -1
    lea lea eax, [ebp - 017Ch]
    mov mov byte ptr [ebp - 126], 0
    push push eax
    lea lea ecx, [ebp - 80]
    call sub_10084535
    mov mov esi, eax
    test test esi, esi
L30:
    jl sub_100C8A1E
    mov mov eax, dword ptr [edi]
    xor xor edx, edx
    lea lea ecx, [eax + 1]
    inc inc edx
    cmp cmp ecx, dword ptr [ebp - 24]
    jae L63
L32:
    mov mov esi, dword ptr [ebp - 12]
    lea lea eax, [esi + eax*4]
    mov mov esi, dword ptr [eax]
    mov mov esi, dword ptr [esi + 4]
    add add eax, 4
    mov mov dword ptr [ebp - 84], esi
    mov mov dword ptr [ebp - 4], ecx
    mov mov dword ptr [ebp - 32], eax
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [ebp - 84]
    cmp cmp ecx, dword ptr [eax + 4]
    jne sub_100C8606
    mov mov eax, dword ptr [edi]
    mov mov esi, dword ptr [ebp - 12]
    lea lea ecx, [eax + edx]
    mov mov eax, dword ptr [esi + eax*4]
    mov mov ecx, dword ptr [esi + ecx*4]
    mov mov eax, dword ptr [eax + 96]
    cmp cmp eax, dword ptr [ecx + 96]
    jne sub_100C861C
    mov mov eax, dword ptr [edi]
    lea lea ecx, [eax + edx]
    mov mov eax, dword ptr [esi + eax*4]
    mov mov ecx, dword ptr [esi + ecx*4]
    mov mov esi, dword ptr [eax + 112]
    mov mov eax, dword ptr [eax + 12]
    shr shr esi, 2
    sub sub eax, esi
    mov mov esi, dword ptr [ecx + 112]
    mov mov ecx, dword ptr [ecx + 12]
    shr shr esi, 2
    sub sub ecx, esi
    cmp cmp eax, ecx
    jne sub_100C8641
    mov mov eax, dword ptr [ebp - 32]
L34:
    add add eax, 4
    inc inc edx
    inc inc dword ptr [ebp - 4]
L35:
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp ecx, dword ptr [ebp - 24]
    mov mov dword ptr [ebp - 32], eax
L36:
    jb sub_100C85FC
    mov mov eax, dword ptr [ebp - 52]
    mov mov eax, dword ptr [eax + 4]
    test test al, al
    jns sub_100C866F
    push push 3
    pop pop eax
    jmp sub_100C8688
    test test ah, 32
L39:
    je sub_100C8682
    xor xor eax, eax
    jmp sub_100C8691
L40:
    and and eax, 040000h
    neg neg eax
    sbb sbb eax, eax
    inc inc eax
    inc inc eax
    mov mov ecx, dword ptr [ebp - 12]
    mov mov word ptr [ebx], ax
    mov mov eax, dword ptr [edi]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov esi, dword ptr [eax + 112]
    mov mov ax, word ptr [eax + 12]
    shr shr esi, 2
    sub sub ax, si
    mov mov word ptr [ebx + 2], ax
    mov mov eax, dword ptr [ebp - 40]
    mov mov word ptr [ebx + 4], dx
    mov mov eax, dword ptr [eax + 32]
    test test eax, eax
    je sub_100C8719
    lea lea edx, [ebx + 8]
    push push edx
    mov mov edx, dword ptr [edi]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov ecx, dword ptr [ecx + 60]
    and and ecx, 0E00000h
    push push ecx
    push push 1
    push push eax
    lea lea eax, [ebp - 80]
    push push eax
    call sub_100C4354
    mov mov esi, eax
    test test esi, esi
    jl sub_100C8B12
    mov mov eax, dword ptr [ebp - 40]
    cmp cmp dword ptr [eax + 48], 0
    je sub_100C8770
    mov mov ecx, dword ptr [ebp - 48]
    mov mov edx, dword ptr [ecx]
    lea lea eax, [ebx - 4]
    push push eax
    push push dword ptr [ebp - 40]
    call call dword ptr [edx + 094h]
    mov mov esi, eax
    test test esi, esi
    jl sub_100C8B37
    mov mov ecx, dword ptr [ebp - 40]
    mov mov eax, dword ptr [ecx + 52]
L43:
    test test eax, eax
    je sub_100C8A0E
    mov mov dx, word ptr [ebx]
    cmp cmp dx, 1
    jne sub_100C8891
    lea lea esi, [eax + 3]
    and and esi, -4
    mov mov eax, esi
    shl shl eax, 2
    push push eax
    mov mov dword ptr [ebp - 32], eax
    call sub_100F7E16
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 60], eax
    je sub_100C8B51
    mov mov ecx, dword ptr [ebp - 32]
    mov mov ebx, dword ptr [ebp - 60]
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    mov mov edi, ebx
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
L44:
    shr shr esi, 2
    rep stosb rep stosb byte ptr es:[edi], al
    je sub_100C884B
    lea lea eax, [ebx + 8]
    mov mov dword ptr [eax], 1
    add add eax, 16
L47:
    dec dec esi
    jne sub_100C884E
    mov mov edi, dword ptr [ebp - 40]
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [edi + 52], 0
    jbe sub_100C88C2
    mov mov esi, dword ptr [ebp - 4]
    mov mov eax, dword ptr [edi + 56]
    shl shl esi, 2
    mov mov eax, dword ptr [esi + eax]
    test test eax, eax
    je sub_100C88C7
    mov mov ecx, dword ptr [eax]
    sub sub ecx, 0
    je sub_100C88C3
    dec dec ecx
    je sub_100C88BE
    dec dec ecx
    je sub_100C88C1
    dec dec ecx
    jne sub_100C88D7
    fld fld qword ptr [eax + 8]
    call sub_100F9785
L52:
    mov mov edi, dword ptr [ebp - 40]
    mov mov dword ptr [esi + ebx], eax
    jmp sub_100C88E7
    mov mov eax, dword ptr [eax + 8]
    mov mov dword ptr [esi + ebx], eax
    jmp sub_100C88EF
    xor xor ecx, ecx
    cmp cmp dword ptr [eax + 8], ecx
    setne setne cl
    mov mov dword ptr [esi + ebx], ecx
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [edi + 52]
    jb sub_100C88C2
    mov mov eax, dword ptr [ebp - 20]
    add add eax, 12
    push push eax
    push push 11
    push push dword ptr [ebp - 32]
    lea lea ecx, [ebp - 80]
    push push ebx
    call sub_1008472F
    mov mov esi, eax
    test test esi, esi
    jl sub_100C8C18
    and and dword ptr [ebp - 60], 0
    jmp sub_100C8AE4
    cmp cmp dx, 2
    jne sub_100C8A2E
    add add eax, 3
    and and eax, -4
    mov mov esi, eax
    shl shl esi, 2
    push push esi
    mov mov dword ptr [ebp - 52], esi
    call sub_100F7EEF
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 64], eax
    je sub_100C8C2A
    mov mov edx, dword ptr [ebp - 64]
    mov mov ecx, esi
    shr shr ecx, 2
    xor xor eax, eax
    mov mov edi, edx
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, esi
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov edi, dword ptr [ebp - 40]
    xor xor ebx, ebx
    cmp cmp dword ptr [edi + 52], ebx
    jbe sub_100C8A45
    mov mov eax, dword ptr [edi + 56]
    mov mov ecx, ebx
    shl shl ecx, 2
    mov mov eax, dword ptr [ecx + eax]
    test test eax, eax
    je sub_100C8A4E
    mov mov esi, dword ptr [eax]
    sub sub esi, 0
    je sub_100C8A46
    dec dec esi
    je sub_100C8A44
    dec dec esi
    je sub_100C8A32
    dec dec esi
    jne sub_100C8A5E
    fld fld qword ptr [eax + 8]
    jmp sub_100C8A60
    mov mov eax, dword ptr [eax + 8]
    test test eax, eax
    mov mov dword ptr [ebp - 84], eax
    fild fild dword ptr [ebp - 84]
    jge sub_100C8A6D
    fadd fadd dword ptr [g_1019BC80]
    jmp sub_100C8A75
    fild fild dword ptr [eax + 8]
    jmp sub_100C8A7A
    cmp cmp dword ptr [eax + 8], 0
    je sub_100C8A7E
    fld1 fld1
    jmp sub_100C8A84
    fldz fldz
    fstp fstp dword ptr [ecx + edx]
    inc inc ebx
    cmp cmp ebx, dword ptr [edi + 52]
    jb sub_100C8A45
    mov mov eax, dword ptr [ebp - 20]
    add add eax, 12
    push push eax
    push push 11
    push push dword ptr [ebp - 52]
    lea lea ecx, [ebp - 80]
    push push edx
    call sub_100847F3
    mov mov esi, eax
    test test esi, esi
    jl sub_100C8CDC
    and and dword ptr [ebp - 64], 0
    jmp sub_100C8BA8
    test test dx, dx
    jne sub_100C8BB7
    mov mov eax, dword ptr [ecx + 20]
    mov mov esi, eax
    shl shl esi, 2
    push push esi
    mov mov dword ptr [ebp - 52], esi
    call sub_100F7FAF
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 56], eax
    je sub_100C8CEA
    mov mov ecx, esi
    mov mov esi, dword ptr [ebp - 56]
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    mov mov edi, esi
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov edi, dword ptr [ebp - 40]
    xor xor ebx, ebx
    cmp cmp dword ptr [edi + 20], ebx
    mov mov dword ptr [ebp - 4], ebx
    jbe sub_100C8BCF
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [edi + 60]
    shl shl ecx, 2
    mov mov eax, dword ptr [ecx + eax]
    cmp cmp eax, ebx
    je sub_100C8BD4
    mov mov edx, dword ptr [eax]
    sub sub edx, ebx
    je sub_100C8BCF
    dec dec edx
    je sub_100C8BD2
    dec dec edx
    je sub_100C8BD5
    dec dec edx
    jne sub_100C8BE3
    fld fld qword ptr [g_1019BE20]
    fld fld qword ptr [eax + 8]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_100C8BE3
    xor xor eax, eax
    inc inc eax
    jmp sub_100C8BEA
    xor xor eax, eax
    mov mov dword ptr [ecx + esi], eax
    jmp sub_100C8C01
    xor xor edx, edx
    cmp cmp dword ptr [eax + 8], ebx
    setne setne dl
    mov mov dword ptr [ecx + esi], edx
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [edi + 20]
    jb sub_100C8BCF
    mov mov eax, dword ptr [ebp - 20]
    add add eax, 12
    push push eax
    push push 11
    push push dword ptr [ebp - 52]
    lea lea ecx, [ebp - 80]
    push push esi
    call sub_100848B8
    mov mov esi, eax
    cmp cmp esi, ebx
    jl sub_100C8DA1
    and and dword ptr [ebp - 56], 0
    mov mov ebx, dword ptr [ebp - 20]
    mov mov edi, dword ptr [ebp - 16]
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    add add edi, 4
    add add ebx, 20
    cmp cmp eax, dword ptr [ebp - 28]
    mov mov dword ptr [ebp - 16], edi
    mov mov dword ptr [ebp - 20], ebx
    jb sub_100C8861
    push push dword ptr [ebp - 28]
    mov mov ecx, dword ptr [ebp - 48]
    push push dword ptr [ebp - 44]
    mov mov eax, dword ptr [ecx]
    lea lea edx, [ebp - 80]
    push push edx
L57:
    call call dword ptr [eax + 090h]
    mov mov esi, eax
    test test esi, esi
    jl sub_100C8DE5
    mov mov ebx, dword ptr [ebp - 48]
    xor xor eax, eax
    lea lea edi, [ebp - 124]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    lea lea eax, [ebp - 124]
L58:
    push push eax
L59:
    push push 0
    push push dword ptr [ebx + 0108h]
    call sub_1006405B
    mov mov esi, eax
L60:
    test test esi, esi
    jl sub_100C8E0B
    lea lea eax, [ebp - 88]
    push push eax
    push push 5
    push push -1
    push push dword ptr [ebp - 124]
    lea lea ecx, [ebp - 80]
    call sub_1008493F
    mov mov esi, eax
    test test esi, esi
    jl sub_100C8E28
    lea lea eax, [ebp - 108]
    push push eax
    push push 5
    push push -1
    push push 01011A608h
    lea lea ecx, [ebp - 80]
    call sub_1008495E
    mov mov esi, eax
    test test esi, esi
    jl sub_100C8E47
    lea lea ecx, [ebp - 80]
    call sub_10084AA9
    mov mov edi, eax
    cmp cmp edi, 08000h
    ja sub_100C8E3F
    push push edi
    mov mov ecx, ebx
    call sub_100C49A6
    mov mov esi, eax
    test test esi, esi
    jl sub_100C8E67
    mov mov ecx, dword ptr [ebx + 0110h]
    mov mov eax, dword ptr [ebx + 010Ch]
    lea lea ecx, [ecx*4 - 4]
    push push ecx
    lea lea ecx, [eax + 4]
    push push ecx
    lea lea eax, [eax + edi*4 + 4]
    push push eax
    call sub_100F706F
    mov mov eax, dword ptr [ebx + 010Ch]
    add add esp, 12
    push push edi
    add add eax, 4
    push push eax
    lea lea ecx, [ebp - 80]
    call sub_10084B05
    mov mov esi, eax
    test test esi, esi
    jl sub_100C8EA5
    add add dword ptr [ebx + 0110h], edi
    mov mov eax, dword ptr [ebx + 0110h]
    add add dword ptr [ebx + 0120h], edi
    mov mov dword ptr [ebx + 011Ch], eax
    xor xor esi, esi
    jmp sub_100C8EC1
    mov mov esi, 08007000Eh
    jmp sub_100C8EC8
    push push 01011A5D4h
    push push 011C4h
    push push 0
    push push ebx
    call sub_1008B9D5
    add add esp, 16
    mov mov esi, 080004005h
    push push dword ptr [ebp - 44]
    call sub_100F8195
    push push dword ptr [ebp - 12]
    call sub_100F819D
    push push dword ptr [ebp - 64]
    call sub_100F81A5
    push push dword ptr [ebp - 56]
    call sub_100F81AD
    push push dword ptr [ebp - 60]
    call sub_100F81B5
    push push dword ptr [ebp - 36]
L63:
    call sub_100F81BD
    add add esp, 24
    lea lea ecx, [ebp - 80]
    call sub_10084A06
    pop pop edi
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100c7c92 ENDP
END
