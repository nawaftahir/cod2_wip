.686
.MODEL FLAT, C
EXTRN sub_10023604:PROC
EXTRN sub_10023637:PROC
EXTRN EXTRN g_101D0A74:DWORD:DWORD
EXTRN EXTRN g_101D0A78:DWORD:DWORD
EXTRN EXTRN g_101D4924:DWORD:DWORD
.CODE
FUN_10023560 PROC
    push push esi
    push push edi
    mov mov edi, 0101D4828h
    mov mov eax, dword ptr [edi - 4]
    test test eax, eax
    je L0
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov eax, dword ptr [edi]
    test test eax, eax
    je L1
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    mov mov esi, dword ptr [edi - 8]
    test test esi, esi
    je sub_10023604
    movzx movzx eax, byte ptr [esi + 12]
    test test eax, eax
    jl L2
    cmp cmp eax, 1
    jle L3
    cmp cmp eax, 4
    je L4
    mov mov eax, dword ptr [esi + 16]
    mov mov ecx, dword ptr [g_101D0A74]
    sub sub ecx, eax
    mov mov eax, dword ptr [g_101D0A78]
    mov mov dword ptr [g_101D0A74], ecx
    mov mov ecx, dword ptr [esi + 20]
    sub sub eax, ecx
    mov mov dword ptr [g_101D0A78], eax
    mov mov eax, dword ptr [esi + 4]
    test test eax, eax
    je sub_10023637
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    lea lea ecx, [esi + 16]
    mov mov dword ptr [esi + 4], 0
    xor xor eax, eax
    mov mov dword ptr [ecx], eax
    mov mov dword ptr [ecx + 4], eax
    mov mov dword ptr [esi], 0
    add add edi, 20
    cmp cmp edi, 0101D492Ch
    jl L5
    xor xor eax, eax
    mov mov ecx, 65
L5:
    mov mov edi, 0101D4820h
    rep stosd rep stosd dword ptr es:[edi], eax
    pop pop edi
    mov mov dword ptr [g_101D4924], eax
    pop pop esi
    ret ret
FUN_10023560 ENDP
END
