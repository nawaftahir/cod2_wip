.686
.MODEL FLAT, C
EXTRN sub_100F6CA6:PROC
EXTRN sub_100F6D62:PROC
EXTRN sub_100F6D63:PROC
EXTRN sub_100F6E20:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003d230 PROC
    sub esp, 12
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 24]
    push esi
    mov esi, eax
    mov eax, dword ptr [esp + 36]
    mov ecx, dword ptr [eax + ebp*4]
    mov eax, dword ptr [esp + 32]
    mov edx, eax
    and edx, 31
    xor ecx, eax
    test cl, 31
    lea edx, [edx*8 + 0101907A8h]
    push edi
    mov dword ptr [esp + 24], ecx
    mov dword ptr [esp + 16], edx
    je L2
L0:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 010199A50h
    push 010193358h
    push eax
    call sub_100F6D62
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6CA6
    add esp, 16
L1:
    mov ecx, dword ptr [esp + 16]
    mov ecx, dword ptr [ecx]
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push ecx
    mov ecx, dword ptr [esi]
    push ecx
    push ebp
    push eax
    call dword ptr [edx + 0x10c]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    mov eax, dword ptr [esp + 36]
L2:
    xor ecx, ecx
    mov dword ptr [esp + 32], 10
    mov ebx, 000007C00h
    mov dword ptr [esp + 20], ecx
    lea edi, [esi + 4]
    jmp L3
    lea ebx, [ebx]
L3:
    mov edx, dword ptr [esp + 24]
    test edx, ebx
    je L9
    mov esi, dword ptr [esp + 16]
    mov edx, 1
    shl edx, cl
    test dword ptr [esi + 4], edx
    je L7
    mov ecx, dword ptr [esp + 32]
    sar eax, cl
    and eax, 31
    mov ecx, eax
    and ecx, 7
    test al, 8
    mov esi, dword ptr [ecx*4 + 010190860h]
    je L4
    or esi, 16
L4:
    test al, 16
    je L5
    or esi, 32
    nop
L5:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L6
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L6
    push 0101999F8h
    push 010193358h
    push eax
    call sub_100F6E20
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6D63
    add esp, 16
L6:
    mov edx, dword ptr [edi]
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push edx
    push ebp
    push eax
    call dword ptr [ecx + 0x10c]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L5
    mov ecx, dword ptr [esp + 20]
    jmp L8
L7:
    mov edx, ebx
    not edx
    and edx, eax
    mov eax, dword ptr [esp + 40]
    mov eax, dword ptr [eax + ebp*4]
    and eax, ebx
    or edx, eax
    mov dword ptr [esp + 36], edx
L8:
    mov eax, dword ptr [esp + 36]
L9:
    mov edx, dword ptr [esp + 32]
    inc ecx
    add edx, 5
    add edi, 4
    shl ebx, 5
    cmp ecx, 3
    mov dword ptr [esp + 20], ecx
    mov dword ptr [esp + 32], edx
    jl L3
    mov ecx, dword ptr [esp + 40]
    pop edi
    pop esi
    mov dword ptr [ecx + ebp*4], eax
FUN_1003d230 ENDP
END
