.686
.MODEL FLAT, C
EXTRN sub_100857F0:PROC
EXTRN sub_10086ED5:PROC
EXTRN sub_1008A75D:PROC
EXTRN sub_1008A9A5:PROC
EXTRN sub_1008A9B9:PROC
EXTRN sub_1008AD0B:PROC
EXTRN sub_10092A1B:PROC
EXTRN sub_10092A58:PROC
EXTRN sub_10092A95:PROC
EXTRN sub_10093100:PROC
EXTRN sub_10093137:PROC
EXTRN sub_10093176:PROC
EXTRN sub_100BA213:PROC
EXTRN sub_100C25B9:PROC
EXTRN sub_100C29A1:PROC
EXTRN sub_100C29B2:PROC
EXTRN sub_100C29C1:PROC
EXTRN sub_100C29DC:PROC
EXTRN sub_100C2A74:PROC
EXTRN sub_100C2A7C:PROC
EXTRN sub_100C2A9A:PROC
EXTRN sub_100C2A9B:PROC
EXTRN sub_100C2AFE:PROC
EXTRN sub_100C2B0C:PROC
EXTRN sub_100C2B10:PROC
EXTRN sub_100C2B14:PROC
EXTRN sub_100C2B1B:PROC
EXTRN sub_100C2B1C:PROC
EXTRN sub_100C2B27:PROC
EXTRN sub_100C2B29:PROC
EXTRN sub_100C2B2F:PROC
EXTRN sub_100C2B3F:PROC
EXTRN sub_100C2B45:PROC
EXTRN sub_100C2B55:PROC
EXTRN sub_100C2B7F:PROC
EXTRN sub_100C2B8D:PROC
EXTRN sub_100C2BE7:PROC
EXTRN sub_100C2BEC:PROC
EXTRN sub_100C2C30:PROC
EXTRN sub_100C2C3D:PROC
EXTRN sub_100C2C98:PROC
EXTRN sub_100C2CAC:PROC
EXTRN sub_100F79AE:PROC
EXTRN sub_100F79C6:PROC
EXTRN sub_100F7BBA:PROC
EXTRN sub_100F7BC2:PROC
.CODE
FUN_100c2620 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0E8h
    push push ebx
    mov mov ebx, ecx
    test test byte ptr [ebx + 0CCh], 4
    je L0
    xor xor eax, eax
    inc inc eax
    jmp sub_100C29A1
    push push edi
    mov mov ecx, ebx
    call sub_10086ED5
    xor xor edi, edi
    cmp cmp eax, edi
    jl sub_100C29B2
    mov mov ecx, ebx
    call sub_1008AD0B
    cmp cmp eax, edi
    jl sub_100C29C1
    push push esi
    mov mov esi, dword ptr [ebx + 12]
    push push 25
    mov mov dword ptr [ebp - 8], edi
    mov mov dword ptr [ebp - 12], edi
    mov mov dword ptr [ebp - 28], edi
    pop pop ecx
    xor xor eax, eax
    test test byte ptr [ebx + 111], 16
    lea lea edi, [ebp - 084h]
    rep stosd rep stosd dword ptr es:[edi], eax
    push push 25
    pop pop ecx
    lea lea edi, [ebp - 0E8h]
    mov mov dword ptr [ebp - 20], esi
    rep stosd rep stosd dword ptr es:[edi], eax
    jne L2
    mov mov eax, dword ptr [ebx + 48]
    test test eax, eax
    je L1
    push push eax
    push push dword ptr [ebx + 08Ch]
    lea lea eax, [ebp - 0E8h]
    push push eax
    mov mov ecx, ebx
    call sub_10092A1B
    mov mov edi, eax
    test test edi, edi
    jl sub_100C29DC
    push push 0
    lea lea eax, [ebp - 0E8h]
    push push eax
    mov mov ecx, ebx
    call sub_10093100
    xor xor ecx, ecx
    test test eax, eax
    setge setge cl
    mov mov dword ptr [ebp - 28], ecx
    mov mov eax, dword ptr [ebx + 44]
    dec dec eax
    push push eax
    push push dword ptr [ebx + 088h]
    lea lea eax, [ebp - 084h]
    push push eax
    mov mov ecx, ebx
    call sub_10092A58
    test test eax, eax
    jl L3
    push push 0
    lea lea eax, [ebp - 084h]
    push push eax
    mov mov ecx, ebx
    call sub_10093137
    test test eax, eax
    jge L5
    lea lea eax, [ebp - 084h]
    push push eax
    mov mov ecx, ebx
    call sub_1008A75D
    push push dword ptr [ebx + 44]
    lea lea eax, [ebp - 084h]
    push push dword ptr [ebx + 088h]
    mov mov ecx, ebx
    push push eax
    call sub_10092A95
    mov mov edi, eax
    test test edi, edi
    jl L6
    push push 0
    lea lea eax, [ebp - 084h]
    push push eax
    mov mov ecx, ebx
    call sub_10093176
    mov mov edi, eax
    test test edi, edi
    jge L7
    cmp cmp edi, 08007000Eh
    je sub_100C2A74
    xor xor edi, edi
    inc inc edi
    jmp sub_100C2A7C
    shl shl esi, 2
    push push esi
    mov mov dword ptr [ebp - 16], esi
    call sub_100F79AE
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 8], eax
    jne L8
    mov mov edi, 08007000Eh
    jmp sub_100C2A9A
    push push esi
    call sub_100F79C6
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    mov mov dword ptr [ebp - 12], edi
    je L9
    mov mov ecx, esi
    mov mov esi, dword ptr [ebx + 24]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov edx, dword ptr [ebp - 20]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebp - 16]
    mov mov esi, dword ptr [ebx + 24]
    mov mov edi, dword ptr [ebp - 8]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    xor xor ecx, ecx
    test test edx, edx
    jbe L10
    mov mov eax, dword ptr [ebx + 24]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov dword ptr [ebx + 0100h], eax
    or or dword ptr [eax + 36], -1
    inc inc ecx
L2:
    cmp cmp ecx, edx
    jb L10
    lea lea edi, [edx - 1]
    test test edi, edi
    mov mov dword ptr [ebp - 4], edi
L4:
    jl sub_100C2AFE
    mov mov eax, dword ptr [ebx + 24]
    mov mov ecx, dword ptr [eax + edi*4]
    mov mov dword ptr [ebx + 0100h], ecx
    mov mov eax, dword ptr [ecx]
    mov mov esi, 0FFF00000h
    test test esi, eax
    je sub_100C2B0C
    and and eax, 0F0000000h
    cmp cmp eax, 060000000h
    je sub_100C2B1C
    call sub_100857F0
    test test eax, eax
    jne sub_100C2B29
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov ecx, dword ptr [eax]
    and and ecx, esi
    cmp cmp ecx, 011000000h
    je sub_100C2B3F
    push push edi
    push push eax
    push push dword ptr [ebp - 12]
    mov mov ecx, ebx
    call sub_100BA213
    test test byte ptr [ebx + 112], 8
    je sub_100C2B14
    mov mov eax, dword ptr [ebx + 0100h]
    mov mov edx, dword ptr [eax]
    xor xor ecx, ecx
    and and edx, esi
    cmp cmp edx, 050000000h
L6:
    mov mov dword ptr [ebp - 20], ecx
    mov mov dword ptr [ebp - 24], ecx
    jne sub_100C2A9B
    mov mov dword ptr [ebp - 24], 1
    cmp cmp dword ptr [eax + 12], ecx
    jbe sub_100C2B0C
    mov mov ecx, dword ptr [ebx + 108]
    mov mov edx, dword ptr [ebx + 0100h]
    mov mov edx, dword ptr [edx + 12]
    mov mov esi, dword ptr [ebx + 20]
    mov mov eax, dword ptr [eax + 16]
    shl shl ecx, 3
    sar sar ecx, 31
    mov mov dword ptr [ebp - 32], edx
    test test ecx, ecx
    mov mov edx, dword ptr [eax]
    mov mov edx, dword ptr [esi + edx*4]
    jne sub_100C2B10
    mov mov edi, dword ptr [ebp - 084h]
    cmp cmp edi, dword ptr [edx + 4]
    jne sub_100C2B1B
    mov mov edi, dword ptr [edx + 12]
    mov mov edx, dword ptr [edx + 16]
    lea lea edx, [edx + edi*4]
    mov mov edi, dword ptr [ebp - 112]
    mov mov edx, dword ptr [edi + edx*4]
    jmp sub_100C2B2F
    mov mov edx, dword ptr [edx + 16]
    cmp cmp edx, 3
    jne sub_100C2B45
    mov mov dword ptr [ebp - 20], 1
    jmp sub_100C2B55
    mov mov dword ptr [ebp - 24], 1
    add add eax, 4
    dec dec dword ptr [ebp - 32]
    jne sub_100C2B27
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 24], eax
    jne sub_100C2B7F
    push push 1
    push push eax
    jmp sub_100C2B8D
L9:
    cmp cmp dword ptr [ebp - 20], eax
    jne sub_100C2BEC
    push push 0
    push push 1
    push push dword ptr [ebp - 4]
    lea lea eax, [ebp - 084h]
    push push dword ptr [ebp - 12]
    mov mov ecx, ebx
    push push dword ptr [ebp - 8]
    push push eax
    call sub_100C25B9
    jmp sub_100C2BE7
    push push dword ptr [ebp - 28]
    lea lea eax, [ebp - 0E8h]
    push push edi
    push push dword ptr [ebp - 12]
    mov mov ecx, ebx
    push push dword ptr [ebp - 8]
    push push eax
    lea lea eax, [ebp - 084h]
    push push eax
    call L4
    mov mov edi, eax
    test test edi, edi
    jl sub_100C2C3D
    jne sub_100C2C30
    mov mov ecx, dword ptr [ebp - 16]
    mov mov esi, dword ptr [ebx + 24]
    mov mov edi, dword ptr [ebp - 8]
    mov mov eax, ecx
    shr shr ecx, 2
    dec dec dword ptr [ebp - 4]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebp - 4]
    dec dec edi
    mov mov dword ptr [ebp - 4], edi
    jns sub_100C2AFE
    xor xor edi, edi
    test test byte ptr [ebx + 111], 16
    pop pop esi
    jne sub_100C2C98
    lea lea eax, [ebp - 084h]
    push push eax
    mov mov ecx, ebx
    call sub_1008A9A5
    cmp cmp dword ptr [ebx + 48], 0
    je sub_100C2CAC
    lea lea eax, [ebp - 0E8h]
    push push eax
    mov mov ecx, ebx
    call sub_1008A9B9
    push push dword ptr [ebp - 12]
    call sub_100F7BBA
    push push dword ptr [ebp - 8]
    call sub_100F7BC2
    pop pop ecx
    pop pop ecx
    mov mov eax, edi
    pop pop edi
    pop pop ebx
    leave leave
    ret ret
FUN_100c2620 ENDP
END
