.686
.MODEL FLAT, C
EXTRN sub_1006C796:PROC
EXTRN sub_1006C803:PROC
EXTRN sub_100853F1:PROC
EXTRN sub_10085460:PROC
EXTRN sub_100854E0:PROC
EXTRN sub_1008568F:PROC
EXTRN sub_1008571E:PROC
EXTRN sub_10085881:PROC
EXTRN sub_100858F0:PROC
EXTRN sub_10085977:PROC
EXTRN sub_10085B1F:PROC
EXTRN sub_10085BB9:PROC
EXTRN sub_10085E9E:PROC
EXTRN sub_100B9A11:PROC
EXTRN sub_100B9A7C:PROC
EXTRN sub_100B9B5A:PROC
EXTRN sub_100BE87A:PROC
EXTRN sub_100BE899:PROC
EXTRN sub_100BE89B:PROC
EXTRN sub_100BE8B7:PROC
EXTRN sub_100BE8BE:PROC
EXTRN sub_100BE912:PROC
EXTRN sub_100BE926:PROC
EXTRN sub_100BE95C:PROC
EXTRN sub_100BE984:PROC
EXTRN sub_100BE9A8:PROC
EXTRN sub_100BE9B5:PROC
EXTRN sub_100BE9B8:PROC
EXTRN sub_100BE9C1:PROC
EXTRN sub_100BE9E6:PROC
EXTRN sub_100BEA0E:PROC
EXTRN sub_100BEA1A:PROC
EXTRN sub_100BEA32:PROC
EXTRN sub_100BEA6B:PROC
EXTRN sub_100BEA70:PROC
EXTRN sub_100BEA76:PROC
EXTRN sub_100BEAA2:PROC
EXTRN sub_100BEAB7:PROC
EXTRN sub_100BEAD0:PROC
EXTRN sub_100BEAFB:PROC
EXTRN sub_100BEB07:PROC
EXTRN sub_100BEB50:PROC
EXTRN sub_100BEB6B:PROC
EXTRN sub_100BEB6E:PROC
EXTRN sub_100BEB99:PROC
EXTRN sub_100BEBEA:PROC
EXTRN sub_100BEC56:PROC
EXTRN EXTRN g_1019BC88:DWORD:DWORD
EXTRN EXTRN g_1019BE20:DWORD:DWORD
.CODE
FUN_100be476 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0110h
    push push ebx
    push push esi
    push push edi
    and and dword ptr [ebp - 12], 0
    and and dword ptr [ebp - 32], 0
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ebx, dword ptr [eax]
    xor xor edi, edi
    inc inc edi
    push push edi
    and and ebx, 0FFFFFh
    push push ebx
    lea lea ecx, [ebp - 32]
    push push ecx
    lea lea ecx, [ebp - 0D0h]
    push push ecx
    lea lea ecx, [ebp - 12]
    push push ecx
    lea lea ecx, [ebp - 0110h]
    push push ecx
    push push 010118E78h
    push push eax
    mov mov ecx, esi
    mov mov dword ptr [ebp - 16], esi
    mov mov dword ptr [ebp - 28], edi
    mov mov dword ptr [ebp - 24], 2
    mov mov dword ptr [ebp - 20], 3
    call sub_100B9A11
    test test eax, eax
    jne L2
    push push 116
    call sub_10085881
    test test eax, eax
    je L0
    mov mov ecx, eax
    call sub_100853F1
    mov mov edi, eax
    mov mov dword ptr [ebp - 8], edi
    jmp L1
    and and dword ptr [ebp - 8], 0
    mov mov edi, dword ptr [ebp - 8]
    test test edi, edi
    je L7
    push push 0
    lea lea eax, [ebx + ebx]
    push push ebx
    push push eax
    mov mov eax, ebx
    and and eax, 0FFFFFh
    or or eax, 073600000h
    jmp L3
    push push edi
    push push ebx
    lea lea eax, [ebp - 32]
    push push eax
    lea lea eax, [ebp - 0D0h]
    push push eax
    lea lea eax, [ebp - 12]
    push push eax
    lea lea eax, [ebp - 0110h]
    push push eax
    push push 010118ED8h
    push push dword ptr [esi + 0100h]
    mov mov ecx, esi
    call sub_100B9A7C
    test test eax, eax
    jne L6
    push push 116
    call sub_100858F0
    test test eax, eax
    je L4
    mov mov ecx, eax
    call sub_10085460
    mov mov edi, eax
    mov mov dword ptr [ebp - 8], edi
    jmp L5
    and and dword ptr [ebp - 8], 0
    mov mov edi, dword ptr [ebp - 8]
    test test edi, edi
    je sub_100BE89B
    push push 0
    lea lea eax, [ebx + ebx]
    push push ebx
    push push eax
    mov mov eax, ebx
    and and eax, 0FFFFFh
    or or eax, 073500000h
    push push eax
    mov mov ecx, edi
    call sub_10085977
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    mov mov ecx, edi
    jl sub_100BE912
    push push dword ptr [esi + 0100h]
    call sub_100854E0
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100BE926
    mov mov edx, dword ptr [esi + 0100h]
    mov mov esi, dword ptr [edx + 16]
    mov mov edi, dword ptr [edi + 16]
    mov mov eax, ebx
    mov mov ebx, dword ptr [ebp - 8]
    shl shl eax, 2
    mov mov ecx, eax
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebx + 8]
    mov mov ecx, eax
    shr shr ecx, 2
    lea lea esi, [ebp - 0D0h]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    lea lea esi, [ebp - 0C0h]
    jmp sub_100BE9B5
    push push edi
    push push ebx
    lea lea eax, [ebp - 32]
    push push eax
    lea lea eax, [ebp - 0D0h]
    push push eax
    lea lea eax, [ebp - 12]
    push push eax
    lea lea eax, [ebp - 0110h]
    push push eax
    push push 010118F38h
    push push dword ptr [esi + 0100h]
    mov mov ecx, esi
    call sub_100B9B5A
    test test eax, eax
    jne sub_100BEA1A
L3:
    mov mov eax, dword ptr [ebp - 0B0h]
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edx + eax*4]
    mov mov eax, 080000h
    cmp cmp dword ptr [ecx + 60], eax
    jne L8
    xor xor eax, eax
    test test ebx, ebx
    jbe sub_100BE87A
    mov mov ecx, ebx
    lea lea esi, [ebp - 0A0h]
    lea lea edi, [ebp - 32]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [ebp + eax*4 - 0B0h]
L5:
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 56]
    mov mov dword ptr [ebp + eax*4 - 48], ecx
    inc inc eax
    cmp cmp eax, ebx
    jb L9
    jmp sub_100BE899
    mov mov ecx, dword ptr [ebp - 0A0h]
    mov mov ecx, dword ptr [edx + ecx*4]
    cmp cmp dword ptr [ecx + 60], eax
    jne sub_100BEA6B
    xor xor eax, eax
    test test ebx, ebx
    jbe sub_100BE8B7
    mov mov ecx, ebx
    lea lea esi, [ebp - 0B0h]
    lea lea edi, [ebp - 32]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [ebp + eax*4 - 0A0h]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [ecx + 56]
    mov mov dword ptr [ebp + eax*4 - 48], ecx
    inc inc eax
    cmp cmp eax, ebx
    jb sub_100BE8BE
    mov mov esi, dword ptr [ebp - 16]
    xor xor edi, edi
    inc inc edi
    and and dword ptr [ebp - 8], 0
    test test ebx, ebx
    mov mov dword ptr [ebp - 12], edi
    mov mov dword ptr [ebp - 4], edi
    jbe sub_100BE9C1
    fld fld qword ptr [g_1019BE20]
    mov mov edi, dword ptr [esi + 16]
    fld fld qword ptr [g_1019BC88]
L6:
    mov mov eax, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp + eax*4 - 0D0h]
    mov mov ecx, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [ecx + 4]
    mov mov eax, dword ptr [edi + eax*4]
    test test byte ptr [eax + 5], 1
    jne sub_100BE95C
    and and dword ptr [ebp - 4], 0
    and and dword ptr [ebp - 12], 0
    fld fld st(1)
    fld fld qword ptr [ecx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_100BE984
    and and dword ptr [ebp - 4], 0
    fld fld st(0)
    fld fld qword ptr [ecx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_100BE9A8
    and and dword ptr [ebp - 12], 0
    mov mov eax, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp + eax*4 - 0C0h]
    mov mov ecx, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [ecx + 4]
    mov mov eax, dword ptr [edi + eax*4]
    test test byte ptr [eax + 5], 1
    jne sub_100BE9E6
    and and dword ptr [ebp - 4], 0
    and and dword ptr [ebp - 12], 0
    fld fld st(0)
    fld fld qword ptr [ecx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_100BEA0E
    and and dword ptr [ebp - 4], 0
    fld fld st(1)
    fld fld qword ptr [ecx + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp sub_100BEA32
    and and dword ptr [ebp - 12], 0
    inc inc dword ptr [ebp - 8]
    cmp cmp dword ptr [ebp - 8], ebx
    jb sub_100BE9B8
    cmp cmp dword ptr [ebp - 4], 0
    fstp fstp st(0)
    fstp fstp st(0)
    jne sub_100BEA70
    cmp cmp dword ptr [ebp - 12], 0
    jne sub_100BEA76
    xor xor eax, eax
    inc inc eax
    jmp sub_100BEB6B
    push push 116
    call sub_10085B1F
    test test eax, eax
    je sub_100BEAA2
    mov mov ecx, eax
    call sub_1008568F
    mov mov edi, eax
    mov mov dword ptr [ebp - 8], edi
    jmp sub_100BEAB7
    and and dword ptr [ebp - 8], 0
    mov mov edi, dword ptr [ebp - 8]
    test test edi, edi
    jne sub_100BEAD0
    mov mov eax, 08007000Eh
    jmp sub_100BEB99
    mov mov eax, ebx
    and and eax, 0FFFFFh
    cmp cmp dword ptr [ebp - 4], 0
    je sub_100BEAFB
    or or eax, 073600000h
    jmp sub_100BEB07
    or or eax, 073500000h
    push push 0
    push push ebx
    lea lea ecx, [ebx + ebx]
    push push ecx
    push push eax
    mov mov ecx, edi
    call sub_10085BB9
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    mov mov ecx, edi
    jl sub_100BEB50
    push push dword ptr [esi + 0100h]
    call sub_1008571E
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jge sub_100BEB6E
    mov mov ecx, edi
    push push 1
    call sub_1006C796
    mov mov eax, dword ptr [ebp - 4]
    jmp sub_100BEBEA
    mov mov edx, dword ptr [esi + 0100h]
    mov mov esi, dword ptr [edx + 16]
    mov mov edi, dword ptr [edi + 16]
    mov mov eax, ebx
    mov mov ebx, dword ptr [ebp - 8]
    shl shl eax, 2
    mov mov ecx, eax
    mov mov edx, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebx + 8]
    mov mov ecx, eax
    shr shr ecx, 2
    lea lea esi, [ebp - 32]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
L7:
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    lea lea esi, [ebp - 48]
    mov mov edi, dword ptr [ebx + 8]
    mov mov ecx, eax
    shr shr ecx, 2
    add add edi, eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    mov mov eax, dword ptr [ebp - 16]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [eax + 0100h]
    push push ebx
    call sub_10085E9E
    push push 1
    mov mov ecx, ebx
    mov mov esi, eax
    call sub_1006C803
    mov mov eax, esi
    jmp sub_100BEC56
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100be476 ENDP
END
