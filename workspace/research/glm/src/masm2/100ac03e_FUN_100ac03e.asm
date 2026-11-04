.686
.MODEL FLAT, C
EXTRN sub_1006CC0C:PROC
EXTRN sub_10085607:PROC
EXTRN sub_1008593E:PROC
EXTRN sub_10085956:PROC
EXTRN sub_10085A97:PROC
EXTRN sub_10085B1E:PROC
EXTRN sub_10085DCE:PROC
EXTRN sub_10085DE6:PROC
EXTRN sub_10085F20:PROC
EXTRN sub_10085F3E:PROC
EXTRN sub_100AC856:PROC
EXTRN sub_100AC913:PROC
EXTRN sub_100AC952:PROC
EXTRN sub_100AC954:PROC
EXTRN sub_100AC95D:PROC
EXTRN sub_100AC96C:PROC
EXTRN sub_100AC9F4:PROC
EXTRN sub_100AC9F8:PROC
EXTRN sub_100AC9FC:PROC
EXTRN sub_100ACA01:PROC
EXTRN sub_100ACA04:PROC
EXTRN sub_100ACA0A:PROC
EXTRN sub_100ACA0F:PROC
EXTRN sub_100ACAE8:PROC
EXTRN sub_100ACAEB:PROC
EXTRN sub_100ACAED:PROC
EXTRN sub_100ACAEE:PROC
EXTRN sub_100ACAF3:PROC
EXTRN sub_100ACAF6:PROC
EXTRN sub_100ACAFE:PROC
EXTRN sub_100ACB01:PROC
EXTRN sub_100ACB07:PROC
EXTRN sub_100ACBC5:PROC
EXTRN sub_100ACBD2:PROC
EXTRN sub_100ACBF6:PROC
EXTRN sub_100ACC06:PROC
EXTRN sub_100ACC28:PROC
EXTRN sub_100ACC9F:PROC
EXTRN sub_100ACCA7:PROC
EXTRN sub_100ACD26:PROC
EXTRN sub_100ACD28:PROC
EXTRN sub_100ACD32:PROC
EXTRN sub_100ACD3A:PROC
EXTRN sub_100ACD3E:PROC
EXTRN sub_100ACD45:PROC
EXTRN sub_100ACD47:PROC
EXTRN sub_100ACD53:PROC
EXTRN sub_100ACD5A:PROC
EXTRN sub_100ACD7A:PROC
EXTRN sub_100ACDBA:PROC
EXTRN sub_100ACDC4:PROC
EXTRN sub_100ACDD3:PROC
EXTRN sub_100ACF00:PROC
EXTRN sub_100ACF1E:PROC
EXTRN sub_100ACF4E:PROC
EXTRN sub_100ACF8D:PROC
EXTRN sub_100ACF93:PROC
EXTRN sub_100ACFBB:PROC
EXTRN sub_100ACFC0:PROC
EXTRN sub_100ACFC7:PROC
EXTRN sub_100ACFCC:PROC
EXTRN sub_100ACFD0:PROC
EXTRN sub_100ACFDE:PROC
EXTRN sub_100AD021:PROC
EXTRN sub_100AD02D:PROC
.CODE
FUN_100ac03e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0CCh
    push push ebx
    push push esi
    mov mov esi, ecx
    xor xor ecx, ecx
    push push edi
    mov mov dword ptr [ebp - 48], ecx
    mov mov dword ptr [ebp - 28], ecx
    mov mov dword ptr [ebp - 40], ecx
    jmp L0
    xor xor ecx, ecx
    mov mov eax, dword ptr [esi + 022Ch]
    mov mov edx, dword ptr [ebp - 40]
    mov mov eax, dword ptr [eax + edx*4]
    cmp cmp eax, ecx
    je L2
    cmp cmp dword ptr [eax + 12], ecx
    je L3
L0:
    cmp cmp dword ptr [esi + 0224h], ecx
    mov mov dword ptr [ebp - 12], ecx
    jbe L4
    mov mov eax, dword ptr [esi + 0230h]
    mov mov ecx, dword ptr [ebp - 12]
    mov mov ebx, dword ptr [eax + ecx*4]
    test test ebx, ebx
    mov mov dword ptr [ebp - 20], ebx
    je L5
    mov mov eax, dword ptr [ebx]
    test test eax, eax
    je L6
    and and dword ptr [ebp - 36], 0
    cmp cmp ecx, 6
    sbb sbb ecx, ecx
    neg neg ecx
    and and eax, 0FFFFFh
    mov mov dword ptr [ebp - 60], ecx
    mov mov dword ptr [ebp - 8], eax
    je L7
    mov mov eax, dword ptr [ebx + 4]
    xor xor edx, edx
    div div dword ptr [ebp - 8]
    mov mov edx, dword ptr [esi + 022Ch]
    mov mov edi, dword ptr [ebp - 40]
    mov mov edi, dword ptr [edx + edi*4]
    mov mov dword ptr [ebp - 56], eax
    xor xor eax, eax
    cmp cmp dword ptr [edi + 12], eax
    mov mov dword ptr [ebp - 32], eax
    mov mov dword ptr [ebp - 24], eax
    jbe L11
    mov mov eax, edx
    mov mov edx, dword ptr [ebp - 40]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [eax + 12]
    mov mov dword ptr [ebp - 44], eax
    mov mov eax, dword ptr [ebp - 56]
    cmp cmp ecx, eax
    jae L8
    mov mov edx, dword ptr [ebp - 8]
    imul imul edx, ecx
    shl shl edx, 2
    sub sub eax, ecx
    mov mov dword ptr [ebp - 52], eax
    cmp cmp dword ptr [ebp - 8], 0
    jbe L10
    mov mov ecx, dword ptr [ebp - 24]
    mov mov eax, dword ptr [edi + 16]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebx + 8]
    mov mov dword ptr [ebp - 16], eax
    mov mov eax, dword ptr [ebp - 8]
    add add ecx, edx
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ecx]
    cmp cmp eax, dword ptr [ebp - 16]
    je L7
    mov mov ebx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ebx + eax*4]
    mov mov ebx, dword ptr [ebp - 16]
    cmp cmp dword ptr [eax + 56], ebx
    jne L13
    mov mov ebx, dword ptr [ebp - 40]
    cmp cmp dword ptr [ebp - 12], ebx
    jbe L14
    mov mov eax, dword ptr [esi + 0230h]
    mov mov eax, dword ptr [eax + ebx*4]
    test test eax, eax
    je L15
    mov mov eax, dword ptr [eax]
    test test eax, eax
    je L16
    and and eax, 0FFF00000h
    cmp cmp eax, 011000000h
    je L17
    mov mov dword ptr [ebp - 32], 1
    mov mov dword ptr [ebp - 36], edi
    add add ecx, 4
    dec dec dword ptr [ebp - 4]
    jne L12
    mov mov ebx, dword ptr [ebp - 20]
    mov mov ecx, dword ptr [ebp - 60]
    mov mov eax, dword ptr [ebp - 8]
    shl shl eax, 2
    add add edx, eax
    dec dec dword ptr [ebp - 52]
    jne L11
    inc inc dword ptr [ebp - 24]
    mov mov eax, dword ptr [ebp - 24]
    cmp cmp eax, dword ptr [ebp - 44]
    jb L9
    cmp cmp dword ptr [ebp - 32], 0
    je L18
    mov mov eax, dword ptr [ebp + 8]
    test test eax, eax
    je L19
    inc inc dword ptr [eax]
    mov mov ecx, dword ptr [eax]
    inc inc ecx
    mov mov dword ptr [eax], ecx
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [esi + 0224h]
    jb L4
    inc inc dword ptr [ebp - 40]
    cmp cmp dword ptr [ebp - 40], 6
    jb L1
    and and dword ptr [ebp - 36], 0
    cmp cmp dword ptr [esi + 0220h], 0
    jbe sub_100AC952
    mov mov eax, dword ptr [esi + 022Ch]
    mov mov ecx, dword ptr [ebp - 36]
    mov mov eax, dword ptr [eax + ecx*4]
L1:
    test test eax, eax
    je sub_100AC954
    cmp cmp dword ptr [eax], 0
    je sub_100AC95D
    mov mov ecx, dword ptr [eax + 12]
    and and dword ptr [ebp - 32], 0
    test test ecx, ecx
    jbe sub_100AC96C
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + 16]
L5:
    mov mov edi, ecx
    mov mov ecx, dword ptr [eax]
    mov mov ebx, dword ptr [edx + ecx*4]
    cmp cmp dword ptr [ebx + 16], 3
    jne L34
    mov mov ebx, ecx
    mov mov dword ptr [ebp - 32], 1
    mov mov dword ptr [ebp - 40], ebx
    jmp L35
    or or eax, -1
    lea lea edi, [ebp - 76]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor ecx, ecx
    cmp cmp dword ptr [ebx + 4], ecx
    stosd stosd dword ptr es:[edi], eax
    mov mov dword ptr [ebp - 4], ecx
    stosd stosd dword ptr es:[edi], eax
    mov mov dword ptr [ebp - 8], ecx
    jbe L23
    mov mov ecx, dword ptr [ebp - 36]
    mov mov eax, dword ptr [ecx + 12]
    test test eax, eax
    jbe L22
    mov mov edx, dword ptr [ebx + 8]
    mov mov edi, dword ptr [ebp - 8]
    mov mov edx, dword ptr [edx + edi*4]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov dword ptr [ebp - 44], edx
    mov mov dword ptr [ebp - 32], eax
    jmp L20
    mov mov edx, dword ptr [ebp - 44]
    mov mov eax, dword ptr [ecx]
    cmp cmp eax, edx
    je L21
    mov mov edi, dword ptr [esi + 20]
    mov mov edx, dword ptr [edi + edx*4]
    cmp cmp eax, dword ptr [edx + 56]
    jne L26
    mov mov edi, dword ptr [ebp - 4]
    xor xor edx, edx
    test test edi, edi
    jbe L25
    cmp cmp dword ptr [ebp + edx*4 - 76], eax
    je L27
L15:
    inc inc edx
    cmp cmp edx, edi
    jb L25
    cmp cmp edx, edi
    jne L28
    mov mov dword ptr [ebp + edi*4 - 76], eax
    inc inc edi
    mov mov dword ptr [ebp - 4], edi
    add add ecx, 4
    dec dec dword ptr [ebp - 32]
    jne L24
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [ebx + 4]
    jb L23
    push push 116
    call sub_10085A97
    test test eax, eax
    je L29
    mov mov ecx, eax
    call sub_10085607
    mov mov dword ptr [ebp - 28], eax
    jmp L30
    and and dword ptr [ebp - 28], 0
    cmp cmp dword ptr [ebp - 28], 0
    je L37
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 28]
    push push 0
    push push dword ptr [ebp - 4]
    and and eax, 0FFFFFh
    push push dword ptr [ebp - 4]
    or or eax, 010000000h
    push push eax
    call sub_10085B1E
    mov mov edi, eax
    test test edi, edi
    mov mov dword ptr [ebp - 16], edi
    jl sub_100ACAEE
    mov mov edx, dword ptr [ebp - 28]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov edi, dword ptr [edx + 16]
    or or eax, -1
    rep stosd rep stosd dword ptr es:[edi], eax
    xor xor edi, edi
    cmp cmp dword ptr [ebx + 4], edi
    mov mov dword ptr [ebp - 24], edi
    jbe L39
    mov mov eax, dword ptr [ebp - 36]
    cmp cmp dword ptr [eax + 12], edi
    mov mov dword ptr [ebp - 8], edi
    jbe L39
    mov mov edx, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edi, dword ptr [esi + 20]
    mov mov edx, dword ptr [edi + ecx*4]
    mov mov eax, dword ptr [eax + 16]
    mov mov dword ptr [ebp - 16], edx
    mov mov edx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax + edx*4]
    cmp cmp eax, ecx
    je L32
    mov mov ecx, dword ptr [ebp - 16]
    cmp cmp eax, dword ptr [ecx + 56]
    jne L41
    mov mov ebx, dword ptr [edi + eax*4]
    mov mov eax, dword ptr [ebp - 24]
    xor xor edx, edx
    div div dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax + 16]
    mov mov dword ptr [ebp - 44], ebx
    shl shl edx, 2
    mov mov ecx, dword ptr [edx + eax]
    cmp cmp ecx, -1
    jne L36
    lea lea ebx, [esi + 0408h]
    mov mov eax, dword ptr [ebx]
    cmp cmp eax, 64
    jae L43
    mov mov ecx, dword ptr [esi + eax*4 + 0304h]
    inc inc eax
    mov mov dword ptr [ebx], eax
    mov mov eax, dword ptr [edi + ecx*4]
    mov mov edi, dword ptr [esi + 088h]
    and and dword ptr [eax + 60], 0
    or or dword ptr [eax + 56], -1
    cmp cmp ecx, -1
    mov mov ebx, dword ptr [ebp - 44]
    mov mov dword ptr [eax + 4], edi
    mov mov edi, dword ptr [ebx + 16]
    mov mov dword ptr [eax + 16], edi
    je L45
    mov mov eax, dword ptr [ebp - 36]
    mov mov edi, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov edi, dword ptr [ebp - 16]
    cmp cmp eax, dword ptr [edi + 56]
    jne L42
    mov mov eax, dword ptr [esi + 0408h]
    cmp cmp eax, 64
    jae sub_100AC856
    mov mov edi, dword ptr [esi + eax*4 + 0304h]
    inc inc eax
    mov mov dword ptr [esi + 0408h], eax
    mov mov ebx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + edi*4]
    mov mov dword ptr [eax + 16], ebx
    mov mov ebx, dword ptr [ebp - 16]
    mov mov ebx, dword ptr [ebx + 60]
    mov mov dword ptr [eax + 60], ebx
    mov mov dword ptr [eax + 56], ecx
    mov mov ebx, dword ptr [esi + 088h]
    mov mov dword ptr [eax + 4], ebx
    mov mov eax, dword ptr [ebp - 20]
    mov mov eax, dword ptr [eax + 8]
    mov mov ebx, dword ptr [ebp - 24]
    mov mov dword ptr [ebp - 44], edi
    mov mov dword ptr [eax + ebx*4], edi
    jmp L44
    mov mov eax, dword ptr [ebp - 20]
    mov mov eax, dword ptr [eax + 8]
    mov mov edi, dword ptr [ebp - 24]
    mov mov dword ptr [eax + edi*4], ecx
    mov mov eax, dword ptr [ebp - 36]
    mov mov eax, dword ptr [eax + 16]
    mov mov ebx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov edi, dword ptr [ebp - 28]
    mov mov edi, dword ptr [edi + 8]
    mov mov ebx, dword ptr [ebp - 20]
    mov mov dword ptr [edx + edi], eax
    mov mov eax, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax + 16]
    mov mov dword ptr [edx + eax], ecx
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    and and dword ptr [eax + 60], 0
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 36]
    mov mov ecx, dword ptr [ebp - 8]
    cmp cmp ecx, dword ptr [eax + 12]
    jb L38
    mov mov edx, dword ptr [ebp - 28]
    xor xor edi, edi
    inc inc dword ptr [ebp - 24]
    mov mov ecx, dword ptr [ebp - 24]
    cmp cmp ecx, dword ptr [ebx + 4]
    jb L40
    mov mov ebx, dword ptr [esi + 022Ch]
    lea lea eax, [esi + 0220h]
    mov mov ecx, dword ptr [eax]
    mov mov dword ptr [ebx + ecx*4], edx
    inc inc dword ptr [eax]
    lea lea eax, [esi + 0404h]
    mov mov ecx, dword ptr [eax]
    cmp cmp ecx, 12
    jae sub_100AC913
    mov mov dword ptr [esi + ecx*4 + 02C4h], edx
    inc inc dword ptr [eax]
    mov mov dword ptr [ebp - 28], edi
    jmp L31
    mov mov edi, 08007000Eh
    jmp sub_100ACC9F
    mov mov ebx, dword ptr [ebp - 40]
    add add eax, 4
    dec dec edi
    jne L33
    cmp cmp dword ptr [ebp - 32], 0
    je sub_100ACC28
    and and dword ptr [ebp - 4], 0
    push push 6
    pop pop eax
    cmp cmp dword ptr [esi + 0224h], eax
    mov mov dword ptr [ebp - 12], eax
    jbe sub_100AC9F8
L24:
    mov mov edx, dword ptr [esi + 0230h]
    add add edx, 24
L25:
    mov mov eax, dword ptr [edx]
    xor xor ecx, ecx
    cmp cmp eax, ecx
L27:
    je sub_100AC9F8
    cmp cmp dword ptr [eax], ecx
    je sub_100AC9FC
    cmp cmp dword ptr [eax + 4], ecx
    mov mov dword ptr [ebp - 20], ecx
    jbe sub_100ACA04
    mov mov ecx, dword ptr [eax + 8]
    mov mov dword ptr [ebp - 16], ecx
    mov mov ecx, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ecx]
    mov mov edi, dword ptr [esi + 20]
    mov mov edi, dword ptr [edi + ecx*4]
    cmp cmp dword ptr [edi + 56], ebx
    je sub_100AC9F4
    cmp cmp ecx, ebx
    jne sub_100ACA0F
    cmp cmp dword ptr [ebp - 4], 16
    jae sub_100ACCA7
    mov mov ecx, dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 4]
    mov mov dword ptr [ebp + ecx*4 - 08Ch], eax
    inc inc dword ptr [ebp - 20]
    mov mov ecx, dword ptr [ebp - 20]
    add add dword ptr [ebp - 16], 4
    cmp cmp ecx, dword ptr [eax + 4]
    jb sub_100ACA0A
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    add add edx, 4
    cmp cmp eax, dword ptr [esi + 0224h]
    jb sub_100ACA01
    mov mov eax, dword ptr [ebp + 8]
    test test eax, eax
    je sub_100ACAED
    and and dword ptr [ebp - 12], 0
    cmp cmp dword ptr [esi + 12], 0
    jbe sub_100ACAEB
    mov mov eax, dword ptr [esi + 24]
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebp - 20]
    mov mov eax, dword ptr [eax]
    test test eax, eax
    je sub_100ACAE8
    cmp cmp dword ptr [eax], 0
    je sub_100ACAED
    cmp cmp dword ptr [eax + 40], 1
    je sub_100ACAF3
    mov mov edi, dword ptr [eax + 4]
    and and dword ptr [ebp - 16], 0
    test test edi, edi
    jbe sub_100ACAFE
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [esi + 20]
    mov mov edx, dword ptr [edx + ecx*4]
    cmp cmp dword ptr [edx + 56], ebx
    je sub_100ACAF6
    cmp cmp ecx, ebx
    jne sub_100ACB07
    cmp cmp dword ptr [ebp - 4], 16
    jae sub_100ACD28
    inc inc dword ptr [ebp - 4]
    inc inc dword ptr [ebp - 16]
    add add eax, 4
    cmp cmp dword ptr [ebp - 16], edi
    jb sub_100ACB01
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    add add dword ptr [ebp - 20], 4
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_100ACAEE
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp dword ptr [ebp - 4], 0
    je sub_100ACD26
    inc inc dword ptr [eax]
    cmp cmp dword ptr [ebp - 4], 0
    je sub_100ACD32
    test test eax, eax
    jne sub_100ACD3A
    cmp cmp dword ptr [esi + 0404h], 12
    jae sub_100ACD7A
    push push 116
    call sub_10085DCE
    test test eax, eax
    je sub_100ACBC5
    mov mov ecx, eax
    call sub_1008593E
    mov mov edi, eax
    jmp sub_100ACBD2
    xor xor edi, edi
    push push 116
    call sub_10085DE6
    test test eax, eax
    je sub_100ACBF6
    mov mov ecx, eax
    call sub_10085956
    mov mov dword ptr [ebp - 8], eax
    jmp sub_100ACC06
    and and dword ptr [ebp - 8], 0
    test test edi, edi
    je sub_100ACDBA
    cmp cmp dword ptr [ebp - 8], 0
    je sub_100ACDC4
    mov mov eax, dword ptr [esi + 0408h]
    cmp cmp eax, 64
    ja sub_100ACDD3
    mov mov ecx, dword ptr [esi + eax*4 + 0308h]
    mov mov ebx, dword ptr [esi + eax*4 + 0304h]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    or or dword ptr [eax + 56], -1
    mov mov dword ptr [eax + 16], 3
    xor xor edx, edx
    mov mov dword ptr [eax + 60], edx
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ebx*4]
    or or dword ptr [eax + 56], -1
    mov mov dword ptr [eax + 16], 4
    mov mov dword ptr [eax + 60], edx
    add add dword ptr [esi + 0408h], 2
    cmp cmp dword ptr [ebp - 4], edx
    mov mov dword ptr [ebp - 44], ecx
    mov mov dword ptr [ebp - 12], edx
    jbe sub_100ACD3E
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp + eax*4 - 08Ch]
    and and dword ptr [ebp - 20], 0
    cmp cmp dword ptr [eax + 4], 0
    jbe sub_100ACD47
    mov mov eax, dword ptr [eax + 8]
    mov mov edx, dword ptr [ebp - 20]
    lea lea eax, [eax + edx*4]
    mov mov edx, dword ptr [esi + 20]
    mov mov dword ptr [ebp - 32], eax
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov edx, dword ptr [ebp - 40]
    cmp cmp dword ptr [eax + 56], edx
    jne sub_100ACD45
    mov mov dword ptr [eax + 56], ecx
    jmp sub_100ACD53
    mov mov eax, dword ptr [ebp - 32]
    cmp cmp dword ptr [eax], edx
    jne sub_100ACD5A
    mov mov dword ptr [eax], ecx
    inc inc dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp + eax*4 - 08Ch]
    mov mov edx, dword ptr [ebp - 20]
    cmp cmp edx, dword ptr [eax + 4]
    jb sub_100ACD47
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [ebp - 4]
    jb sub_100ACD3E
    push push 0
    push push 1
    push push 1
    push push 010000001h
    mov mov ecx, edi
    call sub_10085F20
    test test eax, eax
L36:
    mov mov dword ptr [ebp - 16], eax
    jl sub_100ACF00
    mov mov ecx, dword ptr [ebp - 8]
    push push 0
    push push 1
    push push 1
    push push 010000001h
    call sub_10085F3E
    test test eax, eax
    mov mov dword ptr [ebp - 16], eax
    jl sub_100ACF1E
    mov mov eax, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ebp - 40]
    mov mov edx, dword ptr [ebp - 44]
    mov mov dword ptr [eax], ebx
    mov mov eax, dword ptr [edi + 8]
    mov mov dword ptr [eax], ecx
    mov mov eax, dword ptr [ebp - 8]
    mov mov dword ptr [edi + 40], 1
    mov mov ecx, dword ptr [eax + 16]
    mov mov dword ptr [ecx], edx
    mov mov ecx, dword ptr [eax + 8]
    mov mov dword ptr [ecx], ebx
    push push 2
    pop pop ecx
    mov mov dword ptr [edi + 40], ecx
L37:
    mov mov edx, dword ptr [esi + 0404h]
    mov mov dword ptr [esi + edx*4 + 02C4h], edi
    mov mov edx, dword ptr [esi + 0404h]
    mov mov dword ptr [esi + edx*4 + 02C8h], eax
    add add dword ptr [esi + 0404h], ecx
    mov mov ecx, dword ptr [esi + 0220h]
    mov mov edx, dword ptr [esi + 022Ch]
    mov mov dword ptr [edx + ecx*4], edi
    mov mov ecx, dword ptr [ebp - 48]
    inc inc dword ptr [esi + 0220h]
    inc inc dword ptr [ebp - 48]
    mov mov dword ptr [ebp + ecx*4 - 0CCh], eax
    inc inc dword ptr [ebp - 36]
    mov mov eax, dword ptr [ebp - 36]
    cmp cmp eax, dword ptr [esi + 0220h]
    jb sub_100AC952
    mov mov edx, dword ptr [esi + 0224h]
    mov mov edi, dword ptr [ebp - 48]
    lea lea eax, [edx + edi]
    cmp cmp eax, 0200h
    jbe sub_100ACF4E
L42:
    mov mov eax, 080004005h
    jmp sub_100ACFBB
    mov mov edi, 080004005h
    jmp sub_100ACFC0
    xor xor eax, eax
    inc inc eax
    jmp sub_100ACFC7
    mov mov edi, 08007000Eh
    jmp sub_100ACFCC
    cmp cmp edx, 6
    jb sub_100ACF8D
    lea lea ecx, [edx + edi]
    shl shl ecx, 2
    mov mov eax, dword ptr [esi + 0230h]
    mov mov ebx, dword ptr [eax + edx*4]
    mov mov dword ptr [eax + ecx], ebx
    dec dec edx
    sub sub ecx, 4
    cmp cmp edx, 6
    jae sub_100ACF93
    test test edi, edi
    jbe sub_100ACFD0
    mov mov edx, dword ptr [ebp - 48]
    push push 24
    pop pop eax
    lea lea ecx, [ebp - 0CCh]
L43:
    sub sub ecx, eax
    mov mov ebx, dword ptr [ecx + eax]
    mov mov edi, dword ptr [esi + 0230h]
    mov mov dword ptr [eax + edi], ebx
    add add eax, 4
L44:
    dec dec edx
    jne sub_100ACFDE
    mov mov eax, dword ptr [ebp - 48]
    add add dword ptr [esi + 0224h], eax
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 28], 0
    je sub_100AD021
    mov mov ecx, dword ptr [ebp - 28]
    push push 1
    call sub_1006CC0C
    jmp sub_100AD02D
    mov mov edi, dword ptr [ebp - 16]
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_100ac03e ENDP
END
