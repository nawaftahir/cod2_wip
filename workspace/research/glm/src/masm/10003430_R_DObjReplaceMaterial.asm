.686
.MODEL FLAT, C
EXTRN sub_1000383F:PROC
EXTRN sub_10003848:PROC
EXTRN sub_100038F2:PROC
EXTRN sub_100038FB:PROC
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
EXTRN g_1019BCB4:DWORD
EXTRN g_1019BEDC:DWORD
EXTRN g_101AAC70:DWORD
.CODE
R_DObjReplaceMaterial PROC
    mov eax, 000001000h
    call sub_100F883A
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 000001010h]
    push edi
    xor ebx, ebx
    jmp L0
    lea esp, [esp]
L0:
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    cmp byte ptr [eax + 000000404h], bl
    je L1
    mov ecx, dword ptr [eax + 000000418h]
    mov edx, dword ptr [eax + 000000414h]
    mov byte ptr [eax + 000000404h], bl
    mov dword ptr [esp + 000001018h], ecx
    mov dword ptr [eax + 000000400h], edx
L1:
    lea eax, [esp + 000001018h]
    push eax
    mov eax, 1
    call sub_1005F6F9
    mov cl, byte ptr [eax]
    add esp, 4
    cmp cl, bl
    je sub_1000383F
    cmp cl, 125
    je sub_10003848
    cmp cl, 123
    jne L2
    mov dword ptr [esi + 64], ebx
    mov dword ptr [esi + 84], ebx
    mov dword ptr [esi + 80], 03F000000h
    mov byte ptr [esi + 112], bl
    mov dword ptr [esi + 68], ebx
    mov dword ptr [esi + 72], ebx
    mov dword ptr [esi + 76], ebx
    mov dword ptr [esi + 88], ebx
    mov dword ptr [esi + 92], ebx
    mov dword ptr [esi + 96], ebx
    mov dword ptr [esi + 100], ebx
    mov dword ptr [esi + 104], ebx
    mov dword ptr [esi + 108], ebx
    jmp L0
L2:
    push 0000007FFh
    push eax
    lea ecx, [esp + 000000818h]
    push ecx
    call sub_100F5EB7
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov byte ptr [esp + 00000101Bh], bl
    mov cl, byte ptr [eax + 000000404h]
    add esp, 12
    cmp cl, bl
    je L3
    mov edx, dword ptr [eax + 000000418h]
    mov ecx, dword ptr [eax + 000000414h]
    mov byte ptr [eax + 000000404h], bl
    mov dword ptr [esp + 000001018h], edx
    mov dword ptr [eax + 000000400h], ecx
L3:
    lea edx, [esp + 000001018h]
    push edx
    mov eax, 1
    call sub_1005F7AC
    mov cl, byte ptr [eax]
    add esp, 4
    cmp cl, bl
    je sub_100038F2
    cmp cl, 125
    je sub_100038FB
    push 0000007FFh
    push eax
    lea eax, [esp + 24]
    push eax
    call sub_100F5F32
    add esp, 12
    mov byte ptr [esp + 00000080Fh], bl
    mov edi, 07FFFFFFFh
    xor edx, edx
    jmp L4
    lea esp, [esp]
    lea esp, [esp]
L4:
    movsx eax, byte ptr [esp + edx + 000000810h]
    movsx ecx, byte ptr [edx + 01019173Ch]
    inc edx
    mov ebp, edi
    dec edi
    test ebp, ebp
    je L9
    cmp eax, ecx
    je L7
    cmp eax, 97
    jl L5
    cmp eax, 122
    jg L5
    sub eax, 32
L5:
    cmp ecx, 97
    jl L6
    cmp ecx, 122
    jg L6
    sub ecx, 32
L6:
    cmp eax, ecx
    jne L8
L7:
    cmp eax, ebx
    jne L4
    jmp L9
L8:
    xor edx, edx
    cmp eax, ecx
    setge dl
    lea edx, [edx + edx - 1]
    mov eax, edx
    cmp eax, ebx
    jne L10
L9:
    lea eax, [esp + 16]
    push eax
    call sub_100F5F6C
    fst dword ptr [esi + 64]
    fcomp dword ptr [g_1019BCB4]
    add esp, 4
    fnstsw ax
    test ah, 65
    jne L0
    lea ecx, [esp + 16]
    push ecx
    push 0101916C8h
    call sub_10061E60
    fld dword ptr [esi + 64]
    fmul dword ptr [g_1019BEDC]
    add esp, 8
    fstp dword ptr [esi + 64]
    jmp L0
L10:
    mov eax, 07FFFFFFFh
    mov ecx, 0101916C0h
    lea edx, [esp + 000000810h]
    call sub_10060B5A
    test eax, eax
    jne L12
    lea eax, [esi + 68]
    lea edx, [esi + 76]
    lea ecx, [esi + 72]
L11:
    push edx
    push ecx
    push eax
    mov dword ptr [eax], ebx
    lea edx, [esp + 28]
    push 010191928h
    mov dword ptr [eax + 4], ebx
    push edx
    mov dword ptr [eax + 8], ebx
    call sub_100F5FAF
    add esp, 20
    jmp L0
L12:
    mov eax, 07FFFFFFFh
    mov ecx, 0101916B0h
    lea edx, [esp + 000000810h]
    call sub_10060B9F
    test eax, eax
    jne L13
    lea eax, [esp + 16]
    push eax
    call sub_100F600F
    fstp dword ptr [esi + 80]
    add esp, 4
    jmp L0
L13:
    mov eax, 07FFFFFFFh
    mov ecx, 0101916A4h
    lea edx, [esp + 000000810h]
    call sub_10060BCE
    test eax, eax
    jne L14
    lea ecx, [esi + 96]
    push ecx
    lea edi, [esi + 88]
    lea edx, [esi + 92]
    push edx
    push edi
    lea eax, [esp + 28]
    push 010191928h
    push eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi + 4], ebx
    mov dword ptr [edi + 8], ebx
    call sub_100F6023
    add esp, 20
    mov edx, edi
    mov ecx, edi
    call sub_1005E1B1
    fstp st(0)
    jmp L0
L14:
    mov eax, 07FFFFFFFh
    mov ecx, 010191694h
    lea edx, [esp + 000000810h]
    call sub_10060C1E
    test eax, eax
    jne L15
    lea ecx, [esi + 108]
    push ecx
    lea edi, [esi + 100]
    lea edx, [esi + 104]
    push edx
    push edi
    lea eax, [esp + 28]
    push 010191928h
    push eax
    mov dword ptr [edi], ebx
    mov dword ptr [edi + 4], ebx
    mov dword ptr [edi + 8], ebx
    call sub_100F6073
    add esp, 20
    mov edx, edi
    mov ecx, edi
    call sub_1005E201
    fstp st(0)
    mov byte ptr [esi + 112], 1
    jmp L0
L15:
    mov eax, 07FFFFFFFh
    mov ecx, 010191688h
    lea edx, [esp + 000000810h]
    call sub_10060C72
    test eax, eax
    jne L16
    lea ecx, [esp + 16]
    push ecx
    call sub_100F60E2
    fstp dword ptr [esi + 84]
    add esp, 4
    jmp L0
L16:
    mov eax, 07FFFFFFFh
    mov ecx, 010191678h
    lea edx, [esp + 000000810h]
    call sub_10060CA1
    test eax, eax
    jne L17
    lea eax, [esi + 116]
    lea edx, [esi + 124]
    lea ecx, [esi + 120]
    jmp L11
L17:
    mov eax, 07FFFFFFFh
    mov ecx, 010191670h
    lea edx, [esp + 000000810h]
    call sub_10060CC9
    test eax, eax
    jne L0
    push 63
    lea eax, [esp + 20]
    push eax
    push esi
    call sub_100F617E
    add esp, 12
    mov byte ptr [esi + 63], bl
    jmp L0
R_DObjReplaceMaterial ENDP
END
