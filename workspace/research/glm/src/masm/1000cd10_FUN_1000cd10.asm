.686
.MODEL FLAT, C
EXTRN sub_1003D97A:PROC
EXTRN sub_100F883A:PROC
EXTRN g_101D0A74:DWORD
EXTRN g_101D0A78:DWORD
EXTRN g_101D492C:DWORD
EXTRN g_101D4C88:DWORD
.CODE
FUN_1000cd10 PROC
    mov eax, 000002004h
    call sub_100F883A
    mov al, byte ptr [g_101D492C]
    test al, al
    push ebp
    push esi
    push edi
    jne L1
    mov eax, dword ptr [g_101D4C88]
    xor edi, edi
    test eax, eax
    jle L1
L0:
    push 0
    xor eax, eax
    call sub_1003D97A
    mov eax, dword ptr [g_101D4C88]
    add esp, 4
    inc edi
    cmp edi, eax
    jl L0
L1:
    xor edx, edx
    mov dword ptr [esp + 12], edx
    xor edi, edi
    nop
L2:
    mov esi, dword ptr [edi + 0101CEA68h]
    test esi, esi
    je L7
    cmp esi, 0101CE890h
    jb L3
    cmp esi, 0101CEA64h
    jae L3
    mov dword ptr [esp + edx*4 + 16], esi
    inc edx
    mov dword ptr [esp + 12], edx
    jmp L7
L3:
    movzx eax, byte ptr [esi + 12]
    test eax, eax
    jl L4
    cmp eax, 1
    jle L5
    cmp eax, 4
    je L5
L4:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [g_101D0A74]
    sub ecx, eax
    mov eax, dword ptr [g_101D0A78]
    mov dword ptr [g_101D0A74], ecx
    mov ecx, dword ptr [esi + 20]
    sub eax, ecx
    mov dword ptr [g_101D0A78], eax
L5:
    mov eax, dword ptr [esi + 4]
    test eax, eax
    je L6
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    mov edx, dword ptr [esp + 12]
    lea ecx, [esi + 16]
    mov dword ptr [esi + 4], 0
    xor eax, eax
    mov dword ptr [ecx], eax
    mov dword ptr [ecx + 4], eax
L6:
    mov dword ptr [esi], 0
L7:
    add edi, 4
    cmp edi, 000002000h
    jb L2
    xor eax, eax
    mov ecx, 000000800h
    mov edi, 0101CEA68h
    xor ebp, ebp
    test edx, edx
    rep stosd dword ptr es:[edi], eax
    jle L13
L8:
    mov edi, dword ptr [esp + ebp*4 + 16]
    mov esi, dword ptr [edi + 32]
    mov al, byte ptr [esi]
    xor edx, edx
    test al, al
    mov ecx, 119
    je L10
L9:
    movsx eax, al
    imul eax, ecx
    add edx, eax
    mov al, byte ptr [esi + ecx - 118]
    inc ecx
    test al, al
    jne L9
L10:
    and edx, 0000007FFh
    mov eax, edx
    mov ecx, dword ptr [eax*4 + 0101CEA68h]
    test ecx, ecx
    je L12
    lea ebx, [ebx]
L11:
    inc eax
    and eax, 0000007FFh
    mov ecx, dword ptr [eax*4 + 0101CEA68h]
    test ecx, ecx
    jne L11
L12:
    mov dword ptr [eax*4 + 0101CEA68h], edi
    mov eax, dword ptr [esp + 12]
    inc ebp
    cmp ebp, eax
    jl L8
L13:
    pop edi
    pop esi
    pop ebp
    add esp, 000002004h
    ret
FUN_1000cd10 ENDP
END
