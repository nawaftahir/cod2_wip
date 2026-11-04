.686
.MODEL FLAT, C
EXTRN sub_10039460:PROC
EXTRN sub_10060CCB:PROC
EXTRN sub_100F6CCE:PROC
EXTRN sub_100F6D52:PROC
EXTRN sub_100F6D8B:PROC
EXTRN sub_100F6E0E:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10039270 PROC
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    push ebx
    mov ebx, dword ptr [esp + 8]
    push esi
    push edi
    je L2
    mov eax, dword ptr [esp + 24]
    xor edi, edi
    test eax, eax
    jle L2
    mov esi, dword ptr [esp + 20]
    add esi, 8
    jmp L0
    lea ebx, [ebx]
L0:
    fld dword ptr [esi + 4]
    sub esp, 32
    fstp qword ptr [esp + 24]
    lea ecx, [edi + ebx]
    fld dword ptr [esi]
    fstp qword ptr [esp + 16]
    fld dword ptr [esi - 4]
    fstp qword ptr [esp + 8]
    fld dword ptr [esi - 8]
    fstp qword ptr [esp]
    push ecx
    push 010198C94h
    call sub_10060CCB
    mov edx, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [edx + 8]
    add esp, 40
    test ecx, ecx
    je L1
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne dl
    test dl, dl
    je L1
    push eax
    push 010193358h
    push ecx
    call sub_100F6D8B
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6CCE
    add esp, 16
L1:
    mov eax, dword ptr [esp + 24]
    inc edi
    add esi, 16
    cmp edi, eax
    jl L0
L2:
    mov eax, dword ptr [esp + 24]
    mov edi, dword ptr [esp + 20]
    shl ebx, 4
    shl eax, 4
    lea edx, [ebx + 010765680h]
    mov ecx, eax
    mov esi, edx
    xor ebx, ebx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_10039460
    mov ebx, dword ptr [esp + 20]
    mov ecx, eax
    mov edi, edx
    mov edx, ecx
    shr ecx, 2
    mov esi, ebx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov esi, dword ptr [esp + 24]
    mov edi, dword ptr [esp + 16]
    mov eax, dword ptr [g_101CE7EC]
    mov edx, dword ptr [eax + 8]
    test edx, edx
    mov ecx, dword ptr [g_10764584]
    je L3
    test ecx, ecx
    setne al
    test al, al
    je L3
    push 010198C08h
    push 010193358h
    push ecx
    call sub_100F6E0E
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6D52
    add esp, 16
L3:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push esi
    push ebx
    push edi
    push eax
    call dword ptr [edx + 0x1b4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
FUN_10039270 ENDP
END
