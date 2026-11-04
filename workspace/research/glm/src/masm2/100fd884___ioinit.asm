.686
.MODEL FLAT, C
EXTRN sub_100FC473:PROC
EXTRN sub_100FC509:PROC
EXTRN sub_100FDA99:PROC
EXTRN sub_100FDA9B:PROC
EXTRN sub_100FDACA:PROC
EXTRN sub_100FDAD2:PROC
EXTRN sub_100FDAE2:PROC
EXTRN sub_100FDB46:PROC
EXTRN sub_100FDB74:PROC
EXTRN sub_100FDB83:PROC
EXTRN sub_100FDBC6:PROC
EXTRN sub_100FDBC9:PROC
EXTRN sub_100FDBCB:PROC
EXTRN sub_100FDBE2:PROC
EXTRN sub_100FDBED:PROC
EXTRN sub_100FDBF1:PROC
EXTRN sub_100FDBF6:PROC
EXTRN sub_100FDBF7:PROC
EXTRN sub_100FDBF8:PROC
EXTRN sub_100FDC36:PROC
EXTRN sub_100FDC3C:PROC
EXTRN sub_10107BAA:PROC
EXTRN sub_10107C2F:PROC
EXTRN EXTRN fp_1010C150:DWORD:DWORD
EXTRN EXTRN fp_1010C154:DWORD:DWORD
EXTRN EXTRN fp_1010C158:DWORD:DWORD
EXTRN EXTRN fp_1010C15C:DWORD:DWORD
EXTRN EXTRN g_1076AC9C:DWORD:DWORD
EXTRN EXTRN g_1076ACA0:DWORD:DWORD
.CODE
__ioinit PROC
    sub sub esp, 72
    push push ebx
    mov mov ebx, 0480h
    push push ebx
    call sub_100FC473
    test test eax, eax
    pop pop ecx
    jne L0
    or or eax, -1
    jmp sub_100FDA99
    mov mov dword ptr [g_1076ACA0], eax
    mov mov dword ptr [g_1076AC9C], 32
    lea lea ecx, [eax + 0480h]
    jmp L1
    or or dword ptr [eax], -1
    and and dword ptr [eax + 8], 0
    mov mov byte ptr [eax + 4], 0
    mov mov byte ptr [eax + 5], 10
    mov mov ecx, dword ptr [g_1076ACA0]
    add add eax, 36
    add add ecx, 0480h
    cmp cmp eax, ecx
    jb L2
    push push ebp
    push push esi
    push push edi
    lea lea eax, [esp + 20]
    push push eax
    call dword ptr [fp_1010C15C]
    cmp cmp word ptr [esp + 70], 0
    je L8
    mov mov eax, dword ptr [esp + 72]
    test test eax, eax
    je L10
    mov mov edi, dword ptr [eax]
    lea lea ebp, [eax + 4]
    lea lea eax, [edi + ebp]
    mov mov dword ptr [esp + 16], eax
    mov mov eax, 0800h
    cmp cmp edi, eax
    jl L3
    mov mov edi, eax
    cmp cmp dword ptr [g_1076AC9C], edi
    jge L5
    mov mov esi, 01076ACA4h
    push push ebx
    call sub_100FC509
    test test eax, eax
    pop pop ecx
    je L6
    add add dword ptr [g_1076AC9C], 32
    mov mov dword ptr [esi], eax
    lea lea ecx, [eax + 0480h]
    jmp L6
    or or dword ptr [eax], -1
    and and dword ptr [eax + 8], 0
    mov mov byte ptr [eax + 4], 0
    mov mov byte ptr [eax + 5], 10
    mov mov ecx, dword ptr [esi]
    add add eax, 36
    add add ecx, ebx
    cmp cmp eax, ecx
    jb L7
    add add esi, 4
    cmp cmp dword ptr [g_1076AC9C], edi
    jl L4
    jmp L9
    mov mov edi, dword ptr [g_1076AC9C]
    xor xor ebx, ebx
    test test edi, edi
    jle sub_100FDACA
    mov mov eax, dword ptr [esp + 16]
    mov mov eax, dword ptr [eax]
    cmp cmp eax, -1
    je sub_100FDACA
    mov mov cl, byte ptr [ebp]
    test test cl, 1
    je sub_100FDAD2
    test test cl, 8
    jne sub_100FDA9B
    push push eax
    call dword ptr [fp_1010C158]
    test test eax, eax
    je sub_100FDAE2
    mov mov ecx, ebx
    mov mov eax, ebx
    and and eax, 31
    lea lea eax, [eax + eax*8]
    sar sar ecx, 5
    mov mov ecx, dword ptr [ecx*4 + 01076ACA0h]
    lea lea esi, [ecx + eax*4]
    mov mov eax, dword ptr [esp + 16]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [esi], eax
    mov mov al, byte ptr [ebp]
    mov mov byte ptr [esi + 4], al
    lea lea eax, [esi + 12]
    push push 0FA0h
    push push eax
    call sub_10107BAA
    test test eax, eax
    pop pop ecx
    pop pop ecx
    je sub_100FDB46
    inc inc dword ptr [esi + 8]
    add add dword ptr [esp + 16], 4
    inc inc ebx
    inc inc ebp
    cmp cmp ebx, edi
    jl sub_100FDACA
    xor xor ebx, ebx
    mov mov ecx, dword ptr [g_1076ACA0]
    lea lea eax, [ebx + ebx*8]
    lea lea esi, [ecx + eax*4]
    cmp cmp dword ptr [esi], -1
    jne sub_100FDBC9
    test test ebx, ebx
    mov mov byte ptr [esi + 4], 081h
    jne sub_100FDB74
    push push -10
    pop pop eax
    jmp sub_100FDB83
    or or eax, -1
    jmp sub_100FDBF7
    mov mov eax, ebx
L4:
    dec dec eax
    neg neg eax
L5:
    sbb sbb eax, eax
    add add eax, -11
    push push eax
    call dword ptr [fp_1010C154]
    mov mov edi, eax
L7:
    cmp cmp edi, -1
    je sub_100FDBED
    push push edi
    call dword ptr [fp_1010C158]
    test test eax, eax
    je sub_100FDBF8
    and and eax, 0FFh
    cmp cmp eax, 2
    mov mov dword ptr [esi], edi
    jne sub_100FDBE2
    or or byte ptr [esi + 4], 64
    jmp sub_100FDBF1
    cmp cmp eax, 3
    jne sub_100FDBF6
    or or byte ptr [esi + 4], 8
    lea lea eax, [esi + 12]
    push push 0FA0h
    push push eax
    call sub_10107C2F
    test test eax, eax
    pop pop ecx
    pop pop ecx
    je sub_100FDBCB
    inc inc dword ptr [esi + 8]
    jmp sub_100FDC36
    or or byte ptr [esi + 4], 64
    jmp sub_100FDC3C
    or or byte ptr [esi + 4], 080h
    inc inc ebx
    cmp cmp ebx, 3
    jl sub_100FDBC6
    push push dword ptr [g_1076AC9C]
    call dword ptr [fp_1010C150]
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 72
    ret ret
__ioinit ENDP
END
