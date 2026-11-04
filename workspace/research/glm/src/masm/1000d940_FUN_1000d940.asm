.686
.MODEL FLAT, C
EXTRN sub_1000D4F7:PROC
EXTRN sub_1000DE8B:PROC
EXTRN sub_1000E071:PROC
EXTRN sub_10060991:PROC
EXTRN sub_100F8840:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4AD4:DWORD
EXTRN fp_101D4AD8:DWORD
EXTRN g_1019BECC:DWORD
EXTRN g_1019BED0:DWORD
EXTRN g_1019BED4:DWORD
.CODE
FUN_1000d940 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    mov eax, 0000020A8h
    call sub_100F8840
    push ebx
    push ebp
    push esi
    xor ebx, ebx
    push edi
    mov byte ptr [esp + 23], bl
    call dword ptr [fp_101D4AD4]
    cmp eax, 2
    jne L0
    push 1
    call dword ptr [fp_101D4AD8]
    mov edx, eax
    add esp, 4
    mov eax, 07FFFFFFFh
    mov ecx, 010193364h
    call sub_10060991
    test eax, eax
    jne L0
    mov byte ptr [esp + 23], 1
L0:
    xor eax, eax
    mov dword ptr [esp + 28], eax
    mov ecx, 20
    lea edi, [esp + 96]
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [esp + 0000000B0h], ebx
    lea edi, [esp + 0000000B0h]
    mov ebx, 01000C7E0h
    mov dword ptr [esp + 32], eax
    call sub_1000D4F7
    mov bl, byte ptr [esp + 23]
    test bl, bl
    mov ecx, dword ptr [esp + 0000000B0h]
    je L3
    mov eax, 0101CE890h
    jmp L1
    lea ecx, [ecx]
L1:
    cmp ecx, 000000800h
    jae L3
    cmp dword ptr [eax], 0
    je L2
    mov dword ptr [esp + ecx*4 + 0000000B4h], eax
    mov ecx, dword ptr [esp + 0000000B0h]
    inc ecx
    mov dword ptr [esp + 0000000B0h], ecx
L2:
    add eax, 36
    cmp eax, 0101CEA64h
    jl L1
L3:
    lea eax, [esp + ecx*4 + 0000000B4h]
    mov ecx, eax
    lea edx, [esp + 0000000B4h]
    sub ecx, edx
    push 01000D900h
    sar ecx, 2
    push ecx
    push eax
    mov eax, edx
    push eax
    call sub_1000E071
    push 01019335Ch
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 24
    mov esi, 0101A5A24h
L4:
    mov ecx, dword ptr [esi]
    push ecx
    push 010193358h
    push 0
    call dword ptr [fp_101D49C8]
    add esi, 4
    add esp, 12
    cmp esi, 0101A5A2Ch
    jl L4
    push 010193344h
    push 0
    call dword ptr [fp_101D49C8]
    mov eax, dword ptr [esp + 0000000B8h]
    add esp, 8
    test eax, eax
    mov dword ptr [esp + 24], 0
    jle L20
    jmp L5
    lea ecx, [ecx]
L5:
    mov edx, dword ptr [esp + 24]
    mov edi, dword ptr [esp + edx*4 + 0000000B4h]
    mov eax, dword ptr [edi]
    sub eax, 3
    je L6
    dec eax
    je L8
    dec eax
    jne sub_1000DE8B
L6:
    mov eax, dword ptr [edi + 4]
    mov ecx, dword ptr [eax]
    lea edx, [esp + 36]
    push edx
    push 0
    push eax
    call dword ptr [ecx + 0x44]
    mov eax, dword ptr [esp + 36]
L7:
    cmp eax, 51
    jg L10
    je L9
    add eax, -21
    cmp eax, 29
    ja L15
    movzx eax, byte ptr [eax + 01000DD50h]
    jmp dword ptr [eax*4 + 0x1000dd38]
L8:
    mov eax, dword ptr [edi + 4]
    mov ecx, dword ptr [eax]
    lea edx, [esp + 68]
    push edx
    push 0
    push eax
    call dword ptr [ecx + 0x44]
    mov eax, dword ptr [esp + 68]
    jmp L7
    push 01019333Ch
    jmp L14
    push 010193334h
    jmp L14
    push 010193324h
    jmp L14
    push 01019331Ch
    jmp L14
    push 0101932FCh
    jmp L14
L9:
    push 01019332Ch
    jmp L14
L10:
    cmp eax, 033545844h
    jg L13
    je L12
    cmp eax, 114
    je L11
    cmp eax, 031545844h
    jne L15
    push 010193314h
    jmp L14
L11:
    push 0101932F4h
    jmp L14
L12:
    push 01019330Ch
    jmp L14
L13:
    cmp eax, 035545844h
    jne L15
    push 010193304h
L14:
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
L15:
    movzx ecx, byte ptr [edi + 12]
    mov edx, dword ptr [ecx*4 + 0101A59FCh]
    push edx
    push 0101932ECh
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    xor esi, esi
    lea ebp, [edi + 16]
    jmp L16
    lea esp, [esp]
    lea esp, [esp]
L16:
    fild dword ptr [ebp]
    fmul dword ptr [g_1019BED0]
    fcom dword ptr [g_1019BED4]
    fnstsw ax
    test ah, 5
    mov eax, 0101932E4h
    jnp L17
    mov eax, 0101932DCh
L17:
    sub esp, 8
    fstp qword ptr [esp]
    push eax
    push 0
    call dword ptr [fp_101D49C8]
    movzx eax, byte ptr [edi + 12]
    mov ecx, dword ptr [ebp]
    lea eax, [esi + eax*2]
    mov edx, dword ptr [esp + eax*4 + 112]
    lea eax, [esp + eax*4 + 112]
    add edx, ecx
    add esp, 16
    test bl, bl
    mov dword ptr [eax], edx
    jne L18
    movzx eax, byte ptr [edi + 12]
    test eax, eax
    jl L18
    cmp eax, 1
    jle L19
    cmp eax, 4
    je L19
L18:
    add dword ptr [esp + esi*4 + 28], ecx
L19:
    inc esi
    add ebp, 4
    cmp esi, 2
    jl L16
    mov ecx, dword ptr [edi + 32]
    push ecx
    push 0101932D4h
    push 0
    call dword ptr [fp_101D49C8]
    mov eax, dword ptr [esp + 36]
    mov ecx, dword ptr [esp + 0000000BCh]
    add esp, 12
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 24], eax
    jl L5
L20:
    push 0101932C8h
    push 0
    call dword ptr [fp_101D49C8]
    mov edx, dword ptr [esp + 0000000B8h]
    push edx
    push 0101932B4h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 20
    xor esi, esi
    mov edi, edi
L21:
    fild dword ptr [esp + esi + 28]
    mov eax, dword ptr [esi + 0101A5A24h]
    push eax
    sub esp, 8
    fmul dword ptr [g_1019BECC]
    fstp qword ptr [esp]
    push 010193294h
    push 0
    call dword ptr [fp_101D49C8]
    add esi, 4
    add esp, 20
    cmp esi, 8
    jl L21
    push 010193290h
    push 0
    call dword ptr [fp_101D49C8]
    push 010193288h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 16
    mov esi, 0101A5A24h
L22:
    mov ecx, dword ptr [esi]
    push ecx
    push 010193358h
    push 0
    call dword ptr [fp_101D49C8]
    add esi, 4
    add esp, 12
    cmp esi, 0101A5A2Ch
    jl L22
    push 010193290h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
    lea esi, [esp + 96]
    mov edi, 0101A59FCh
L23:
    mov edx, dword ptr [edi]
    push edx
    push 010193284h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 12
    mov ebx, 2
L24:
    fild dword ptr [esi]
    sub esp, 8
    fmul dword ptr [g_1019BECC]
    fstp qword ptr [esp]
    push 01019327Ch
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 16
    add esi, 4
    dec ebx
    jne L24
    push 010193274h
    push 0
    call dword ptr [fp_101D49C8]
    add edi, 4
    add esp, 8
    cmp edi, 0101A5A24h
    jl L23
    push 010193210h
    push 0
FUN_1000d940 ENDP
END
