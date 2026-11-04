.686
.MODEL FLAT, C
EXTRN sub_1006C70E:PROC
EXTRN sub_1006CD10:PROC
EXTRN sub_1006CD1E:PROC
EXTRN sub_1008543A:PROC
EXTRN sub_10085539:PROC
EXTRN sub_100855A5:PROC
EXTRN sub_10085850:PROC
EXTRN sub_100858C7:PROC
EXTRN sub_100858CA:PROC
EXTRN sub_100859C9:PROC
EXTRN sub_10085A3F:PROC
EXTRN sub_10085B9D:PROC
EXTRN sub_10085CE0:PROC
EXTRN sub_10085D60:PROC
EXTRN sub_10085DFF:PROC
EXTRN sub_10086260:PROC
EXTRN sub_10086290:PROC
EXTRN sub_100862B8:PROC
EXTRN sub_100862ED:PROC
EXTRN sub_100866AD:PROC
EXTRN sub_1008676E:PROC
EXTRN sub_10086828:PROC
EXTRN sub_10086861:PROC
EXTRN sub_100868C9:PROC
EXTRN sub_1008B952:PROC
EXTRN sub_1008B97D:PROC
EXTRN sub_100A81AD:PROC
EXTRN sub_100A8229:PROC
EXTRN sub_100A8326:PROC
EXTRN sub_100ACCB6:PROC
EXTRN sub_100ACD4A:PROC
EXTRN sub_100B1750:PROC
EXTRN sub_100B1795:PROC
EXTRN sub_100B179F:PROC
EXTRN sub_100B17A9:PROC
EXTRN sub_100B17B3:PROC
EXTRN sub_100B17DE:PROC
EXTRN sub_100B17E6:PROC
EXTRN sub_100B17F1:PROC
EXTRN sub_100B1804:PROC
EXTRN sub_100B181F:PROC
EXTRN sub_100B1894:PROC
EXTRN sub_100B18A2:PROC
EXTRN sub_100B18B7:PROC
EXTRN sub_100B18D8:PROC
EXTRN sub_100B1946:PROC
EXTRN sub_100B194C:PROC
EXTRN sub_100B195D:PROC
EXTRN sub_100B196D:PROC
EXTRN sub_100B197C:PROC
EXTRN sub_100B1985:PROC
EXTRN sub_100B198F:PROC
EXTRN sub_100B1993:PROC
EXTRN sub_100B19A7:PROC
EXTRN sub_100B19BB:PROC
EXTRN sub_100B19D9:PROC
EXTRN sub_100B19E5:PROC
EXTRN sub_100B1A5C:PROC
EXTRN sub_100B1AEF:PROC
EXTRN sub_100B1AFA:PROC
EXTRN sub_100B1B11:PROC
EXTRN sub_100B1B3E:PROC
EXTRN sub_100B1B44:PROC
EXTRN sub_100B1B45:PROC
EXTRN sub_100B1B6A:PROC
EXTRN sub_100B1B88:PROC
EXTRN sub_100B1BCC:PROC
EXTRN sub_100B1C33:PROC
EXTRN sub_100B1C49:PROC
EXTRN sub_100B1C87:PROC
EXTRN sub_100B1CAB:PROC
EXTRN sub_100B1CD9:PROC
EXTRN sub_100B1D14:PROC
EXTRN sub_100B1D48:PROC
EXTRN sub_100B1D49:PROC
EXTRN sub_100B1D55:PROC
EXTRN sub_100B1D67:PROC
EXTRN sub_100B1D7A:PROC
EXTRN sub_100B1DA9:PROC
EXTRN sub_100B1E3B:PROC
EXTRN sub_100B1E87:PROC
EXTRN sub_100B1E8C:PROC
EXTRN sub_100B1E94:PROC
EXTRN sub_100B1EA3:PROC
EXTRN sub_100B1EE4:PROC
EXTRN sub_100B1EE9:PROC
EXTRN sub_100B1EF5:PROC
EXTRN sub_100B1F14:PROC
EXTRN sub_100B1F99:PROC
EXTRN sub_100B1FAC:PROC
EXTRN sub_100B1FEC:PROC
EXTRN sub_100B1FF4:PROC
EXTRN sub_100B1FF5:PROC
EXTRN sub_100B1FFA:PROC
EXTRN sub_100B1FFD:PROC
EXTRN sub_100B2026:PROC
EXTRN sub_100B2042:PROC
.CODE
FUN_100b0e3d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0104h
    push push ebx
    push push esi
    xor xor edx, edx
    mov mov esi, ecx
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 8], edx
    push push edi
    mov mov dword ptr [ebp - 32], edx
    mov mov dword ptr [ebp - 24], edx
    jbe L0
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov edi, dword ptr [eax + 4]
    mov mov dword ptr [eax + 48], edx
    cmp cmp edi, dword ptr [esi + 088h]
    jne L1
    or or dword ptr [eax + 12], -1
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 8]
    jb L0
    mov mov ecx, dword ptr [esi + 76]
    jmp L2
    mov mov eax, dword ptr [esi + 0230h]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp eax, edx
    je L4
    cmp cmp dword ptr [eax], edx
    je L5
    cmp cmp dword ptr [eax + 12], edx
    jbe L7
    mov mov edi, dword ptr [eax + 16]
    mov mov edi, dword ptr [edi + edx*4]
    mov mov ebx, dword ptr [esi + 20]
    mov mov edi, dword ptr [ebx + edi*4]
    inc inc edx
    mov mov dword ptr [edi + 72], ecx
    cmp cmp edx, dword ptr [eax + 12]
    jb L6
    xor xor edx, edx
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 0224h]
    jb L3
    mov mov ecx, dword ptr [esi + 0224h]
    mov mov eax, dword ptr [esi + 76]
    cmp cmp eax, ecx
    mov mov dword ptr [ebp - 44], ecx
    mov mov dword ptr [ebp - 36], eax
    jae L41
    mov mov eax, dword ptr [esi + 0230h]
    mov mov ecx, dword ptr [ebp - 36]
    mov mov eax, dword ptr [eax + ecx*4]
    test test eax, eax
    mov mov dword ptr [ebp - 16], eax
    je L42
    cmp cmp dword ptr [eax], 0
    je sub_100B1750
    push push 116
    call sub_100858CA
    test test eax, eax
    je L8
L3:
    mov mov ecx, eax
    call sub_1008543A
    mov mov dword ptr [ebp - 24], eax
    jmp L9
    and and dword ptr [ebp - 24], 0
    cmp cmp dword ptr [ebp - 24], 0
    je sub_100B17DE
    push push dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebp - 24]
    call sub_10085B9D
    test test eax, eax
    mov mov dword ptr [ebp - 20], eax
    jl sub_100B181F
    cmp cmp dword ptr [esi + 0224h], 0200h
    jae sub_100B1804
    mov mov ebx, dword ptr [ebp - 16]
    mov mov edx, dword ptr [ebx]
    and and dword ptr [ebp - 48], 0
    and and dword ptr [ebp - 60], 0
    and and edx, 0FFF00000h
    cmp cmp edx, 050000000h
    jne L12
    cmp cmp dword ptr [ebx + 12], 1
    jne L13
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [eax]
    mov mov edi, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edi + ecx*4]
    cmp cmp dword ptr [ecx + 16], 3
    mov mov dword ptr [ebp - 28], ecx
    jne L14
    lea lea ecx, [ebp - 68]
    push push ecx
    lea lea ecx, [ebp - 56]
    push push ecx
    lea lea ecx, [ebp - 40]
    push push ecx
    push push 1
    push push eax
    push push dword ptr [ebp - 44]
    mov mov ecx, esi
    push push dword ptr [ebp - 36]
    push push dword ptr [esi + 0230h]
    call sub_100ACCB6
    cmp cmp dword ptr [ebp - 68], 0
    je L15
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push 3
    push push 0
    push push dword ptr [esi + 088h]
    mov mov ecx, esi
    call sub_100862B8
    mov mov ebx, eax
    cmp cmp ebx, -1
    je sub_100B1894
    mov mov eax, dword ptr [esi + 20]
    mov mov edi, dword ptr [eax + ebx*4]
L9:
    push push dword ptr [ebp - 28]
    mov mov ecx, edi
    call sub_10085DFF
    mov mov eax, dword ptr [esi + 088h]
    and and dword ptr [edi + 60], 0
    push push 116
    mov mov dword ptr [edi + 4], eax
    mov mov dword ptr [edi + 16], 3
    call sub_100859C9
    test test eax, eax
    je L10
    mov mov ecx, eax
    call sub_10085539
    mov mov edi, eax
    jmp L11
    xor xor edi, edi
    test test edi, edi
    je sub_100B18D8
    push push 0
    push push 1
    push push 1
    push push 010000001h
    mov mov ecx, edi
    call sub_10085A3F
    test test eax, eax
    mov mov dword ptr [ebp - 20], eax
    jl sub_100B18A2
    push push dword ptr [ebp - 16]
    mov mov ecx, edi
    call sub_100855A5
    test test eax, eax
    mov mov dword ptr [ebp - 20], eax
    jl sub_100B18B7
    mov mov ecx, dword ptr [edi + 16]
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [eax + 16]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [edi + 8]
    mov mov dword ptr [eax], ebx
    mov mov eax, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [eax + 16]
    mov mov dword ptr [ecx], ebx
    mov mov ecx, dword ptr [esi + 0224h]
    mov mov edx, dword ptr [esi + 0230h]
    mov mov dword ptr [edx + ecx*4], eax
    inc inc dword ptr [esi + 0224h]
    push push eax
    mov mov ecx, esi
    mov mov dword ptr [ebp - 40], eax
    call sub_10086260
    test test eax, eax
    jl sub_100B194C
    mov mov eax, dword ptr [esi + 0224h]
    cmp cmp eax, 0200h
    jae sub_100B195D
    mov mov ecx, dword ptr [esi + 0230h]
    mov mov dword ptr [ecx + eax*4], edi
    inc inc dword ptr [esi + 0224h]
    push push edi
    mov mov ecx, esi
    call sub_10086290
    test test eax, eax
    jl sub_100B197C
    mov mov ebx, dword ptr [ebp - 16]
    jmp L20
    cmp cmp edx, 010000000h
    jne L16
    push push ebx
    mov mov ecx, esi
    call sub_100A81AD
    test test eax, eax
    je L17
    mov mov ecx, dword ptr [ebx + 12]
    test test ecx, ecx
    mov mov dword ptr [ebp - 48], 1
    jbe L21
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ebx + 16]
    mov mov edi, dword ptr [eax]
    mov mov edi, dword ptr [edx + edi*4]
    cmp cmp dword ptr [edi + 60], 0
    je L19
    and and dword ptr [ebp - 48], 0
    add add eax, 4
    dec dec ecx
    jne L18
    cmp cmp dword ptr [ebp - 48], 0
    jne L22
    push push dword ptr [ebp - 24]
    mov mov ecx, esi
    call sub_100862ED
    test test eax, eax
    jl sub_100B19D9
    mov mov eax, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [esi + 0224h]
    mov mov edx, dword ptr [esi + 0230h]
    mov mov dword ptr [edx + ecx*4], eax
    inc inc dword ptr [esi + 0224h]
    mov mov dword ptr [ebp - 40], eax
    jmp L19
    mov mov ecx, dword ptr [ebp - 24]
    push push 1
    call sub_1006C70E
    and and dword ptr [ebp - 40], 0
    and and dword ptr [ebp - 24], 0
    push push ebx
    mov mov ecx, esi
    call sub_100A8229
    test test eax, eax
    je sub_100B1985
    and and dword ptr [ebp - 28], 0
    and and dword ptr [ebp - 12], 0
    or or eax, -1
    lea lea edi, [ebp - 84]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebx + 12]
    test test eax, eax
    jbe L23
    mov mov edx, dword ptr [esi + 20]
    mov mov edi, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebx + 16]
    shl shl edi, 2
    mov mov ecx, dword ptr [edi + eax]
    mov mov eax, dword ptr [edx + ecx*4]
    cmp cmp dword ptr [eax + 48], 0
    je L25
    mov mov eax, dword ptr [eax + 16]
    shl shl eax, 2
    mov mov dword ptr [ebp + eax - 84], ecx
    mov mov ecx, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [edi + ecx]
    mov mov dword ptr [ebp + eax - 084h], ecx
    mov mov dword ptr [ebp - 28], 1
    mov mov eax, dword ptr [ebx + 12]
    inc inc dword ptr [ebp - 12]
    cmp cmp dword ptr [ebp - 12], eax
    jb L24
    lea lea ecx, [ebp - 12]
    push push ecx
    lea lea ecx, [ebp - 0104h]
    push push ecx
    push push eax
    push push dword ptr [ebx + 16]
    xor xor edi, edi
    push push dword ptr [ebp - 44]
    mov mov ecx, esi
    push push dword ptr [ebp - 36]
    mov mov dword ptr [ebp - 12], edi
    push push dword ptr [esi + 0230h]
L11:
    call sub_100ACD4A
    cmp cmp dword ptr [ebp - 28], edi
    je sub_100B19E5
    or or eax, -1
    lea lea edi, [ebp - 100]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 20], eax
    jbe L28
    mov mov ecx, dword ptr [ebp + eax*4 - 0104h]
    mov mov eax, dword ptr [esi + 20]
    mov mov edi, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [edi + 56], -1
    mov mov dword ptr [ebp - 8], ecx
    je L26
    mov mov edi, dword ptr [edi + 56]
    mov mov dword ptr [ebp - 8], edi
    mov mov edi, dword ptr [eax + edi*4]
    mov mov eax, dword ptr [edi + 72]
    cmp cmp eax, dword ptr [ebp - 44]
    jae L27
    cmp cmp eax, dword ptr [ebp - 36]
    jae L30
    cmp cmp eax, -1
    je L31
    mov mov ecx, dword ptr [esi + 0230h]
    shl shl eax, 2
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [eax + ecx]
    push push eax
    mov mov ecx, esi
    mov mov dword ptr [ebp - 28], eax
    call sub_100A8326
    test test eax, eax
    je L36
    mov mov ecx, dword ptr [ebp - 28]
    mov mov eax, dword ptr [ecx]
    and and eax, 0FFF00000h
    cmp cmp eax, 010000000h
    jne L33
    cmp cmp dword ptr [edi + 56], -1
    jne L35
    xor xor eax, eax
    cmp cmp dword ptr [ecx + 12], eax
    jbe L36
    mov mov ecx, dword ptr [ecx + 16]
    jmp L29
    mov mov ecx, dword ptr [ebp - 32]
    mov mov edx, dword ptr [ebp - 8]
    cmp cmp edx, dword ptr [ecx]
    je L34
    mov mov edx, dword ptr [ebp - 4]
    add add ecx, 4
    mov mov dword ptr [ebp - 32], ecx
    mov mov ecx, dword ptr [esi + 0230h]
    mov mov ecx, dword ptr [edx + ecx]
    inc inc eax
    cmp cmp eax, dword ptr [ecx + 12]
    jb L32
    jmp L37
    mov mov ecx, dword ptr [ebp - 28]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov edx, dword ptr [edi + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov dword ptr [ebp + edx*4 - 116], eax
    mov mov dword ptr [ebp - 60], 1
    mov mov eax, dword ptr [edi + 16]
    lea lea eax, [ebp + eax*4 - 100]
    mov mov ecx, dword ptr [eax]
    cmp cmp ecx, -1
    jne L38
    mov mov ecx, dword ptr [ebp - 8]
    mov mov dword ptr [eax], ecx
    jmp L39
    cmp cmp ecx, dword ptr [ebp - 8]
    jne sub_100B1B3E
    mov mov eax, dword ptr [ebp - 20]
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 12]
    mov mov dword ptr [ebp - 20], eax
    jb L28
    xor xor edi, edi
    xor xor eax, eax
    mov mov dword ptr [ebp - 12], edi
    or or edx, -1
    mov mov ecx, dword ptr [ebp + eax - 100]
    cmp cmp ecx, edx
    je sub_100B1795
    cmp cmp dword ptr [ebp + eax - 84], edx
    jne sub_100B1B6A
    cmp cmp ecx, edx
    jne sub_100B17A9
    cmp cmp dword ptr [ebp + eax - 84], edx
    je sub_100B17B3
    inc inc edi
    mov mov dword ptr [ebp - 12], edi
    add add eax, 4
    cmp cmp eax, 16
    jb sub_100B179F
    push push 116
    call sub_10085CE0
    test test eax, eax
    je sub_100B17E6
    mov mov ecx, eax
    call sub_10085850
    jmp sub_100B17F1
    xor xor eax, eax
    test test eax, eax
    mov mov dword ptr [ebp - 32], eax
    je sub_100B1BCC
    push push 0
    push push edi
    lea lea ecx, [edi + edi*2]
    push push ecx
    and and edi, 0FFFFFh
    or or edi, 070100000h
    push push edi
    mov mov ecx, eax
    call sub_10085D60
    test test eax, eax
    mov mov dword ptr [ebp - 20], eax
    jl sub_100B1C33
    push push dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebp - 32]
    call sub_100858C7
    test test eax, eax
    mov mov dword ptr [ebp - 20], eax
    jl sub_100B1C49
    mov mov eax, dword ptr [ebp - 12]
    and and dword ptr [ebp - 4], 0
    shl shl eax, 2
    and and dword ptr [ebp - 28], 0
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp - 28]
    mov mov ebx, dword ptr [ebp + eax - 84]
    cmp cmp ebx, -1
    je sub_100B196D
    cmp cmp dword ptr [ebp - 48], 0
    mov mov ecx, dword ptr [ebp - 32]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + edx*4], ebx
    jne sub_100B1946
    mov mov eax, dword ptr [esi + 20]
    fldz fldz
    mov mov edi, dword ptr [eax + ebx*4]
    push push ecx
L19:
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [edi + 16]
    mov mov ecx, esi
    push push 0
    push push dword ptr [esi + 088h]
    call sub_100866AD
L20:
    cmp cmp eax, -1
    je sub_100B1C87
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [edi + 60]
    mov mov dword ptr [ecx + 60], edx
    and and dword ptr [edi + 60], 0
    mov mov ecx, dword ptr [esi + 0224h]
    mov mov dword ptr [edi + 72], ecx
    mov mov ecx, dword ptr [ebp - 40]
    xor xor edi, edi
    cmp cmp dword ptr [ecx + 12], edi
    jbe sub_100B19A7
    mov mov edx, dword ptr [ecx + 16]
    lea lea edx, [edx + edi*4]
    cmp cmp dword ptr [edx], ebx
    jne sub_100B1993
    mov mov dword ptr [edx], eax
    inc inc edi
    cmp cmp edi, dword ptr [ecx + 12]
    jb sub_100B198F
    jmp sub_100B19BB
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + ebx*4]
    mov mov edx, dword ptr [esi + 0224h]
    mov mov eax, dword ptr [ebp + eax - 084h]
    mov mov dword ptr [ecx + 72], edx
    mov mov ecx, dword ptr [ebp - 32]
    mov mov edx, dword ptr [ecx + 8]
    mov mov edi, dword ptr [ebp - 8]
    mov mov dword ptr [edi + edx], eax
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [ebp - 64], eax
    mov mov eax, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [esi + 0444h]
    mov mov dword ptr [eax + edx*4], ecx
    jmp sub_100B1AFA
    mov mov ebx, dword ptr [ebp + eax - 100]
    cmp cmp ebx, -1
    je sub_100B1B11
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 32]
    mov mov ecx, dword ptr [ecx + 16]
    shl shl edx, 2
    cmp cmp dword ptr [ebp - 60], 0
    mov mov dword ptr [ebp - 52], edx
    mov mov dword ptr [edx + ecx], ebx
    jne sub_100B1AEF
    mov mov eax, dword ptr [esi + 20]
    fldz fldz
    mov mov edi, dword ptr [eax + ebx*4]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [edi + 16]
    mov mov ecx, esi
    push push 0
    push push dword ptr [esi + 088h]
    call sub_1008676E
    cmp cmp eax, -1
    je sub_100B1D48
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [edi + 60]
    mov mov dword ptr [ecx + 60], edx
    mov mov ecx, dword ptr [edi + 72]
    and and dword ptr [edi + 60], 0
    cmp cmp ecx, -1
    je sub_100B1D49
    cmp cmp ecx, dword ptr [esi + 0224h]
    je sub_100B1D55
    mov mov edx, dword ptr [esi + 0230h]
    mov mov ecx, dword ptr [edx + ecx*4]
    xor xor edx, edx
    cmp cmp dword ptr [ecx + 12], edx
    mov mov dword ptr [ebp - 56], ecx
    jbe sub_100B1B44
    mov mov ecx, dword ptr [ecx + 16]
    lea lea ecx, [ecx + edx*4]
    cmp cmp dword ptr [ecx], ebx
    jne sub_100B1B45
    mov mov dword ptr [ecx], eax
    mov mov ecx, dword ptr [ebp - 56]
    inc inc edx
    cmp cmp edx, dword ptr [ecx + 12]
    jb sub_100B1B44
    mov mov ecx, dword ptr [esi + 0224h]
    mov mov edx, dword ptr [ebp - 52]
    mov mov dword ptr [edi + 72], ecx
    jmp sub_100B1B88
L25:
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + ebx*4]
    mov mov edi, dword ptr [esi + 0224h]
    mov mov eax, dword ptr [ebp + eax - 116]
    mov mov dword ptr [ecx + 72], edi
    mov mov ecx, dword ptr [ebp - 32]
    mov mov edi, dword ptr [ecx + 8]
    mov mov ebx, dword ptr [esi + 0440h]
    mov mov dword ptr [edx + edi], ebx
    mov mov edx, dword ptr [ebp - 12]
    mov mov edi, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx + 8]
    lea lea edx, [edi + edx*2]
    mov mov dword ptr [ebp - 52], eax
    mov mov dword ptr [ecx + edx*4], eax
    inc inc dword ptr [ebp - 4]
    add add dword ptr [ebp - 8], 4
    mov mov eax, dword ptr [ebp - 28]
    add add eax, 4
    cmp cmp eax, 16
    mov mov dword ptr [ebp - 28], eax
    jb sub_100B1A5C
    mov mov eax, dword ptr [ebp - 12]
    and and dword ptr [ebp - 4], 0
    mov mov ebx, dword ptr [ebp - 32]
    shl shl eax, 2
    and and dword ptr [ebp - 16], 0
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp + eax - 84]
    cmp cmp eax, -1
    je sub_100B1CAB
    mov mov ecx, dword ptr [esi + 20]
    fldz fldz
    mov mov edi, dword ptr [ecx + eax*4]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [edi + 16]
    mov mov ecx, esi
    push push 0
    push push dword ptr [esi + 088h]
    call sub_10086861
    cmp cmp eax, -1
    je sub_100B1E3B
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [ebp - 52]
    cmp cmp edx, -1
    mov mov dword ptr [ecx + 56], edx
    mov mov edi, dword ptr [edi + 60]
    mov mov dword ptr [ecx + 60], edi
    je sub_100B1CD9
    mov mov edi, dword ptr [esi + 20]
    mov mov edx, dword ptr [edi + edx*4]
    mov mov edx, dword ptr [edx + 4]
    mov mov dword ptr [ecx + 4], edx
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp - 12]
    lea lea ecx, [edx + ecx*2]
    mov mov edx, dword ptr [ebx + 8]
    mov mov dword ptr [edx + ecx*4], eax
    jmp sub_100B1D67
    mov mov eax, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp + eax - 100]
    cmp cmp eax, -1
    je sub_100B1D7A
    mov mov ecx, dword ptr [esi + 20]
    fldz fldz
    mov mov edi, dword ptr [ecx + eax*4]
    push push ecx
    push push ecx
    fstp fstp qword ptr [esp]
    push push dword ptr [edi + 16]
    mov mov ecx, esi
    push push 0
    push push dword ptr [esi + 088h]
    call sub_100868C9
    cmp cmp eax, -1
    je sub_100B1EA3
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [ebp - 64]
    cmp cmp edx, -1
    mov mov dword ptr [ecx + 56], edx
    mov mov edi, dword ptr [edi + 60]
    mov mov dword ptr [ecx + 60], edi
    je sub_100B1DA9
    mov mov edi, dword ptr [esi + 20]
    mov mov edx, dword ptr [edi + edx*4]
    mov mov edx, dword ptr [edx + 4]
    mov mov dword ptr [ecx + 4], edx
    mov mov ecx, dword ptr [ebx + 8]
    mov mov edx, dword ptr [ebp - 8]
    mov mov dword ptr [edx + ecx], eax
    inc inc dword ptr [ebp - 4]
    add add dword ptr [ebp - 8], 4
    add add dword ptr [ebp - 16], 4
    cmp cmp dword ptr [ebp - 16], 16
    jb sub_100B1D14
    mov mov eax, dword ptr [esi + 0224h]
    cmp cmp eax, 0200h
    jae sub_100B1EF5
    mov mov ecx, dword ptr [esi + 0230h]
    mov mov dword ptr [ecx + eax*4], ebx
    inc inc dword ptr [esi + 0224h]
    push push ebx
    mov mov ecx, esi
    call sub_10086828
    test test eax, eax
    jl sub_100B1F14
    and and dword ptr [ebp - 32], 0
    jmp sub_100B1E87
    cmp cmp dword ptr [ebp - 12], edi
    jbe sub_100B1E8C
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ebp + edi*4 - 0104h]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov edx, dword ptr [eax + 56]
    cmp cmp edx, -1
    je sub_100B1E94
    mov mov eax, dword ptr [ecx + edx*4]
    inc inc edi
    cmp cmp edi, dword ptr [ebp - 12]
    mov mov dword ptr [eax + 48], 1
    jb sub_100B1E8C
    mov mov eax, dword ptr [ebp - 40]
    xor xor ecx, ecx
    cmp cmp eax, ecx
    je sub_100B1EE4
L28:
    cmp cmp dword ptr [eax + 12], ecx
    jbe sub_100B1EE9
    mov mov edi, dword ptr [eax + 16]
    mov mov edi, dword ptr [edi + ecx*4]
    mov mov edx, dword ptr [esi + 0224h]
    mov mov ebx, dword ptr [esi + 20]
L29:
    mov mov edi, dword ptr [ebx + edi*4]
    dec dec edx
    inc inc ecx
    mov mov dword ptr [edi + 72], edx
    cmp cmp ecx, dword ptr [eax + 12]
    jb sub_100B1EE9
    inc inc dword ptr [ebp - 36]
    mov mov eax, dword ptr [ebp - 36]
    cmp cmp eax, dword ptr [ebp - 44]
    jb L40
    xor xor edx, edx
    mov mov eax, dword ptr [esi + 76]
    jmp sub_100B1F99
    mov mov ecx, edi
    jmp sub_100B1FAC
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, 0FFh
    push push eax
L36:
    push push 0101178C8h
    push push 011B9h
    push push dword ptr [ebx + 60]
    push push esi
    call sub_1008B952
    add add esp, 20
    mov mov dword ptr [ebp - 20], 080004005h
    jmp sub_100B1FEC
    mov mov dword ptr [ebp - 20], 08007000Eh
    jmp sub_100B1FF5
    mov mov eax, dword ptr [ebp - 16]
    push push 0101178A0h
    push push 012CAh
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B97D
    add add esp, 16
    jmp sub_100B1FF4
    mov mov dword ptr [ebp - 20], 08007000Eh
    jmp sub_100B1FFD
    mov mov ecx, dword ptr [esi + 0230h]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov dword ptr [ecx], edx
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 44]
    jb sub_100B1FFA
    mov mov dword ptr [ebp - 20], edx
    mov mov ecx, dword ptr [ebp - 32]
L38:
    test test ecx, ecx
    je sub_100B2026
    push push 1
    call sub_1006CD10
    mov mov ecx, dword ptr [ebp - 24]
    test test ecx, ecx
L39:
    je sub_100B2042
    push push 1
    call sub_1006CD1E
    mov mov eax, dword ptr [ebp - 20]
    pop pop edi
L42:
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100b0e3d ENDP
END
