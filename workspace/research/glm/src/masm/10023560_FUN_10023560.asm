.686
.MODEL FLAT, C
EXTRN g_101D0A74:DWORD
EXTRN g_101D0A78:DWORD
EXTRN g_101D4924:DWORD
.CODE
FUN_10023560 PROC
    push esi
    push edi
    mov edi, 0101D4828h
L0:
    mov eax, dword ptr [edi - 4]
    test eax, eax
    je L1
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
L1:
    mov eax, dword ptr [edi]
    test eax, eax
    je L2
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
L2:
    mov esi, dword ptr [edi - 8]
    test esi, esi
    je L6
    movzx eax, byte ptr [esi + 12]
    test eax, eax
    jl L3
    cmp eax, 1
    jle L4
    cmp eax, 4
    je L4
L3:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [g_101D0A74]
    sub ecx, eax
    mov eax, dword ptr [g_101D0A78]
    mov dword ptr [g_101D0A74], ecx
    mov ecx, dword ptr [esi + 20]
    sub eax, ecx
    mov dword ptr [g_101D0A78], eax
L4:
    mov eax, dword ptr [esi + 4]
    test eax, eax
    je L5
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    lea ecx, [esi + 16]
    mov dword ptr [esi + 4], 0
    xor eax, eax
    mov dword ptr [ecx], eax
    mov dword ptr [ecx + 4], eax
L5:
    mov dword ptr [esi], 0
L6:
    add edi, 20
    cmp edi, 0101D492Ch
    jl L0
    xor eax, eax
    mov ecx, 65
    mov edi, 0101D4820h
    rep stosd dword ptr es:[edi], eax
    pop edi
    mov dword ptr [g_101D4924], eax
    pop esi
    ret
FUN_10023560 ENDP
END
