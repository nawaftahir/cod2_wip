.686
.MODEL FLAT, C
EXTRN sub_1000CE67:PROC
EXTRN sub_1000CF0D:PROC
EXTRN sub_1000CF33:PROC
EXTRN sub_1000CF5B:PROC
EXTRN sub_1000CF61:PROC
EXTRN sub_1003D97A:PROC
EXTRN sub_100F883A:PROC
EXTRN EXTRN g_101D0A74:DWORD:DWORD
EXTRN EXTRN g_101D0A78:DWORD:DWORD
EXTRN EXTRN g_101D492C:DWORD:DWORD
EXTRN EXTRN g_101D4C88:DWORD:DWORD
.CODE
FUN_1000cd10 PROC
    mov mov eax, 02004h
    call sub_100F883A
    mov mov al, byte ptr [g_101D492C]
    test test al, al
    push push ebp
    push push esi
    push push edi
    jne L0
    mov mov eax, dword ptr [g_101D4C88]
    xor xor edi, edi
    test test eax, eax
    jle L1
    push push 0
    xor xor eax, eax
    call sub_1003D97A
    mov mov eax, dword ptr [g_101D4C88]
    add add esp, 4
    inc inc edi
    cmp cmp edi, eax
    jl L1
    xor xor edx, edx
    mov mov dword ptr [esp + 12], edx
    xor xor edi, edi
    nop nop
    mov mov esi, dword ptr [edi + 0101CEA68h]
    test test esi, esi
    je L5
    cmp cmp esi, 0101CE890h
    jb L2
    cmp cmp esi, 0101CEA64h
L1:
    jae L3
    mov mov dword ptr [esp + edx*4 + 16], esi
    inc inc edx
    mov mov dword ptr [esp + 12], edx
    jmp L7
    movzx movzx eax, byte ptr [esi + 12]
    test test eax, eax
    jl L4
    cmp cmp eax, 1
    jle L5
    cmp cmp eax, 4
    je L6
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
    je sub_1000CE67
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    mov mov edx, dword ptr [esp + 12]
    lea lea ecx, [esi + 16]
    mov mov dword ptr [esi + 4], 0
    xor xor eax, eax
    mov mov dword ptr [ecx], eax
    mov mov dword ptr [ecx + 4], eax
    mov mov dword ptr [esi], 0
L3:
    add add edi, 4
    cmp cmp edi, 02000h
    jb L6
    xor xor eax, eax
    mov mov ecx, 0800h
    mov mov edi, 0101CEA68h
    xor xor ebp, ebp
    test test edx, edx
    rep stosd rep stosd dword ptr es:[edi], eax
    jle sub_1000CF33
    mov mov edi, dword ptr [esp + ebp*4 + 16]
    mov mov esi, dword ptr [edi + 32]
    mov mov al, byte ptr [esi]
    xor xor edx, edx
    test test al, al
    mov mov ecx, 119
    je sub_1000CF0D
    movsx movsx eax, al
    imul imul eax, ecx
    add add edx, eax
    mov mov al, byte ptr [esi + ecx - 118]
    inc inc ecx
    test test al, al
    jne sub_1000CF0D
    and and edx, 07FFh
    mov mov eax, edx
    mov mov ecx, dword ptr [eax*4 + 0101CEA68h]
    test test ecx, ecx
    je sub_1000CF5B
    lea lea ebx, [ebx]
    inc inc eax
    and and eax, 07FFh
    mov mov ecx, dword ptr [eax*4 + 0101CEA68h]
    test test ecx, ecx
    jne sub_1000CF61
    mov mov dword ptr [eax*4 + 0101CEA68h], edi
    mov mov eax, dword ptr [esp + 12]
    inc inc ebp
    cmp cmp ebp, eax
    jl sub_1000CF33
    pop pop edi
    pop pop esi
    pop pop ebp
    add add esp, 02004h
    ret ret
FUN_1000cd10 ENDP
END
