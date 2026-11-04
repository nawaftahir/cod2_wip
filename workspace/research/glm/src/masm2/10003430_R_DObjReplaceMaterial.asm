.686
.MODEL FLAT, C
EXTRN sub_100037D1:PROC
EXTRN sub_100037D4:PROC
EXTRN sub_100037E9:PROC
EXTRN sub_1000383F:PROC
EXTRN sub_10003848:PROC
EXTRN sub_10003877:PROC
EXTRN sub_100038EB:PROC
EXTRN sub_100038F2:PROC
EXTRN sub_100038FB:PROC
EXTRN sub_1000396A:PROC
EXTRN sub_100039AA:PROC
EXTRN sub_10003A0E:PROC
EXTRN sub_10003A91:PROC
EXTRN sub_10003AE8:PROC
EXTRN sub_1005E1B1:PROC
EXTRN sub_1005E201:PROC
EXTRN sub_1005F6F9:PROC
EXTRN sub_1005F7AC:PROC
EXTRN sub_10060B5A:PROC
EXTRN sub_10060B9F:PROC
EXTRN sub_10060BCE:PROC
EXTRN sub_10060C1E:PROC
EXTRN sub_10060C72:PROC
EXTRN sub_10060CA1:PROC
EXTRN sub_10060CC9:PROC
EXTRN sub_10061E60:PROC
EXTRN sub_100F5EB7:PROC
EXTRN sub_100F5F32:PROC
EXTRN sub_100F5F6C:PROC
EXTRN sub_100F5FAF:PROC
EXTRN sub_100F600F:PROC
EXTRN sub_100F6023:PROC
EXTRN sub_100F6073:PROC
EXTRN sub_100F60E2:PROC
EXTRN sub_100F617E:PROC
EXTRN sub_100F883A:PROC
EXTRN EXTRN g_1019BCB4:DWORD:DWORD
EXTRN EXTRN g_1019BEDC:DWORD:DWORD
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
R_DObjReplaceMaterial PROC
    mov mov eax, 01000h
    call sub_100F883A
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 01010h]
    push push edi
    xor xor ebx, ebx
    jmp L0
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    cmp cmp byte ptr [eax + 0404h], bl
    je L1
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov edx, dword ptr [eax + 0414h]
    mov mov byte ptr [eax + 0404h], bl
    mov mov dword ptr [esp + 01018h], ecx
    mov mov dword ptr [eax + 0400h], edx
    lea lea eax, [esp + 01018h]
    push push eax
    mov mov eax, 1
    call sub_1005F6F9
    mov mov cl, byte ptr [eax]
    add add esp, 4
    cmp cmp cl, bl
    je sub_1000383F
    cmp cmp cl, 125
    je sub_10003848
    cmp cmp cl, 123
    jne L3
    mov mov dword ptr [esi + 64], ebx
    mov mov dword ptr [esi + 84], ebx
    mov mov dword ptr [esi + 80], 03F000000h
    mov mov byte ptr [esi + 112], bl
    mov mov dword ptr [esi + 68], ebx
    mov mov dword ptr [esi + 72], ebx
    mov mov dword ptr [esi + 76], ebx
    mov mov dword ptr [esi + 88], ebx
    mov mov dword ptr [esi + 92], ebx
    mov mov dword ptr [esi + 96], ebx
    mov mov dword ptr [esi + 100], ebx
    mov mov dword ptr [esi + 104], ebx
    mov mov dword ptr [esi + 108], ebx
    jmp L2
    push push 07FFh
    push push eax
    lea lea ecx, [esp + 0818h]
    push push ecx
    call sub_100F5EB7
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov byte ptr [esp + 0101Bh], bl
    mov mov cl, byte ptr [eax + 0404h]
    add add esp, 12
    cmp cmp cl, bl
    je L5
    mov mov edx, dword ptr [eax + 0418h]
    mov mov ecx, dword ptr [eax + 0414h]
    mov mov byte ptr [eax + 0404h], bl
    mov mov dword ptr [esp + 01018h], edx
    mov mov dword ptr [eax + 0400h], ecx
    lea lea edx, [esp + 01018h]
    push push edx
    mov mov eax, 1
    call sub_1005F7AC
    mov mov cl, byte ptr [eax]
    add add esp, 4
    cmp cmp cl, bl
    je sub_100038F2
    cmp cmp cl, 125
    je sub_100038FB
    push push 07FFh
    push push eax
L3:
    lea lea eax, [esp + 24]
    push push eax
    call sub_100F5F32
    add add esp, 12
    mov mov byte ptr [esp + 080Fh], bl
    mov mov edi, 07FFFFFFFh
    xor xor edx, edx
    jmp L9
    lea lea esp, [esp]
    lea lea esp, [esp]
    movsx movsx eax, byte ptr [esp + edx + 0810h]
    movsx movsx ecx, byte ptr [edx + 01019173Ch]
    inc inc edx
    mov mov ebp, edi
    dec dec edi
    test test ebp, ebp
    je L16
    cmp cmp eax, ecx
    je L14
    cmp cmp eax, 97
    jl L12
    cmp cmp eax, 122
    jg L13
    sub sub eax, 32
    cmp cmp ecx, 97
    jl L15
    cmp cmp ecx, 122
    jg L16
    sub sub ecx, 32
    cmp cmp eax, ecx
    jne L18
    cmp cmp eax, ebx
    jne L11
    jmp L19
    xor xor edx, edx
    cmp cmp eax, ecx
    setge setge dl
    lea lea edx, [edx + edx - 1]
    mov mov eax, edx
    cmp cmp eax, ebx
    jne sub_100037D4
    lea lea eax, [esp + 16]
    push push eax
    call sub_100F5F6C
    fst fst dword ptr [esi + 64]
    fcomp fcomp dword ptr [g_1019BCB4]
    add add esp, 4
    fnstsw fnstsw ax
    test test ah, 65
    jne L4
    lea lea ecx, [esp + 16]
    push push ecx
    push push 0101916C8h
    call sub_10061E60
    fld fld dword ptr [esi + 64]
    fmul fmul dword ptr [g_1019BEDC]
    add add esp, 8
    fstp fstp dword ptr [esi + 64]
    jmp L6
    mov mov eax, 07FFFFFFFh
    mov mov ecx, 0101916C0h
    lea lea edx, [esp + 0810h]
    call sub_10060B5A
    test test eax, eax
    jne sub_10003877
    lea lea eax, [esi + 68]
    lea lea edx, [esi + 76]
L6:
    lea lea ecx, [esi + 72]
    push push edx
    push push ecx
    push push eax
    mov mov dword ptr [eax], ebx
    lea lea edx, [esp + 28]
    push push 010191928h
    mov mov dword ptr [eax + 4], ebx
    push push edx
    mov mov dword ptr [eax + 8], ebx
    call sub_100F5FAF
    add add esp, 20
    jmp L7
    mov mov eax, 07FFFFFFFh
    mov mov ecx, 0101916B0h
    lea lea edx, [esp + 0810h]
    call sub_10060B9F
    test test eax, eax
    jne sub_100038EB
    lea lea eax, [esp + 16]
    push push eax
    call sub_100F600F
    fstp fstp dword ptr [esi + 80]
    add add esp, 4
    jmp L8
    mov mov eax, 07FFFFFFFh
    mov mov ecx, 0101916A4h
    lea lea edx, [esp + 0810h]
    call sub_10060BCE
    test test eax, eax
    jne sub_1000396A
    lea lea ecx, [esi + 96]
    push push ecx
    lea lea edi, [esi + 88]
    lea lea edx, [esi + 92]
    push push edx
    push push edi
    lea lea eax, [esp + 28]
    push push 010191928h
    push push eax
    mov mov dword ptr [edi], ebx
    mov mov dword ptr [edi + 4], ebx
    mov mov dword ptr [edi + 8], ebx
    call sub_100F6023
    add add esp, 20
    mov mov edx, edi
    mov mov ecx, edi
    call sub_1005E1B1
    fstp fstp st(0)
    jmp L10
    mov mov eax, 07FFFFFFFh
    mov mov ecx, 010191694h
    lea lea edx, [esp + 0810h]
    call sub_10060C1E
    test test eax, eax
    jne sub_10003A0E
    lea lea ecx, [esi + 108]
    push push ecx
    lea lea edi, [esi + 100]
    lea lea edx, [esi + 104]
    push push edx
    push push edi
    lea lea eax, [esp + 28]
    push push 010191928h
    push push eax
    mov mov dword ptr [edi], ebx
    mov mov dword ptr [edi + 4], ebx
    mov mov dword ptr [edi + 8], ebx
    call sub_100F6073
    add add esp, 20
    mov mov edx, edi
    mov mov ecx, edi
    call sub_1005E201
    fstp fstp st(0)
    mov mov byte ptr [esi + 112], 1
    jmp L17
    mov mov eax, 07FFFFFFFh
    mov mov ecx, 010191688h
    lea lea edx, [esp + 0810h]
    call sub_10060C72
L15:
    test test eax, eax
    jne sub_10003A91
    lea lea ecx, [esp + 16]
    push push ecx
    call sub_100F60E2
    fstp fstp dword ptr [esi + 84]
    add add esp, 4
    jmp L20
    mov mov eax, 07FFFFFFFh
    mov mov ecx, 010191678h
    lea lea edx, [esp + 0810h]
    call sub_10060CA1
    test test eax, eax
    jne sub_10003AE8
    lea lea eax, [esi + 116]
    lea lea edx, [esi + 124]
L20:
    lea lea ecx, [esi + 120]
    jmp sub_100039AA
    mov mov eax, 07FFFFFFFh
    mov mov ecx, 010191670h
    lea lea edx, [esp + 0810h]
    call sub_10060CC9
    test test eax, eax
    jne sub_100037D1
    push push 63
    lea lea eax, [esp + 20]
    push push eax
    push push esi
    call sub_100F617E
    add add esp, 12
    mov mov byte ptr [esi + 63], bl
    jmp sub_100037E9
R_DObjReplaceMaterial ENDP
END
