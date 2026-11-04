.686
.MODEL FLAT, C
EXTRN sub_1000D4F7:PROC
EXTRN sub_1000DD34:PROC
EXTRN sub_1000DD38:PROC
EXTRN sub_1000DD3B:PROC
EXTRN sub_1000DD42:PROC
EXTRN sub_1000DD52:PROC
EXTRN sub_1000DD54:PROC
EXTRN sub_1000DD57:PROC
EXTRN sub_1000DDB5:PROC
EXTRN sub_1000DDFB:PROC
EXTRN sub_1000DE2B:PROC
EXTRN sub_1000DE6A:PROC
EXTRN sub_1000DE72:PROC
EXTRN sub_1000DE7B:PROC
EXTRN sub_1000DE80:PROC
EXTRN sub_1000DE8B:PROC
EXTRN sub_1000DF6F:PROC
EXTRN sub_1000E000:PROC
EXTRN sub_1000E071:PROC
EXTRN sub_1000E0A4:PROC
EXTRN sub_1000E0A7:PROC
EXTRN sub_10060991:PROC
EXTRN sub_100F8840:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4AD4:DWORD:DWORD
EXTRN EXTRN fp_101D4AD8:DWORD:DWORD
EXTRN EXTRN g_1019BECC:DWORD:DWORD
EXTRN EXTRN g_1019BED0:DWORD:DWORD
EXTRN EXTRN g_1019BED4:DWORD:DWORD
.CODE
FUN_1000d940 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    mov mov eax, 020A8h
    call sub_100F8840
    push push ebx
    push push ebp
    push push esi
    xor xor ebx, ebx
    push push edi
    mov mov byte ptr [esp + 23], bl
    call dword ptr [fp_101D4AD4]
    cmp cmp eax, 2
    jne L0
    push push 1
    call dword ptr [fp_101D4AD8]
    mov mov edx, eax
    add add esp, 4
    mov mov eax, 07FFFFFFFh
    mov mov ecx, 010193364h
    call sub_10060991
    test test eax, eax
    jne L1
    mov mov byte ptr [esp + 23], 1
    xor xor eax, eax
    mov mov dword ptr [esp + 28], eax
    mov mov ecx, 20
    lea lea edi, [esp + 96]
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov dword ptr [esp + 0B0h], ebx
    lea lea edi, [esp + 0B0h]
    mov mov ebx, 01000C7E0h
    mov mov dword ptr [esp + 32], eax
    call sub_1000D4F7
    mov mov bl, byte ptr [esp + 23]
    test test bl, bl
    mov mov ecx, dword ptr [esp + 0B0h]
    je L3
    mov mov eax, 0101CE890h
    jmp L2
    lea lea ecx, [ecx]
    cmp cmp ecx, 0800h
    jae L6
    cmp cmp dword ptr [eax], 0
    je L5
    mov mov dword ptr [esp + ecx*4 + 0B4h], eax
    mov mov ecx, dword ptr [esp + 0B0h]
    inc inc ecx
    mov mov dword ptr [esp + 0B0h], ecx
    add add eax, 36
    cmp cmp eax, 0101CEA64h
    jl L4
    lea lea eax, [esp + ecx*4 + 0B4h]
    mov mov ecx, eax
    lea lea edx, [esp + 0B4h]
    sub sub ecx, edx
    push push 01000D900h
    sar sar ecx, 2
    push push ecx
    push push eax
    mov mov eax, edx
    push push eax
    call sub_1000E071
    push push 01019335Ch
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 24
    mov mov esi, 0101A5A24h
    mov mov ecx, dword ptr [esi]
    push push ecx
    push push 010193358h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esi, 4
    add add esp, 12
    cmp cmp esi, 0101A5A2Ch
    jl L7
    push push 010193344h
    push push 0
    call dword ptr [fp_101D49C8]
    mov mov eax, dword ptr [esp + 0B8h]
    add add esp, 8
    test test eax, eax
    mov mov dword ptr [esp + 24], 0
    jle sub_1000DD52
    jmp L8
    lea lea ecx, [ecx]
    mov mov edx, dword ptr [esp + 24]
    mov mov edi, dword ptr [esp + edx*4 + 0B4h]
    mov mov eax, dword ptr [edi]
L4:
    sub sub eax, 3
L5:
    je L9
    dec dec eax
    je L10
L6:
    dec dec eax
    jne sub_1000DE8B
    mov mov eax, dword ptr [edi + 4]
    mov mov ecx, dword ptr [eax]
    lea lea edx, [esp + 36]
    push push edx
    push push 0
    push push eax
    call call dword ptr [ecx + 68]
    mov mov eax, dword ptr [esp + 36]
    cmp cmp eax, 51
    jg L13
    je L12
    add add eax, -21
    cmp cmp eax, 29
    ja L14
    movzx movzx eax, byte ptr [eax + 01000DD50h]
    jmp jmp dword ptr [eax*4 + 01000DD38h]
    mov mov eax, dword ptr [edi + 4]
    mov mov ecx, dword ptr [eax]
    lea lea edx, [esp + 68]
    push push edx
    push push 0
    push push eax
    call call dword ptr [ecx + 68]
    mov mov eax, dword ptr [esp + 68]
    jmp L11
    push push 01019333Ch
    jmp L15
    push push 010193334h
    jmp L16
    push push 010193324h
    jmp L17
    push push 01019331Ch
    jmp L18
    push push 0101932FCh
    jmp L21
    push push 01019332Ch
    jmp L23
    cmp cmp eax, 033545844h
    jg L22
    je L20
    cmp cmp eax, 114
    je L19
    cmp cmp eax, 031545844h
    jne sub_1000DD38
    push push 010193314h
    jmp sub_1000DD34
    push push 0101932F4h
    jmp sub_1000DD3B
    push push 01019330Ch
    jmp sub_1000DD42
    cmp cmp eax, 035545844h
    jne sub_1000DD54
    push push 010193304h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    movzx movzx ecx, byte ptr [edi + 12]
    mov mov edx, dword ptr [ecx*4 + 0101A59FCh]
    push push edx
    push push 0101932ECh
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    xor xor esi, esi
    lea lea ebp, [edi + 16]
    jmp sub_1000DDB5
    lea lea esp, [esp]
    lea lea esp, [esp]
    fild fild dword ptr [ebp]
    fmul fmul dword ptr [g_1019BED0]
    fcom fcom dword ptr [g_1019BED4]
    fnstsw fnstsw ax
    test test ah, 5
    mov mov eax, 0101932E4h
    jnp sub_1000DDFB
    mov mov eax, 0101932DCh
    sub sub esp, 8
    fstp fstp qword ptr [esp]
    push push eax
    push push 0
    call dword ptr [fp_101D49C8]
    movzx movzx eax, byte ptr [edi + 12]
    mov mov ecx, dword ptr [ebp]
    lea lea eax, [esi + eax*2]
    mov mov edx, dword ptr [esp + eax*4 + 112]
L8:
    lea lea eax, [esp + eax*4 + 112]
    add add edx, ecx
    add add esp, 16
    test test bl, bl
    mov mov dword ptr [eax], edx
    jne sub_1000DE6A
    movzx movzx eax, byte ptr [edi + 12]
    test test eax, eax
    jl sub_1000DE72
    cmp cmp eax, 1
    jle sub_1000DE7B
    cmp cmp eax, 4
    je sub_1000DE80
    add add dword ptr [esp + esi*4 + 28], ecx
    inc inc esi
    add add ebp, 4
    cmp cmp esi, 2
    jl sub_1000DE2B
    mov mov ecx, dword ptr [edi + 32]
L9:
    push push ecx
    push push 0101932D4h
    push push 0
    call dword ptr [fp_101D49C8]
    mov mov eax, dword ptr [esp + 36]
    mov mov ecx, dword ptr [esp + 0BCh]
    add add esp, 12
    inc inc eax
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 24], eax
    jl sub_1000DD57
    push push 0101932C8h
    push push 0
    call dword ptr [fp_101D49C8]
    mov mov edx, dword ptr [esp + 0B8h]
    push push edx
    push push 0101932B4h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 20
    xor xor esi, esi
    mov mov edi, edi
    fild fild dword ptr [esp + esi + 28]
    mov mov eax, dword ptr [esi + 0101A5A24h]
    push push eax
    sub sub esp, 8
    fmul fmul dword ptr [g_1019BECC]
    fstp fstp qword ptr [esp]
L11:
    push push 010193294h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esi, 4
    add add esp, 20
    cmp cmp esi, 8
    jl sub_1000DF6F
    push push 010193290h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 010193288h
L12:
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 16
    mov mov esi, 0101A5A24h
    mov mov ecx, dword ptr [esi]
    push push ecx
    push push 010193358h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esi, 4
    add add esp, 12
    cmp cmp esi, 0101A5A2Ch
    jl sub_1000E000
    push push 010193290h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    lea lea esi, [esp + 96]
    mov mov edi, 0101A59FCh
    mov mov edx, dword ptr [edi]
    push push edx
    push push 010193284h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    mov mov ebx, 2
    fild fild dword ptr [esi]
    sub sub esp, 8
    fmul fmul dword ptr [g_1019BECC]
    fstp fstp qword ptr [esp]
    push push 01019327Ch
    push push 0
L15:
    call dword ptr [fp_101D49C8]
    add add esp, 16
    add add esi, 4
    dec dec ebx
    jne sub_1000E0A4
    push push 010193274h
    push push 0
    call dword ptr [fp_101D49C8]
L21:
    add add edi, 4
    add add esp, 8
    cmp cmp edi, 0101A5A24h
    jl sub_1000E0A7
    push push 010193210h
    push push 0
FUN_1000d940 ENDP
END
