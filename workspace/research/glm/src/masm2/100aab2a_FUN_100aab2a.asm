.686
.MODEL FLAT, C
EXTRN sub_1008B5C8:PROC
EXTRN sub_1008B5E4:PROC
EXTRN sub_100AA5B5:PROC
EXTRN sub_100AA5CB:PROC
EXTRN sub_100AA801:PROC
EXTRN sub_100AA841:PROC
EXTRN sub_100AB0D7:PROC
EXTRN sub_100AB0E8:PROC
EXTRN sub_100AB100:PROC
EXTRN sub_100AB216:PROC
EXTRN sub_100AB222:PROC
EXTRN sub_100AB22A:PROC
EXTRN sub_100AB232:PROC
EXTRN sub_100AB23A:PROC
EXTRN sub_100AB242:PROC
EXTRN sub_100AB24A:PROC
EXTRN sub_100AB25C:PROC
EXTRN sub_100AB27D:PROC
EXTRN sub_100AB2A0:PROC
EXTRN sub_100AB2E8:PROC
EXTRN sub_100AB2E9:PROC
EXTRN sub_100AB2F8:PROC
EXTRN sub_100AB2FE:PROC
EXTRN sub_100AB316:PROC
EXTRN sub_100AB326:PROC
EXTRN sub_100AB33B:PROC
EXTRN sub_100AB34D:PROC
EXTRN sub_100AB372:PROC
EXTRN sub_100AB3C4:PROC
EXTRN sub_100AB3CC:PROC
EXTRN sub_100AB424:PROC
EXTRN sub_100AB42F:PROC
EXTRN sub_100AB43E:PROC
EXTRN sub_100AB45A:PROC
EXTRN sub_100AB481:PROC
EXTRN sub_100AB4C1:PROC
EXTRN sub_100AB4CA:PROC
EXTRN sub_100AB4D0:PROC
EXTRN sub_100AB4F7:PROC
EXTRN sub_100AB515:PROC
EXTRN sub_100AB53F:PROC
EXTRN sub_100AB543:PROC
EXTRN sub_100F7A5F:PROC
EXTRN sub_100F7B26:PROC
EXTRN sub_100F7B37:PROC
EXTRN sub_100F7B48:PROC
EXTRN sub_100F7B60:PROC
EXTRN sub_100F7D4F:PROC
EXTRN sub_100F7D5E:PROC
.CODE
FUN_100aab2a PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 112
    and and dword ptr [ebp - 16], 0
    and and dword ptr [ebp - 8], 0
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    push push 6
    pop pop edx
    xor xor eax, eax
    mov mov ecx, edx
    lea lea edi, [ebp - 88]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    lea lea edi, [ebp - 112]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    lea lea edi, [ebp - 64]
    rep stosd rep stosd dword ptr es:[edi], eax
    or or eax, -1
    mov mov ecx, edx
    lea lea edi, [esi + 040Ch]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    lea lea edi, [esi + 0424h]
    rep stosd rep stosd dword ptr es:[edi], eax
    xor xor edi, edi
    cmp cmp dword ptr [esi + 12], edi
    mov mov dword ptr [ebp - 20], 1
    mov mov dword ptr [ebp - 28], edi
    mov mov dword ptr [ebp - 4], edi
    jbe L1
    xor xor ebx, ebx
    inc inc ebx
    mov mov eax, dword ptr [esi + 24]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [eax]
    mov mov edx, ecx
    and and edx, 0FFF00000h
    cmp cmp edx, 060000000h
    mov mov dword ptr [eax + 36], edi
    je L11
    cmp cmp edx, 060500000h
    je L12
    cmp cmp edx, 060A00000h
    je L13
    cmp cmp edx, 060F00000h
    je L14
    cmp cmp edx, 011000000h
    je L17
    cmp cmp edx, 072C00000h
    je L18
    cmp cmp edx, 072D00000h
    je L20
    mov mov edi, ecx
    and and edi, 0FFFFFh
    mov mov dword ptr [ebp - 36], edi
    je L3
    test test ecx, ecx
    je L4
    and and dword ptr [ebp - 12], 0
    cmp cmp dword ptr [eax + 4], 0
    jbe L7
    mov mov ecx, dword ptr [eax + 4]
    mov mov eax, dword ptr [eax + 8]
    mov mov dword ptr [ebp - 40], ecx
    mov mov dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [esi + 080h]
    cmp cmp dword ptr [ecx + 4], eax
    jne L8
    cmp cmp byte ptr [ecx + 108], 3
    movzx movzx eax, byte ptr [ecx + 109]
    jne L10
    mov mov edx, eax
    shl shl edx, 2
    lea lea eax, [ebp + edx - 88]
    cmp cmp dword ptr [eax], 0
    je L2
    mov mov ecx, dword ptr [esi + 0C8h]
    and and ecx, 0FFFFh
    cmp cmp ecx, 0104h
    je L5
    cmp cmp dword ptr [ebp + edx - 64], 0
    jne L6
    and and dword ptr [ebp - 20], 0
    mov mov dword ptr [eax], ebx
    mov mov eax, dword ptr [ebp - 12]
    lea lea ecx, [eax + edi]
    cmp cmp eax, ecx
    mov mov dword ptr [ebp + edx - 112], ebx
    jae L15
    sub sub ecx, dword ptr [ebp - 12]
    mov mov ebx, dword ptr [ebp - 24]
    lea lea edx, [ebp + edx - 64]
    mov mov eax, dword ptr [edx]
    mov mov dword ptr [ebp - 32], ecx
    mov mov edi, dword ptr [ebx]
    mov mov ecx, dword ptr [esi + 20]
    mov mov edi, dword ptr [ecx + edi*4]
    mov mov edi, dword ptr [edi + 16]
    inc inc edi
    cmp cmp edi, eax
    jbe L19
    mov mov eax, edi
    add add ebx, 4
    dec dec dword ptr [ebp - 32]
    jne L16
    mov mov edi, dword ptr [ebp - 36]
    xor xor ebx, ebx
    mov mov dword ptr [edx], eax
    inc inc ebx
    add add dword ptr [ebp - 12], edi
    mov mov eax, edi
    shl shl eax, 2
    add add dword ptr [ebp - 24], eax
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp eax, dword ptr [ebp - 40]
    jb L9
    inc inc dword ptr [ebp - 28]
    xor xor edi, edi
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 12]
    jb L0
    cmp cmp dword ptr [ebp - 28], 16
    jbe L21
    mov mov dword ptr [ebp - 20], edi
    xor xor eax, eax
    cmp cmp dword ptr [esi + 8], edi
    jbe L22
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + eax*4]
    inc inc eax
    mov mov dword ptr [ecx + 64], edi
    cmp cmp eax, dword ptr [esi + 8]
    jb L22
    cmp cmp dword ptr [ebp - 20], edi
    mov mov ebx, dword ptr [esi + 12]
    mov mov dword ptr [ebp - 40], ebx
    je L26
    push push 0800h
    mov mov dword ptr [esi + 022Ch], edi
    call sub_100F7A5F
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    mov mov dword ptr [esi + 0230h], edi
    je L27
    xor xor eax, eax
    push push eax
    push push eax
    push push ebx
    mov mov ecx, 0200h
    rep stosd rep stosd dword ptr es:[edi], eax
    push push dword ptr [esi + 24]
    lea lea eax, [esi + 0224h]
    push push eax
    push push dword ptr [esi + 0230h]
    mov mov ecx, esi
    call sub_100AA5B5
    test test eax, eax
    jge sub_100AB216
    jmp sub_100AB25C
    cmp cmp edx, 011000000h
    jne L25
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax]
    jmp L26
    mov mov eax, dword ptr [eax + 8]
    and and ecx, 0FFFFFh
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 4]
    cmp cmp ecx, dword ptr [esi + 080h]
    jne L28
    cmp cmp dword ptr [eax + 60], edi
    jne L29
    cmp cmp byte ptr [eax + 108], 3
    movzx movzx ecx, byte ptr [eax + 109]
    jne L31
    lea lea eax, [ebp + ecx*4 - 88]
    cmp cmp dword ptr [eax], edi
L2:
    je L30
    mov mov ecx, dword ptr [esi + 0C8h]
    and and ecx, 0FFFFh
    cmp cmp ecx, 0104h
L5:
    je L32
    mov mov dword ptr [ebp - 20], edi
    mov mov dword ptr [eax], ebx
L6:
    jmp L23
    mov mov dword ptr [ebp - 20], edi
    jmp L24
    push push 010117110h
    push push 011A1h
    push push dword ptr [eax + 96]
    jmp sub_100AB2E8
    mov mov edi, 0800h
    push push edi
    call sub_100F7B26
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 022Ch], eax
L12:
    je sub_100AB0D7
    push push edi
    call sub_100F7B37
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [esi + 0230h], eax
    je sub_100AB0E8
    push push edi
    call sub_100F7B48
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 16], eax
    jne sub_100AB100
    mov mov eax, 08007000Eh
    jmp sub_100AB316
    push push edi
L17:
    call sub_100F7B60
L19:
    mov mov edi, dword ptr [esi + 022Ch]
    mov mov ebx, 0200h
L20:
    mov mov dword ptr [ebp - 8], eax
    xor xor eax, eax
    pop pop ecx
    mov mov ecx, ebx
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov edi, dword ptr [esi + 0230h]
    mov mov ecx, ebx
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov edi, dword ptr [ebp - 16]
    mov mov ecx, ebx
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov edi, dword ptr [ebp - 8]
    mov mov ecx, ebx
    rep stosd rep stosd dword ptr es:[edi], eax
    cmp cmp dword ptr [esi + 12], eax
    mov mov dword ptr [esi + 0220h], eax
    mov mov dword ptr [esi + 0224h], eax
    mov mov dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 4], eax
    jbe sub_100AB2A0
    cmp cmp dword ptr [ebp - 4], ebx
    jae sub_100AB372
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [eax]
    mov mov edx, ecx
    and and edx, 0FFF00000h
    cmp cmp edx, 060000000h
    je sub_100AB222
    cmp cmp edx, 060500000h
    je sub_100AB22A
    cmp cmp edx, 060A00000h
    je sub_100AB232
    cmp cmp edx, 060F00000h
    je sub_100AB23A
    cmp cmp edx, 011000000h
    je sub_100AB242
    cmp cmp edx, 072D00000h
    je sub_100AB24A
    cmp cmp edx, 072C00000h
    jne sub_100AB2E9
    and and ecx, 0FFFFFh
    cmp cmp edx, 011000000h
    mov mov dword ptr [ebp - 32], ecx
    jne sub_100AB27D
    xor xor ecx, ecx
    mov mov dword ptr [ebp - 32], ecx
    mov mov edx, dword ptr [eax + 8]
    mov mov edi, dword ptr [esi + 20]
    lea lea edx, [edx + ecx*4]
    mov mov ecx, dword ptr [edx]
    mov mov ecx, dword ptr [edi + ecx*4]
    mov mov edi, dword ptr [ecx + 4]
    cmp cmp edi, dword ptr [esi + 088h]
    je sub_100AB2F8
    cmp cmp dword ptr [ecx + 60], 0
    jne sub_100AB2FE
    cmp cmp edi, dword ptr [esi + 080h]
    jne sub_100AB326
    cmp cmp byte ptr [ecx + 108], 3
    jne sub_100AB424
    movzx movzx eax, byte ptr [ecx + 109]
    cmp cmp dword ptr [ebp + eax*4 - 112], 0
    je sub_100AB33B
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0104h
    je sub_100AB34D
    push push 0101170C0h
    push push 011A8h
    jmp sub_100AB45A
    mov mov eax, dword ptr [eax + 4]
    sub sub eax, dword ptr [ebp - 32]
    lea lea ecx, [ebp - 12]
    push push ecx
    push push dword ptr [ebp - 16]
    mov mov ecx, esi
    push push eax
    push push edx
    call sub_100AA5CB
    mov mov edi, eax
    test test edi, edi
    jl sub_100AB42F
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 12]
    jb sub_100AB2A0
    xor xor ebx, ebx
    xor xor edx, edx
    cmp cmp dword ptr [ebp - 12], ebx
L23:
    jbe sub_100AB3C4
    mov mov eax, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebp - 8]
L24:
    sub sub ecx, eax
    mov mov edi, dword ptr [eax]
    mov mov dword ptr [ecx + eax], edi
    mov mov dword ptr [eax], ebx
    inc inc edx
    add add eax, 4
    cmp cmp edx, dword ptr [ebp - 12]
    jb sub_100AB3CC
    push push ebx
    push push ebx
    push push dword ptr [ebp - 40]
    lea lea eax, [esi + 0224h]
    push push dword ptr [esi + 24]
    mov mov ecx, esi
    push push eax
    push push dword ptr [esi + 0230h]
    call sub_100AA801
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100AB481
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 12], eax
    jbe sub_100AB43E
    mov mov ecx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ecx + eax*4]
    and and dword ptr [ecx + 36], 0
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 12]
    jb sub_100AB43E
    push push dword ptr [esi + 76]
    lea lea eax, [esi + 0220h]
    push push dword ptr [esi + 0230h]
    mov mov ecx, esi
    push push dword ptr [ebp - 12]
    push push dword ptr [ebp - 8]
    push push eax
    push push dword ptr [esi + 022Ch]
    call sub_100AA841
    mov mov edi, eax
    test test edi, edi
    jl sub_100AB4C1
    xor xor edi, edi
    xor xor ecx, ecx
    cmp cmp dword ptr [esi + 8], edi
    jbe sub_100AB4CA
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [eax + 64], 1
    jne sub_100AB4D0
    mov mov edx, dword ptr [esi + 116]
    mov mov dword ptr [eax + 4], edx
    inc inc ecx
    cmp cmp ecx, dword ptr [esi + 8]
    jb sub_100AB4CA
    cmp cmp dword ptr [ebp - 16], 0
    je sub_100AB4F7
    push push dword ptr [ebp - 16]
    call sub_100F7D4F
    pop pop ecx
    cmp cmp dword ptr [ebp - 8], 0
    je sub_100AB515
    push push dword ptr [ebp - 8]
    call sub_100F7D5E
L28:
    pop pop ecx
    mov mov eax, edi
    pop pop edi
    pop pop esi
L29:
    pop pop ebx
    leave leave
    ret ret
    push push 010116F88h
    push push 011A2h
    push push 0
    push push esi
    call sub_1008B5C8
    add add esp, 16
    mov mov eax, 080004005h
    jmp sub_100AB543
L32:
    push push 010116D90h
    push push 011A1h
    push push 0
    push push esi
    call sub_1008B5E4
    add add esp, 16
    mov mov edi, 080004005h
    jmp sub_100AB53F
FUN_100aab2a ENDP
END
