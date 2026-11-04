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
EXTRN g_1019BC88:DWORD
EXTRN g_1019BE20:DWORD
.CODE
FUN_100be476 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000110h
    push ebx
    push esi
    push edi
    and dword ptr [ebp - 12], 0
    and dword ptr [ebp - 32], 0
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov ebx, dword ptr [eax]
    xor edi, edi
    inc edi
    push edi
    and ebx, 0000FFFFFh
    push ebx
    lea ecx, [ebp - 32]
    push ecx
    lea ecx, [ebp - 0000000D0h]
    push ecx
    lea ecx, [ebp - 12]
    push ecx
    lea ecx, [ebp - 000000110h]
    push ecx
    push 010118E78h
    push eax
    mov ecx, esi
    mov dword ptr [ebp - 16], esi
    mov dword ptr [ebp - 28], edi
    mov dword ptr [ebp - 24], 2
    mov dword ptr [ebp - 20], 3
    call sub_100B9A11
    test eax, eax
    jne L2
    push 116
    call sub_10085881
    test eax, eax
    je L0
    mov ecx, eax
    call sub_100853F1
    mov edi, eax
    mov dword ptr [ebp - 8], edi
    jmp L1
L0:
    and dword ptr [ebp - 8], 0
    mov edi, dword ptr [ebp - 8]
L1:
    test edi, edi
    je L22
    push 0
    lea eax, [ebx + ebx]
    push ebx
    push eax
    mov eax, ebx
    and eax, 0000FFFFFh
    or eax, 073600000h
    jmp L5
L2:
    push edi
    push ebx
    lea eax, [ebp - 32]
    push eax
    lea eax, [ebp - 0000000D0h]
    push eax
    lea eax, [ebp - 12]
    push eax
    lea eax, [ebp - 000000110h]
    push eax
    push 010118ED8h
    push dword ptr [esi + 000000100h]
    mov ecx, esi
    call sub_100B9A7C
    test eax, eax
    jne L6
    push 116
    call sub_100858F0
    test eax, eax
    je L3
    mov ecx, eax
    call sub_10085460
    mov edi, eax
    mov dword ptr [ebp - 8], edi
    jmp L4
L3:
    and dword ptr [ebp - 8], 0
    mov edi, dword ptr [ebp - 8]
L4:
    test edi, edi
    je L22
    push 0
    lea eax, [ebx + ebx]
    push ebx
    push eax
    mov eax, ebx
    and eax, 0000FFFFFh
    or eax, 073500000h
L5:
    push eax
    mov ecx, edi
    call sub_10085977
    test eax, eax
    mov dword ptr [ebp - 4], eax
    mov ecx, edi
    jl L27
    push dword ptr [esi + 000000100h]
    call sub_100854E0
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jl L26
    mov edx, dword ptr [esi + 000000100h]
    mov esi, dword ptr [edx + 16]
    mov edi, dword ptr [edi + 16]
    mov eax, ebx
    mov ebx, dword ptr [ebp - 8]
    shl eax, 2
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebx + 8]
    mov ecx, eax
    shr ecx, 2
    lea esi, [ebp - 0000000D0h]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    lea esi, [ebp - 0000000C0h]
    jmp L29
L6:
    push edi
    push ebx
    lea eax, [ebp - 32]
    push eax
    lea eax, [ebp - 0000000D0h]
    push eax
    lea eax, [ebp - 12]
    push eax
    lea eax, [ebp - 000000110h]
    push eax
    push 010118F38h
    push dword ptr [esi + 000000100h]
    mov ecx, esi
    call sub_100B9B5A
    test eax, eax
    jne L31
    mov eax, dword ptr [ebp - 0000000B0h]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [edx + eax*4]
    mov eax, 000080000h
    cmp dword ptr [ecx + 60], eax
    jne L8
    xor eax, eax
    test ebx, ebx
    jbe L11
    mov ecx, ebx
    lea esi, [ebp - 0000000A0h]
    lea edi, [ebp - 32]
    rep movsd dword ptr es:[edi], dword ptr [esi]
L7:
    mov ecx, dword ptr [ebp + eax*4 - 0000000B0h]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 56]
    mov dword ptr [ebp + eax*4 - 48], ecx
    inc eax
    cmp eax, ebx
    jb L7
    jmp L10
L8:
    mov ecx, dword ptr [ebp - 0000000A0h]
    mov ecx, dword ptr [edx + ecx*4]
    cmp dword ptr [ecx + 60], eax
    jne L30
    xor eax, eax
    test ebx, ebx
    jbe L11
    mov ecx, ebx
    lea esi, [ebp - 0000000B0h]
    lea edi, [ebp - 32]
    rep movsd dword ptr es:[edi], dword ptr [esi]
L9:
    mov ecx, dword ptr [ebp + eax*4 - 0000000A0h]
    mov ecx, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [ecx + 56]
    mov dword ptr [ebp + eax*4 - 48], ecx
    inc eax
    cmp eax, ebx
    jb L9
L10:
    mov esi, dword ptr [ebp - 16]
    xor edi, edi
    inc edi
L11:
    and dword ptr [ebp - 8], 0
    test ebx, ebx
    mov dword ptr [ebp - 12], edi
    mov dword ptr [ebp - 4], edi
    jbe L19
    fld qword ptr [g_1019BE20]
    mov edi, dword ptr [esi + 16]
    fld qword ptr [g_1019BC88]
L12:
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [ebp + eax*4 - 0000000D0h]
    mov ecx, dword ptr [edx + eax*4]
    mov eax, dword ptr [ecx + 4]
    mov eax, dword ptr [edi + eax*4]
    test byte ptr [eax + 5], 1
    jne L13
    and dword ptr [ebp - 4], 0
    and dword ptr [ebp - 12], 0
L13:
    fld st(1)
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L14
    and dword ptr [ebp - 4], 0
L14:
    fld st(0)
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L15
    and dword ptr [ebp - 12], 0
L15:
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [ebp + eax*4 - 0000000C0h]
    mov ecx, dword ptr [edx + eax*4]
    mov eax, dword ptr [ecx + 4]
    mov eax, dword ptr [edi + eax*4]
    test byte ptr [eax + 5], 1
    jne L16
    and dword ptr [ebp - 4], 0
    and dword ptr [ebp - 12], 0
L16:
    fld st(0)
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L17
    and dword ptr [ebp - 4], 0
L17:
    fld st(1)
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L18
    and dword ptr [ebp - 12], 0
L18:
    inc dword ptr [ebp - 8]
    cmp dword ptr [ebp - 8], ebx
    jb L12
    cmp dword ptr [ebp - 4], 0
    fstp st(0)
    fstp st(0)
    jne L19
    cmp dword ptr [ebp - 12], 0
    jne L19
    xor eax, eax
    inc eax
    jmp L31
L19:
    push 116
    call sub_10085B1F
    test eax, eax
    je L20
    mov ecx, eax
    call sub_1008568F
    mov edi, eax
    mov dword ptr [ebp - 8], edi
    jmp L21
L20:
    and dword ptr [ebp - 8], 0
    mov edi, dword ptr [ebp - 8]
L21:
    test edi, edi
    jne L23
L22:
    mov eax, 08007000Eh
    jmp L31
L23:
    mov eax, ebx
    and eax, 0000FFFFFh
    cmp dword ptr [ebp - 4], 0
    je L24
    or eax, 073600000h
    jmp L25
L24:
    or eax, 073500000h
L25:
    push 0
    push ebx
    lea ecx, [ebx + ebx]
    push ecx
    push eax
    mov ecx, edi
    call sub_10085BB9
    test eax, eax
    mov dword ptr [ebp - 4], eax
    mov ecx, edi
    jl L27
    push dword ptr [esi + 000000100h]
    call sub_1008571E
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jge L28
L26:
    mov ecx, edi
L27:
    push 1
    call sub_1006C796
    mov eax, dword ptr [ebp - 4]
    jmp L31
L28:
    mov edx, dword ptr [esi + 000000100h]
    mov esi, dword ptr [edx + 16]
    mov edi, dword ptr [edi + 16]
    mov eax, ebx
    mov ebx, dword ptr [ebp - 8]
    shl eax, 2
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebx + 8]
    mov ecx, eax
    shr ecx, 2
    lea esi, [ebp - 32]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    lea esi, [ebp - 48]
L29:
    mov edi, dword ptr [ebx + 8]
    mov ecx, eax
    shr ecx, 2
    add edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    mov eax, dword ptr [ebp - 16]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [eax + 000000100h]
    push ebx
    call sub_10085E9E
    push 1
    mov ecx, ebx
    mov esi, eax
    call sub_1006C803
    mov eax, esi
    jmp L31
L30:
    mov eax, edi
L31:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100be476 ENDP
END
