.686
.MODEL FLAT, C
EXTRN sub_1003D3FD:PROC
EXTRN sub_1003D40C:PROC
EXTRN sub_1003D447:PROC
EXTRN sub_1003D450:PROC
EXTRN sub_1003D456:PROC
EXTRN sub_1003D463:PROC
EXTRN sub_1003D464:PROC
EXTRN sub_1003D465:PROC
EXTRN sub_1003D4DB:PROC
EXTRN sub_100F6CA6:PROC
EXTRN sub_100F6D62:PROC
EXTRN sub_100F6D63:PROC
EXTRN sub_100F6E20:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003d230 PROC
    sub sub esp, 12
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 24]
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [esp + 36]
    mov mov ecx, dword ptr [eax + ebp*4]
    mov mov eax, dword ptr [esp + 32]
    mov mov edx, eax
    and and edx, 31
    xor xor ecx, eax
    test test cl, 31
    lea lea edx, [edx*8 + 0101907A8h]
    push push edi
    mov mov dword ptr [esp + 24], ecx
    mov mov dword ptr [esp + 16], edx
    je L3
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L0
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L1
    push push 010199A50h
    push push 010193358h
    push push eax
    call sub_100F6D62
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6CA6
    add add esp, 16
    mov mov ecx, dword ptr [esp + 16]
    mov mov ecx, dword ptr [ecx]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push ecx
    mov mov ecx, dword ptr [esi]
    push push ecx
    push push ebp
    push push eax
    call call dword ptr [edx + 010Ch]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L2
    mov mov eax, dword ptr [esp + 36]
    xor xor ecx, ecx
    mov mov dword ptr [esp + 32], 10
    mov mov ebx, 07C00h
    mov mov dword ptr [esp + 20], ecx
    lea lea edi, [esi + 4]
    jmp L4
    lea lea ebx, [ebx]
    mov mov edx, dword ptr [esp + 24]
    test test edx, ebx
    je sub_1003D450
    mov mov esi, dword ptr [esp + 16]
    mov mov edx, 1
L3:
    shl shl edx, cl
    test test dword ptr [esi + 4], edx
    je sub_1003D447
    mov mov ecx, dword ptr [esp + 32]
    sar sar eax, cl
    and and eax, 31
    mov mov ecx, eax
    and and ecx, 7
    test test al, 8
    mov mov esi, dword ptr [ecx*4 + 010190860h]
    je sub_1003D3FD
    or or esi, 16
    test test al, 16
    je sub_1003D40C
    or or esi, 32
    nop nop
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003D456
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003D464
    push push 0101999F8h
    push push 010193358h
    push push eax
    call sub_100F6E20
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6D63
    add add esp, 16
    mov mov edx, dword ptr [edi]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push edx
    push push ebp
    push push eax
    call call dword ptr [ecx + 010Ch]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003D465
    mov mov ecx, dword ptr [esp + 20]
    jmp sub_1003D4DB
    mov mov edx, ebx
    not not edx
    and and edx, eax
    mov mov eax, dword ptr [esp + 40]
    mov mov eax, dword ptr [eax + ebp*4]
    and and eax, ebx
L4:
    or or edx, eax
    mov mov dword ptr [esp + 36], edx
    mov mov eax, dword ptr [esp + 36]
    mov mov edx, dword ptr [esp + 32]
    inc inc ecx
    add add edx, 5
    add add edi, 4
    shl shl ebx, 5
    cmp cmp ecx, 3
    mov mov dword ptr [esp + 20], ecx
    mov mov dword ptr [esp + 32], edx
    jl sub_1003D463
    mov mov ecx, dword ptr [esp + 40]
    pop pop edi
    pop pop esi
    mov mov dword ptr [ecx + ebp*4], eax
FUN_1003d230 ENDP
END
