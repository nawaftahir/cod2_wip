.686
.MODEL FLAT, C
EXTRN sub_1006C66B:PROC
EXTRN sub_100854F1:PROC
EXTRN sub_10085565:PROC
EXTRN sub_10085981:PROC
EXTRN sub_100859FE:PROC
EXTRN sub_10085D05:PROC
EXTRN sub_1008634E:PROC
EXTRN sub_100B9A11:PROC
EXTRN g_1019BC88:DWORD
EXTRN g_1019BE20:DWORD
.CODE
FUN_100be86c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000108h
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov ebx, dword ptr [eax]
    push edi
    xor ecx, ecx
    inc ecx
    push ecx
    mov dword ptr [ebp - 36], ecx
    and ebx, 0000FFFFFh
    push ebx
    lea ecx, [ebp - 40]
    push ecx
    lea ecx, [ebp - 0000000C8h]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 000000108h]
    push ecx
    push 010118AD8h
    xor edi, edi
    push eax
    mov ecx, esi
    mov dword ptr [ebp - 24], esi
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 40], edi
    mov dword ptr [ebp - 32], 2
    mov dword ptr [ebp - 28], 3
    call sub_100B9A11
    cmp eax, edi
    jne L16
    cmp ebx, edi
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 12], edi
    mov dword ptr [ebp - 16], edi
    mov dword ptr [ebp - 4], edi
    jbe L7
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebp - 0000000B8h]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ebp - 0000000A8h]
    mov edi, dword ptr [eax + edx*4]
    mov edx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx + 4]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 4]
    and eax, 000000100h
    mov dword ptr [ebp - 20], eax
L0:
    cmp dword ptr [ebp - 20], 0
    je L3
    mov eax, dword ptr [edi + 4]
    mov eax, dword ptr [edx + eax*4]
    test byte ptr [eax + 5], 1
    je L3
    cmp dword ptr [ecx + 8], -1
    jne L3
    cmp dword ptr [edi + 8], -1
    jne L3
    fld qword ptr [g_1019BC88]
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L1
    fld qword ptr [g_1019BE20]
    fld qword ptr [edi + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L1
    mov dword ptr [ebp - 8], 1
    jmp L2
L1:
    fld qword ptr [g_1019BC88]
    fld qword ptr [edi + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L3
    fld qword ptr [g_1019BE20]
    fld qword ptr [ecx + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jp L3
    mov dword ptr [ebp - 12], 1
L2:
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], ebx
    jb L0
    xor ecx, ecx
    cmp dword ptr [ebp - 8], ecx
    je L5
    cmp dword ptr [ebp - 12], ecx
    je L4
L3:
    xor eax, eax
    inc eax
    jmp L16
L4:
    mov eax, ebx
    and eax, 0000FFFFFh
    or eax, 073500000h
    mov dword ptr [ebp - 16], eax
L5:
    cmp dword ptr [ebp - 12], ecx
    je L6
    mov eax, ebx
    and eax, 0000FFFFFh
    or eax, 073600000h
    mov dword ptr [ebp - 16], eax
L6:
    xor edi, edi
L7:
    push 116
    call sub_10085981
    cmp eax, edi
    je L8
    mov ecx, eax
    call sub_100854F1
    mov dword ptr [ebp - 4], eax
    jmp L9
L8:
    mov dword ptr [ebp - 4], edi
L9:
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, edi
    jne L10
    mov eax, 08007000Eh
    jmp L16
L10:
    push edi
    push ebx
    lea eax, [ebx + ebx]
    push eax
    push dword ptr [ebp - 16]
    call sub_100859FE
    cmp eax, edi
    jl L14
    push dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ebp - 4]
    call sub_10085565
    cmp eax, edi
    jl L14
    mov edx, dword ptr [esi + 000000100h]
    fldz
    mov esi, dword ptr [edx + 16]
    mov edx, dword ptr [ebp - 4]
    mov edi, dword ptr [edx + 16]
    mov eax, ebx
    shl eax, 2
    mov ecx, eax
    mov edx, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, eax
    mov eax, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + 8]
    mov eax, ecx
    shr ecx, 2
    lea esi, [ebp - 0000000C8h]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov esi, dword ptr [ebp - 24]
    push ecx
    push ecx
    mov ecx, esi
    fstp qword ptr [esp]
    push 0
    push 0
    push dword ptr [esi + 120]
    call sub_1008634E
    cmp eax, -1
    jne L11
    mov esi, 08007000Eh
    jmp L15
L11:
    test ebx, ebx
    jbe L13
    mov ecx, ebx
    shl ecx, 2
L12:
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [edx + 8]
    mov dword ptr [ecx + edx], eax
    add ecx, 4
    dec ebx
    jne L12
L13:
    push dword ptr [ebp - 4]
    mov ecx, dword ptr [esi + 000000100h]
    call sub_10085D05
L14:
    mov esi, eax
L15:
    mov ecx, dword ptr [ebp - 4]
    push 1
    call sub_1006C66B
    mov eax, esi
L16:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100be86c ENDP
END
