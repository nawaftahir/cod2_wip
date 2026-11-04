.686
.MODEL FLAT, C
EXTRN sub_10039320:PROC
EXTRN sub_10039338:PROC
EXTRN sub_10039341:PROC
EXTRN sub_10060CCB:PROC
EXTRN sub_100F6CCE:PROC
EXTRN sub_100F6D52:PROC
EXTRN sub_100F6D8B:PROC
EXTRN sub_100F6E0E:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10039130 PROC
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    push push ebx
    mov mov ebx, dword ptr [esp + 8]
    push push esi
    push push edi
    je L1
    mov mov eax, dword ptr [esp + 24]
    xor xor edi, edi
    test test eax, eax
    jle L2
    mov mov esi, dword ptr [esp + 20]
    add add esi, 8
    jmp L0
    lea lea ebx, [ebx]
    fld fld dword ptr [esi + 4]
    sub sub esp, 32
    fstp fstp qword ptr [esp + 24]
    lea lea ecx, [edi + ebx]
    fld fld dword ptr [esi]
    fstp fstp qword ptr [esp + 16]
    fld fld dword ptr [esi - 4]
    fstp fstp qword ptr [esp + 8]
    fld fld dword ptr [esi - 8]
    fstp fstp qword ptr [esp]
    push push ecx
    push push 010198C94h
    call sub_10060CCB
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [edx + 8]
    add add esp, 40
    test test ecx, ecx
    je L4
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne dl
    test test dl, dl
    je L5
    push push eax
    push push 010193358h
    push push ecx
    call sub_100F6D8B
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6CCE
    add add esp, 16
    mov mov eax, dword ptr [esp + 24]
    inc inc edi
    add add esi, 16
    cmp cmp edi, eax
    jl L3
    mov mov eax, dword ptr [esp + 24]
    mov mov edi, dword ptr [esp + 20]
    shl shl ebx, 4
    shl shl eax, 4
    lea lea edx, [ebx + 010764680h]
    mov mov ecx, eax
    mov mov esi, edx
    xor xor ebx, ebx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_10039320
    mov mov ebx, dword ptr [esp + 20]
    mov mov ecx, eax
    mov mov edi, edx
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov esi, ebx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov esi, dword ptr [esp + 24]
    mov mov edi, dword ptr [esp + 16]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [eax + 8]
    test test edx, edx
    mov mov ecx, dword ptr [g_10764584]
    je sub_10039338
    test test ecx, ecx
    setne setne al
    test test al, al
    je sub_10039341
    push push 010198C50h
    push push 010193358h
    push push ecx
    call sub_100F6E0E
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6D52
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push esi
    push push ebx
    push push edi
    push push eax
    call call dword ptr [edx + 0178h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
FUN_10039130 ENDP
END
